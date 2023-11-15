package dto;

public class ReviewTableDto {
	private int user_id;
	private int rice_id;
	private String review_comment;
	private int review_star;
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getRice_id() {
		return rice_id;
	}
	public void setRice_id(int rice_id) {
		this.rice_id = rice_id;
	}
	public String getReview_comment() {
		return review_comment;
	}
	public void setReview_comment(String review_comment) {
		this.review_comment = review_comment;
	}
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}
}
