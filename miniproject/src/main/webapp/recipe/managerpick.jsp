<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet" href="/miniproject/css/navoutline.css">
<link rel="stylesheet" href="/miniproject/css/managerpick.css">
</head>

<body>

	<div class="modal fade" id="test" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog height modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">관리자픽 레시피
						등록</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
					<form action="${pageContext.request.contextPath }/managerpick/managerpick.do" id="add" method="post" enctype="multipart/form-data">
				<div class="modal-body">
						<select class="name_area" name="name">
						<c:forEach var="picklist" items="${picklist }" varStatus="status">
						<option value='${picklist.name }'> ${picklist.name}</option>
						</c:forEach>
						</select>
						<div class="filebox">
							<input type="file" class="file" name="file" id="file" onchange="imageView(this)">
							<label for="file">사진등록</label>
						</div> 
						<div style="justify-content:center; display: flex"><img id="tempImage" src=""></div>	
				</div>
					</form>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="a()">등록</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
					</div>
			</div>
		</div>
	</div>
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
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath }/foodmanage/list.do">식품등록</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/foodlist/mylist.do">식품
										전체 리스트</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
							href="#" role="button" aria-expanded="false">리시피</a>
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
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath }/freeboard/fb_list.do">자유게시판</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
			<div class="col col-md-6 text-center">
				<nav class="navbar-brand">
					<a
						href="${pageContext.request.contextPath }/mainindex/mainIndex.do"><img
						class="logo" src="/miniproject/imgs/logo3.png"></a>
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

					<div>
						<span class="dday_simpleview red rounded-circle">${sessionScope.dday[0]}</span>
					</div>
					<div>
						<span class="dday_simpleview yellow rounded-circle">${sessionScope.dday[1]}</span>
					</div>
					<div>
						<span class="dday_simpleview green rounded-circle">${sessionScope.dday[2]}</span>
					</div>
					<div class="dropdown myAcc">
						<button class="btn btn-secondary dropdown-toggle myAcc"
							type="button" data-bs-toggle="dropdown" aria-expanded="false">
							<img src="${sessionScope.img}" class="rounded-circle userimg">
						</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/detail.do">
							<span class="material-symbols-outlined key"> lock </span> 내 정보</a></li>
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath }/member/logout.do"><span
									class="material-symbols-outlined logout"> logout </span> 로그아웃</a></li>
						</ul>
					</div>
				</c:if>
			</div>
		</div>
	</nav>
	<main>
		
		<div class= row>
			<div class="card_area">
			<c:if test="${not empty plist}">
			<c:forEach var="plist" items="${plist}">
				<div class="card" style="width: 18rem;">
  					<img src="${plist.imgpath }" class="card-img-top" alt="...">
 				 	<div class="card-body">
    				<h5 class="card-title">${plist.name}</h5>
    				</div>
    			</div>
			</c:forEach>
			</c:if>
			</div>
		</div>

	</main>
	<div class= "btn_container">
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#test">등록</button>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
		<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	
		let f = document.getElementById("add");
		function a() {
			f.submit();
		}
		
		function imageView(input) {
		       if (input.files && input.files[0]) {
		           var reader = new FileReader();

		           reader.onload = function(e) {
		               $('#tempImage').attr('src', e.target.result)
		                .width(288)
		                .height(162);
		           
		           }

		           reader.readAsDataURL(input.files[0]);
		       }
		   }
		
	</script>

</body>

</html>