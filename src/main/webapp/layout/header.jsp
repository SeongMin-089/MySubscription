<%@ page import="com.subscription.dto.MemberDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
%>

<header class="site-header">
    <div class="header-inner">
        <h1 class="logo">
            <a href="${pageContext.request.contextPath}/index.jsp">MySubscription</a>
        </h1>

        <nav class="gnb">
            <a href="${pageContext.request.contextPath}/index.jsp">홈</a>

            <%
            if (loginMember == null) {
            %>
                <a href="${pageContext.request.contextPath}/join.jsp">회원가입</a>
                <a href="${pageContext.request.contextPath}/login.jsp">로그인</a>
            <%
            } else {
            %>
                <a href="${pageContext.request.contextPath}/mypage.jsp">마이페이지</a>
                <a href="${pageContext.request.contextPath}/subscriptionList.jsp">내 구독 목록</a>
                <a href="${pageContext.request.contextPath}/logout">로그아웃</a>
            <%
            }
            %>
        </nav>
    </div>
</header>