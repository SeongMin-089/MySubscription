package com.subscription.controller;

import java.io.IOException;

import com.subscription.dao.SubscriptionDAO;
import com.subscription.dto.MemberDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/subscriptionDelete")
public class SubscriptionDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        HttpSession session = request.getSession(false);
        MemberDTO loginMember = null;

        if (session != null) {
            loginMember = (MemberDTO) session.getAttribute("loginMember");
        }

        if (loginMember == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        int subNo = Integer.parseInt(request.getParameter("subNo"));

        SubscriptionDAO dao = new SubscriptionDAO();
        dao.deleteSubscription(subNo, loginMember.getMemberNo());

        response.sendRedirect(request.getContextPath() + "/subscriptionList.jsp");
    }
}