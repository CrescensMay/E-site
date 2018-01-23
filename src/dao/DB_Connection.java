package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB_Connection {
    public Connection getConnection(){
        Connection connection = null;
        String driver = "com.mysql.jdbc.Driver";
        String user = "root";
        String password = "crescens";
        String url = "jdbc:mysql://localhost:3306/image";

        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return connection;
    }
}
