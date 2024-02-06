package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.MySQLOperator;
import dto.ReviewRiceUserTableDto;

public class ReviewTableDao {
	private static final String INSERT_ALL ="INSERT INTO REVIEWTABLE (rice_id, user_id, review_comment, review_star) VALUES (?, ?, ?, ?)";
	private static final String SELECT_REVIEW = "SELECT r.*, u.user_name FROM REVIEWTABLE r JOIN USERTABLE u USING(user_id) WHERE rice_id = ?";							
	private static final String DELETE_REVIEW = "DELETE FROM REVIEWTABLE WHERE review_id = ?";
	private static final String ADMIN_SELECT_REVIEW = "SELECT r.rice_id, r.review_id, u.user_name, r.review_comment, r.review_star FROM USERTABLE u JOIN REVIEWTABLE r ON u.user_id = r.user_id WHERE rice_id = ?";
	
	Connection cn = null;
	PreparedStatement prsmt = null;
	ResultSet rs = null;
	
	public void insertReview(String rice_id, int user_id, String review_comment, String review_star) {//違うかも
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
	
	public ArrayList<ReviewRiceUserTableDto> selectReview(String rice_id) {
		ArrayList<ReviewRiceUserTableDto> result = new ArrayList<ReviewRiceUserTableDto>();
		try {
			cn = MySQLOperator.getInstance().getConnection();
			System.out.println(rice_id);
			prsmt = cn.prepareStatement(SELECT_REVIEW);
			prsmt.setString(1, rice_id);
			rs = prsmt.executeQuery();
			while(rs.next()) {
				ReviewRiceUserTableDto reviewdto = new ReviewRiceUserTableDto();
				reviewdto.setReview_id(rs.getInt("review_id"));
				reviewdto.setUser_id(rs.getInt("user_id"));
				reviewdto.setUser_name(rs.getString("user_name"));
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
	
	public void deleteReview(int review_id) {
		try {
			cn = MySQLOperator.getInstance().getConnection();
			prsmt = cn.prepareStatement(DELETE_REVIEW);
			prsmt.setInt(1, review_id);
			prsmt.executeUpdate();
		} catch(SQLException e) {
			MySQLOperator.getInstance().rollback();
		}
	}
	
	public ArrayList<ReviewRiceUserTableDto> adminSelectReview(String rice_id) {
		ArrayList<ReviewRiceUserTableDto> result = new ArrayList<ReviewRiceUserTableDto>();
		try {
			cn = MySQLOperator.getInstance().getConnection();
			System.out.println(rice_id);
			prsmt = cn.prepareStatement(ADMIN_SELECT_REVIEW);
			prsmt.setString(1, rice_id);
			rs = prsmt.executeQuery();
			while(rs.next()) {
				ReviewRiceUserTableDto reviewriceuserdto = new ReviewRiceUserTableDto();
				reviewriceuserdto.setRice_id(rs.getInt("rice_id"));
				reviewriceuserdto.setReview_id(rs.getInt("review_id"));
				reviewriceuserdto.setUser_name(rs.getString("user_name"));
				reviewriceuserdto.setReview_comment(rs.getString("review_comment"));
				reviewriceuserdto.setReview_star(rs.getInt("review_star"));
				result.add(reviewriceuserdto);
			}
			
		} catch(SQLException e) {
			MySQLOperator.getInstance().rollback();
			e.printStackTrace();
		}
		return result;
	}
	
}
