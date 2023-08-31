package server;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Functionality.AdminDataFetch;

/**
 * Servlet implementation class AdminPasswordUpdate
 */
@WebServlet("/AdminPasswordUpdate")
public class AdminPasswordUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String password = request.getParameter("oldpassword");
        String newpass = request.getParameter("newpass");
        String confirmpass = request.getParameter("newpass1");
        String admin_id = request.getParameter("admin_id");

        AdminDataFetch adminDataFetch = new AdminDataFetch();

        if (newpass.equals(confirmpass)) {
            if (password.equals(adminDataFetch.oldpass(Long.parseLong(admin_id)))) {
                adminDataFetch.update(confirmpass, Long.parseLong(admin_id));
            } else {
                request.setAttribute("message", "old password mismatched");
            }
        } else {
            request.setAttribute("message", "new password mismatched");
        }
    }

}
