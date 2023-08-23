package Functionality;

class Login{


	public boolean isvalid(long Uid, String Password){

		String query = "select * from  Registration where id = ? and password = ?";

		try{
			Connection connetion = DBConnetion.getConnection();

			PreparedStatement preparedstatement = connection.preparedstatement(query);

			preparedstatement.setLong(1,Long.ValueOf("id"));
			preparedstatement.setString(2,"password");

			preparedstatement.executeQuery();
		}

		catch(SQLException e){

		}

		connection.close();
	}

	public String getRole(long Uid){
		String query = "select role from Registration where id = ?";
		Connection connetion = null;
		String role = "";

		try{
			connetion = DBConnetion.getConnection();

			PreparedStatement preparedstatement = connection.preparedstatement(query);

			preparedstatement.setLong(1,Uid);

			ResultSet r = preparedstatement.executeQuery();

			while(r.next()){
				role = r.getString("role");
			}
		}
		catch(SQLExcetion e){

		}

		connection.close();

		return role;
	}
}
