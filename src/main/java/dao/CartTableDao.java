package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import database.MySQLOperator;
import dto.CartTableDto;

public class CartTableDao {
	private static final String SELECT_ALL = "SELECT * FROM CartTable";
	
	MySQLOperator ma = new MySQLOperator();
	
	Connection cn = null;
	PreparedStatement prstm = null;
	ResultSet rs = null;
	
	public CartTableDto AllSelect() {
		CartTableDto cdto = null;
		try {
			cn = ma.getConnection();
			prstm = cn.prepareStatement(SELECT_ALL);
			rs = prstm.executeQuery();
			ResultSetMetaData rsMeta = rs.getMetaData();
			int colCount = rsMeta.getColumnCount();
			
			while(rs.next()) {
				cdto = new CartTableDto();
				for(int i = 1; i < colCount; i++) {
					cdto.setCart_quantity(rs.getInt("cart_quentity"));
					cdto.setUser_id(rs.getInt("user_id"));
					cdto.setRice_id(rs.getInt("rice_id"));
				}
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
        return cdto;
	}
}
