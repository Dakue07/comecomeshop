package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MySQLOperator {
	private static Connection cn = null;
	private static PreparedStatement st = null;
	private static ResultSet rs = null;
	private static int choose = 0;
	
	public Connection getConnection(String orainstance, String user, String pass) {
		return cn = MySQLConnector.getConnection(orainstance, user, pass);
	}
	
	public void close(Connection cn, PreparedStatement _st) {
		st = _st;
		choose++;
		close(cn);
	}
	public void close(Connection cn, PreparedStatement _st, ResultSet _rs) {
		st = _st;
		rs = _rs;
		choose += 2;
		close(cn);
	}
	public void close(Connection cn) {
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
}