package dto;

import java.io.Serializable;

public class UserAddressOrderDto implements Serializable {
	private String useraddress_postcode;
	private String useraddress_state_city;
	private String useraddress_street;
	private String order_time;

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
	public String getOrder_time() {
		return order_time;
	}
	public void setOrder_time(String order_time) {
		this.order_time = order_time;
	}

}
