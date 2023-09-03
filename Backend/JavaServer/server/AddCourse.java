package server;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Attandance.Functionality.CourseDataFetch;
import com.Attandance.model.Course;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class AddCourse
 */
@WebServlet("/AddCourse")
public class AddCourse extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddCourse() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form parameters from the request
        String CourseName = request.getParameter("courseName");
        long CourseId = Long.parseLong(request.getParameter("courseId"));
        String startdatestr = request.getParameter("startDate");
        String enddatestr = request.getParameter("endDate");
        String action = request.getParameter("action");

        // Assuming date strings are in the format "yyyy-MM-dd"
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date startDate = null;
        java.util.Date endDate = null;

        try {
            startDate = sdf.parse(startdatestr);
            endDate = sdf.parse(enddatestr);
        } catch (ParseException e) {
            // Handling parsing error here
            e.printStackTrace();

        }

        // Convert java.util.Date objects to java.sql.Date
        java.sql.Date sqlStartDate = new java.sql.Date(startDate.getTime());
        java.sql.Date sqlEndDate = new java.sql.Date(endDate.getTime());

        Course course = new Course();
        course.setCourseId(CourseId);
        course.setCourseName(CourseName);
        course.setStartDate(sqlStartDate);
        course.setEndDate(sqlEndDate);

        boolean success = false;

        // add the class CourseDataFetch to get data
        CourseDataFetch courseDataFetch = new CourseDataFetch();

        // Perform password validation for insertion and updatation of data in courses.

        if (courseDataFetch.AlreadyPresent(CourseId) && action.equals("edit")) {
            success = courseDataFetch.editcourse(course);
        }

        else {
            success = courseDataFetch.AddCourse(course);
        }

        // Prepare a JSON response
        JsonObject jsonResponse = new JsonObject();
        if (success) {
            jsonResponse.addProperty("status", "success");
            jsonResponse.addProperty("message", "course added successfully.");
        } else {
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "course addition failed. Please check your inputs.");
        }

        // Set the content type of the response to JSON

        response.setContentType("application/json");

        // Write the JSON response to the client
        response.getWriter().write(jsonResponse.toString());

    }

}
