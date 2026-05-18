package com.subscription.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
    public static Connection getConnection() {
        Connection conn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/mysubscription?useSSL=false&serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true";
            String user = "root";
            String password = "1234";

            conn = DriverManager.getConnection(url, user, password);
            System.out.println("DB 연결 성공");

        } catch (Exception e) {
            System.out.println("DB 연결 실패");
            e.printStackTrace();
        }

        return conn;
    }
}