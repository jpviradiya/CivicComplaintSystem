package com.project.civic.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBUtil {

    private static final Properties props = new Properties();
    static {
        try (InputStream input = DBUtil.class.getClassLoader().getResourceAsStream("config.properties")) {
            if (input == null) {
                System.out.println("Sorry, unable to find config.properties");
            } else {
                props.load(input);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }


    private static final String URL = "jdbc:mysql://localhost:3306/civic_db?useSSL=false&serverTimezone=UTC";
    private static final String USER = props.getProperty("db.user");
    private static final String PASSWORD = props.getProperty("db.password");

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver not found", e);
        }
    }
}