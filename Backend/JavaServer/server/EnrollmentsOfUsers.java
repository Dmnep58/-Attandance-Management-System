package server;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Functionality.Enrollments;
import model.Enrollment;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class EnrollmentsOfUsers
 */
@WebServlet("/EnrollmentsOfUsers")
public class EnrollmentsOfUsers extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("Id");
        String courseid = request.getParameter("courseid");
        String Batch = request.getParameter("Batch");
        String action = request.getParameter("action");

        Enrollments enrollments = new Enrollments();
        boolean success = false;

        switch (action) {
            case "assignfaculty":
                Enrollment enrollment = new Enrollment();
                enrollment.setFacultyid(Long.parseLong(id));
                enrollment.setCourseid(Long.parseLong(courseid));
                enrollment.setBatch(Batch);

                success = enrollments.FacultyEnroll(enrollment);

                break;

            case "assignstudent":
                break;

            default:

        }

        // Prepare a JSON response
        JsonObject jsonResponse = new JsonObject();
        if (success) {
            jsonResponse.addProperty("status", "success");
        } else {
            jsonResponse.addProperty("status", "error");
        }

        // Set the content type of the response to JSON

        response.setContentType("application/json");
        // Write the JSON response to the client
        response.getWriter().write(jsonResponse.toString());

    }

}
