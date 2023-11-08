package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

import database.MySQLOperator;
import dto.RicetableDto;

public class RiceTableDAO {
	private static final String SELECT_RICE_ALL = "SELECT * FROM RiceTable";
	
	private static final String DB_USER = "come";
	private static final String DB_PASS = "come";
	
	MySQLOperator ma = new MySQLOperator();
    
    Connection cn = null;
    Statement st = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public ArrayList<RicetableDto> SelectAllRice() {
    	ArrayList<RicetableDto> result = new ArrayList<>();
    	st = ma.getStatement(DB_USER, DB_PASS);
    	ResultSet rs = st.executeQuery(SELECT_RICE_ALL);
		ResultSetMetaData rsMeta = (ResultSetMetaData) rs.getMetaData();
    	int colCount = rsMeta.getColumnCount();
    	
    	while(rs.next()) {
    		RicetableDto ricedto= new RicetableDto();
    	}
    	
    }

}
