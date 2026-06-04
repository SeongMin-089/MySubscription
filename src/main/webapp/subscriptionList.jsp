<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.DecimalFormat"%>
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

DecimalFormat formatter = new DecimalFormat("#,###");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 구독 목록 - MySubscription</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/subscription.css">
</head>
<body>

	<jsp:include page="layout/header.jsp"></jsp:include>

	<main class="page-main">
		<section class="list-hero">
			<div class="list-hero-content">
				<span class="list-badge">SUBSCRIPTION LIST</span>

				<h2>
					<%=loginMember.getName()%>님의<br>
					구독 목록을 확인하세요
				</h2>

				<p>
					현재 등록된 구독 서비스와 월 구독료, 결제일을 한눈에 확인하고
					필요한 정보는 바로 수정하거나 삭제할 수 있습니다.
				</p>

				<div class="btn-wrap">
					<a href="${pageContext.request.contextPath}/subscriptionAdd.jsp" class="btn btn-primary">구독 등록</a>
					<a href="${pageContext.request.contextPath}/mypage.jsp" class="btn btn-dark">마이페이지</a>
				</div>
			</div>

			<div class="summary-panel">
				<div class="summary-item">
					<span>등록된 구독</span>
					<strong><%=subscriptionList.size()%>개</strong>
				</div>

				<div class="summary-line"></div>

				<div class="summary-item">
					<span>월 구독료 합계</span>
					<strong><%=formatter.format(totalPrice)%>원</strong>
				</div>
			</div>
		</section>

		<section class="list-section">
			<div class="list-title">
				<div>
					<span>MY SUBSCRIPTIONS</span>
					<h3>구독 서비스 목록</h3>
				</div>

				<p>총 <strong><%=subscriptionList.size()%></strong>개의 구독 서비스가 등록되어 있습니다.</p>
			</div>

			<div class="table-card">
				<table class="subscription-table">
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
							<td colspan="8">
								<div class="empty-box">
									<div class="empty-icon">📭</div>
									<h4>등록된 구독 서비스가 없습니다.</h4>
									<p>먼저 구독 서비스를 등록해 월 구독료를 관리해보세요.</p>
									<a href="${pageContext.request.contextPath}/subscriptionAdd.jsp" class="empty-btn">구독 등록하기</a>
								</div>
							</td>
						</tr>
						<%
						} else {
							for (SubscriptionDTO sub : subscriptionList) {
						%>
						<tr>
							<td><%=sub.getSubNo()%></td>
							<td class="service-name"><%=sub.getServiceName()%></td>
							<td>
								<span class="category-badge"><%=sub.getCategory()%></span>
							</td>
							<td class="price"><%=formatter.format(sub.getPrice())%>원</td>
							<td>매월 <%=sub.getPaymentDay()%>일</td>
							<td class="memo"><%=sub.getMemo() == null ? "" : sub.getMemo()%></td>
							<td><%=sub.getRegdate()%></td>
							<td>
								<div class="table-actions">
									<a href="${pageContext.request.contextPath}/subscriptionUpdate.jsp?subNo=<%=sub.getSubNo()%>"
										class="action-btn edit">수정</a>

									<a href="${pageContext.request.contextPath}/subscriptionDelete?subNo=<%=sub.getSubNo()%>"
										class="action-btn delete"
										onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
								</div>
							</td>
						</tr>
						<%
							}
						}
						%>
					</tbody>
				</table>
			</div>
		</section>
	</main>

	<jsp:include page="layout/footer.jsp"></jsp:include>

</body>
</html>