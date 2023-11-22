package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.MySQLOperator;
import dto.UserTableDto;

public class UserDao {
	private static final String INSERT_USER = "INSERT INTO usertable (user_name, user_pass, user_Email) VALUES (?, ?, ?)";
	private static final String SELECT_USER_PASS = "SELECT user_id, user_name, user_pass FROM usertable WHERE user_name = ?";
	private static final String SELECT_USER_ID = "SELECT user_id FROM usertable WHERE user_name = ? AND user_pass = ?";
	private static final String DB_USER = "come";
	private static final String DB_PASS = "come";
	
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
			e.printStackTrace();
		}
		return dto;
	}
	
	public boolean createUser(String name, String pass, String mail, String useraddress_postcord, String useraddress_state_sity, String useraddress_street) {
		try {
			cn = null;
			cn = MySQLOperator.getInstance().getConnection();
					
			cn.setAutoCommit(false);
			prsmt = cn.prepareStatement(INSERT_USER);
			prsmt.setString(1, name);
			prsmt.setString(2, pass);
			prsmt.setString(3, mail);
			int row = prsmt.executeUpdate();

			prsmt = cn.prepareStatement(SELECT_USER_ID);
			prsmt.setString(1, name);
			prsmt.setString(2, pass);
			rs = prsmt.executeQuery();
			rs.next();
			int user_id = rs.getInt(1);
      
			UserAddressDao uDao = new UserAddressDao();
			uDao.insertAddress(cn, user_id, useraddress_postcord, useraddress_state_sity, useraddress_street);
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
			prsmt = cn.prepareStatement(SELECT_USER_ID);
			prsmt.setString(1, user_name);
			prsmt.setString(2, user_pass);
			rs = prsmt.executeQuery();
			rs.next();
			user_id = rs.getString(1);
			System.out.println(user_id);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return user_id;
	}
}
