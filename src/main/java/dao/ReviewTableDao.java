package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.MySQLOperator;
import dto.ReviewRiceUserTableDto;

public class ReviewTableDao {
	private static final String INSERT_ALL ="INSERT INTO REVIEWTABLE VALUE(?, ?, ?, ?)";
	private static final String SELECT_REVIEW = "SELECT rt.rice_image_path, rt.rice_name, r.review_comment, r.review_star FROM USERTABLE u JOIN REVIEWTABLE r JOIN RICETABLE rt ON r.rice_id = rt.rice_id ON u.user_id = r.user_id WHERE r.user_id = ?";							
	private static final String DELETE_REVIEW = "DELETE FROM REVIEWTABLE WHERE review_id = ?";
	private static final String ADMIN_SELECT_REVIEW = "SELECT r.user_id, r.review_comment, r.review_star FROM USERTABLE u JOIN REBIEWTABLE r ON u.user_id = r.user_id WHERE user_id = ?, rice_id = ?";
	
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
	
	public ArrayList<ReviewRiceUserTableDto> Select_Review(int user_id) {
		ArrayList<ReviewRiceUserTableDto> result = new ArrayList<ReviewRiceUserTableDto>();
		try {
			cn = MySQLOperator.getInstance().getConnection();
			System.out.println(user_id);
			prsmt = cn.prepareStatement(SELECT_REVIEW);
			prsmt.setInt(1, user_id);
			rs = prsmt.executeQuery();
			while(rs.next()) {
				ReviewRiceUserTableDto reviewricedto = new ReviewRiceUserTableDto();
				reviewricedto.setRice_image_path(rs.getString("rice_image_path"));
				reviewricedto.setRice_name(rs.getString("rice_name"));
				reviewricedto.setReview_comment(rs.getString("review_comment"));
				reviewricedto.setReview_star(rs.getInt("review_star"));
				result.add(reviewricedto);
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
