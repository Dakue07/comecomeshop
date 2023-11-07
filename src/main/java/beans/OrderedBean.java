package beans;

public class OrderedBean {
	private int user_id;
	private int rice_id;
	private int ordered_amount;
	private String ordered_time;
	
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
	public int getOrdered_amount() {
		return ordered_amount;
	}
	public void setOrdered_amount(int ordered_amount) {
		this.ordered_amount = ordered_amount;
	}
	public String getOrdered_time() {
		return ordered_time;
	}
	public void setOrdered_time(String ordered_time) {
		this.ordered_time = ordered_time;
	}
}
