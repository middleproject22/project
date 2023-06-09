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
	<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link rel="stylesheet" href="/miniproject/css/navoutline.css">
<link rel="stylesheet" href="/miniproject/css/foodmanage_list.css">



<script type="text/javascript">
	let param =""; 
window.onload= function (){
	a("iii");		
	select();		
}		

function a(el){		
		param = el;
	}

function select() {	
	const xhttp = new XMLHttpRequest();
				

	
				
	xhttp.onload= function(){
		let val = xhttp.responseText;
		let arr = JSON.parse(val);
		let html = '';
		for(let obj of arr){
			  html += "<span id='spanid' class='aa' id='"+obj.ig_name +"'" ;
			  html += " onclick=\"sele('"+obj.ig_name+"'); showcnt();\">";
			  html += "<img class='imgingredient' src='../ingredientimg/"+obj.ig_path+"'>";
			  html += obj.ig_name ;
			  html += "</span>";
			}										
		let igname = document.getElementById("igname");
		igname.innerHTML = html ;	
	}				
		xhttp.open("GET","${pageContext.request.contextPath}/foodmanage/select.do?name="+param);
		xhttp.send();	
}			
			
function searing() {	
				
	const xhttp = new XMLHttpRequest();
				
	xhttp.onload= function(){
		let val = xhttp.responseText;
		let arr = JSON.parse(val);
		let html = '';
		for(let obj of arr){
			 html += "<span id='spanid' class='aa' id='"+obj.ig_name +"'" ;
			  html += " onclick=\"sele('"+obj.ig_name+"'); showcnt();\">";
			  html += "<img class='imgingredient' src='../ingredientimg/"+obj.ig_path+"'>";
			  html += obj.ig_name ;
			  html += "</span>";
		}			
		let igname = document.getElementById("igname");
		igname.innerHTML = html ;	
	}			
	param = document.getElementById("searchIng").value;
	
	document.getElementById("searchIng").value = '';
	xhttp.open("GET","${pageContext.request.contextPath}/foodmanage/search.do?name="+param);
	xhttp.send();	
}	

function sele(ingredient){
	
	document.getElementById("basket_id").src ="../categoryimg/장바구니2.png" ;
	let sspan = document.getElementById("baskep_cnt");
	
	
	const xhttp = new XMLHttpRequest();
	xhttp.onload= function(){
		let val = xhttp.responseText;
		let arr = JSON.parse(val);
		let html = '';
		for(let obj of arr){
			html +=" " + obj.ingredient;
		}		
		let textingredient = document.getElementById("textingredient");
		textingredient.value += html;
	}
		xhttp.open("GET","${pageContext.request.contextPath}/foodmanage/temp.do?ingredient="+ingredient);
		xhttp.send();
}		

function showcnt(){
	
	const xhttp = new XMLHttpRequest();

	xhttp.onload= function(){
		let val = xhttp.responseText;
		let html = val-'0'+1;
		
		let cntspan = document.getElementById("basket_cnt");
		cntspan.innerHTML = html;
	}
		xhttp.open("GET","${pageContext.request.contextPath}/foodmanage/showcnt.do");
		xhttp.send();
}		
	
	
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

	<div class="basket_div">
	<c:if test="${not empty temp}">
	<img src ="../categoryimg/장바구니2.png" id="basket_id" class="basket" onclick="window.location.href='${pageContext.request.contextPath}/foodmanage/detail.do'">
	</c:if>
	<c:if test="${empty temp}">
	<img src ="../categoryimg/장바구니.png" id="basket_id" class="basket" onclick="window.location.href='${pageContext.request.contextPath}/foodmanage/detail.do'">
	</c:if>
	
	<span class="basket_span">장바구니</span>
	<span id="basket_cnt" class="basket_span" >
	<c:if test="${cntnum!=0}">
	${cntnum}
	</c:if>
	</span>
	</div>
	
	
	
<div class="body_container"> 

	<div class="empty_div">
	</div>
	
	
	

<div class="category-container">

  <div class="category-row">
  <div class="your-class">
   <div class="category-item">   
      <img src="../categoryimg/all.png" onclick='a("iii");select();'>
    </div> 
<c:forEach var="vo" items="${list}">
    <div class="category-item">   
      <img src="../categoryimg/${vo.cat_name}.png" onclick='a("${vo.cat_name}");select();'>
    </div> 
</c:forEach>
    </div>
</div>
</div>
<div class="empty_div">
</div>

<div class="ingredient_search">
	<form id="ff">
	<div class="form-floating mb-3">
			<div class="ingredient_search_bt">
  		<input type="text" id="searchIng" class="form-control" autocomplete="off">
		<button type="button" class="btn btn-success" onclick="searing()">검색</button>
			</div>
		</div>
	</form>
</div>	


<div class="ingredient">
		<div id="igname" class="overflow-auto">
		</div>
</div>

<div class="empty_div">
</div>
	
	
<div class="addingredient">
	<div class="addingredient_bt">
		<input type="text" id="textingredient" class="form-control">
		<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/foodmanage/detail.do'">등록</button>
	</div>
</div>

<div class="emptydiv">
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
		
		<script type="text/javascript">
		$('.your-class').slick({
			  infinite: true,
			  slidesToShow: 6,
			  slidesToScroll: 6
			});

		</script>
</body>
</html>