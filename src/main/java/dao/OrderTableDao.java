package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.OrderedBean;
import database.MySQLOperator;
import dto.OrderRiceDto;
import dto.UserAddressOrderDto;

public class OrderTableDao {
	private static final String INSERT_ORDER = "INSERT INTO ORDERTABLE(order_id, user_id, rice_id, useraddress_id, card_id, order_quantity, order_amount) VALUES(?, ?, ?, ?, ?, ?, ?)";
	private static final String SELECT_ORDER_BY_ORDER_ID = "SELECT * FROM ORDERTABLE WHERE order_id = ?";
	private static final String SELECT_ORDER_BY_USER_ID = "SELECT o.order_id, o.user_id, o.rice_id, o.order_quantity, o.order_amount, o.order_time, o.useraddress_id, o.card_id, r.rice_name, r.rice_genre, r.rice_weight, r.rice_made, r.rice_image_path, r.rice_since, r.rice_stock, r.rice_price, r.rice_flag FROM ORDERTABLE o JOIN RICETABLE r ON o.rice_id = r.rice_id WHERE o.user_id = ?";
	private static final String SELECT_ORDER_DETAILS_BY_USER_ID ="SELECT DISTINCT o.order_time, ua.useraddress_postcode, ua.useraddress_state_city, ua.useraddress_street FROM USERADDRESSTABLE ua JOIN ORDERTABLE o ON ua.user_id = o.user_id WHERE o.user_id = ?";
	private static final String ORDER_CANCEL = "DELETE FROM ORDERTABLE WHERE order_id = ?";
	private static final String SELECT_ORDER = "SELECT * FROM ORDERDETAILSTABLE WHERE user_id = ?";

	
	
	Connection cn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void InsertOrder(int order_id, int user_id, int rice_id, int useraddress_id, int card_id, int order_quantity, int order_amount) {
		try {
			cn = MySQLOperator.getInstance().getConnection();
			pstmt = cn.prepareStatement(INSERT_ORDER);
			pstmt.setInt(1, order_id);
			pstmt.setInt(2, user_id);
			pstmt.setInt(3, rice_id);
			pstmt.setInt(4, useraddress_id);
			pstmt.setInt(5, card_id);
			pstmt.setInt(6, order_quantity);
			pstmt.setInt(7, order_amount);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			MySQLOperator.getInstance().rollback();
		}
	}
	
	public ArrayList<OrderedBean> selectOrderByOrderId(int order_id) {
		
		ArrayList<OrderedBean> orderResult = new ArrayList<OrderedBean>();
		try {
			cn = MySQLOperator.getInstance().getConnection();
			pstmt = cn.prepareStatement(SELECT_ORDER_BY_ORDER_ID);
			pstmt.setInt(1, order_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderedBean order = new OrderedBean();
				order.setOrder_id(rs.getInt("order_id"));
				order.setUser_id(rs.getInt("user_id"));
				order.setRice_id(rs.getInt("rice_id"));
				order.setOrder_quantity(rs.getInt("order_quantity"));
				order.setOrdered_amount(rs.getInt("order_amount"));
				order.setOrdered_time(rs.getString("order_time"));
				order.setUseraddress_id(rs.getInt("useraddress_id"));
				order.setCard_id(rs.getInt("card_id"));
				orderResult.add(order);	 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderResult;
	}
	
	public ArrayList<OrderRiceDto> selectOrderByUserId(int user_id) {
			
		ArrayList<OrderRiceDto> orderResult = new ArrayList<OrderRiceDto>();
		try {
			cn = MySQLOperator.getInstance().getConnection();
			pstmt = cn.prepareStatement(SELECT_ORDER_BY_USER_ID);
			pstmt.setInt(1, user_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderRiceDto orderRice = new OrderRiceDto();
				orderRice.setOrder_id(rs.getInt("order_id"));
				orderRice.setUser_id(rs.getInt("user_id"));
				orderRice.setRice_id(rs.getInt("rice_id"));
				orderRice.setOrder_quantity(rs.getInt("order_quantity"));
				orderRice.setOrder_amount(rs.getInt("order_amount"));
				orderRice.setOrder_time(rs.getString("order_time"));
				orderRice.setUseraddress_id(rs.getInt("useraddress_id"));
				orderRice.setCard_id(rs.getInt("card_id"));
				orderRice.setRice_name(rs.getString("rice_name"));
	            orderRice.setRice_genre(rs.getString("rice_genre"));
	            orderRice.setRice_weight(rs.getInt("rice_weight"));
	            orderRice.setRice_made(rs.getString("rice_made"));
	            orderRice.setRice_image_path(rs.getString("rice_image_path"));
	            orderRice.setRice_since(rs.getString("rice_since"));
	            orderRice.setRice_stock(rs.getInt("rice_stock"));
	            orderRice.setRice_price(rs.getInt("rice_price"));
	            orderRice.setRice_flag(rs.getBoolean("rice_flag"));
				
				orderResult.add(orderRice);	 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderResult;
	}
	
	public int IncrementId() {
		int max_order_id = 0;
		try {
			cn = MySQLOperator.getInstance().getConnection();
			String sql = "SELECT max(order_id) FROM ORDERTABLE";
			pstmt = cn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			max_order_id = rs.getInt(1);
			
		} catch (SQLException e) {
			MySQLOperator.getInstance().rollback();
		}
		return max_order_id;
	}

	public UserAddressOrderDto selectOrderDetails(int user_id) {
		
		UserAddressOrderDto useraddressdto = new UserAddressOrderDto();
		try {
			cn = MySQLOperator.getInstance().getConnection();
			pstmt = cn.prepareStatement(SELECT_ORDER_DETAILS_BY_USER_ID);
			pstmt.setInt(1, user_id);
			rs = pstmt.executeQuery();
			rs.next();
			
			useraddressdto.setOrder_time(rs.getString("order_time"));
			useraddressdto.setUseraddress_postcode(rs.getString("useraddress_postcode"));
			useraddressdto.setUseraddress_state_city(rs.getString("useraddress_state_city"));
			useraddressdto.setUseraddress_street(rs.getString("useraddress_street"));
			
		} catch(SQLException e) {
			MySQLOperator.getInstance().rollback();
			e.printStackTrace();
		}
		return useraddressdto;
	}
		
	public void orderCancel(int order_id) {
		try {
			cn = MySQLOperator.getInstance().getConnection();
			pstmt = cn.prepareStatement(ORDER_CANCEL);
			pstmt.setInt(1, order_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			MySQLOperator.getInstance().rollback();
		}
	}
	
	public ArrayList<OrderRiceDto> select_order(int user_id) {
		ArrayList<OrderRiceDto> result = new ArrayList<OrderRiceDto>();
		
		try {
			cn = MySQLOperator.getInstance().getConnection();
			System.out.println("orderDetailsDAOまで来たよ");
			pstmt = cn.prepareStatement(SELECT_ORDER);
			pstmt.setInt(1, user_id);
			rs = pstmt.executeQuery();
			System.out.println("orderDetailsDAO");
			while(rs.next()) {
				OrderRiceDto orderbean = new OrderRiceDto();
				System.out.println("orderDetailsDAO3");
				orderbean.setOrder_id(rs.getInt("order_id"));
				orderbean.setUser_id(rs.getInt("user_id"));
				orderbean.setRice_id(rs.getInt("rice_id"));
				orderbean.setUseraddress_id(rs.getInt("useraddress_id"));
				orderbean.setRice_image_path(rs.getString("rice_image_path"));
				orderbean.setRice_name(rs.getString("rice_name"));
				orderbean.setOrder_quantity(rs.getInt("order_quantity"));
				orderbean.setOrder_amount(rs.getInt("Order_amount"));
				orderbean.setOrder_time(rs.getString("order_time"));

				result.add(orderbean);
			}
			
		} catch(SQLException e) {
			MySQLOperator.getInstance().rollback();
			e.printStackTrace();
		}
		return result;
	}
}
