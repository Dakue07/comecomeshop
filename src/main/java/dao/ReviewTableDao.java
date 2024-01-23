package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.MySQLOperator;
import dto.ReviewTableDto;

public class ReviewTableDao {
	private static final String INSERT_ALL ="INSERT INTO REVIEWTABLE (rice_id, user_id, review_comment, review_star) VALUES (?, ?, ?, ?)";
	private static final String SELECT_REVIEW = "SELECT * FROM REVIEWTABLE WHERE rice_id = ?";							
	private static final String DELETE_REVIEW = "DELETE FROM REVIEWTABLE WHERE review_id = ?";
	private static final String ADMIN_SELECT_REVIEW = "SELECT r.user_id, r.review_comment, r.review_star FROM USERTABLE u JOIN REVIEWTABLE r ON u.user_id = r.user_id WHERE user_id = ? AND rice_id = ?";
	
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
			e.printStackTrace();
		}
	}
	
	public ArrayList<ReviewTableDto> Select_Review(String rice_id) {
		ArrayList<ReviewTableDto> result = new ArrayList<ReviewTableDto>();
		try {
			cn = MySQLOperator.getInstance().getConnection();
			System.out.println(rice_id);
			prsmt = cn.prepareStatement(SELECT_REVIEW);
			prsmt.setString(1, rice_id);
			rs = prsmt.executeQuery();
			while(rs.next()) {
				ReviewTableDto reviewdto = new ReviewTableDto();
				reviewdto.setReview_id(rs.getInt("review_id"));
				reviewdto.setUser_id(rs.getInt("user_id"));
				reviewdto.setRice_id(rs.getInt("rice_id"));
				reviewdto.setReview_comment(rs.getString("review_comment"));
				reviewdto.setReview_star(rs.getInt("review_star"));
				result.add(reviewdto);
			}
			
		} catch(SQLException e) {
			MySQLOperator.getInstance().rollback();
		}
		return result;
	}
	
	public void DELETE_REVIEW(int review_id) {
		try {
			cn = MySQLOperator.getInstance().getConnection();
			prsmt = cn.prepareStatement(DELETE_REVIEW);
			prsmt.setInt(1, review_id);
			rs = prsmt.executeQuery();
		} catch(SQLException e) {
			MySQLOperator.getInstance().rollback();
		}
	}
}
