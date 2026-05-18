package com.subscription.controller;

import java.io.IOException;

import com.subscription.dao.MemberDAO;
import com.subscription.dto.MemberDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String userId = request.getParameter("userId");
        String password = request.getParameter("password");

        MemberDAO dao = new MemberDAO();
        MemberDTO member = dao.login(userId, password);

        if (member != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loginMember", member);

            response.sendRedirect(request.getContextPath() + "/mypage.jsp");
        } else {
            response.getWriter().println("<script>");
            response.getWriter().println("alert('아이디 또는 비밀번호가 올바르지 않습니다.');");
            response.getWriter().println("history.back();");
            response.getWriter().println("</script>");
        }
    }
}