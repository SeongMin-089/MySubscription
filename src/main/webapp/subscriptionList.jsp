<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.YearMonth"%>
<%@ page import="java.time.temporal.ChronoUnit"%>
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

String sort = request.getParameter("sort");

if (sort == null || sort.trim().equals("")) {
	sort = "default";
}

ArrayList<SubscriptionDTO> subscriptionList = dao.getSubscriptionList(loginMember.getMemberNo(), sort);
int totalPrice = dao.getTotalPrice(loginMember.getMemberNo());
Map<String, Integer> categoryTotalMap = dao.getCategoryTotalPrice(loginMember.getMemberNo());

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

		<section class="category-section">
			<div class="category-title">
				<span>CATEGORY SUMMARY</span>
				<h3>카테고리별 월 구독료</h3>
			</div>

			<div class="category-card-wrap">
				<%
				if (categoryTotalMap.size() == 0) {
				%>
				<div class="category-empty">
					아직 카테고리별 구독료가 없습니다.
				</div>
				<%
				} else {
					for (Map.Entry<String, Integer> entry : categoryTotalMap.entrySet()) {
				%>
				<div class="category-card">
					<span><%=entry.getKey()%></span>
					<strong><%=formatter.format(entry.getValue())%>원</strong>
				</div>
				<%
					}
				}
				%>
			</div>
		</section>

		<section class="list-section">
			<div class="list-title">
				<div>
					<span>MY SUBSCRIPTIONS</span>
					<h3>구독 서비스 목록</h3>
				</div>

				<div class="list-control">
					<p>총 <strong><%=subscriptionList.size()%></strong>개의 구독 서비스가 등록되어 있습니다.</p>

					<form action="${pageContext.request.contextPath}/subscriptionList.jsp" method="get" class="sort-form">
						<select name="sort" onchange="this.form.submit()">
							<option value="default" <%=sort.equals("default") ? "selected" : ""%>>기본순</option>
							<option value="priceDesc" <%=sort.equals("priceDesc") ? "selected" : ""%>>월 구독료 높은순</option>
							<option value="priceAsc" <%=sort.equals("priceAsc") ? "selected" : ""%>>월 구독료 낮은순</option>
							<option value="paymentDay" <%=sort.equals("paymentDay") ? "selected" : ""%>>결제일 빠른순</option>
							<option value="recent" <%=sort.equals("recent") ? "selected" : ""%>>최근 등록순</option>
						</select>
					</form>
				</div>
			</div>

			<div class="table-card">
				<table class="subscription-table">
					<thead>
						<tr>
							<th>서비스명</th>
							<th>카테고리</th>
							<th>월 구독료</th>
							<th>결제일</th>
							<th>상태</th>
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
								String status = sub.getStatus();

								if (status == null || status.trim().equals("")) {
									status = "구독중";
								}

								LocalDate today = LocalDate.now();
								int paymentDay = sub.getPaymentDay();

								YearMonth thisMonth = YearMonth.from(today);
								int safePaymentDay = Math.min(paymentDay, thisMonth.lengthOfMonth());
								LocalDate paymentDate = LocalDate.of(today.getYear(), today.getMonth(), safePaymentDay);

								if (paymentDate.isBefore(today)) {
									YearMonth nextMonth = thisMonth.plusMonths(1);
									int nextSafePaymentDay = Math.min(paymentDay, nextMonth.lengthOfMonth());
									paymentDate = LocalDate.of(nextMonth.getYear(), nextMonth.getMonth(), nextSafePaymentDay);
								}

								long dday = ChronoUnit.DAYS.between(today, paymentDate);

								String paymentBadge = "";

								if ("해지".equals(status)) {
									paymentBadge = "해지 완료";
								} else if (dday == 0) {
									paymentBadge = "오늘 결제";
								} else if (dday <= 3) {
									paymentBadge = "결제 임박";
								} else {
									paymentBadge = "D-" + dday;
								}

								String paymentBadgeClass = "";

								if (!"해지".equals(status) && dday <= 3) {
									paymentBadgeClass = "soon";
								}

								String statusClass = "status-" + status.replace(" ", "-");
						%>
						<tr>
							<td class="service-name"><%=sub.getServiceName()%></td>

							<td>
								<span class="category-badge"><%=sub.getCategory()%></span>
							</td>

							<td class="price"><%=formatter.format(sub.getPrice())%>원</td>

							<td>
								매월 <%=sub.getPaymentDay()%>일
								<span class="payment-badge <%=paymentBadgeClass%>">
									<%=paymentBadge%>
								</span>
							</td>

							<td>
								<span class="status-badge <%=statusClass%>">
									<%=status%>
								</span>
							</td>

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