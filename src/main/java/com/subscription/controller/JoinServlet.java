package com.subscription.controller;

import java.io.IOException;

import com.subscription.dao.MemberDAO;
import com.subscription.dto.MemberDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/join")
public class JoinServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        MemberDTO member = new MemberDTO();
        member.setUserId(userId);
        member.setPassword(password);
        member.setName(name);
        member.setEmail(email);

        MemberDAO dao = new MemberDAO();
        int result = dao.insertMember(member);

        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } else {
            response.getWriter().println("<script>");
            response.getWriter().println("alert('회원가입에 실패했습니다. 다시 시도해주세요.');");
            response.getWriter().println("history.back();");
            response.getWriter().println("</script>");
        }
    }
}