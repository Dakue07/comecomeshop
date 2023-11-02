package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// MySQLに接続するためのクラス

public class MySQLConnector extends MySQLAccessor {
	public static Connection getConnection(String sqlinstance, String user, String pass) {
		Connection cn = null;
		try {
			cn = DriverManager.getConnection("jdbc:mysql://" + sqlinstance + "/db1?user=" + user + "&password=" + pass);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cn;
	}
}