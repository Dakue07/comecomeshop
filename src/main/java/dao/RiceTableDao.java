package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.RiceBean;
import database.MySQLOperator;
import dto.RiceTableDto;
public class RiceTableDao {
    private static final String SELECT_RICE_ALL = "SELECT * FROM RiceTable";
    private static final String SELECT_RICE_NAME = "SELECT * FROM RiceTable WHERE rice_name LIKE ? AND rice_flag = 0 ORDER BY rice_id DESC" ;
    private static final String SELECT_PRODUCT = "SELECT * FROM RIceTable where rice_id = ?";
//    private static final String DB_USER = "come";
//    private static final String DB_PASS = "come";
        
    Connection cn = MySQLOperator.getInstance().getConnection();
    Statement st = null;
    PreparedStatement prstm = null;
    ResultSet rs = null;
        
    public ArrayList<RiceTableDto> SelectProduct(String rice_id) {
        ArrayList<RiceTableDto> result = new ArrayList<>();
        ResultSet rs = null;
        try {
            rs = st.executeQuery(SELECT_PRODUCT);
        
          
            while(rs.next()) {
                RiceTableDto ricedto= new RiceTableDto();
                    ricedto.setRice_id(rs.getInt("rice_id"));
                    ricedto.setRice_name(rs.getString("rice_name"));
                    ricedto.setRice_genre(rs.getString("rice_genre"));
                    ricedto.setRice_weight(rs.getInt("rice_weight"));
                    ricedto.setRice_made(rs.getString("rice_made"));
                    ricedto.setRice_image_path(rs.getString("rice_image_path"));
                    ricedto.setRice_since(rs.getString("rice_since"));
                    ricedto.setRice_stock(rs.getInt("rice_stock"));
                    ricedto.setRice_price(rs.getInt("rice_price"));
                    result.add(ricedto);

                }
        
        } catch (SQLException e) {
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
//    
    public ArrayList<RiceTableDto> SelectRice(String rice_name, String sortColmnName) { //使うのかわからない
    	ArrayList<RiceTableDto> result = new ArrayList<RiceTableDto>();
        RiceTableDto ricedto = null;
        if (rice_name == null) {
        	rice_name = "";
        }
        if (sortColmnName == null) {
        	sortColmnName = "rice_id desc";
        }
        try {
            cn = MySQLOperator.getInstance().getConnection();
            prstm = cn.prepareStatement(SELECT_RICE_NAME);

            prstm.setString(1, "%" + rice_name + "%");
            ResultSet rs = prstm.executeQuery();
            ResultSetMetaData rsMeta = rs.getMetaData();

  
            int colCount = rsMeta.getColumnCount();
            while(rs.next()) {
            ricedto= new RiceTableDto();
              ricedto.setRice_id(rs.getInt("rice_id"));
              ricedto.setRice_name(rs.getString("rice_name"));
              ricedto.setRice_genre(rs.getString("rice_genre"));
              ricedto.setRice_weight(rs.getInt("rice_weight"));
              ricedto.setRice_made(rs.getString("rice_made"));
              ricedto.setRice_image_path(rs.getString("rice_image_path"));
              ricedto.setRice_since(rs.getString("rice_since"));
              ricedto.setRice_stock(rs.getInt("rice_stock"));
              ricedto.setRice_price(rs.getInt("rice_price"));
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
        System.out.println(result.size());
        return result;
    }
    
	public ArrayList<RiceBean> SelectAll() {
	    ArrayList<RiceBean> result = new ArrayList<>();
	    ResultSet rs = null;
	    try {
	        rs = st.executeQuery(SELECT_RICE_ALL);
	    
	      
	        while(rs.next()) {
	            RiceBean riceBean = new RiceBean();
	            riceBean.setRice_id(rs.getInt("rice_id"));
			    riceBean.setRice_name(rs.getString("rice_name"));
			    riceBean.setRice_genre(rs.getString("rice_genre"));
			    riceBean.setRice_weight(rs.getInt("rice_weight"));
			    riceBean.setRice_made(rs.getString("rice_made"));
			    riceBean.setRice_image_path(rs.getString("rice_image_path"));
			    riceBean.setRice_since(rs.getString("rice_since"));
			    riceBean.setRice_stock(rs.getInt("rice_stock"));
			    riceBean.setRice_price(rs.getInt("rice_price"));
	            result.add(riceBean);
	        }
        } catch (SQLException e) {
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