package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.MySQLOperator;
import dto.UserDto;

public class UserDao {
	private static final String INSERT_USER = "INSERT INTO usertable (name, password) VALUES (?, ?)";
	private static final String SELECT_USER_PASS = "SELECT name, password FROM usertable WHERE name = ?";
//	private static final String DB_USER = "come";
//	private static final String DB_PASS = "come";
//	
	MySQLOperator ma = new MySQLOperator();
	
	Connection cn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public UserDto findRecode(String user) {
		UserDto dto = null;
		cn = ma.getConnection(cn, DB_USER, DB_PASS); //引数合ってる分からん
		pstmt = cn.prepareStatement(SELECT_USER_PASS);
		pstmt.setString(1, user);
		rs = pstmt.executeQuery();
		if(rs != null) {
			dto = new UserDto(rs.getString(1), rs.getString(2));
		} else {
			System.out.println("null");
		}
		ma.close(cn, pstmt, rs);
	}
	
	public boolean createUser(String name, String user) {
		try {
			Connection cn = ma.getConnection(cn, DB_USER, DB_PASS);
			PreparedStatement pstmt = cn.prepareStatement(INSERT_USER);
			pstmt.setString(1, name);
			pstmt.setString(2, user);
			int row = pstmt.executeUpdate();
			return row > 0;
		} catch(SQLException e) {
			e.printStackTrace();
		}
	
	}
}
