<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 - MySubscription</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<jsp:include page="layout/header.jsp"></jsp:include>

<main>
    <div class="main-box">
        <h2>로그인</h2>

        <form action="${pageContext.request.contextPath}/login" method="post" class="form-box">
            <div class="form-group">
                <label for="userId">아이디</label>
                <input type="text" id="userId" name="userId" required>
            </div>

            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" required>
            </div>

            <div class="btn-wrap">
                <button type="submit" class="btn">로그인</button>
                <a href="${pageContext.request.contextPath}/join.jsp" class="btn sub">회원가입</a>
            </div>
        </form>
    </div>
</main>

<jsp:include page="layout/footer.jsp"></jsp:include>

</body>
</html>