package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.MySQLOperator;

public class ReviewTableDao {
	private static final String INSERT_ALL ="INSERT INTO REVIEWTABLE VALUE(?, ?, ?, ?);";
	private static final String SELECT_REVIEW = "SELECT u.user_name, r.review_comment, r.review_star FROM USERTABLE u JOIN REBIEWTABLE r ON u.user_id = r.user_id WHERE user_id = ?, rice_id = ?;";
	private static final String DELETE_REVIEW = "DELETE FROM REVIEWTABLE WHERE user_id = ?, rice_id = 0;";
	
	Connection cn = null;
	PreparedStatement prsmt = null;
	ResultSet rs = null;
	
	public void Insert_Review(String rice_id, int user_id, String review_comment, String review_star) {//違うかも
		try {
			cn = MySQLOperator.getInstance().getConnection();
			prsmt = cn.prepareStatement(INSERT_ALL);
			prsmt.setString(1, rice_id);
			prsmt.setInt(2, user_id);
			prsmt.setString(3, review_comment);
			prsmt.setString(4, review_star);
			prsmt.executeUpdate();
		} catch(SQLException e) {
			MySQLOperator.getInstance().rollback();
		}
	}
	
	
}
