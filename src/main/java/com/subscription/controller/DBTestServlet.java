package com.subscription.controller;

import com.subscription.util.DBconnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/dbtest")
public class DBTestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html; charset=UTF-8");

        Connection conn = DBconnect.getConnection();

        if (conn != null) {
            response.getWriter().println("<h2>DB 연결 성공</h2>");
        } else {
            response.getWriter().println("<h2>DB 연결 실패</h2>");
        }
    }
}