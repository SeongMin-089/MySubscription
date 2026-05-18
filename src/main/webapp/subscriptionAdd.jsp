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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<jsp:include page="layout/header.jsp"></jsp:include>

<main>
    <div class="main-box">
        <h2>구독 서비스 등록</h2>

        <form action="${pageContext.request.contextPath}/subscriptionAdd" method="post" class="form-box">
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

            <div class="form-group">
                <label for="price">월 구독료</label>
                <input type="number" id="price" name="price" placeholder="예: 14900" required>
            </div>

            <div class="form-group">
                <label for="paymentDay">결제일</label>
                <input type="number" id="paymentDay" name="paymentDay" min="1" max="31" placeholder="1~31" required>
            </div>

            <div class="form-group">
                <label for="memo">메모</label>
                <textarea id="memo" name="memo" rows="4" placeholder="메모를 입력하세요"></textarea>
            </div>

            <div class="btn-wrap">
                <button type="submit" class="btn">등록하기</button>
                <a href="${pageContext.request.contextPath}/mypage.jsp" class="btn sub">취소</a>
            </div>
        </form>
    </div>
</main>

<jsp:include page="layout/footer.jsp"></jsp:include>

</body>
</html>