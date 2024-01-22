package beans;

import java.sql.Date;

public class CardBean {
	private int card_id;
	private int user_id;
	private String card_holdername;
	private String card_number;
	private String card_replace_number;
	private Date card_validity;
	private String card_securitycode;
	
	public int getCard_id() {
		return card_id;
	}
	public void setCard_id(int card_id) {
		this.card_id = card_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getCard_holdername() {
		return card_holdername;
	}
	public void setCard_holdername(String card_holdername) {
		this.card_holdername = card_holdername;
	}
	public String getCard_number() {
		return card_number;
	}
	public String getCard_replace_number() {
		return card_replace_number;
	}
	public void setCard_replace_number(String card_replace_number) {
		this.card_replace_number = card_replace_number;
	}
	public void setCard_number(String card_numbe) {
		this.card_number = card_numbe;
	}
	public Date getCard_validity() {
		return card_validity;
	}
	public void setCard_validity(Date card_validity) {
		this.card_validity = card_validity;
	}
	public String getCard_securitycode() {
		return card_securitycode;
	}
	public void setCard_securitycode(String card_securitycode) {
		this.card_securitycode = card_securitycode;
	}
}