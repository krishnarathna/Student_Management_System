package DbConnection;

import java.sql.*;

public class ConnectionProvider {
public static Connection getCon() {
	String url = "jdbc:mysql://localhost:3306/student";
	String name = "root";
	String pass = "ammukrish@123";
//	System.out.println("running");
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, name, pass);
		return con;
		
	}
	catch(Exception e)
	{
		System.out.println(e);
		return null;
	}
	
}
}
