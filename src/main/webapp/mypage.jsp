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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
</head>
<body>

	<jsp:include page="layout/header.jsp"></jsp:include>

	<main class="page-main">
		<section class="mypage-hero">
			<div class="mypage-content">
				<span class="mypage-badge">MY PAGE</span>

				<h2>
					<%=loginMember.getName()%>님,<br>
					오늘도 구독 관리를 시작해볼까요?
				</h2>

				<p>
					이용 중인 구독 서비스를 등록하고, 월 구독료를 확인하며,<br>
					필요한 구독 정보는 언제든지 수정하거나 삭제할 수 있습니다.
				</p>

				<div class="btn-wrap">
					<a href="${pageContext.request.contextPath}/subscriptionAdd.jsp" class="btn btn-primary">구독 등록</a>
					<a href="${pageContext.request.contextPath}/subscriptionList.jsp" class="btn btn-dark">구독 목록</a>
				</div>
			</div>

			<div class="mypage-panel">
				<div class="panel-label">LOGIN USER</div>

				<div class="user-circle">
					<%=loginMember.getName().substring(0, 1)%>
				</div>

				<h3><%=loginMember.getName()%>님</h3>
				<p>🟢 회원</p>

				<a href="${pageContext.request.contextPath}/logout" class="logout-link">로그아웃</a>
			</div>
		</section>

		<section class="quick-section">
			<div class="quick-title">
				<span>QUICK MENU</span>
				<h3>자주 사용하는 메뉴</h3>
			</div>

			<div class="quick-card-wrap">
				<a href="${pageContext.request.contextPath}/subscriptionAdd.jsp" class="quick-card">
					<div class="quick-icon">🧾</div>

					<div class="quick-text">
						<h4>구독 등록</h4>
						<p>새로운 구독 서비스를 추가합니다.</p>
					</div>

					<span class="quick-arrow">→</span>
				</a>

				<a href="${pageContext.request.contextPath}/subscriptionList.jsp" class="quick-card active">
					<div class="quick-icon">📊</div>

					<div class="quick-text">
						<h4>구독 목록</h4>
						<p>등록한 구독과 월 구독료를 확인합니다.</p>
					</div>

					<span class="quick-arrow">→</span>
				</a>

				<a href="${pageContext.request.contextPath}/logout" class="quick-card">
					<div class="quick-icon">🚪</div>

					<div class="quick-text">
						<h4>로그아웃</h4>
						<p>현재 계정에서 안전하게 나갑니다.</p>
					</div>

					<span class="quick-arrow">→</span>
				</a>
			</div>
		</section>
	</main>

	<jsp:include page="layout/footer.jsp"></jsp:include>

</body>
</html>