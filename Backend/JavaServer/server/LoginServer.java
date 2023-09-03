package server;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Functionality.Login;

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

        HttpSession session = null;

        if (l.isvalid(Integer.valueOf(id), password) == true) // check for the valid user.
        {
            session = request.getSession();
            session.setAttribute("aid", id);
            response.sendRedirect("admin.jsp");
        }

        else {
            id = "";
            password = "";
            response.sendRedirect("Login.jsp");
        }

    }

}
