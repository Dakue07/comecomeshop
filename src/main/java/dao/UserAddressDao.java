package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.MySQLOperator;

public class UserAddressDao {
	private static final String INSERT_ADDRESS = "INSERT INTO useraddresstable(user_id, useraddress_postcode, useraddress_state_sity, useraddress_street) values(?, ?, ?, ?)";
	
	MySQLOperator ma = new MySQLOperator();
	
	Connection cn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public boolean insertAddress(Connection cn, String user_id, String useraddress_postcode, String useraddress_state_sity, String useraddress_street) {
		try {
			PreparedStatement pstmt = cn.prepareStatement(INSERT_ADDRESS);
			pstmt.setString(1, user_id);
			pstmt.setString(2, useraddress_postcode);
			pstmt.setString(3, useraddress_state_sity);
			pstmt.setString(4, useraddress_street);
			int row = pstmt.executeUpdate();
			return row > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
}