<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel='stylesheet' type="text/css" href="../css/index.css">
<link rel='stylesheet' type="text/css" href="../css/fb_list.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg py-3 sicky-top bgc shadow-lg">
		<div class="container">
			<div class="col col-md-3 text-start">
				<span class="text_margine"><a href="#">나의 냉장고</a></span> <span
					class="text_margine"><a href="#">레시피</a></span> <span
					class="text_margine"><a
					href="${pageContext.request.contextPath }/freeboard/fb-list.do">게시판</a></span>
			</div>
			<div class="col col-md-6 text-center">
				<nav class="navbar-brand">
					<a href="${pageContext.request.contextPath }/index.jsp"><img
						class="logo" src="/miniproject/imgs/logo3.png"></a>
				</nav>
			</div>
			<div class="col col-md-3 text-end">
				<c:if test="${empty sessionScope.loginId }">
					<span class="text_margine"><a
						href="${pageContext.request.contextPath }/member/login.do">로그인</a></span>
					<span class="text_margine"><a
						href="${pageContext.request.contextPath }/member/join.do">회원가입</a></span>
				</c:if>
				<c:if test="${not empty sessionScope.loginId }">
					<a href="${pageContext.request.contextPath }/member/detail.do"><img
						src="/miniproject/imgs/user.png" class="img-circle"></a>
					<span class="text_margine"><a
						href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a></span>
				</c:if>
			</div>
		</div>
	</nav>
	<div class="container text-center">
		<div class="row">
			<div class="col-5 fb_title">
				<h1>게 시 판</h1>
			</div>
			<div class="col-2" style="padding-top: 5px">
				<select class="form-select" aria-label="Default select example">
					<option selected>전체보기</option>
					<option value="1">제목</option>
					<option value="2">작성자</option>
				</select>

			</div>
			<div class="col-4" style="padding-top: 5px">
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="검색어입력"
						aria-label="Recipient's username" aria-describedby="button-addon2">
					<button class="btn btn-outline-secondary" type="button"
						id="button-addon2">검색</button>
				</div>
			</div>
		</div>
	</div>
	<div class="tableBox">
		<table class="table">
			<thead
				style="border-top-width: 3px; border-bottom-width: 3px; border-color:#00A652">
				<tr>
					<th scope="col" style="width: 10%">번호</th>
					<th scope="col" style="width: 50%">제목</th>
					<th scope="col" style="width: 10%">글쓴이</th>
					<th scope="col" style="width: 10%">작성일</th>
					<th scope="col" style="width: 10%">조회</th>
					<th scope="col" style="width: 10%">추천</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="vo" items="${list }">
				<tr>
					<th scope="row">${vo.fb_num}</th>
					<td>${vo.title}</td>
					<td>${vo.id}</td>
					<td>${vo.w_date}</td>
					<td>${vo.cnt}</td>
					<td>${vo.cnt}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
		<button type="button" class="btn btn-outline-secondary"
			style="float: right; margin-right: 160px">
			<a href="${pageContext.request.contextPath }/freeboard/fb_add.do">글작성</a>
		</button>
	</div>
	<br />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>