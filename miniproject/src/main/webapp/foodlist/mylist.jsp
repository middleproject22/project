<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 식품 리스트</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
	<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link href="/miniproject/css/(FoodList)mylist.css" rel="stylesheet">
<link rel="stylesheet" href="/miniproject/css/navoutline.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

//체크박스 개수 제한
$(document).ready(function(){
	$("input[type='checkbox']").on("click",function(){
		let count = $("input:checked[type='checkbox']").length;
		
		
		if(count>3){
			$(this).prop("checked",false);
			Swal.fire({
			 	   title: '선택 불가!',
			 	   text: '3개까지만 선택이 가능합니다.',
			 	   icon: 'error',
				   
			 	   confirmButtonColor: '#1A7742', // confrim 버튼 색깔 지정
			 	   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			 	})
		}
	});
// 	$("input:checkbox[name=${vo.ingredient }]").length(function(){
// 		alert(length);
// 	}) 

});





function check(){
let list = document.getElementsByClassName("inglist");
console.log(list);
let tf = false;
for(obj of list){
	if(obj.checked == true){
		tf = true;
		break;
	}
}
	if(!tf){
		Swal.fire({
	 	   title: '재료 검색 실패!',
	 	   text: '선택된 재료가 없습니다.',
	 	   icon: 'error',
		   
	 	   confirmButtonColor: '#1A7742', // confrim 버튼 색깔 지정
	 	   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
	 	})

	}else{
		document.getElementById("submitbtn").type = "submit"
	}
	
}



</script>
</head>

<body>
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
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/foodlist/mylist.do">나의 식품 리스트</a></li>
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

	
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>

<div class="contentsize">
	<div class="row">
		<div class="col ref">
			${sessionScope.loginId} 님의 냉장고 (${countall}개)
			
		</div>
	</div>

		<div class="p-8"></div>

	<div class="container text-center">
	<div class="name">
		<div class="row">
		
			<div class="col">
				레시피
			</div>

			<div class="col-2 categorysel">
				<select name="categories" onchange="window.open(value,'_self');">
					<option>카테고리</option>
					<option
						value="${pageContext.request.contextPath}/foodlist/category.do?cat_lnum=1">육류,어패류,
						달걀, 콩류</option>
					<option
						value="${pageContext.request.contextPath}/foodlist/category.do?cat_lnum=3">과일류</option>
					<option
						value="${pageContext.request.contextPath}/foodlist/category.do?cat_lnum=4">유제품류</option>
					<option
						value="${pageContext.request.contextPath}/foodlist/category.do?cat_lnum=2">곡류</option>
					<option
						value="${pageContext.request.contextPath}/foodlist/category.do?cat_lnum=5">채소류</option>
					<option
						value="${pageContext.request.contextPath}/foodlist/mylist.do">전체보기</option>

				</select>
			</div>
			<div class="col">
				이름
			</div>
			<div class="col-2">
				유통기한
			</div>
			<div class="col">
				남은 날
			</div>
			<div class="col">
				남은 양
			</div>
			<div class="col-3">
				영양소(100g)
			</div>
			<div class="col">
				삭제
			</div>
		</div>
	</div>
	</div>
	<hr class="line">

	<div class="emptyalert">
	<c:if test="${empty list }" >
	냉장고가 비었습니다. 식품을 추가해주세요.
	</c:if>
	</div>

	<!--  for 문으로 리스트 돌리기 -->
	<form method="post" action="${pageContext.request.contextPath }/recipe/getMat.do">
	<c:forEach var="vo" items="${list }" varStatus="status">
	
		<div class="container">
			<c:if test="${vo.dday<0}">
				<div class="row ddayarea0 text-center" style="background-color: gainsboro">
			</c:if>
			<c:if test="${0<=vo.dday&& vo.dday<3}">
				<div class="row ddayarea3 text-center" >
			</c:if>
			<c:if test="${3<=vo.dday&& vo.dday<7}">
				<div class="row ddayarea7 text-center" >
			</c:if>
			<c:if test="${7<=vo.dday}">
				<div class="row ddayareaAll text-center" >
			</c:if>
			
<!-- 			레시피 체크박스 선택 -->
			<div class="col">
		<c:if test="${vo.dday<0}">
		<input class="form-check-input" type="checkbox" value="${vo.ingredient }"  disabled>
		</c:if>
		<c:if test="${vo.dday>=0}">
        <input class="form-check-input inglist" type="checkbox" value="${vo.ingredient }" name="inglist">
     	</c:if>
     	   </div>
			<!--  카테고리 보여줌 -->
			<div class="col-2">
				<c:if test="${vo.cat_lnum == 1}">
						육류,어패류, 달걀, 콩류
					</c:if>
				<c:if test="${vo.cat_lnum ==2}">
						곡류
					</c:if>
				<c:if test="${vo.cat_lnum ==3}">
						과일류
					</c:if>
				<c:if test="${vo.cat_lnum ==4}">
						유제품류
					</c:if>
				<c:if test="${vo.cat_lnum ==5}">
						채소류
					</c:if>
			</div>
			<div class="col">

				<h6>${vo.ingredient }</h6>
				<c:if test="${not empty vo.memo  }">
				<div class="col memocss" >
					${vo.memo }</div>
				</c:if>
			</div>
			<div class="col-2">
				<h6>${vo.expiredate }</h6>
			</div>
			<!-- 남은 날짜 (remain) -->
			<div class="col" id="">
				<h6>${vo.dday }</h6>
			</div>
			<div class="col flistsel">
				<!--       vo.amount 일때 기본값으로 보여줌. 근데 바꾸면 저장되도록. 근데 db값이 디폴트되도록 -->

			<c:if test="${vo.dday<0 }">
				<select class="disabledclass" onchange="window.open(value,'_self');" disabled>
					<option selected>${vo.amount}%</option>
				</select>
			</c:if>
			<c:if test="${0<=vo.dday}">
				<select class="abledclass" name="selamount" onchange="window.open(value,'_self');">
				
					<option selected>--${vo.amount}%--</option>
					<option value="${pageContext.request.contextPath}/foodlist/delete.do?num=${vo.fm_num }">0%</option>
					<option	value="${pageContext.request.contextPath}/foodlist/updateamount.do?amount=25&num=${vo.fm_num }">25%</option>
					<option	value="${pageContext.request.contextPath}/foodlist/updateamount.do?amount=50&num=${vo.fm_num }">50%</option>
					<option	value="${pageContext.request.contextPath}/foodlist/updateamount.do?amount=75&num=${vo.fm_num }">75%</option>
					<option	value="${pageContext.request.contextPath}/foodlist/updateamount.do?amount=100&num=${vo.fm_num }">100%</option>

				</select>
		</c:if>
			</div>
			<div class="col-3 nutrient">

				<!-- 영양소 불러오기. MyList에서 listIng 받아옴. varstatus -->
				<table style="font-size: 15px;"  class="table table-sm">
					<tr>
						<td>칼로리 :${listIng[status.index].ig_kcal }</td>
						<td>단백질 :${listIng[status.index].ig_pt }</td>
					</tr>
					<tr>
						<td>지방 :${listIng[status.index].ig_fat }</td>
						<td>탄수화물 :${listIng[status.index].ig_car }</td>
					</tr>
					<tr>
						<td>당 :${listIng[status.index].ig_sug }</td>
						<td>나트륨 :${listIng[status.index].ig_nat }</td>
					</tr>
				</table>
			</div>
			<div class="col">
			<button type="button" class="btn btn-outline-danger" onclick="location.href='${pageContext.request.contextPath}/foodlist/delete.do?num=${vo.fm_num }'">삭제</button>
			</div>
		</div>
		</div>	
	</c:forEach>
	<div class="submitbtn">
	<button type="button" class="btn btn-success" onclick='location.href="${pageContext.request.contextPath }/foodmanage/list.do"'>식품
				추가하기</button>
	<button type="button" class="btn btn-success" id="submitbtn" onclick="check()">레시피 검색하기</button>
        </div>
        </form>
        
</div>
</body>

</html>
