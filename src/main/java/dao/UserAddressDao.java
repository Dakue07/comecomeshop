package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.UserAddressBean;
import database.MySQLOperator;

public class UserAddressDao {
	private static final String INSERT_ADDRESS = "INSERT INTO USERADDRESSTABLE(user_id, useraddress_receiver, useraddress_postcode, useraddress_state_city, useraddress_street) values(?, ?, ?, ?, ?)";
	private static final String SELECT_ADDRESS_BY_USER = "SELECT * FROM USERADDRESSTABLE WHERE user_id = ?";
	private static final String DELETE_ADDRESS = "DELETE FROM USERADDRESSTABLE WHERE useraddress_id = ?";
	
	Connection cn = MySQLOperator.getInstance().getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public boolean insertAddress(int user_id, String useraddress_receiver, String useraddress_postcode, String useraddress_state_city, String useraddress_street) {
		try {
			PreparedStatement pstmt = cn.prepareStatement(INSERT_ADDRESS);
			pstmt.setInt(1, user_id);
			pstmt.setString(2, useraddress_receiver);
			pstmt.setString(3, useraddress_postcode);
			pstmt.setString(4, useraddress_state_city);
			pstmt.setString(5, useraddress_street);
			int row = pstmt.executeUpdate();
			return row > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	public ArrayList<UserAddressBean> selectAddressByUser(int user_id) {
		ArrayList<UserAddressBean> result = new ArrayList<>();
		try {
			PreparedStatement pstmt = cn.prepareStatement(SELECT_ADDRESS_BY_USER);
			pstmt.setInt(1, user_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				UserAddressBean userAddressBean = new UserAddressBean();
				
				userAddressBean.setUseraddress_id(rs.getInt(1));
				userAddressBean.setUser_id(rs.getInt(2));
				userAddressBean.setUseraddress_receiver(rs.getString(3));
				userAddressBean.setUseraddress_postcode(rs.getString(4));
				userAddressBean.setUseraddress_state_city(rs.getString(5));
				userAddressBean.setUseraddress_street(rs.getString(6));
				
				result.add(userAddressBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public void deleteAddress(int useraddress_id) {
		try {
			cn = MySQLOperator.getInstance().getConnection();
			PreparedStatement pstmt = cn.prepareStatement(DELETE_ADDRESS);
			pstmt.setInt(1, useraddress_id);
			pstmt.executeUpdate();
			System.out.println("住所削除完了");
		} catch (SQLException e) {
			e.printStackTrace();
			MySQLOperator.getInstance().rollback();
		}
		
	}	
}