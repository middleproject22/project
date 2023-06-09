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
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
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

<style>
 body{ 
 	height:1000px; 
 } 

</style>
</head>

<body>

	<nav class="navbar navbar-expand-lg bgc ">
		<div class="container">
			<div class="col col-md-3 text-start">
				<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
						href="#" role="button" aria-expanded="false">나의 냉장고</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item needlogin"
								onclick='checkId(this,1)'
								>식품등록</a></li>
							<li><a class="dropdown-item needlogin"
								onclick='checkId(this,2)'
								>나의
									식품 리스트</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
						href="#" role="button" aria-expanded="false">레시피</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath }/recipe/AllData.do">레시피
									목록</a></li>
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath }/managerpick/managerpick.do">냉부
									추천 레시피</a></li>
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
					<a
						href="${pageContext.request.contextPath }/mainindex/mainIndex.do"><img
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

					<div>
						<a href="${pageContext.request.contextPath}/foodlist/mylist.do">
							<span class="dday_simpleview red rounded-circle">${sessionScope.dday[0]}</span>
						</a>
					</div>
					<div>
						<a href="${pageContext.request.contextPath}/foodlist/mylist.do">
							<span class="dday_simpleview yellow rounded-circle">${sessionScope.dday[1]}</span>
						</a>
					</div>
					<div>
						<a href="${pageContext.request.contextPath}/foodlist/mylist.do">
							<span class="dday_simpleview green rounded-circle">${sessionScope.dday[2]}</span>
						</a>
					</div>
					<div class="dropdown myAcc">
						<button class="btn btn-secondary dropdown-toggle myAcc"
							type="button" data-bs-toggle="dropdown" aria-expanded="false">
							<img src="${sessionScope.img}" class="rounded-circle userimg">
						</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/member/detail.do"><span
									class="material-symbols-outlined key"> lock </span> 내 정보</a></li>
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath }/member/logout.do"><span
									class="material-symbols-outlined logout"> logout </span> 로그아웃</a></li>
						</ul>
					</div>
				</c:if>
			</div>
		</div>
	</nav>
	<div class="main">
		<div class="row ">
			<div class="col col-md-8 m-auto">
				<div class="recommandlist"
					style="display: flex; justify-content: space-evenly; height: 291px;">
					<c:forEach var="mlist" items="${mlist }">
						<div class="userpick">
							<a href="${pageContext.request.contextPath}/recipe/byName.do?rcpnm=${mlist.name}&num=${mlist.seqnum}"><img
								src="${mlist.imgpath }"></a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="row justify-content-md-center">
			<div class="col col-md-4 m-2">
				<h3 style="margin-bottom: 18px">자유게시판</h3>
				<table
					style="text-align: center; border-bottom: black solid 2px; width: 100%; margin-top:10px; ">
					<tr style="border-bottom: black solid 2px">
						<th>제목</th>
						<th>조회수</th>
						<th>추천수</th>
					</tr>
					<c:if test="${not empty flist }">
						<c:forEach var="flist" items="${ flist}">
							<tr style="border-bottom: 1px solid #9e9e9e;">
								<td><a
									href="${pageContext.request.contextPath}/freeboard/fb_detail.do?fb_num=${flist.fb_num}">${flist.title}</a></td>
								<td>${flist.cnt}</td>
								<td>${flist.likes}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>

			</div>
			<div class="col col-md-4 m-2"">
				<h3 style="margin-bottom: 18px">인기레시피</h3>
				<table
					style="text-align: center; border-bottom: black solid 2px; width: 100%;">
					<tr style="border-bottom: black solid 2px">
						<th>레시피 이름</th>
						<th>조회수</th>
						<th>추천수</th>
					</tr>
					<c:if test="${not empty rlist }">
						<c:forEach var="rlist" items="${ rlist}">
							<tr style="border-bottom: 1px solid #9e9e9e;">
								<td><a
									href="${pageContext.request.contextPath }/recipe/byName.do?rcpnm=${rlist.name }&num=${rlist.seq_num}">${rlist.name}</a></td>
								<td>${rlist.cnt}</td>
								<td>${rlist.likes}</td>
							</tr>
						</c:forEach>
					</c:if>
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
		$('.recommandlist').slick({
			dots : true,
			infinite : true,
			speed : 300,
			slidesToShow : 1,
			centerMode : true,
			variableWidth : true
		});

		function checkId(el,num) {

			<c:if test="${empty sessionScope.loginId}">
			Swal.fire({
			 	   title:'로그인 실패!',
			 	   text: '로그인이 필요한 서비스 입니다.',
			 	   icon: 'error',
				   
			 	   confirmButtonColor: '#1A7742', // confrim 버튼 색깔 지정
			 	   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			 	}).then(function() {
					location.href = "${pageContext.request.contextPath}/member/login.jsp";
				})
			</c:if>
			<c:if test="${not empty sessionScope.loginId}">
			if(num == 1 ){
				el.href ="${pageContext.request.contextPath }/foodmanage/list.do"
			}else if(num == 2){
				el.href ="${pageContext.request.contextPath}/foodlist/mylist.do"
			}	
			</c:if>
		}
	</script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</body>


</html>