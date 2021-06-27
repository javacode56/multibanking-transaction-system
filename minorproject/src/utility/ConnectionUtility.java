package utility;

import java.sql.*;

public class ConnectionUtility {
	private String username="root";
	private String password="root";
	private String driver="com.mysql.jdbc.Driver";
	private String url="jdbc:mysql://localhost:3306/emp";
	private Connection con=null;
	
	public Connection getConnection()
	{
		//Connection local=null;
		try
		{
			Class.forName(driver);
			//local=DriverManager.getConnection(url,username,password);
			con=DriverManager.getConnection(url,username,password);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return con;
		//return local;
	}

}
