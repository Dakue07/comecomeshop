package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.MySQLOperator;
import dto.RiceCartTableDto;

public class CartTableDao {
	private static final String SELECT_ALL = "SELECT cart_quantity, rice_name, rice_genre, rice_weight, rice_made, rice_image_path, rice_since, rice_stock, rice_price "
											+ "FROM CartTable INNER JOIN RiceTable ON CartTable.rice_id = RiceTable.rice_id WHERE CartTable.user_id = ?";//カートに追加したものをすべて表示する
	private static final String INSERT_CART = "INSERT INTO CartTable VALUES(?, ?, ?)";//カートに追加するとき11/22の時点では個数選択はまだ出来ないので1を入れてます。by和希
	
	MySQLOperator ma = new MySQLOperator();
	
	Connection cn = null;
	PreparedStatement prsmt = null;
	ResultSet rs = null;
	
	public void CartInsert(int cart_quantity, int user_id, String rice_id) {//違うかも
		try {
			cn = ma.getConnection();
			cn.setAutoCommit(false);
			prsmt = cn.prepareStatement(INSERT_CART);
			prsmt.setInt(1, user_id);
			prsmt.setString(2, rice_id);
			prsmt.setInt(3, cart_quantity);
			prsmt.executeUpdate();
			cn.commit();
		} catch(SQLException e) {
			try {
				cn.rollback();
			} catch(SQLException e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public  ArrayList<RiceCartTableDto> AllSelect(String user_id) {
		ArrayList<RiceCartTableDto> result = new ArrayList<RiceCartTableDto>();
		try {
			System.out.println("ALLSELECT石川");
			rs = null;
			cn = ma.getConnection();
			prsmt = cn.prepareStatement(SELECT_ALL);
			prsmt.setString(1, user_id);
			rs = prsmt.executeQuery();
			System.out.println("while文のはじめ");
			while(rs.next()) {
				RiceCartTableDto rcdto = new RiceCartTableDto();
				rcdto.setCart_quantity(rs.getInt("cart_quantity"));
				rcdto.setRice_name(rs.getString("rice_name"));
				rcdto.setRice_genre(rs.getString("rice_genre"));
				rcdto.setRice_weight(rs.getString("rice_weight"));
				rcdto.setRice_made(rs.getString("rice_made"));
				rcdto.setRice_image_path(rs.getString("rice_image_path"));
				rcdto.setRice_since(rs.getTimestamp("rice_since"));
				rcdto.setRice_stock(rs.getString("rice_stock"));
				rcdto.setRice_price(rs.getString("rice_price"));
				
				System.out.println(rs.getInt("cart_quantity"));
				System.out.println(rs.getString("rice_name"));
				System.out.println(rs.getString("rice_genre"));
				System.out.println(rs.getInt("rice_weight"));
				System.out.println(rs.getInt("rice_since"));
				System.out.println("石川qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
				result.add(rcdto);
				System.out.println(result);
				
			}
			
		} catch (SQLException e) {
            // TODO 自動生成された catch ブロック
			
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) {
                    rs.close();
                }
            } catch(SQLException e) {
                e.printStackTrace();
            }
        }
        return result;
	}
}
