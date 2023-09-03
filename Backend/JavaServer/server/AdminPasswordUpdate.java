package server;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.JsonObject;
import com.Attandance.Functionality.AdminDataFetch;

/**
 * Servlet implementation class AdminPasswordUpdate
 */
@WebServlet("/AdminPasswordUpdate")
public class AdminPasswordUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters from the request
        String oldPassword = request.getParameter("oldpassword");
        String newPassword = request.getParameter("newpassword");
        String confirmNewPassword = request.getParameter("confirmnewpassword");
        long adminId = Long.parseLong(request.getParameter("admin_id"));

        // Perform password validation and update logic here
        boolean success = validateAndUpdatePassword(adminId, oldPassword, newPassword, confirmNewPassword);

        // Prepare a JSON response
        JsonObject jsonResponse = new JsonObject();
        if (success) {
            jsonResponse.addProperty("status", "success");
            jsonResponse.addProperty("message", "Password updated successfully.");
        } else {
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Password update failed. Please check your inputs.");
        }

        // Set the content type of the response to JSON

        response.setContentType("application/json");

        // Write the JSON response to the client
        response.getWriter().write(jsonResponse.toString());
    }

    // Implement your password validation and update logic here
    private boolean validateAndUpdatePassword(Long adminId, String oldPassword, String newPassword,
            String confirmNewPassword) {

        AdminDataFetch adminDataFetch = new AdminDataFetch();

        boolean isvalid = (newPassword.equals(confirmNewPassword)) ? true : false;

        if (isvalid) {
            isvalid = (oldPassword.equals(adminDataFetch.oldpass(adminId))) ? true : false;
        }
        if (isvalid) {
            adminDataFetch.update(confirmNewPassword, adminId);
        }

        return isvalid;
    }

}
