package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MySQLCloser extends MySQLAccessor {
	public static void close(Connection cn){
		try {
			if (cn != null) {
				cn.close();
			}
			System.out.println("リソースの開放完了");
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}
	
	public static void close(Connection cn, PreparedStatement st){
		try {
			if (st != null) {
				st.close();
			}
			if (cn != null) {
				cn.close();
			}
			System.out.println("リソースの開放完了");
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}
	
	public static void close(Connection cn, PreparedStatement st, ResultSet rs){
		try {
			if (rs != null) {
				rs.close();
			}
			if (st != null) {
				st.close();
			}
			if (cn != null) {
				cn.close();
			}
			System.out.println("リソースの開放完了");
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}
}
