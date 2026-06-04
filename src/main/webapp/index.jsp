<%@ page import="com.subscription.dto.MemberDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MySubscription</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
</head>
<body>

<jsp:include page="layout/header.jsp"></jsp:include>

<main class="page-main">
    <section class="home-hero">
        <div class="hero-content">
            <span class="hero-badge">SUBSCRIPTION MANAGER</span>

            <h2>
                나의 구독 서비스를<br>
                한눈에 관리하세요
            </h2>

            <p>
                MySubscription은 사용자가 이용 중인 구독 서비스를 등록, 수정, 삭제하고
                월 구독료를 계산할 수 있는 구독 관리 웹 서비스입니다.
            </p>

            <div class="btn-wrap">
                <%
                if (loginMember == null) {
                %>
                    <a href="${pageContext.request.contextPath}/join.jsp" class="btn btn-primary">회원가입</a>
                    <a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-dark">로그인</a>
                <%
                } else {
                %>
                    <a href="${pageContext.request.contextPath}/subscriptionAdd.jsp" class="btn btn-primary">구독 등록</a>
                    <a href="${pageContext.request.contextPath}/subscriptionList.jsp" class="btn btn-dark">구독 목록</a>
                <%
                }
                %>
            </div>
        </div>

        <div class="hero-preview">
            <div class="preview-top">
                <span>이번 달 예상 구독료</span>
                <strong>49,900원</strong>
            </div>

            <div class="preview-item">
                <span>Netflix</span>
                <strong>17,000원</strong>
            </div>

            <div class="preview-item">
                <span>YouTube Premium</span>
                <strong>14,900원</strong>
            </div>

            <div class="preview-item">
                <span>Music Service</span>
                <strong>18,000원</strong>
            </div>
        </div>
    </section>

    <section class="home-info-section">
        <div class="section-title">
            <span>WHY MYSUBSCRIPTION</span>
            <h3>구독 생활을 더 단순하게 관리하세요</h3>
            <p>여러 서비스에 흩어진 구독 정보를 한 곳에 모아 월 지출을 쉽게 확인할 수 있습니다.</p>
        </div>

        <div class="info-card-wrap">
            <div class="info-card">
                <div class="info-icon">➕</div>
                <h4>한 번에 기록하기</h4>
                <p>
                    OTT, 음악, 클라우드 등 이용 중인 구독 서비스를 간단하게 등록할 수 있습니다.
                </p>
            </div>

            <div class="info-card main">
                <div class="info-icon">💲</div>
                <h4>지출 흐름 확인하기</h4>
                <p>
                    매달 나가는 구독료 합계를 확인해 불필요한 지출을 줄일 수 있습니다.
                </p>
            </div>

            <div class="info-card">
                <div class="info-icon">✔️</div>
                <h4>필요할 때 정리하기</h4>
                <p>
                    변경된 구독 정보는 수정하고, 더 이상 사용하지 않는 서비스는 삭제할 수 있습니다.
                </p>
            </div>
        </div>
    </section>
</main>

<jsp:include page="layout/footer.jsp"></jsp:include>

</body>
</html>