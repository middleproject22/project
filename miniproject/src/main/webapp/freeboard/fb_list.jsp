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

<script>
	function search() {
	let url = '';
		let selevalue = document.getElementById("selectvalue").value;
		let val = document.getElementById("search-text").value;
	
		switch (selevalue) {
		case "1":
				url="${pageContext.request.contextPath}/freeboard/fb_searchtitle.do?title="+val;
			break;
		default:
				url="${pageContext.request.contextPath}/freeboard/fb_searchid.do?id="+val;
			break;
		
		}
			window.location.href= url;
	}
</script>

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
							<li><a class="dropdown-item" href="#scrollspyHeading3">레시피
									목록</a></li>
							<li><a class="dropdown-item" href="#scrollspyHeading4">관리자
									픽 레시피</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
						href="#" role="button" aria-expanded="false">게시판</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath }/freeboard/fb_list.do">자유게시판</a></li>
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
	<div class="container text-center">
		<div class="row">
			<div class="col-5 fb_title">
				<h1>게 시 판</h1>
			</div>
			<div class="col-2" style="padding-top: 5px">
				<select class="form-select" aria-label="Default select example"
					id="selectvalue">

					<option selected value="0">선택하기</option>
					<option value="1">제목</option>
					<option value="2">작성자</option>
				</select>

			</div>
			<div class="col-4" style="padding-top: 5px">
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="검색어입력"
						aria-label="Recipient's username" aria-describedby="button-addon2"
						id="search-text">
					<button class="btn btn-outline-secondary" type="button"
						id="button-addon2" onclick="search()">검색</button>
				</div>
			</div>
			<div class="col-1" style="padding-top: 5px">
				<button type="button" class="btn btn-outline-secondary"
					style="float: right;">
					<a href="${pageContext.request.contextPath }/freeboard/fb_add.do">글작성</a>
				</button>
			</div>
		</div>
	</div>
	<div class="tableBox">
		<table class="table">
			<thead
				style="border-top-width: 3px; border-bottom-width: 3px; border-color: #00A652">
				<tr>
					<th scope="col" style="width: 10%">번호</th>
					<th scope="col" style="width: 50%">제목</th>
					<th scope="col" style="width: 10%">작성자</th>
					<th scope="col" style="width: 10%">작성일</th>
					<th scope="col" style="width: 10%">조회</th>
					<th scope="col" style="width: 10%">추천</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${list }">
					<tr>
						<th scope="row">${vo.fb_num}</th>
						<td><a
							href="${pageContext.request.contextPath }/freeboard/fb_detail.do?fb_num=${vo.fb_num}">${vo.title}</a></td>
						<td>${vo.id}</td>
						<td>${vo.w_date}</td>
						<td>${vo.cnt}</td>
						<td>${vo.cnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<br />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>