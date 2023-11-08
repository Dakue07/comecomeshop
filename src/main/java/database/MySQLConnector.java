package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// MySQLに接続するためのクラス

public class MySQLConnector extends MySQLAccessor {
	public Connection getConnection(String user, String pass) {
		Connection cn = null;
		try {
			
			cn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/orcl?characterEncoding=UTF-8&serverTimezone=JST",user,pass);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cn;
	}
}