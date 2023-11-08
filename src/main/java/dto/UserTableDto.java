package dto;

public class UserTableDto {
	private int userId; //これ間違えてるかも
	private String user;
	private String pass;
	
	public UserTableDto(String user, String pass) {
		setUser(user);
		setPass(pass);
	}

	
	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
}
