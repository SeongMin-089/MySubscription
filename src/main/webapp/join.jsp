<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 - MySubscription</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<jsp:include page="layout/header.jsp"></jsp:include>

<main>
    <div class="main-box">
        <h2>회원가입</h2>

        <form action="${pageContext.request.contextPath}/join" method="post" class="form-box">
            <div class="form-group">
                <label for="userId">아이디</label>
                <input type="text" id="userId" name="userId" required>
            </div>

            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" required>
            </div>

            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="btn-wrap">
                <button type="submit" class="btn">가입하기</button>
                <a href="${pageContext.request.contextPath}/index.jsp" class="btn sub">취소</a>
            </div>
        </form>
    </div>
</main>

<jsp:include page="layout/footer.jsp"></jsp:include>

</body>
</html>