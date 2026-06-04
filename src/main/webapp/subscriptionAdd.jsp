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
<title>구독 등록 - MySubscription</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/subscription.css">
</head>
<body>

	<jsp:include page="layout/header.jsp"></jsp:include>

	<main class="page-main">
		<section class="form-hero">
			<div class="form-hero-content">
				<span class="form-badge">ADD SUBSCRIPTION</span>

				<h2>
					새로운 구독 서비스를<br>
					등록하세요
				</h2>

				<p>
					서비스명, 카테고리, 월 구독료, 결제일을 입력하면<br>
					내 구독 목록에서 한눈에 관리할 수 있습니다.
				</p>
			</div>

			<div class="form-guide-panel">
				<div class="guide-icon">🧾</div>
				<h3>구독 등록</h3>
				<p>매월 나가는 구독료를 기록해 지출을 쉽게 관리해보세요.</p>
			</div>
		</section>

		<section class="form-section">
			<div class="form-title">
				<span>SUBSCRIPTION FORM</span>
				<h3>구독 정보 입력</h3>
			</div>

			<form action="${pageContext.request.contextPath}/subscriptionAdd" method="post" class="subscription-form">
				<div class="form-row">
					<div class="form-group">
						<label for="serviceName">서비스명</label>
						<input type="text" id="serviceName" name="serviceName" placeholder="예: Netflix, YouTube Premium" required>
					</div>

					<div class="form-group">
						<label for="category">카테고리</label>
						<select id="category" name="category" required>
							<option value="">카테고리 선택</option>
							<option value="영상">영상</option>
							<option value="음악">음악</option>
							<option value="쇼핑">쇼핑</option>
							<option value="게임">게임</option>
							<option value="클라우드">클라우드</option>
							<option value="기타">기타</option>
						</select>
					</div>
				</div>

				<div class="form-row">
					<div class="form-group">
						<label for="price">월 구독료</label>
						<input type="number" id="price" name="price" placeholder="예: 14900" required>
					</div>

					<div class="form-group">
						<label for="paymentDay">결제일</label>
						<input type="number" id="paymentDay" name="paymentDay" min="1" max="31" placeholder="1~31" required>
					</div>
				</div>

				<div class="form-group">
					<label for="memo">메모</label>
					<textarea id="memo" name="memo" rows="4" placeholder="메모를 입력하세요"></textarea>
				</div>

				<div class="form-actions">
					<button type="submit" class="btn btn-primary">등록하기</button>
					<a href="${pageContext.request.contextPath}/mypage.jsp" class="btn btn-dark">취소</a>
				</div>
			</form>
		</section>
	</main>

	<jsp:include page="layout/footer.jsp"></jsp:include>

</body>
</html>