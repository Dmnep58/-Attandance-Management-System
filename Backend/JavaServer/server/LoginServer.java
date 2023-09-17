package server;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.ha.backend.MultiCastSender;

import Functionality.Login;
import Functionality.TeacherStudentDetails;
import model.TeacherStudent;

/**
 * Servlet implementation class LoginServer
 */
@WebServlet("/LoginServer")
public class LoginServer extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Login l;

    public LoginServer() {
        super();
        l = new Login();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("userid");
        String password = request.getParameter("password");
        String action = request.getParameter("action");

        HttpSession session = null;
        // check for the valid user.

        switch (action) {
            case "admin":
                if (l.isvalid(Integer.valueOf(id), password) == true) {
                    session = request.getSession();
                    session.setAttribute("aid", id);
                    response.sendRedirect("admin.jsp");
                }

                else {
                    id = "";
                    password = "";
                    response.sendRedirect("Login.jsp");
                }

                break;

            case "Teacher":
                TeacherStudentDetails teacherStudentDetails = new TeacherStudentDetails();

                if (l.isvalidUser(Integer.valueOf(id), password) == true) {
                    session = request.getSession();
                    session.setAttribute("aid", id);
                    if (teacherStudentDetails.Userrole(Long.valueOf(id)).equals(action)) {
                        response.sendRedirect("TeacherPanel.jsp");
                    } else {
                        response.sendRedirect("StudentPanel.jsp");
                    }
                }
                break;

            default:

        }

    }

}
