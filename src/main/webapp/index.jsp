<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MySubscription</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<jsp:include page="layout/header.jsp"></jsp:include>

<main>
    <div class="main-box">
        <h2>나의 구독 서비스를 한눈에 관리하세요</h2>
        <p>
            MySubscription은 사용자가 이용 중인 구독 서비스를 등록하고,
            월 구독료를 계산하며, 구독 정보를 수정하거나 삭제할 수 있는
            구독 관리 웹 서비스입니다.
        </p>

        <div class="btn-wrap">
            <a href="${pageContext.request.contextPath}/join.jsp" class="btn">회원가입</a>
            <a href="${pageContext.request.contextPath}/login.jsp" class="btn sub">로그인</a>
        </div>
    </div>
</main>

<jsp:include page="layout/footer.jsp"></jsp:include>

</body>
</html>