
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link rel="stylesheet" href="/miniproject/css/index.css">
<link rel="stylesheet" href="/miniproject/css/fb_list.css">
<title>Document</title>

</head>

<body>
	<nav class="navbar navbar-expand-lg py-3 sicky-top bgc shadow-lg">
		<div class="container">
			<div class="col col-md-3 text-start">
				<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
					<li class="nav-item dropdown">
						<h5>
							<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
								href="#" role="button" aria-expanded="false">나의 냉장고</a>
						</h5>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#scrollspyHeading3">식품등록</a></li>
							<li><a class="dropdown-item" href="#scrollspyHeading4">식품
									전체 리스트</a></li>
							<li><a class="dropdown-item" href="#scrollspyHeading5">냉장고를
									부탁해</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown">
						<h5>
							<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
								href="#" role="button" aria-expanded="false">리시피</a>
						</h5>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#scrollspyHeading3">레시피
									목록</a></li>
							<li><a class="dropdown-item" href="#scrollspyHeading4">관리자
									픽 레시피</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown">
						<h5>
							<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
								href="" role="button" aria-expanded="false">게시판</a>
						</h5>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#scrollspyHeading3">자유게시판</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="col col-md-6 text-center">
				<nav class="navbar-brand">
					<a href="${pageContext.request.contextPath }/freeboard/fb_list.do"><img
						class="logo" src="/miniproject/imgs/logo3.png"></a>
				</nav>
			</div>
			<div class="col col-md-3 text-end text_flex">
				<c:if test="${empty sessionScope.loginId }">
					<h5>
						<span class="text_margine"><a
							href="${pageContext.request.contextPath }/member/login.do">로그인</a></span>
					</h5>
					<h5>
						<span class="text_margine"><a
							href="${pageContext.request.contextPath }/member/join.do">회원가입</a></span>
					</h5>
				</c:if>
				<c:if test="${not empty sessionScope.loginId }">
					<a href="${pageContext.request.contextPath }/member/detail.do"><img
						src="/miniproject/imgs/user.png" class="img-circle"></a>
					<h5>
						<span class="text_margine"><a
							href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a></span>
					</h5>
				</c:if>
			</div>
		</div>
	</nav>
	<div class="container text-center">
		<div class="row">
			<div class="col-4 fb_title">
				<h1>글 작 성</h1>
			</div>
		</div>
		<form action="${pageContext.request.contextPath }/freeboard/fb_add.do"
			method="post">
			<input type="hidden" name="id" value="${sessionScope.loginId }">
			<div class="input-group mb-3">
				<input type="text" name="title" class="form-control"
					placeholder="제목을 입력해 주세요." aria-label="Recipient's username"
					aria-describedby="button-addon2">
			</div>
			<div class="input-group mb-3"
				style="height: 500px; overflow-y: auto;">
				<input type="textarea" name="content" class="form-control"
					placeholder="글 내용을 입력해 주세요." aria-label="Recipient's username"
					aria-describedby="button-addon2"
					style="word-wrap: break-word; overflow-wrap: break-word;">
			</div>
			<input type="submit" value="저장">
		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>