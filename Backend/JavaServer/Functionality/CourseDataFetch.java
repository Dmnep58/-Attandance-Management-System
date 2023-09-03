package Functionality;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DataBaseConnection.DBConnection;
import model.Course;

public class CourseDataFetch {

    Connection connection = null;

    // insertion of the data in DataBase
    public boolean AddCourse(Course course) {

        String query = "INSERT into course values(? , ? , ? , ?)";
        boolean inserted = false;
        try {
            connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setLong(1, course.getCourseId());
            preparedStatement.setDate(2, course.getStartDate());
            preparedStatement.setDate(3, course.getEndDate());
            preparedStatement.setString(4, course.getCourseName());

            int row = preparedStatement.executeUpdate();

            if (row > 0) {
                inserted = true;
                connection.close();

            }
        } catch (SQLException e) {
            inserted = false;
        }

        return inserted;
    }

    // find the number of the course
    public long NumberOfCourse() {
        String query = "select count(*) from course";
        long courses = 0;

        try {
            connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                courses = resultSet.getLong(1);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {

                e.printStackTrace();
            }
        }

        return courses;
    }

    // fetch all course data
    public List<Course> FetchAllCourseData() {
        List<Course> courses = new ArrayList<>();

        String query = "select * from course";

        try {
            connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Course course = new Course();
                course.setCourseId(resultSet.getLong("course_id"));
                course.setStartDate(resultSet.getDate("start_date"));
                course.setEndDate(resultSet.getDate("end_date"));
                course.setCourseName(resultSet.getString("course_name"));
                courses.add(course);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        ;

        return courses;
    }

    // edit the course data
    public boolean editcourse(Course course) {

        boolean edited = false;
        String query = "Update course set coursename = ? , startDate= ? , endDate = ? where courseid = ?";

        try {
            connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setString(1, course.getCourseName());
            preparedStatement.setDate(2, course.getStartDate());
            preparedStatement.setDate(3, course.getEndDate());
            preparedStatement.setLong(4, course.getCourseId());

            int row = preparedStatement.executeUpdate();

            if (row > 0) {
                edited = true;
                connection.close();
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return edited;
    }

    // find the course is already present or not
    public boolean AlreadyPresent(long courseid) {

        boolean isexists = false;

        String query = "select * from course where course_id = ?";

        try {
            connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setLong(1, courseid);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                isexists = true;
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return isexists;
    }

}
