<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 - MySubscription</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth.css">
</head>
<body>

	<jsp:include page="layout/header.jsp"></jsp:include>

	<main class="page-main">
		<section class="auth-section">
			<div class="auth-card">
				<div class="auth-title">
					<h3>로그인</h3>
					<p>아이디와 비밀번호를 입력해 로그인해주세요.</p>
				</div>

				<form action="${pageContext.request.contextPath}/login" method="post" class="auth-form">
					<div class="form-group">
						<label for="userId">아이디</label>
						<input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요" required>
					</div>

					<div class="form-group">
						<label for="password">비밀번호</label>
						<input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
					</div>

					<div class="auth-actions">
						<button type="submit" class="btn btn-primary">로그인</button>
						<a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-dark">취소</a>
					</div>

					<p class="auth-link">
						아직 계정이 없으신가요?
						<a href="${pageContext.request.contextPath}/join.jsp">회원가입</a>
					</p>
				</form>
			</div>
		</section>
	</main>

	<jsp:include page="layout/footer.jsp"></jsp:include>

</body>
</html>