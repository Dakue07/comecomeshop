package dto;

public class OrderDetailsTableDto {
	private int order_id;
	private int user_id;
	private int rice_id;
	private int order_quantity;
	private int order_amount;
	private String rice_name;
	private String rice_image_path;
	private int rice_price;
	
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
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
	public int getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
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
	public String getRice_image_path() {
		return rice_image_path;
	}
	public void setRice_iamge_path(String rice_image_path) {
		this.rice_image_path = rice_image_path;
	}
	public int getRice_price() {
		return rice_price;
	}
	public void setRice_price(int rice_price) {
		this.rice_price = rice_price;
	}
	
	

}
