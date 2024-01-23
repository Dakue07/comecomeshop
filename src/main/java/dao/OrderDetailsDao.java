package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.MySQLOperator;
import dto.OrderDetailsTableDto;

public class OrderDetailsDao {

	private static final String SELECT_ORDERDETAIL = "SELECT od.* FROM ORDERDETAILSTABLE od JOIN ORDERTABLE ot ON od.order_id = ot.order_id WHERE ot.user_id = ?";
	
	Connection cn = null;
	PreparedStatement prsmt = null;
	ResultSet rs = null;
	
	public ArrayList<OrderDetailsTableDto> SELECT_ORDERDETAIL(int user_id) {
		ArrayList<OrderDetailsTableDto> result = new ArrayList<OrderDetailsTableDto>();
		
		try {
			cn = MySQLOperator.getInstance().getConnection();
			System.out.println("orderDetailsDAOまで来たよ");
			prsmt = cn.prepareStatement(SELECT_ORDERDETAIL);
			prsmt.setInt(1, user_id);
			rs = prsmt.executeQuery();
			System.out.println("orderDetailsDAO");
			while(rs.next()) {
				OrderDetailsTableDto orderdetailsdto = new OrderDetailsTableDto();
				System.out.println("orderDetailsDAO3");
				orderdetailsdto.setRice_id(rs.getInt("rice_id"));
				orderdetailsdto.setRice_iamge_path(rs.getString("rice_image_path"));
				orderdetailsdto.setRice_name(rs.getString("rice_name"));
				orderdetailsdto.setOrder_quantity(rs.getInt("order_quantity"));
				orderdetailsdto.setOrder_amount(rs.getInt("Order_amount"));
				result.add(orderdetailsdto);
			}
			
		} catch(SQLException e) {
			MySQLOperator.getInstance().rollback();
			e.printStackTrace();
		}
		return result;
	}
}
