package Functionality;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DataBaseConnection.DBConnection;

class Login{
	
	DBConnection dbconnect = new DBConnection();

	public boolean isvalid(long Uid, String Password){
		
		String query = "select * from  Registration where id = ? and password = ?";

		try{
			Connection connetion = dbconnect.getConnection();

			PreparedStatement preparedstatement = connetion.prepareStatement(query);

			preparedstatement.setLong(1,Long.valueOf("id"));
			preparedstatement.setString(2,"password");

			preparedstatement.executeQuery();

		}

		catch(SQLException e){
			return false;
		}

		return true;
	}

	public String getRole(long Uid){
		String query = "select role from Registration where id = ?";
		Connection connetion = null;
		String role = "";

		try{
			connetion = dbconnect.getConnection();

			PreparedStatement preparedstatement = connetion.prepareStatement(query);

			preparedstatement.setLong(1,Uid);

			ResultSet r = preparedstatement.executeQuery();

			while(r.next()){
				role = r.getString("role");
			}
		}
		catch(SQLException e){

		}


		return role;
	}
}
