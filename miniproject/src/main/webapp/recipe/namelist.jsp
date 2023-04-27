
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
<title>Document</title>

</head>

<body>
	<nav class="navbar navbar-expand-lg py-3 bgc shadow-lg">
		<div class="container">
			<div class="col col-md-3 text-start">
				<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
						href="#" role="button" aria-expanded="false">나의 냉장고</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#scrollspyHeading3">식품등록</a></li>
							<li><a class="dropdown-item" href="#scrollspyHeading4">식품
									전체 리스트</a></li>
							<li><a class="dropdown-item" href="#scrollspyHeading5">냉장고를
									부탁해</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
						href="#" role="button" aria-expanded="false">레시피</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath }/recipe/AllData.do">레시피
									목록</a></li>
							<li><a class="dropdown-item" href="#scrollspyHeading4">관리자
									픽 레시피</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
						href="#" role="button" aria-expanded="false">게시판</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#scrollspyHeading3">자유게시판</a></li>
						</ul></li>
				</ul>
			</div>
			<div class="col col-md-6 text-center">
				<nav class="navbar-brand">
					<a href="${pageContext.request.contextPath }/index.jsp"><img
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
						src="${sessionScope.img}" class="rounded-circle userimg"></a>
					<h5>
						<span class="text_margine"><a
							href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a></span>
					</h5>
				</c:if>
			</div>
		</div>
	</nav>
	<div class="main">
		<div class="row ">
			<div class="col col-md-8 ">
				<table border="1">
					<tr>
						<td colspan="3"><input type="button" value="제목" onclick="a()">
							<input type="button" value="재료" onclick="b()"></td>
					</tr>
					<tr>
						<td colspan="3">
							<form id="f1"
								action="${pageContext.request.contextPath }/recipe/getName.do"
								method="post">
								<input type="text" name="rcp"> <input type="submit"
									value="검색">
							</form>
					<tr>
						<td>번호</td>
						<td>레시피 제목</td>
						<td>조회수</td>
						<td>추천수</td>
					</tr>
					<c:forEach var="vo" items="${list }">
						<tr>
							<td>${vo.seq_num}</td>
							<td><a
								href="${pageContext.request.contextPath }/recipe/byName.do?rcpnm=${vo.name}&num=${vo.seq_num}">${vo.name  }</a></td>
							<td>${vo.cnt}</td>
							<td>${vo.likes}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>

	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript"
		src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


	<script>
		$(document).ready(function() {
			$('.recommandlist').slick({
				slidesToShow : 3,
				slidesToScroll : 1,
				autoplay : true,
				autoplaySpeed : 2000,
			});
		})
		let f = document.getElementById("f1");
		function a() {
			f.action = "${pageContext.request.contextPath }/recipe/getName.do";

		}
		function b() {
			f.action = "${pageContext.request.contextPath }/recipe/getMat.do";

		}
	</script>

</body>


</html>
</html>