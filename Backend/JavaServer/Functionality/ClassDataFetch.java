package Functionality;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DataBaseConnection.DBConnection;
import model.Classes;

public class ClassDataFetch {

    Connection connection = null;
    // inner join the table course and enrollment to find required fields.

    public List<Classes> DataClass() {
        List<Classes> l = new ArrayList<>();
        String query = "SELECT course.course_name, enrollment.teacher_id FROM course INNER JOIN enrollment ON course.course_id = enrollment.course_id";
        try {
            connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Classes classes = new Classes();
                classes.setCourseName(resultSet.getString("course_name"));
                classes.setTeacherId(resultSet.getLong("teacher_id"));

                l.add(classes);
            }
            connection.close();
            preparedStatement.close();
        } catch (SQLException e) {
            
            e.printStackTrace();
        }

        return l;
    }

    public int countClass() {
        int classes = 0;
        String query = "select * from enrollment";
        try {
            connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                classes = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            
            e.printStackTrace();
        }

        return classes;
    }
}
