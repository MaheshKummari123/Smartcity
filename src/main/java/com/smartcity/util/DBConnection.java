package com.smartcity.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static String url = "jdbc:postgresql://roundhouse.proxy.rlwy.net:30147/railway?sslmode=require";
    private static String username = "postgres";
    private static String password = "tkXtwSayDHQzqFfYZZfxxNKIIpneXdfG";

    public static Connection getConnection() {
        try {
            Class.forName("org.postgresql.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);
            System.out.println("✅ Connected to Railway DB");
            return conn;
        } catch (Exception e) {
            e.printStackTrace(); // VERY IMPORTANT
            throw new RuntimeException("DB connection failed");
        }
    }
}