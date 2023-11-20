package beans;

import java.io.Serializable;
import java.util.ArrayList;

import dto.RiceTableDto;

public class UserRiceBean implements Serializable {
	private UserBean userBean = new UserBean();
	private ArrayList<RiceTableDto> riceDto = new ArrayList<RiceTableDto>();
	public UserBean getUserBean() {
		return userBean;
	}
	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}
	public ArrayList<RiceTableDto> getRiceDto() {
		return riceDto;
	}
	public void setRiceDto(ArrayList<RiceTableDto> riceDto) {
		this.riceDto = riceDto;
	}
}
	