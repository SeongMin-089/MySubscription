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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/subscription.css">
</head>
<body>

	<jsp:include page="layout/header.jsp"></jsp:include>

	<main class="page-main">
		<section class="form-hero">
			<div class="form-hero-content">
				<span class="form-badge">UPDATE SUBSCRIPTION</span>

				<h2>
					구독 정보를<br>
					수정하세요
				</h2>

				<p>
					변경된 서비스명, 카테고리, 월 구독료, 결제일을 수정하면
					내 구독 목록에 바로 반영됩니다.
				</p>
			</div>

			<div class="form-guide-panel update">
				<div class="guide-icon">✏️</div>
				<h3>구독 수정</h3>
				<p>현재 등록된 구독 정보를 최신 상태로 관리해보세요.</p>
			</div>
		</section>

		<section class="form-section">
			<div class="form-title">
				<span>SUBSCRIPTION FORM</span>
				<h3>구독 정보 수정</h3>
			</div>

			<form action="${pageContext.request.contextPath}/subscriptionUpdate" method="post" class="subscription-form">
				<input type="hidden" name="subNo" value="<%=subscription.getSubNo()%>">

				<div class="form-row">
					<div class="form-group">
						<label for="serviceName">서비스명</label>
						<input type="text" id="serviceName" name="serviceName"
							value="<%=subscription.getServiceName()%>" required>
					</div>

					<div class="form-group">
						<label for="category">카테고리</label>
						<select id="category" name="category" required>
							<option value="영상" <%=subscription.getCategory().equals("영상") ? "selected" : ""%>>영상</option>
							<option value="음악" <%=subscription.getCategory().equals("음악") ? "selected" : ""%>>음악</option>
							<option value="쇼핑" <%=subscription.getCategory().equals("쇼핑") ? "selected" : ""%>>쇼핑</option>
							<option value="게임" <%=subscription.getCategory().equals("게임") ? "selected" : ""%>>게임</option>
							<option value="클라우드" <%=subscription.getCategory().equals("클라우드") ? "selected" : ""%>>클라우드</option>
							<option value="기타" <%=subscription.getCategory().equals("기타") ? "selected" : ""%>>기타</option>
						</select>
					</div>
				</div>

				<div class="form-row">
					<div class="form-group">
						<label for="price">월 구독료</label>
						<input type="number" id="price" name="price"
							value="<%=subscription.getPrice()%>" required>
					</div>

					<div class="form-group">
						<label for="paymentDay">결제일</label>
						<input type="number" id="paymentDay" name="paymentDay" min="1" max="31"
							value="<%=subscription.getPaymentDay()%>" required>
					</div>
				</div>

				<div class="form-group">
					<label for="memo">메모</label>
					<textarea id="memo" name="memo" rows="4"><%=subscription.getMemo() == null ? "" : subscription.getMemo()%></textarea>
				</div>

				<div class="form-actions">
					<button type="submit" class="btn btn-primary">수정하기</button>
					<a href="${pageContext.request.contextPath}/subscriptionList.jsp" class="btn btn-dark">취소</a>
				</div>
			</form>
		</section>
	</main>

	<jsp:include page="layout/footer.jsp"></jsp:include>

</body>
</html>