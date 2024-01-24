package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import database.MySQLOperator;
import dto.RiceCartTableDto;

public class CartTableDao {
	private static final String SELECT_ALL = "SELECT RICETABLE.rice_id, cart_quantity, rice_name, rice_genre, rice_weight, rice_made, rice_image_path, rice_since, rice_stock, rice_price "
											+ "FROM CARTTABLE INNER JOIN RICETABLE ON CARTTABLE.rice_id = RiceTable.rice_id WHERE CARTTABLE.user_id = ?";//カートに追加したものをすべて表示する
	
	private static final String INSERT_CART = "INSERT INTO CARTTABLE VALUES(?, ?, ?)";
	private static final String DELETE_CART_PRODUCT = "DELETE FROM CARTTABLE WHERE rice_id = ? AND user_id = ?";
	private static final String UPDATE_CART_QUANTITY = "UPDATE CARTTABLE SET cart_quantity = cart_quantity + ? WHERE user_id = ? AND rice_id = ?";
	private static final String UPDATE_ABSOLUTE_CART_QUANTITY = "UPDATE CARTTABLE SET cart_quantity = ? WHERE user_id = ? AND rice_id = ?";
	private static final String SELECT_CART_RICEID = "SELECT * FROM CARTTABLE WHERE user_id = ? AND rice_id = ?";
	//無理private static final String SELECT_CART_USERADDRESS_CARD = "SELECT u.user_id, u.useraddress_receiver, u.useraddress_postcode, u.useraddress_state_city, u.useraddress_street, c.card_number, c.card_securitycode, c.card_holdername, c.card_validity, r.rice_id, r.cart_quantity  FROM USERADDRESSTABLE u JOIN CARDTABLE c ON u.user_id = c.user_id JOIN CARTTABLE r ON u.user_id = r.user_id;"
	private static final String DELETE_CART = "DELETE FROM CARTTABLE WHERE user_id = ?";

	Connection cn = null;
	PreparedStatement prsmt = null;
	ResultSet rs = null;
	
	public void CartInsert(int cart_quantity, int user_id, int rice_id) {//違うかも
		try {
			cn = MySQLOperator.getInstance().getConnection();
			prsmt = cn.prepareStatement(INSERT_CART);
			prsmt.setInt(1, user_id);
			prsmt.setInt(2, rice_id);
			prsmt.setInt(3, cart_quantity);
			prsmt.executeUpdate();
		} catch(SQLException e) {
			MySQLOperator.getInstance().rollback();
		}
	}
	
	public void UpdateCartQuantity(int cart_quantity, int absolute_cart_qantity, int user_id, int rice_id) {
	    try {
	    	int existingRice_id;
	        cn = MySQLOperator.getInstance().getConnection();

	        prsmt = cn.prepareStatement(SELECT_CART_RICEID);
	        prsmt.setInt(1, user_id);
	        prsmt.setInt(2, rice_id);
	        rs = prsmt.executeQuery();
	        System.out.println("カートテーブル" + rs);

	        rs.next();
	        try {
	        	existingRice_id = rs.getInt("rice_id");
	        } catch (SQLException e) {
	        	existingRice_id = 0;
	        }
            System.out.println("カートテーブル２" + rice_id);
            if (existingRice_id == (rice_id)) {
            	System.out.println("かーとだおの最初のif");
                if (cart_quantity == 0) {
                	System.out.println("カートから追加したな");
                	prsmt = cn.prepareStatement(UPDATE_ABSOLUTE_CART_QUANTITY);
                	prsmt.setInt(1, absolute_cart_qantity);
                	prsmt.setInt(2, user_id);
                	prsmt.setInt(3, rice_id);
                } else {
                	System.out.println("ホームから追加したな");
                	prsmt = cn.prepareStatement(UPDATE_CART_QUANTITY);
                	prsmt.setInt(1, cart_quantity);
                	prsmt.setInt(2, user_id);
                	prsmt.setInt(3, rice_id);
                }
                prsmt.executeUpdate();
            } else {
                CartInsert(cart_quantity, user_id, rice_id);
	        } 
	    } catch (SQLException e) {
	    	e.printStackTrace();
	        MySQLOperator.getInstance().rollback();
	    }
	}


	
	public  ArrayList<RiceCartTableDto> AllSelect(int user_id) {
		ArrayList<RiceCartTableDto> result = new ArrayList<RiceCartTableDto>();
		try {
			//rs = null;
			cn = MySQLOperator.getInstance().getConnection();

			prsmt = cn.prepareStatement(SELECT_ALL);
			prsmt.setInt(1, user_id);
			rs = prsmt.executeQuery();
			while(rs.next()) {
				RiceCartTableDto rcdto = new RiceCartTableDto();
				rcdto.setRice_id(rs.getInt("rice_id"));
				rcdto.setCart_quantity(rs.getInt("cart_quantity"));
                rcdto.setRice_name(rs.getString("rice_name"));
                rcdto.setRice_genre(rs.getString("rice_genre"));
                rcdto.setRice_weight(rs.getString("rice_weight"));
                rcdto.setRice_made(rs.getString("rice_made"));
                rcdto.setRice_image_path(rs.getString("rice_image_path"));

                Timestamp timestamp = rs.getTimestamp("rice_since");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String rice_since = sdf.format(new Date(timestamp.getTime()));
                rcdto.setRice_since(rice_since);

                rcdto.setRice_stock(rs.getString("rice_stock"));
                rcdto.setRice_price(rs.getString("rice_price"));
				result.add(rcdto);
				
				System.out.println(rcdto.getRice_name());
				
			}
			
		} catch (SQLException e) {
			MySQLOperator.getInstance().rollback();
        } 
        return result;
	}
	
	public void deleteCartProduct(int rice_id, int user_id) {
		try {
			cn = MySQLOperator.getInstance().getConnection();
			prsmt = cn.prepareStatement(DELETE_CART_PRODUCT);
			prsmt.setInt(1, rice_id);
			prsmt.setInt(2, user_id);
			prsmt.executeUpdate();
		} catch(SQLException e) {
			MySQLOperator.getInstance().rollback();
		}
		
	}
	
	public void deleteCart(int user_id) {
		try {
			cn = MySQLOperator.getInstance().getConnection();
			prsmt = cn.prepareStatement(DELETE_CART_PRODUCT);
			prsmt.setInt(1, user_id);
			prsmt.executeUpdate();
		} catch (SQLException e) {
			MySQLOperator.getInstance().rollback();
		}
	}
}
