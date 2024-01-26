package dto;

import java.io.Serializable;

public class OrderRiceDto implements Serializable {
    private int order_id;
    public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
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
	public int getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}
	public int getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(int ordered_amount) {
		this.order_amount = order_amount;
	}
	public String getOrder_time() {
		return order_time;
	}
	public void setOrder_time(String ordered_time) {
		this.order_time = order_time;
	}
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
	public String getRice_name() {
		return rice_name;
	}
	public void setRice_name(String rice_name) {
		this.rice_name = rice_name;
	}
	public String getRice_genre() {
		return rice_genre;
	}
	public void setRice_genre(String rice_genre) {
		this.rice_genre = rice_genre;
	}
	public int getRice_weight() {
		return rice_weight;
	}
	public void setRice_weight(int rice_weight) {
		this.rice_weight = rice_weight;
	}
	public String getRice_made() {
		return rice_made;
	}
	public void setRice_made(String rice_made) {
		this.rice_made = rice_made;
	}
	public String getRice_image_path() {
		return rice_image_path;
	}
	public void setRice_image_path(String rice_image_path) {
		this.rice_image_path = rice_image_path;
	}
	public String getRice_since() {
		return rice_since;
	}
	public void setRice_since(String rice_since) {
		this.rice_since = rice_since;
	}
	public int getRice_stock() {
		return rice_stock;
	}
	public void setRice_stock(int rice_stock) {
		this.rice_stock = rice_stock;
	}
	public int getRice_price() {
		return rice_price;
	}
	public void setRice_price(int rice_price) {
		this.rice_price = rice_price;
	}
	public boolean isRice_flag() {
		return rice_flag;
	}
	public void setRice_flag(boolean rice_flag) {
		this.rice_flag = rice_flag;
	}
	private int user_id;
    private int rice_id;
    private int order_quantity;
    private int order_amount;
    private String order_time;
    private int useraddress_id;
    private int card_id;
    private String rice_name;
    private String rice_genre;
    private int rice_weight;
    private String rice_made;
    private String rice_image_path;
    private String rice_since;
    private int rice_stock;
    private int rice_price;
    private boolean rice_flag;
}