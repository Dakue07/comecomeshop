package dto;

public class UserDto {
	private String user;
	private String pass;
	
	public UserDto(String user, String pass) {
		setUser(user);
		setPass(pass);
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
