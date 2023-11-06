package beans;

import java.io.Serializable;

public class UserBean implements Serializable {
	private String userName = null;
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
