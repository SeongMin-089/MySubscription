<%@ page import="java.util.ArrayList"%>
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

SubscriptionDAO dao = new SubscriptionDAO();
ArrayList<SubscriptionDTO> subscriptionList = dao.getSubscriptionList(loginMember.getMemberNo());
int totalPrice = dao.getTotalPrice(loginMember.getMemberNo());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 구독 목록 - MySubscription</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

	<jsp:include page="layout/header.jsp"></jsp:include>

	<main>
		<div class="main-box">
			<h2>내 구독 목록</h2>

			<p>
				<strong><%=loginMember.getName()%></strong>님의 월 구독료 합계는 <strong><%=totalPrice%>원</strong>
				입니다.
			</p>

			<div class="btn-wrap">
				<a href="${pageContext.request.contextPath}/subscriptionAdd.jsp"
					class="btn">구독 등록</a> <a
					href="${pageContext.request.contextPath}/mypage.jsp"
					class="btn sub">마이페이지</a>
			</div>

			<table class="list-table">
				<thead>
					<tr>
						<th>번호</th>
						<th>서비스명</th>
						<th>카테고리</th>
						<th>월 구독료</th>
						<th>결제일</th>
						<th>메모</th>
						<th>등록일</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (subscriptionList.size() == 0) {
					%>
					<tr>
						<td colspan="8">등록된 구독 서비스가 없습니다.</td>
					</tr>
					<%
					} else {
					for (SubscriptionDTO sub : subscriptionList) {
					%>
					<tr>
						<td><%=sub.getSubNo()%></td>
						<td><%=sub.getServiceName()%></td>
						<td><%=sub.getCategory()%></td>
						<td><%=sub.getPrice()%>원</td>
						<td>매월 <%=sub.getPaymentDay()%>일
						</td>
						<td><%=sub.getMemo() == null ? "" : sub.getMemo()%></td>
						<td><%=sub.getRegdate()%></td>
						<td><a
							href="${pageContext.request.contextPath}/subscriptionDelete?subNo=<%= sub.getSubNo() %>"
							class="btn small" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
						</td>
					</tr>
					<%
					}
					}
					%>
				</tbody>
			</table>
		</div>
	</main>

	<jsp:include page="layout/footer.jsp"></jsp:include>

</body>
</html>