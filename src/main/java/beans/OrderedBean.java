package beans;

public class OrderedBean {
	private int order_id;
	private int user_id;
	private int rice_id;
	private int order_quantity;
	private int ordered_amount;
	private String ordered_time;
	private int useraddress_id;
	private int card_id;
	
	public int getUseraddress_id() {
		return useraddress_id;
	}
	public void setUseraddress_id(int useraddress_id) {
		this.useraddress_id = useraddress_id;
	}
	public int getCard_id() {
		return card_id;
	}
	public void setCard_id(int card_id) {
		this.card_id = card_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}
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
