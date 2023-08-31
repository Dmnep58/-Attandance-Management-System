package Functionality;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DataBaseConnection.DBConnection;
import model.TeacherStudent;

public class TeacherStudentDetails {

    // add the student
    public boolean AddTeacherStudent(TeacherStudent s) {
        String query = "INSERT into registration values(? ,? , ? , ? , ? , ? , ? , ? , ?)";

        try {
            Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setLong(1, s.getUid());
            preparedStatement.setString(2, s.getPasword());
            preparedStatement.setLong(3, s.getRegno());
            preparedStatement.setLong(4, s.getPhno());
            preparedStatement.setString(5, s.getName());
            preparedStatement.setString(6, s.getEmail());
            preparedStatement.setString(7, s.getAddres());
            preparedStatement.setString(8, s.getImage());
            preparedStatement.setString(9, s.getRole());

            int row = preparedStatement.executeUpdate();

            if (row > 0) {
                return true;
            }

        } catch (SQLException e) {

        }

        return false;

    }

    // fetch data from Registration for student
    public List<TeacherStudent> FetchStudentData() {
        String query = "SELECT * FROM registration where role = 'student'";

        List<TeacherStudent> ts = new ArrayList<>();

        try {
            Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                TeacherStudent teacherStudent = new TeacherStudent();
                teacherStudent.setAddres(resultSet.getString("address"));
                teacherStudent.setEmail(resultSet.getString("email"));
                teacherStudent.setName(resultSet.getString("name"));
                teacherStudent.setPhno(resultSet.getLong("phnno"));
                teacherStudent.setRegno(resultSet.getLong("regno"));
                teacherStudent.setUid(resultSet.getLong("uid"));

                ts.add(teacherStudent);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ts;
    }

    // fetch data from Registration for student
    public List<TeacherStudent> FetchTeacherData() {
        String query = "SELECT * FROM registration where role = 'Teacher'";

        List<TeacherStudent> ts = new ArrayList<>();

        try {
            Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                TeacherStudent teacherStudent = new TeacherStudent();
                teacherStudent.setAddres(resultSet.getString("address"));
                teacherStudent.setEmail(resultSet.getString("email"));
                teacherStudent.setName(resultSet.getString("name"));
                teacherStudent.setPhno(resultSet.getLong("phnno"));
                teacherStudent.setRegno(resultSet.getLong("regno"));
                teacherStudent.setUid(resultSet.getLong("uid"));

                ts.add(teacherStudent);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ts;
    }

    // fetch data from Registration
    public List<TeacherStudent> FetchAllData() {
        String query = "SELECT * FROM registration";

        List<TeacherStudent> ts = new ArrayList<>();

        try {
            Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                TeacherStudent teacherStudent = new TeacherStudent();
                teacherStudent.setAddres(resultSet.getString("address"));
                teacherStudent.setEmail(resultSet.getString("email"));
                teacherStudent.setName(resultSet.getString("name"));
                teacherStudent.setPhno(resultSet.getLong("phnno"));
                teacherStudent.setRegno(resultSet.getLong("regno"));
                teacherStudent.setUid(resultSet.getLong("uid"));

                ts.add(teacherStudent);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ts;
    }

    // fetch no of student
    public long StudentsNumber() {
        String number = "select count(*) from registration where role='student'";
        long nLong = 0;
        try {
            Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(number);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                nLong = resultSet.getLong(1);
            }

        } catch (SQLException e) {
            // TODO: handle exception
        }

        return nLong;
    }

    // fetch no of Teacher
    public long TeachersNumber() {
        String number = "select count(*) from registration where role='Teacher'";
        long nLong = 0;
        try {
            Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(number);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                nLong = resultSet.getLong(1);
            }

        } catch (SQLException e) {
            // TODO: handle exception
        }

        return nLong;
    }

}
