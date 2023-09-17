package server;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Functionality.AttendanceManagement;
import model.Attendance;
import com.mysql.cj.Session;

@WebServlet("/SerachAttendes")
public class SerachAttendes extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SerachAttendes() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String batch = request.getParameter("batch");
        long facultyid = Long.parseLong(request.getParameter("facultyid"));
        AttendanceManagement attendanceManagement = new AttendanceManagement();

        List<Attendance> list = attendanceManagement.BatchFacultystudents(batch, facultyid);

        request.setAttribute("studentlist", list);
        request.getRequestDispatcher("MarkAttendance.jsp").forward(request, response);
    }

}
