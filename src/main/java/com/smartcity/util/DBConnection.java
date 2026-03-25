package com.smartcity.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static String url="jdbc:postgresql://localhost:5433/smartcity?sslmode=disable";
	private static String username="postgres";
	private static String password="123";
	

	
	public static Connection getConnection(){
		Connection conn=null;
		try {
				Class.forName("org.postgresql.Driver");
				 conn=DriverManager.getConnection(url,username,password);
		}
		catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return conn;
	}
}
