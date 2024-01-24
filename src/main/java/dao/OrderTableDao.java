package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.OrderedBean;
import database.MySQLOperator;

public class OrderTableDao {
	private static final String INSERT_ORDER = "INSERT INTO ORDERTABLE(order_id, user_id, rice_id, useraddress_id, card_id, order_quantity, order_amount) VALUES(?, ?, ?, ?, ?, ?, ?)";
	private static final String SELECT_ORDER_BY_ORDER_ID = "SELECT * FROM ORDERTABLE WHERE order_id = ?";
	
	Connection cn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void  InsertOrder(int order_id, int user_id, int rice_id, int useraddress_id, int card_id, int order_quantity, int order_amount) {
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
			MySQLOperator.getInstance().rollback();
		}
	}
	
	public ArrayList<OrderedBean> SelectOrderByOrderId(int order_id) {
		
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
				order.setRice_id(rs.getInt("user_id"));
				order.setOrder_quantity(rs.getInt("order_quantity"));
				order.setOrdered_amount(rs.getInt("order_amount"));
				order.setOrdered_time(rs.getString("order_time"));
				orderResult.add(order);	 
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
			String sql = "SELECT max(order_id) FROM ordertable";
			pstmt = cn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			max_order_id = rs.getInt(1);
			
		} catch (SQLException e) {
			MySQLOperator.getInstance().rollback();
		}
		return max_order_id;
	}
}
