package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class SampleConnectDB {
    public static boolean tryConnect() {
        boolean isConnected = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://mysql_server:3306/sample","root","root");
            Statement stmt=con.createStatement();  
            ResultSet rs=stmt.executeQuery("show tables;");
            isConnected = true;
        } catch(Exception e) {
            isConnected = false;
            System.out.println(e);
        }
        return isConnected;
    }  
}
