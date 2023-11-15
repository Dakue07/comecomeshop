package dto;

public class OrderDetailsTableDto {
	private int order_id;
	private int rice_id;
	private int order_quqntity;
	private int order_amount;
	private String rice_name;
	private String rice_iamge_path;
	private int rice_price;
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getRice_id() {
		return rice_id;
	}
	public void setRice_id(int rice_id) {
		this.rice_id = rice_id;
	}
	public int getOrder_quqntity() {
		return order_quqntity;
	}
	public void setOrder_quqntity(int order_quqntity) {
		this.order_quqntity = order_quqntity;
	}
	public int getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}
	public String getRice_name() {
		return rice_name;
	}
	public void setRice_name(String rice_name) {
		this.rice_name = rice_name;
	}
	public String getRice_iamge_path() {
		return rice_iamge_path;
	}
	public void setRice_iamge_path(String rice_iamge_path) {
		this.rice_iamge_path = rice_iamge_path;
	}
	public int getRice_price() {
		return rice_price;
	}
	public void setRice_price(int rice_price) {
		this.rice_price = rice_price;
	}
	
	

}
