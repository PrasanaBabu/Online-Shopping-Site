package project;
import java.sql.*;
public class UserDao {
	
	 
	
	public static Connection getConn() throws ClassNotFoundException, SQLException
	{
		String jdbcDriver="com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/ospjsp";
		String uname ="root";
		String pass ="root";
		
		Class.forName(jdbcDriver);
		Connection con = DriverManager.getConnection(url,uname,pass);
		
		return con;
	}
}
