package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

import database.MySQLOperator;
import dto.RiceTableDto;

public class RiceTableDao {
	private static final String SELECT_RICE_ALL = "SELECT * FROM RiceTable";
	private static final String SELECT_RICE_NAME = "SELECT * FROM RiceTable WHERE rice_name = ?";
	private static final String DB_USER = "come";
	private static final String DB_PASS = "come";
	
	MySQLOperator ma = new MySQLOperator();
    
    Connection cn = null;
    Statement st = null;
    PreparedStatement prstm = null;
    ResultSet rs = null;
    
    public ArrayList<RiceTableDto> SelectAllRice() {
    	ArrayList<RiceTableDto> result = new ArrayList<>();
    	st = ma.getStatement(DB_USER, DB_PASS);
    	ResultSet rs = null;
		try {
			rs = st.executeQuery(SELECT_RICE_ALL);
		
			ResultSetMetaData rsMeta = (ResultSetMetaData) rs.getMetaData();
	    	int colCount = rsMeta.getColumnCount();
	    	
	    	while(rs.next()) {
	    		RiceTableDto ricedto= new RiceTableDto();
	    		for(int i = 1; i < colCount; i ++) {
	    			ricedto.setRice_id(rs.getInt("rice_id"));
	    			ricedto.setRice_name(rs.getString("rice_name"));
	    			ricedto.setRice_genre(rs.getString("rice_genre"));
	    			ricedto.setRice_weight(rs.getInt("rice_weight"));
	    			ricedto.setRice_made(rs.getString("rice_made"));
	    			ricedto.setRice_image(rs.getString("rice_imag"));
	    			ricedto.setRice_since(rs.getString("rice_since"));
	    			ricedto.setRice_stock(rs.getInt("rice_stock"));
	    			ricedto.setRice_price(rs.getInt("rice_price"));
	    		}
	    		result.add(ricedto);
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
    
    public RiceTableDto SelectGenre(String name) { //使うのかわからない
    	RiceTableDto ricedto = null;
    	try {
    		cn = ma.getConnection(DB_USER, DB_PASS);
    		prstm = cn.prepareStatement(SELECT_RICE_NAME);
    		prstm.setString(1, name);
			ResultSet rs = prstm.executeQuery();
			while(rs.next()) {
	    		ricedto= new RiceTableDto();
				ricedto.setRice_id(rs.getInt("rice_id"));
    			ricedto.setRice_name(rs.getString("rice_name"));
    			ricedto.setRice_genre(rs.getString("rice_genre"));
    			ricedto.setRice_weight(rs.getInt("rice_weight"));
    			ricedto.setRice_made(rs.getString("rice_made"));
    			ricedto.setRice_image(rs.getString("rice_imag"));
    			ricedto.setRice_since(rs.getString("rice_since"));
    			ricedto.setRice_stock(rs.getInt("rice_stock"));
    			ricedto.setRice_price(rs.getInt("rice_price"));
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
		return ricedto;
    }

}
