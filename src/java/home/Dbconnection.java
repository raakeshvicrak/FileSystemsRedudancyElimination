package home;

import java.sql.*;

public class Dbconnection {

    static Connection c;
    public static String path = "/Users/raakesh-pt503/Documents";

    public static Connection conn() {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            c = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return c;
    }

}
