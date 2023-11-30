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
	
	private static final String INSERT_CART = "INSERT INTO CARTTABLE VALUES(?, ?, ?)";//カートに追加するとき11/22の時点では個数選択はまだ出来ないので1を入れてます。by和希
	private static final String DELETE_CART = "DELETE FROM CARTTABLE WHERE rice_id = ? AND user_id = ?";
	

	Connection cn = null;
	PreparedStatement prsmt = null;
	ResultSet rs = null;
	
	public void CartInsert(int cart_quantity, int user_id, String rice_id) {//違うかも
		try {
			cn = MySQLOperator.getInstance().getConnection();
			prsmt = cn.prepareStatement(INSERT_CART);
			prsmt.setInt(1, user_id);
			prsmt.setString(2, rice_id);
			prsmt.setInt(3, cart_quantity);
			prsmt.executeUpdate();
		} catch(SQLException e) {
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
			System.out.println("while文のはじめ");
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
	
	public void CartDelete(int rice_id, int user_id) {
		try {
			cn = MySQLOperator.getInstance().getConnection();
			prsmt = cn.prepareStatement(DELETE_CART);
			prsmt.setInt(1, rice_id);
			prsmt.setInt(2, user_id);
			prsmt.executeUpdate();
		} catch(SQLException e) {
			MySQLOperator.getInstance().rollback();
		}
		
	}
}
