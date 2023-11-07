package beans;

import java.io.Serializable;

public class UserInfoBean implements Serializable {
	private int user_id;
	private String userinfo_address;
	private int userinfo_card;
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUserinfo_address() {
		return userinfo_address;
	}
	public void setUserinfo_address(String userinfo_address) {
		this.userinfo_address = userinfo_address;
	}
	public int getUserinfo_card() {
		return userinfo_card;
	}
	public void setUserinfo_card(int userinfo_card) {
		this.userinfo_card = userinfo_card;
	}
	
}