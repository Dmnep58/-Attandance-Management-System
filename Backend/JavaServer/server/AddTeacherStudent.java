package server;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Functionality.TeacherStudentDetails;
import model.TeacherStudent;

/**
 * Servlet implementation class AddTeacherStudent
 */
@WebServlet("/AddTeacherStudent")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class AddTeacherStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    TeacherStudentDetails teacherStudentDetails;
    private static final String SAVE_DIR = "Profile";

    public AddTeacherStudent() {
        super();
        teacherStudentDetails = new TeacherStudentDetails();
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("uid"));
        String name = request.getParameter("name");
        String addres = request.getParameter("address");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Long phno = Long.parseLong(request.getParameter("phnno"));
        Long regno = Long.parseLong(request.getParameter("regno"));
        String role = request.getParameter("role");

        String savePath = SAVE_DIR;
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        Part part = request.getPart("image");
        String fileName = extractFileName(part);
        part.write("E:" + File.separator + savePath + File.separator + fileName);

        switch (role) {
            case "student":
                TeacherStudent ts = new TeacherStudent();
                ts.setUid(id);
                ts.setName(name);
                ts.setAddres(addres);
                ts.setEmail(email);
                ts.setImage(fileName);
                ts.setPasword(password);
                ts.setPhno(phno);
                ts.setRole(role);
                ts.setRegno(regno);

                if (teacherStudentDetails.AddTeacherStudent(ts) == true) {
                    request.setAttribute("message", "Student added successfully!");
                    request.getRequestDispatcher("student.jsp").forward(request, response);
                    ;
                } else {
                    request.setAttribute("message", "Failed to add student.");
                    request.getRequestDispatcher("student.jsp").forward(request, response);
                    ;
                }

                break;

            case "Teacher":
                TeacherStudent ts1 = new TeacherStudent();
                ts1.setUid(id);
                ts1.setName(name);
                ts1.setAddres(addres);
                ts1.setEmail(email);
                ts1.setImage(fileName);
                ts1.setPasword(password);
                ts1.setPhno(phno);
                ts1.setRole(role);
                ts1.setRegno(regno);

                if (teacherStudentDetails.AddTeacherStudent(ts1) == true) {
                    request.setAttribute("message", "Teacher added successfully!");
                    request.getRequestDispatcher("faculty.jsp").forward(request, response);
                    ;
                } else {
                    request.setAttribute("message", "Failed to add student.");
                    request.getRequestDispatcher("faculty.jsp").forward(request, response);
                    ;
                }

        }

    }

}
