package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.MySQLOperator;
import dto.UserTableDto;

public class UserDao {
	private static final String INSERT_USER = "INSERT INTO usertable (user_name, user_pass, user_Email) VALUES (?, ?, ?)";
	private static final String SELECT_USER_PASS = "SELECT user_name, user_pass FROM usertable WHERE user_name = ?";
	private static final String SELECT_USER_ID = "SELECT user_id FROM usertable WHERE user_name = ? AND user_pass = ?";
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
	
	public UserTableDto findRecord(String user) {
		
		UserTableDto dto = null;
		try {
			cn = connect(); 
			pstmt = cn.prepareStatement(SELECT_USER_PASS);
			pstmt.setString(1, user);
			rs = pstmt.executeQuery();
			if(rs != null && rs.next()) {
				dto = new UserTableDto(rs.getString(1), rs.getString(2));
			} else {
				System.out.println("null");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public boolean createUser(String name, String pass, String mail, String useraddress_postcord, String useraddress_state_sity, String useraddress_street) {
		try {
			cn = connect();
			cn.setAutoCommit(false);
			PreparedStatement pstmt = cn.prepareStatement(INSERT_USER);
			pstmt.setString(1, name);
			pstmt.setString(2, pass);
			pstmt.setString(3, mail);
			int row = pstmt.executeUpdate();
			UserAddressDao uDao = new UserAddressDao();
			uDao.insertAddress(cn, name, useraddress_postcord, useraddress_state_sity, useraddress_street);
			cn.commit();
			return row > 0;
		} catch(SQLException e) {
			try {
				cn.rollback();
			} catch(SQLException e2) {
				e2.printStackTrace();
			}
			e.printStackTrace();
			return false;
		}
	
	}
	
	public String findUser_id(String user_name, String user_pass) {
		String user_id = null;
		
		try {
			cn = connect();
			pstmt = cn.prepareStatement(SELECT_USER_ID);
			pstmt.setString(1, user_name);
			pstmt.setString(2, user_pass);
			rs = pstmt.executeQuery();
			rs.next();
			user_id = rs.getString(1);
			System.out.println(user_id);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return user_id;
	}
}
