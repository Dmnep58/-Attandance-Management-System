package server;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Functionality.TeacherStudentDetails;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class EditAndDeleteAdmin
 */
@WebServlet("/EditAndDeleteAdmin")
public class EditAndDeleteAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public EditAndDeleteAdmin() {
        super();
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        long id = Long.parseLong(request.getParameter("uid"));
        TeacherStudentDetails teacherStudentDetails = new TeacherStudentDetails();

        boolean operationResult = teacherStudentDetails.deleteRecord(id);

        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("success", operationResult);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        response.getWriter().write(jsonResponse.toString());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        long id = Long.parseLong(request.getParameter("uid"));
        TeacherStudentDetails teacherStudentDetails = new TeacherStudentDetails();
        teacherStudentDetails.deleteRecord(id);

    }

}
