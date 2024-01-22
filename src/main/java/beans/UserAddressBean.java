package beans;

import java.io.Serializable;

public class UserAddressBean implements Serializable {
	private int useraddress_id;
	private int user_id;
	private String useraddress_receiver;
	private String useraddress_postcode;
	private String useraddress_state_city;
	private String useraddress_street;
	
	public int getUseraddress_id() {
		return useraddress_id;
	}
	public void setUseraddress_id(int useraddress_id) {
		this.useraddress_id = useraddress_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUseraddress_receiver() {
		return useraddress_receiver;
	}
	public void setUseraddress_receiver(String useraddress_receiver) {
		this.useraddress_receiver = useraddress_receiver;
	}
	public String getUseraddress_postcode() {
		return useraddress_postcode;
	}
	public void setUseraddress_postcode(String useraddress_postcode) {
		this.useraddress_postcode = useraddress_postcode;
	}
	public String getUseraddress_state_city() {
		return useraddress_state_city;
	}
	public void setUseraddress_state_city(String useraddress_state_city) {
		this.useraddress_state_city = useraddress_state_city;
	}
	public String getUseraddress_street() {
		return useraddress_street;
	}
	public void setUseraddress_street(String useraddress_street) {
		this.useraddress_street = useraddress_street;
	}
}