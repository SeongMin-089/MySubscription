<%@ page import="com.subscription.dto.MemberDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");

if (loginMember == null) {
	response.sendRedirect(request.getContextPath() + "/login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - MySubscription</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

	<jsp:include page="layout/header.jsp"></jsp:include>

	<main>
		<div class="main-box">
			<h2>마이페이지</h2>

			<p>
				<strong><%=loginMember.getName()%></strong>님 환영합니다.
			</p>

			<div class="btn-wrap">
				<a href="${pageContext.request.contextPath}/subscriptionAdd.jsp"
					class="btn">구독 등록</a> <a
					href="${pageContext.request.contextPath}/subscriptionList.jsp"
					class="btn sub">내 구독 목록</a> <a
					href="${pageContext.request.contextPath}/logout" class="btn sub">로그아웃</a>
			</div>
		</div>
	</main>

	<jsp:include page="layout/footer.jsp"></jsp:include>

</body>
</html>