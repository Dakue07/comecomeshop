package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MySQLOperator {
	private Connection cn = null;
	private static PreparedStatement st = null;
	private static ResultSet rs = null;
	private static int choose = 0;
	
	private static MySQLOperator operator = null;

	private MySQLOperator() {}
	
	public static MySQLOperator getInstance() {
		if (operator == null) {
			operator = new MySQLOperator();
		}		
		return operator;
	}
	
	public Connection createConnection() {
		String DATABASE_NAME = "orcl";
        String PROPATIES = "?characterEncoding=UTF-8&useTimezone=true&serverTimezone=Asia/Tokyo";
        String URL = "jdbc:mySQL://localhost/" + DATABASE_NAME + PROPATIES;

        String USER = "come";
        String PASS = "come";
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            cn = DriverManager.getConnection(URL, USER, PASS);
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
		
		return cn;
	}
	
	public Connection getConnection() {
		return cn;
	}
	
	public void close(Connection cn, PreparedStatement _st) {
		st = _st;
		choose++;
		close(cn);
	}
	public void close(Connection cn, PreparedStatement _st, ResultSet _rs) {
		st = _st;
		rs = _rs;
		choose += 2;
		close(cn);
	}
	public void close(Connection cn) {
		switch (choose) {
			case 0:
				MySQLCloser.close(cn);
				break;
			case 1:
				MySQLCloser.close(cn, st);
				break;
			case 2:
				MySQLCloser.close(cn, st, rs);
				break;
		}
	}
	public void close() {
		close(cn, st, rs);
	}
	
	public Statement getStatement() {
    	Connection cn = getConnection();
    	Statement st = null;
    	
    	try {
    		st = cn.createStatement();
    	} catch(SQLException e) {
            e.printStackTrace();
        }
    	
    	return st;
    }
	
	public void commit() {
	    try {
 // ここでトランザクションを開始
	        cn.commit();
	        //close();
	    } catch (SQLException e){
	        e.printStackTrace();
	    }
	}
	
	public void rollback() {
		try {
			cn.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void beginTransaction() {
		createConnection();
		try {
			cn.setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}