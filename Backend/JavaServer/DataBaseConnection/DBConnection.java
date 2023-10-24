package DataBaseConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnection{
	static Connection connection;
	
    private static final String URL = "jdbc:mysql://localhost:3306/attandance";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "1424";

    public static Connection getConnection() throws SQLException {
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        return connection;
    }

}