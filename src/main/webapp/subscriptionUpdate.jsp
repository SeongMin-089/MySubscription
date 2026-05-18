<%@ page import="com.subscription.dto.MemberDTO"%>
<%@ page import="com.subscription.dto.SubscriptionDTO"%>
<%@ page import="com.subscription.dao.SubscriptionDAO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");

if (loginMember == null) {
    response.sendRedirect(request.getContextPath() + "/login.jsp");
    return;
}

int subNo = Integer.parseInt(request.getParameter("subNo"));

SubscriptionDAO dao = new SubscriptionDAO();
SubscriptionDTO subscription = dao.getSubscription(subNo, loginMember.getMemberNo());

if (subscription == null) {
    response.sendRedirect(request.getContextPath() + "/subscriptionList.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독 수정 - MySubscription</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<jsp:include page="layout/header.jsp"></jsp:include>

<main>
    <div class="main-box">
        <h2>구독 서비스 수정</h2>

        <form action="${pageContext.request.contextPath}/subscriptionUpdate" method="post" class="form-box">
            <input type="hidden" name="subNo" value="<%= subscription.getSubNo() %>">

            <div class="form-group">
                <label for="serviceName">서비스명</label>
                <input type="text" id="serviceName" name="serviceName"
                       value="<%= subscription.getServiceName() %>" required>
            </div>

            <div class="form-group">
                <label for="category">카테고리</label>
                <select id="category" name="category" required>
                    <option value="영상" <%= subscription.getCategory().equals("영상") ? "selected" : "" %>>영상</option>
                    <option value="음악" <%= subscription.getCategory().equals("음악") ? "selected" : "" %>>음악</option>
                    <option value="쇼핑" <%= subscription.getCategory().equals("쇼핑") ? "selected" : "" %>>쇼핑</option>
                    <option value="게임" <%= subscription.getCategory().equals("게임") ? "selected" : "" %>>게임</option>
                    <option value="클라우드" <%= subscription.getCategory().equals("클라우드") ? "selected" : "" %>>클라우드</option>
                    <option value="기타" <%= subscription.getCategory().equals("기타") ? "selected" : "" %>>기타</option>
                </select>
            </div>

            <div class="form-group">
                <label for="price">월 구독료</label>
                <input type="number" id="price" name="price"
                       value="<%= subscription.getPrice() %>" required>
            </div>

            <div class="form-group">
                <label for="paymentDay">결제일</label>
                <input type="number" id="paymentDay" name="paymentDay" min="1" max="31"
                       value="<%= subscription.getPaymentDay() %>" required>
            </div>

            <div class="form-group">
                <label for="memo">메모</label>
                <textarea id="memo" name="memo" rows="4"><%= subscription.getMemo() == null ? "" : subscription.getMemo() %></textarea>
            </div>

            <div class="btn-wrap">
                <button type="submit" class="btn">수정하기</button>
                <a href="${pageContext.request.contextPath}/subscriptionList.jsp" class="btn sub">취소</a>
            </div>
        </form>
    </div>
</main>

<jsp:include page="layout/footer.jsp"></jsp:include>

</body>
</html>