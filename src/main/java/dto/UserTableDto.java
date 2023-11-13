package dto;

public class UserTableDto {
	private int user_id; //これ間違えてるかも
	private String user_name;
	private String user_pass;
	private String user_mail;
	
	public UserTableDto(String user_name, String user_pass) {
		setUser_name(user_name);
		setUser_pass(user_pass);
	}
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_mail() {
		return user_mail;
	}
	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}
	
	
	
}