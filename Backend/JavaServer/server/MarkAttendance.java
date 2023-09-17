package server;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Functionality.AttendanceManagement;
import model.Attendance;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@WebServlet("/MarkAttendance")
public class MarkAttendance extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Initialize Gson
        Gson gson = new Gson();

        try {
            // Parse JSON payload
            StringBuilder sb = new StringBuilder();
            try (BufferedReader reader = request.getReader()) {
                String line;
                while ((line = reader.readLine()) != null) {
                    sb.append(line);
                }
            }

            String payload = sb.toString();

            Attendance attendance = gson.fromJson(payload, Attendance.class);

            String facultyId = attendance.getFacultyid();
            String batch = attendance.getBatch();
            List<String> studentIds = attendance.getStudentIds();
            List<String> markList = attendance.getMarkvalue();

            AttendanceManagement aManagement = new AttendanceManagement();

            // updating the attendance; Update your database using facultyId, batch, and
            // studentIds

            long fid = Integer.parseInt(facultyId);
            for (int i = 0; i < studentIds.size(); i++) {

                if (markList.get(i).equals("1")) {
                    aManagement.updatePresentDays(Long.parseLong(studentIds.get(i)), fid, batch);
                }

                if (markList.get(i).equals("0")) {
                    aManagement.updateTotalDays(Long.parseLong(studentIds.get(i)), fid, batch);
                }

            }

            // Prepare response
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("status", "success");
            jsonResponse.addProperty("message", "Successfully marked attendance");

            response.getWriter().write(gson.toJson(jsonResponse));

        } catch (Exception e) {
            // Handle error and prepare error response
            JsonObject jsonError = new JsonObject();
            jsonError.addProperty("status", "error");
            jsonError.addProperty("message", e.getMessage());

            // Print error message to server logs
            System.out.println("An error occurred: " + e.getMessage());

            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write(gson.toJson(jsonError));
        }
    }
}
