package dto;

public class OrderTableDto {
	private int usr_id;
	private int rice_id;
	private int order_amount;
	private String order_time;
	
	public int getUsr_id() {
		return usr_id;
	}
	public void setUsr_id(int usr_id) {
		this.usr_id = usr_id;
	}
	public int getRice_id() {
		return rice_id;
	}
	public void setRice_id(int rice_id) {
		this.rice_id = rice_id;
	}
	public int getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}
	public String getOrder_time() {
		return order_time;
	}
	public void setOrder_time(String order_time) {
		this.order_time = order_time;
	}
}
