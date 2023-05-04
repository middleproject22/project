<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet" href="/miniproject/css/navoutline.css">
<link rel="stylesheet" href="/miniproject/css/foodmanage_detail.css">
<title>Document</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script type="text/javascript">

	function expiredateselect(el){

		let selectdate = new Date(el.value);
		let sysdate = new Date();
	
			
		if( selectdate < sysdate ){
			Swal.fire({
			 	   title: '날짜 선택 실패!',
			 	   text: '유효하지 않은 날짜입니다.',
			 	   icon: 'error',
				   
			 	   confirmButtonColor: '#1A7742', // confrim 버튼 색깔 지정
			 	   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			 	})
			
			el.valueAsDate = new Date();
		}
		
	}
	
	function alram(){
		let check = document.getElementById("text_ing");
		let obj = '';
		let chknum =0
		let btntype = document.getElementById("addbtn")
		if(check==null){
			Swal.fire({
			 	   title: '등록할 수 없습니다.',
			 	   text: '식재료를 선택해주세요',
			 	   icon: 'error',
				   
			 	   confirmButtonColor: '#1A7742', // confrim 버튼 색깔 지정
			 	   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			 	})
		
				document.getElementById("add").action="${pageContext.request.contextPath }/foodmanage/list.do";	
				document.getElementById("add").method="GET";	
			 			
						
						
						
				}		
							
				else{		
			 				
			 		let selectdate = document.getElementsByClassName("expiredate");
					alert(selectdate.length);
					alert(selectdate.value);
					alert(chknum);
							
					for(i=0;i<selectdate.length;i++){
						alert(selectdate[i].value)
					if(selectdate[i].value != null){
									chknum++
								}
					}
 					alert(chknum)
 					if(chknum==selectdate.length){
						btntype.type = "submit";
					}
					
					else{
						alert("날짜를 입력하세요")
						
					}
					window.location.href="${pageContext.request.contextPath }/foodmanage/detail.do"	
					}

			 	}
	

</script>
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
								<li><a class="dropdown-item" href="${pageContext.request.contextPath }/foodmanage/list.do">식품등록</a></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/foodlist/mylist.do">식품
										전체 리스트</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
							href="#" role="button" aria-expanded="false">레시피</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="${pageContext.request.contextPath }/recipe/AllData.do">레시피
										목록</a></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath }/managerpick/managerpick.do">관리자
										픽 레시피</a></li>
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
	
	

<div class="contentsize">
	
		<div class="p-8"></div>

	<div class="container text-center">
	<div class="name">
		
<div class="empty_div">
</div>
		<div class="row">

			<div class="col">
				<h4>이름</h4>
			</div>
			<div class="col-2">
				<h4>유통기한</h4>
			</div>
			<div class="col">
				<h4>메모</h4>
			</div>
			<div class="col">
				<h4>삭제</h4>
			</div>
		</div>
	</div>
	</div>
	
	<hr class="line">




	<form id="add" action= "${pageContext.request.contextPath}/foodmanage/add.do" method="post">
		<div class="container text-center ">
	<c:forEach var="vo" items="${list }">
		<div class ="row justify-content-md-center margin">
			<div class="col">
				<h6><input type="text" id="text_ing" name="ing" class="form-control" value="${vo.ingredient}"></h6>
			</div>
			<div class="col-2">
				<h6><input type="date" id="datecheck" name="expiredate" class="expiredate form-control" onchange="expiredateselect(this)"></h6>
			</div>
			 <div class="col">
                 <h6><input type="text" id="memo" name="content" class="content_memo form-control" autocomplete="off"></h6>
             </div>
			<div class="col">
			<button type="button" id="delete" class="btn btn-outline-danger" onclick='location.href="${pageContext.request.contextPath}/foodmanage/delete.do?num=${vo.temp_num}"'>삭제</button>
			</div>
			</div>	
			<hr class="line">
	</c:forEach>
		</div>
	
	<div id="align_btn" class="submitbtn">
        <div class="form-floating mb-3">
		  		<input type="button" id="addbtn" class="btn btn-success" value="등록" onclick='alram()'>
        </div>
	</div>
</form>
</div>


<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>
