<%@page import="recipe.RecipeBoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>Document</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet" href="/miniproject/css/navoutline.css">
<link rel="stylesheet" href="/miniproject/css/recipe.css">

<title>Document</title>

</head>

<body>
	<nav class="navbar bgc shadow-lg ">
		<div class="container">
			<div class="col col-md-3 text-start location">
				<button class="navbar-toggler outline" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
					aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
					<span class="material-symbols-outlined"> menu </span>
				</button>
				<h3>나의 냉장고</h3>
			</div>
			<div class="offcanvas offcanvas-start offwidth" tabindex="-1"
				id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
				<div class="offcanvas-header">
					<h5 class="offcanvas-title" id="offcanvasNavbarLabel">메뉴</h5>
					<button type="button" class="btn-close text-reset"
						data-bs-dismiss="offcanvas" aria-label="Close"></button>
				</div>
				<div class="offcanvas-body">
					<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
							href="#" role="button" aria-expanded="false">나의 냉장고</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" onclick='checkId(this,1)'>식품등록</a></li>
								<li><a class="dropdown-item" onclick='checkId(this,1)'>나의 식품 리스트</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
							href="#" role="button" aria-expanded="false">레시피</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="${pageContext.request.contextPath }/recipe/AllData.do">레시피
										목록</a></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath }/managerpick/managerpick.do">냉부 추천 레시피</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
							href="#" role="button" aria-expanded="false">게시판</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="${pageContext.request.contextPath }/freeboard/fb_list.do">자유게시판</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
			<div class="col col-md-6 text-center">
				<nav class="navbar-brand">
					<a href="${pageContext.request.contextPath }/mainindex/mainIndex.do"><img class="logo"
						src="/miniproject/imgs/logo3.png"></a>
				</nav>
			</div>
			<div class="col col-md-3 text_flex">
				<c:if test="${empty sessionScope.loginId }">
					<h3 class="text_margine">
						<a href="${pageContext.request.contextPath}/member/login.do">로그인</a>
					</h3>
					<h3 class="text_margine">
						<a href="${pageContext.request.contextPath}/member/join.do">회원가입</a>
					</h3>
				</c:if>
				<c:if test="${not empty sessionScope.loginId }">

					<div><a href="${pageContext.request.contextPath}/foodlist/mylist.do">
						<span class="dday_simpleview red rounded-circle">${sessionScope.dday[0]}</span>
					</a></div>
					<div><a href="${pageContext.request.contextPath}/foodlist/mylist.do">
						<span class="dday_simpleview yellow rounded-circle">${sessionScope.dday[1]}</span>
					</a></div>
					<div><a href="${pageContext.request.contextPath}/foodlist/mylist.do">
						<span class="dday_simpleview green rounded-circle">${sessionScope.dday[2]}</span>
					</a></div>	
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
	<div style="width: 1000px; margin: 0 auto;">
		<div class="container text-left">
		<div style="margin-top: 60px; margin-bottom: 60px">
			<div class="row">
				<table class="table">
					<thead
						style="border-top-width: 3px; border-bottom-width: 3px; border-color: #00A652;">
						<tr>
							<th>번호</th>
							<th>레시피 이름</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tr>
						<th>${num }</th>
						<th>${RCP_NM }</th>
						<th>${cnt }</th>
					</tr>
					<tr>
						<td colspan="3">재료 : ${RCP_PARTS_DTLS }</td>
					</tr>
					<c:forEach var="vo" items="${list }">
						<tr>
						<td style="width:196px; height:130px;max-width:100%; max-height:100% "><img src="${vo.img }" style="width:100%; height:100%;" ></td>
							<td colspan="2"
								style="text-align: center; vertical-align: middle">${vo.manual }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="btn-toolbar d-md-flex justify-content-md-end " role="toolbar"
				aria-label="Toolbar with button groups">
					<c:if test="${not empty sessionScope.manager}">
						<button type="button" class="btn btn-outline-success " onclick="b()">관리자픽</button>
					</c:if>
					<button type="button" class="btn btn-outline-success " onclick="a()">좋아요</button>
			</div>
			<div class="d-md-flex justify-content-md-end" id ="res" style="text-align: center;"> 추천 : ${likes }</div>
		</div>
</div>
	</div>


	
	

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript"
		src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


	<script type="text/javascript">
// 		function a() {
// 			//비동기 요청 객체 생성
// 			const xhttp = new XMLHttpRequest();

// 			//비동기 요청 응답이 왔을 때 자동 실행될 핸들러 등록
// 			xhttp.onload = function() {

// 			}

// 			xhttp.open("GET","${pageContext.request.contextPath}/recipe/like.do?num=${num}");
// 			xhttp.send();
// 		}

		function a(){
    
   		if(${empty sessionScope.loginId}){
   			Swal.fire({
   		 	   title: '추천 실패!',
   		 	   text: '로그인 후 가능한 서비스입니다.',
   		 	   icon: 'error',
   			   
   		 	   confirmButtonColor: '#1A7742', // confrim 버튼 색깔 지정
   		 	   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
   		 	})
  		 }
  		else{
			const xhttp = new XMLHttpRequest();//
	   
	  		xhttp.onload = function(){
	      		let val = xhttp.responseText;
	      		let html ="추천 :" + val;
	      		document.getElementById("res").innerHTML=html;
	      		console.log("val : " + val);
	   		}
	  		let param = ${num};
		   		
		   		//테스트
		   		xhttp.open("GET", "${pageContext.request.contextPath}/recipe/like.do?num="+param);
		   		xhttp.send();
  		}	
  }
		
		function b() {
			Swal.fire({
			 	   title: '냉부 추천 리스트',
			 	   text: '레시피가 추가되었습니다.',
			 	   icon: 'success',
				   
			 	   confirmButtonColor: '#1A7742', // confrim 버튼 색깔 지정
			 	   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			 	})
			const xhttp = new XMLHttpRequest();
			
			//비동기 요청 응답이 왔을 때 자동 실행될 핸들러 등록
			xhttp.onload = function() {

			}

			xhttp.open("GET","${pageContext.request.contextPath}/recipe/Mp.do?num=${num}");
			xhttp.send();
		}
// 		window.onload=function(){
//			if('${ck}'=="ck"){
//				window.location.reload();
//			}
//		}
		</script>

<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
		
		<script>
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
</body>

</html>
