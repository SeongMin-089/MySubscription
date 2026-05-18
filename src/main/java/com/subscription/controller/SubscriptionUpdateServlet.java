package com.subscription.controller;

import java.io.IOException;

import com.subscription.dao.SubscriptionDAO;
import com.subscription.dto.MemberDTO;
import com.subscription.dto.SubscriptionDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/subscriptionUpdate")
public class SubscriptionUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
        String serviceName = request.getParameter("serviceName");
        String category = request.getParameter("category");
        int price = Integer.parseInt(request.getParameter("price"));
        int paymentDay = Integer.parseInt(request.getParameter("paymentDay"));
        String memo = request.getParameter("memo");

        SubscriptionDTO subscription = new SubscriptionDTO();
        subscription.setSubNo(subNo);
        subscription.setMemberNo(loginMember.getMemberNo());
        subscription.setServiceName(serviceName);
        subscription.setCategory(category);
        subscription.setPrice(price);
        subscription.setPaymentDay(paymentDay);
        subscription.setMemo(memo);

        SubscriptionDAO dao = new SubscriptionDAO();
        int result = dao.updateSubscription(subscription);

        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/subscriptionList.jsp");
        } else {
            response.getWriter().println("<script>");
            response.getWriter().println("alert('구독 수정에 실패했습니다.');");
            response.getWriter().println("history.back();");
            response.getWriter().println("</script>");
        }
    }
}