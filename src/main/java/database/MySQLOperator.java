package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MySQLOperator {
	private static Connection cn = null;
	private static PreparedStatement st = null;
	private static ResultSet rs = null;
	private static int choose = 0;
	
	public static Connection getConnection(String user, String pass) {
		return cn = MySQLConnector.getConnection(user, pass);
	}
	
	public static void close(Connection cn, PreparedStatement _st) {
		st = _st;
		choose++;
		close(cn);
	}
	public static void close(Connection cn, PreparedStatement _st, ResultSet _rs) {
		st = _st;
		rs = _rs;
		choose += 2;
		close(cn);
	}
	public static void close(Connection cn) {
		switch (choose) {
			case 0:
				MySQLCloser.close(cn);
				break;
			case 1:
				MySQLCloser.close(cn, st);
				break;
			case 2:
				MySQLCloser.close(cn, st, rs);
				break;
		}
	}
	
	public Statement getStatement(String user, String pass) {
    	Connection cn = getConnection(user, pass);
    	Statement st = null;
    	
    	try {
    		st = cn.createStatement();
    	} catch(SQLException e) {
            e.printStackTrace();
        }
    	
    	return st;
    }
}