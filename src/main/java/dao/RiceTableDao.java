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
    private static final String SELECT_RICE_ALL = "SELECT * FROM RICETABLE";
    private static final String SELECT_RICE_NAME = "SELECT * FROM RICETABLE WHERE rice_name LIKE ? AND rice_flag = true ORDER BY rice_id ASC" ;
    private static final String SELECT_PRODUCT = "SELECT * FROM RICETABLE where rice_id = ?";
    private static final String INSERT_PRODUCT = "INSERT INTO RICETABLE (rice_name, rice_genre, rice_weight, rice_made, rice_image_path, rice_since, rice_stock, rice_price) Values(?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String DELETE_PRODUCT = "DELETE FROM RICETABLE WHERE rice_id = ?";
    private static final String CHANGE_TRUE = "UPDATE RICETABLE SET rice_flag = true WHERE rice_id = ?";
    private static final String CHANGE_FALSE = "UPDATE RICETABLE SET rice_flag = false WHERE rice_id = ?";
    private static final String SELECT_RICE_PRICE = "SELECT rice_price FROM RICETABLE WHERE rice_id = ?";
    private static final String UPDATE_RICE_STOCK = "UPDATE RICETABLE SET rice_stock = rice_stock-? WHERE rice_id = ?";
    
    Connection cn = null; 
    Statement st = null;
    PreparedStatement prstm = null;
    ResultSet rs = null;
        
    public ArrayList<RiceTableDto> SelectProduct(String rice_id) {
        ArrayList<RiceTableDto> result = new ArrayList<>();
        ResultSet rs = null;
        try {
            cn = MySQLOperator.getInstance().getConnection();
        	System.out.println(cn);
            prstm = cn.prepareStatement(SELECT_PRODUCT);           
            prstm.setString(1, rice_id);
            rs = prstm.executeQuery();
        
          
            while(rs.next()) {
                RiceTableDto ricedto= new RiceTableDto();
                    ricedto.setRice_id(rs.getInt("rice_id"));
                    ricedto.setRice_name(rs.getString("rice_name"));
                    ricedto.setRice_genre(rs.getString("rice_genre"));
                    ricedto.setRice_weight(rs.getInt("rice_weight"));
                    ricedto.setRice_made(rs.getString("rice_made"));
                    ricedto.setRice_image_path(rs.getString("rice_image_path"));
                    
                    String rice_since = rs.getString("rice_since").substring(0, 7).replace("-", "年");
                    System.out.println(rice_since + "これが生まれた時間や");
                    ricedto.setRice_since(rice_since);
                    
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

              String rice_since = rs.getString("rice_since").substring(0, 7).replace("-", "年");
              ricedto.setRice_since(rice_since);
              
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
	    	cn = MySQLOperator.getInstance().getConnection();
	    	st = cn.createStatement();
	        rs = st.executeQuery(SELECT_RICE_ALL);
	    
	      
	        while(rs.next()) {
	            RiceBean riceBean = new RiceBean();
	            riceBean.setRice_id(rs.getInt("rice_id"));
			    riceBean.setRice_name(rs.getString("rice_name"));
			    riceBean.setRice_genre(rs.getString("rice_genre"));
			    riceBean.setRice_weight(rs.getInt("rice_weight"));
			    riceBean.setRice_made(rs.getString("rice_made"));
			    riceBean.setRice_image_path(rs.getString("rice_image_path"));
			    
			    String rice_since = rs.getString("rice_since").substring(0, 7).replace("-", "年");
                riceBean.setRice_since(rice_since);

                riceBean.setRice_stock(rs.getInt("rice_stock"));
			    riceBean.setRice_price(rs.getInt("rice_price"));
			    riceBean.setRice_flag(rs.getBoolean("rice_flag"));
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

    public void insertProduct(String rice_name, String rice_genre, int rice_weight, String rice_made, String rice_image_path, String rice_since, int rice_stock, int rice_price) {
    	try {
            cn = MySQLOperator.getInstance().getConnection();
            prstm = cn.prepareStatement(INSERT_PRODUCT);
            prstm.setString(1, rice_name);
            prstm.setString(2, rice_genre);
            prstm.setInt(3, rice_weight);
            prstm.setString(4, rice_made);
            prstm.setString(5, rice_image_path);
            
            rice_since = rice_since.substring(0, 7).replace("-", "年");
            System.out.println(rice_since + "これが生まれた時間や");
            prstm.setString(6, rice_since);
            
            prstm.setInt(7, rice_stock);
            prstm.setInt(8, rice_price);
            prstm.executeUpdate();
    	} catch(SQLException e) {
    		e.printStackTrace();
			MySQLOperator.getInstance().rollback();
    	}
    }
    
    public void deleteProduct(int rice_id) {
    	try {
    		cn = MySQLOperator.getInstance().getConnection();
            prstm = cn.prepareStatement(DELETE_PRODUCT);
            prstm.setInt(1, rice_id);
            prstm.executeUpdate();
    	} catch(SQLException e) {
			MySQLOperator.getInstance().rollback();
    	}
    	
    }
    
    public void changeTrue(String rice_id) {
    	try {
            cn = MySQLOperator.getInstance().getConnection();
            prstm = cn.prepareStatement(CHANGE_TRUE);
            prstm.setString(1, rice_id);
            prstm.executeUpdate();
    	} catch(SQLException e) {
			MySQLOperator.getInstance().rollback();
    	}
    }
    
    public void changeFalse(String rice_id) {
    	try {
            cn = MySQLOperator.getInstance().getConnection();
            prstm = cn.prepareStatement(CHANGE_FALSE);
            prstm.setString(1, rice_id);
            prstm.executeUpdate();
    	} catch(SQLException e) {
			MySQLOperator.getInstance().rollback();
    	}
    }
    
    public int getRicePrice(int rice_id) {
    	int price = 0;
    	try {
    		cn = MySQLOperator.getInstance().getConnection();
    		prstm = cn.prepareStatement(SELECT_RICE_PRICE);
    		prstm.setInt(1, rice_id);
    		rs = prstm.executeQuery();
    		rs.next();
    		price = rs.getInt(1);
    		
    	} catch (SQLException e) {
    		MySQLOperator.getInstance().rollback();
    	}
    	return price;
    }
    
    public void updateRiceStock(int rice_id, int order_quantity) {
    	try {
    		cn = MySQLOperator.getInstance().getConnection();
    		prstm = cn.prepareStatement(UPDATE_RICE_STOCK);
    		prstm.setInt(1, order_quantity);
    		prstm.setInt(2, rice_id);
    		prstm.executeUpdate();
    	} catch (SQLException e) {
    		e.printStackTrace();
    		MySQLOperator.getInstance().rollback();
    	}
    }
}