package dto;

import java.sql.Timestamp;

public class RiceCartTableDto {
	
	private int cart_quantity;
	private String rice_name;
	private String rice_genre;
	private String rice_weight;
	private String rice_made;
	private String rice_image_path;
	private Timestamp rice_since;
	private String rice_stock;
	private String rice_price;
	public int getCart_quantity() {
		return cart_quantity;
	}
	public void setCart_quantity(int cart_quantity) {
		this.cart_quantity = cart_quantity;
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
	public String getRice_weight() {
		return rice_weight;
	}
	public void setRice_weight(String rice_weight) {
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
	public Timestamp getRice_since() {
		return rice_since;
	}
	public void setRice_since(Timestamp rice_since) {
		this.rice_since = rice_since;
	}
	public String getRice_stock() {
		return rice_stock;
	}
	public void setRice_stock(String rice_stock) {
		this.rice_stock = rice_stock;
	}
	public String getRice_price() {
		return rice_price;
	}
	public void setRice_price(String rice_price) {
		this.rice_price = rice_price;
	}
	
	

}
