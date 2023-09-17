package Functionality;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DataBaseConnection.DBConnection;
import model.Enrollment;

public class Enrollments {

	Connection connection = null;
	PreparedStatement preparedStatement = null;

	static Enrollment enrollment = new Enrollment();

	// fetch all the batch
	public List<String> allBranches(long facultyid) {
		String query = "select batch from facultyenrollment where teacher_id=?";
		List<String> list = new ArrayList<>();
		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(query);

			preparedStatement.setLong(1, facultyid);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				list.add(resultSet.getString(1));
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

	// enroll a course and its batch to a faculty
	public boolean FacultyEnroll(Enrollment enrollment) {
		boolean enrolled = false;

		String query = "Insert into facultyenrollment VALUES(? , ? , ?)";

		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(query);

			preparedStatement.setLong(1, enrollment.getCourseid());
			preparedStatement.setLong(2, enrollment.getFacultyid());
			preparedStatement.setString(3, enrollment.getBatch());

			int row = preparedStatement.executeUpdate();

			if (row > 0) {
				enrolled = true;
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
				System.out.println("bhakk bey");
				e.printStackTrace();
			}
		}
		return enrolled;

	}

	// enroll student to a course
	public void studentenrolled(long studentid, String course) {
		CourseDataFetch courseDataFetch = new CourseDataFetch();
		long courseid = courseDataFetch.FetchCourseId(course);
		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection
					.prepareStatement("Insert into studentenrollment(course_id,student_id) VALUES(? , ?)");
			preparedStatement.setLong(1, courseid);
			preparedStatement.setLong(2, studentid);

			// int row =
			preparedStatement.executeUpdate();
			//
			// if(row> 0) {
			// enrolled = true;
			// }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				connection.close();
				preparedStatement.close();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("bhakk bey");
				e.printStackTrace();
			}
		}
	}

	// Total number of batch teacher enrolled in
	public long TeacherEnrolledBranch(long teacherid) {
		long batch = 0;

		String sql = "select count(distinct(batch)) from facultyenrollment  where teacher_id=?";

		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setLong(1, teacherid);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				batch = resultSet.getLong(1);
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

		return batch;
	}

}
