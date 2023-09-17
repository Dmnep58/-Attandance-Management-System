package Functionality;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import DataBaseConnection.DBConnection;
import model.Attendance;

public class AttendanceManagement {

	Connection connection = null;
	PreparedStatement preparedStatement = null;

	// fetch all the datas from the attendance table
	public List<Attendance> FetchAttandance(String facultyid) {
		String query = "select * from attendance where teacher_id = ?";
		List<Attendance> list = new ArrayList<>();

		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(query);

			preparedStatement.setLong(1, Long.parseLong(facultyid));

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Attendance attendance = new Attendance();
				attendance.setId(resultSet.getLong("SN"));
				attendance.setStudentid(resultSet.getLong("student_id"));
				attendance.setFacultyid(String.valueOf(resultSet.getLong("teacher_id")));
				attendance.setPresentDays(resultSet.getLong("present_days"));
				attendance.setTotalDays(resultSet.getLong("total_days"));
				attendance.setstatus(resultSet.getString("Status"));

				list.add(attendance);

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

		return list;
	}

	// search the students according to the batch wise
	public List<Attendance> Batchstudents(String batch) {
		String query = "SELECT a.* FROM attendance a INNER JOIN studentenrollment se ON a.student_id = se.student_id WHERE se.batch = ?";
		List<Attendance> attendances = new ArrayList<>();

		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, batch);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Attendance attendance = new Attendance();
				attendance.setId(resultSet.getLong("SN"));
				attendance.setStudentid(resultSet.getLong("student_id"));
				attendance.setFacultyid(String.valueOf(resultSet.getLong("teacher_id")));
				attendance.setPresentDays(resultSet.getLong("present_days"));
				attendance.setTotalDays(resultSet.getLong("total_days"));
				attendance.setstatus(resultSet.getString("status"));
				attendances.add(attendance);
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

		return attendances;
	}

	// search the students according to the batch and faculty id
	public List<Attendance> BatchFacultystudents(String batch, long Facultyid) {
		String query = "SELECT DISTINCT a.* FROM attendance a INNER JOIN studentenrollment se ON a.student_id = se.student_id INNER JOIN facultyenrollment fe ON se.batch = fe.batch WHERE a.teacher_id = ? AND fe.batch = ?;";
		List<Attendance> attendances = new ArrayList<>();

		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setLong(1, Facultyid);
			preparedStatement.setString(2, batch);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Attendance attendance = new Attendance();
				attendance.setId(resultSet.getLong("SN"));
				attendance.setStudentid(resultSet.getLong("student_id"));
				attendance.setPresentDays(resultSet.getLong("present_days"));
				attendance.setTotalDays(resultSet.getLong("total_days"));
				attendance.setstatus(resultSet.getString("status"));
				attendances.add(attendance);
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
		return attendances;
	}

	// update the total days by one
	public void updateTotalDays(long studentid, long facultyid, String batch) {
		String query = "UPDATE ATTENDANCE AS a INNER JOIN facultyenrollment AS f ON a.teacher_id = f.teacher_id SET a.total_days = a.total_days + 1 WHERE a.student_id = ? AND a.teacher_id = ? AND f.batch = ?";
		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(query);

			preparedStatement.setLong(1, studentid);
			preparedStatement.setLong(2, facultyid);
			preparedStatement.setString(3, batch);

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

		} finally {
			try {

				connection.close();
				preparedStatement.close();

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

	}

	// update the present days and total days by one
	public void updatePresentDays(long studentid, long facultyid, String batch) {
		String query = "UPDATE ATTENDANCE AS a INNER JOIN facultyenrollment AS f ON a.teacher_id = f.teacher_id SET a.present_days = a.present_days + 1, a.total_days = a.total_days + 1 WHERE a.student_id = ? AND a.teacher_id = ? AND f.batch = ?";
		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(query);

			preparedStatement.setLong(1, studentid);
			preparedStatement.setLong(2, facultyid);
			preparedStatement.setString(3, batch);

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

		} finally {
			try {

				connection.close();
				preparedStatement.close();

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

	}

}
