package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.MySQLOperator;
import dto.UserTableDto;

public class UserDao {
	private static final String INSERT_USER = "INSERT INTO USERTABLE (user_name, user_pass, user_Email) VALUES (?, ?, ?)";
	private static final String SELECT_USER_PASS = "SELECT user_id, user_name, user_pass FROM USERTABLE WHERE user_name = ?";
	private static final String SELECT_USER_ID = "SELECT user_id FROM USERTABLE WHERE user_name = ? AND user_pass = ?";
	private static final String SELECT_ALL = "SELECT * FROM USERTABLE";
	private static final String DELETE_USER = "DELETE FROM USERTABLE WHERE user_id = ?";
	
	Connection cn = null;
	PreparedStatement prsmt = null;
	ResultSet rs = null;
	
	public Connection connect() {
		cn = MySQLOperator.getInstance().getConnection(); //引数合ってる分からん 
		return cn;
	}
	
	public UserTableDto findRecord(String user) {
		
		UserTableDto dto = null;
		try {
			cn = connect(); 
			prsmt = cn.prepareStatement(SELECT_USER_PASS);
			prsmt.setString(1, user);
			rs = prsmt.executeQuery();
			if(rs != null && rs.next()) {
				dto = new UserTableDto(rs.getInt(1), rs.getString(2), rs.getString(3));
			} else {
				System.out.println("null");
			}
		} catch(SQLException e) {
			MySQLOperator.getInstance().rollback();
		}
		return dto;
	}
	
	public boolean createUser(String name, String pass, String Email) {
		try {
			cn = connect();
					
			prsmt = cn.prepareStatement(INSERT_USER);
			prsmt.setString(1, name);
			prsmt.setString(2, pass);
			prsmt.setString(3, Email);
			int row = prsmt.executeUpdate();
      
			return row > 0;
		} catch(SQLException e) {
			MySQLOperator.getInstance().rollback();
			e.printStackTrace();
			return false;
		}
	
	}
	
	public String findUser_id(String user_name, String user_pass) {
		String user_id = null;
		
		try {
			cn = connect();
			prsmt = cn.prepareStatement(SELECT_USER_ID);
			prsmt.setString(1, user_name);
			prsmt.setString(2, user_pass);
			rs = prsmt.executeQuery();
			rs.next();
			user_id = rs.getString(1);
			System.out.println(user_id);
		} catch(SQLException e) {
			MySQLOperator.getInstance().rollback();
		}
		
		return user_id;
	}
	
	public ArrayList<UserTableDto> SelectAll() {
		ArrayList<UserTableDto> result = new ArrayList<UserTableDto>();
		try {
			System.out.println("SelectAll始まり");
			cn = connect();
			prsmt = cn.prepareStatement(SELECT_ALL);
			rs = prsmt.executeQuery();
			while(rs.next()) {
				UserTableDto userdto = new UserTableDto();
				userdto.setUser_id(rs.getInt("user_id"));
				userdto.setUser_name(rs.getString("user_name"));
				userdto.setUser_pass(rs.getString("user_pass"));
				userdto.setUser_Email(rs.getString("user_Email"));
				result.add(userdto);
				System.out.println("SelectAll" + result);
			}
			
		} catch(SQLException e) {
			MySQLOperator.getInstance().rollback();
		}
		return result;
		
	}
	
	public void deleteUser(int user_id) {
		System.out.println("deleteの始まりとuser_id:" + user_id );
		try {
			cn = connect();
			prsmt = cn.prepareStatement(DELETE_USER);
			prsmt.setInt(1, user_id);
			prsmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
			MySQLOperator.getInstance().rollback();
		}
	}
}
