package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.MySQLOperator;
import dto.UserDto;

public class UserDao {
	private static final String INSERT_USER = "INSERT INTO usertable (user_name, user_pass) VALUES (?, ?)";
	private static final String SELECT_USER_PASS = "SELECT user_name, user_pass FROM usertable WHERE user_name = ?";
	private static final String DB_USER = "come";
	private static final String DB_PASS = "come";
	
	MySQLOperator ma = new MySQLOperator();
	
	Connection cn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Connection connect() {
		cn = ma.getConnection(); //引数合ってる分からん 
		return cn;
	}
	
	public UserDto findRecord(String user) {
		
		UserDto dto = null;
		try {
			cn = connect(); 
			pstmt = cn.prepareStatement(SELECT_USER_PASS);
			pstmt.setString(1, user);
			rs = pstmt.executeQuery();
			if(rs != null && rs.next()) {
				dto = new UserDto(rs.getString(1), rs.getString(2));
			} else {
				System.out.println("null");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public boolean createUser(String name, String pass) {
		try {
			cn = connect();
			PreparedStatement pstmt = cn.prepareStatement(INSERT_USER);
			pstmt.setString(1, name);
			pstmt.setString(2, pass);
			int row = pstmt.executeUpdate();
			return row > 0;
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
	
	}
}
