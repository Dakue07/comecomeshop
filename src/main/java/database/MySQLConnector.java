package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// MySQLに接続するためのクラス

public class MySQLConnector extends MySQLAccessor {
	public static Connection getConnection() {
        String DATABASE_NAME = "orcl";
        String PROPATIES = "?characterEncoding=UTF-8&useTimezone=true&serverTimezone=Asia/Tokyo";
        String URL = "jdbc:mySQL://localhost/" + DATABASE_NAME+PROPATIES;

        String USER = "come";
        String PASS = "come";
        Connection conn = null;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(URL, USER, PASS);
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return conn;
    }
}