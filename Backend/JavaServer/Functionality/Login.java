package Functionality;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DataBaseConnection.DBConnection;

public class Login {

	public boolean isvalid(long Uid, String Password) {

		String query = "select * from  admin where admin_id = ? and admin_password = ?";
		Connection connetion = null;
		try {
			connetion = DBConnection.getConnection();

			PreparedStatement preparedstatement = connetion.prepareStatement(query);

			preparedstatement.setLong(1, Uid);
			preparedstatement.setString(2, Password);

			ResultSet resultSet = preparedstatement.executeQuery();

			while (resultSet.next()) {
				return true;
			}
			connetion.close();
		}

		catch (SQLException e) {
			return false;
		}

		return false;
	}

}
