package dto;

public class ReviewRiceUserTableDto  {
	private int review_id;
	private int user_id;
	private int rice_id;
	private String rice_image_path;
	private String rice_name;
	private String review_comment;
	private int review_star;
	private String user_name;
	
	
	public String getRice_name() {
		return rice_name;
	}
	public void setRice_name(String rice_name) {
		this.rice_name = rice_name;
	}
	public String getRice_image_path() {
		return rice_image_path;
	}
	public void setRice_image_path(String rice_image_path) {
		this.rice_image_path = rice_image_path;
	}
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
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
