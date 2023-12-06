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
	
	Connection cn = MySQLOperator.getInstance().getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void insertCard(int user_id, String card_number, String card_securitycode, String card_holdername, Date card_validity) {
		try {
			PreparedStatement pstmt = cn.prepareStatement(INSERT_CARD);
			pstmt.setInt(1, user_id);
			pstmt.setString(2, card_number);
			pstmt.setString(3, card_securitycode);
			pstmt.setString(4, card_holdername);
			pstmt.setDate(5, card_validity);
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
				cardBean.setUser_id(rs.getInt("user_id"));
				cardBean.setCard_holdername(rs.getString("card_holdername"));
				String number = "************" + rs.getString("card_number").substring(12);
				cardBean.setCard_number(number);
				cardBean.setCard_validity(rs.getDate("card_validity"));
				cardBean.setCard_securitycode(rs.getString("card_securitycode"));
				
				result.add(cardBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}	
}