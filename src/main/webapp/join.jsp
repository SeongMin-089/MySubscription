<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 - MySubscription</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth.css">
</head>
<body>

	<jsp:include page="layout/header.jsp"></jsp:include>

	<main class="page-main">
		<section class="auth-section">
			<div class="auth-card">
				<div class="auth-title">
					<h3>회원가입</h3>
					<p>서비스 이용을 위해 회원 정보를 입력해주세요.</p>
				</div>

				<form action="${pageContext.request.contextPath}/join" method="post" class="auth-form">
					<div class="form-group">
						<label for="userId">아이디</label>
						<input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요" required>
					</div>

					<div class="form-group">
						<label for="password">비밀번호</label>
						<input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
					</div>

					<div class="form-group">
						<label for="name">이름</label>
						<input type="text" id="name" name="name" placeholder="이름을 입력하세요" required>
					</div>

					<div class="form-group">
						<label for="email">이메일</label>
						<input type="email" id="email" name="email" placeholder="이메일을 입력하세요" required>
					</div>

					<div class="auth-actions">
						<button type="submit" class="btn btn-primary">가입하기</button>
						<a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-dark">취소</a>
					</div>

					<p class="auth-link">
						이미 계정이 있으신가요?
						<a href="${pageContext.request.contextPath}/login.jsp">로그인</a>
					</p>
				</form>
			</div>
		</section>
	</main>

	<jsp:include page="layout/footer.jsp"></jsp:include>

</body>
</html>