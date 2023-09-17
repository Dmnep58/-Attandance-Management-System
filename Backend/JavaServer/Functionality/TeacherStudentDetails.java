package Functionality;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import DataBaseConnection.DBConnection;
import model.TeacherStudent;

public class TeacherStudentDetails {

    Connection connection = null;
    PreparedStatement preparedStatement = null;

    // add the student
    public boolean AddTeacherStudent(TeacherStudent s) {
        String query = "INSERT into registration values(? ,? , ? , ? , ? , ? , ? , ? , ?)";

        try {
            connection = DBConnection.getConnection();
            preparedStatement = connection.prepareStatement(query);

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

        } finally {
            try {
                connection.close();
                preparedStatement.close();

            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        return false;

    }

    // fetch data from Registration for user having role student
    public List<TeacherStudent> FetchStudentData() {
        String query = "SELECT * FROM registration where role = 'student'";

        List<TeacherStudent> ts = new ArrayList<>();

        try {
            connection = DBConnection.getConnection();
            preparedStatement = connection.prepareStatement(query);

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
        } finally {
            try {
                connection.close();
                preparedStatement.close();

            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        return ts;
    }

    // fetch data from Registration for user having role Teacher
    public List<TeacherStudent> FetchTeacherData() {
        String query = "SELECT * FROM registration where role = 'Teacher'";

        List<TeacherStudent> ts = new ArrayList<>();

        try {
            connection = DBConnection.getConnection();
            preparedStatement = connection.prepareStatement(query);

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
        } finally {
            try {
                connection.close();
                preparedStatement.close();

            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return ts;
    }

    // fetch data from Registration
    public List<TeacherStudent> FetchAllData() {
        String query = "SELECT * FROM registration";

        List<TeacherStudent> ts = new ArrayList<>();

        try {
            connection = DBConnection.getConnection();
            preparedStatement = connection.prepareStatement(query);

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
        } finally {
            try {
                connection.close();
                preparedStatement.close();

            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        return ts;
    }

    // fetch no of student
    public long StudentsNumber() {
        String number = "select count(*) from registration where role='student'";
        long nLong = 0;
        try {
            connection = DBConnection.getConnection();
            preparedStatement = connection.prepareStatement(number);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                nLong = resultSet.getLong(1);
            }

        } catch (SQLException e) {
            // TODO: handle exception
        } finally {
            try {
                connection.close();
                preparedStatement.close();

            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return nLong;
    }

    // fetch no of Teacher
    public long TeachersNumber() {
        String number = "select count(*) from registration where role='Teacher'";
        long nLong = 0;
        try {
            connection = DBConnection.getConnection();
            preparedStatement = connection.prepareStatement(number);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                nLong = resultSet.getLong(1);
            }

        } catch (SQLException e) {
            // TODO: handle exception
        } finally {
            try {
                connection.close();
                preparedStatement.close();

            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        return nLong;
    }

    // Delete the record in registration table.
    public boolean deleteRecord(long uid) {
        final Logger logger = Logger.getLogger(TeacherStudent.class.getName());
        String query = "DELETE FROM registration WHERE uid = ?";
        try {
            connection = DBConnection.getConnection();
            preparedStatement = connection.prepareStatement(query);

            preparedStatement.setLong(1, uid);
            int result = preparedStatement.executeUpdate();

            if (result > 0) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // You may consider logging the exception here or throwing a custom exception.
            logger.log(Level.SEVERE, "Error deleting record", e);
        } finally {
            try {
                connection.close();
                preparedStatement.close();

            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        return false;
    }

    // check for the teacher or student presence
    public boolean ispresent(long uid) {
        boolean ispresent = false;
        String query = "Select * from registration where uid = ? ";
        try {
            connection = DBConnection.getConnection();
            preparedStatement = connection.prepareStatement(query);

            preparedStatement.setLong(1, uid);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                ispresent = true;
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            try {
                connection.close();
                preparedStatement.close();

            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return ispresent;
    }

    // fetch the role of the user
    public String Userrole(long id) {
        String query = "select role from registration where uid = ?";
        String role = "";
        try {
            connection = DBConnection.getConnection();
            preparedStatement = connection.prepareStatement(query);

            preparedStatement.setLong(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                role = resultSet.getString(1);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            try {
                connection.close();
                preparedStatement.close();

            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        return role;

    }

    // Fetch number of courses enrolled by the teacher
    public int TeacherCourseEnroll(int teacherid) {
        int courses = 0;
        String sql = "select count(distinct(course_id)) from facultyenrollment  where teacher_id=?";

        try {
            connection = DBConnection.getConnection();
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setLong(1, teacherid);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                courses = (int) resultSet.getLong(1);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            try {
                connection.close();
                preparedStatement.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return courses;
    }

    // total number of students enrolled till now
    public long NumberOfStudents() {
        long students = 0;
        String sql = "select count(*) from registration where role='student'";

        try {
            connection = DBConnection.getConnection();
            preparedStatement = connection.prepareStatement(sql);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                students = (int) resultSet.getLong(1);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            try {
                connection.close();
                preparedStatement.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        return students;
    }

}
