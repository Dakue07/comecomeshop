package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.CardBean;
import database.MySQLOperator;

public class CardTableDao {
	private static final String INSERT_CARD = "INSERT INTO CARDTABLE(user_id, card_holdername, card_number, card_validity, card_securitycode) values(?, ?, ?, ?, ?)";
	private static final String SELECT_CARD_BY_USER = "SELECT * FROM CARDTABLE WHERE user_id = ?";
	private static final String DELETE_CARD = "DELETE FROM CARDTABLE WHERE user_id = ? AND card_number = ?";
	
	Connection cn = MySQLOperator.getInstance().getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void insertCard(int user_id, String card_holdername, String card_number, Date card_validity, String card_securitycode) {
		try {
			PreparedStatement pstmt = cn.prepareStatement(INSERT_CARD);
			pstmt.setInt(1, user_id);
			pstmt.setString(2, card_holdername);
			pstmt.setString(3, card_number);
			pstmt.setDate(4, card_validity);
			pstmt.setString(5, card_securitycode);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			MySQLOperator.getInstance().rollback();
			e.printStackTrace();
		}
	}
	
	public ArrayList<CardBean> selectCardByUser(int user_id) {
		ArrayList<CardBean> result = new ArrayList<>();
		try {
			PreparedStatement pstmt = cn.prepareStatement(SELECT_CARD_BY_USER);
			pstmt.setInt(1, user_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CardBean cardBean = new CardBean();
				String card_number = rs.getString("card_number");
				cardBean.setUser_id(rs.getInt("user_id"));
				cardBean.setCard_holdername(rs.getString("card_holdername"));
				cardBean.setCard_number(rs.getString("card_number"));
				String replace_number = "************" + card_number.substring(12);
				cardBean.setCard_replace_number(replace_number);
				cardBean.setCard_validity(rs.getDate("card_validity"));
				cardBean.setCard_securitycode(rs.getString("card_securitycode"));
				
				result.add(cardBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}	
	
	public void deleteCard(int user_id, String card_number) {
		try {
			pstmt = cn.prepareStatement(DELETE_CARD);
			pstmt.setInt(1, user_id);
			pstmt.setString(2, card_number);
			pstmt.executeUpdate();
			System.out.println("さくじょできた");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}