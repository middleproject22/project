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
<link rel="stylesheet" href="/miniproject/css/foodmanage_list.css">

<title>Document</title>
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
			html += "<span id='"+obj.ig_name +"'" ;
			html += " onclick=\"sele('" + obj.ig_name + "')\">" + obj.ig_name;
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
			html += "<span id='"+obj.ig_name +"'" ;
			html += " onclick=\"sele('" + obj.ig_name + "')\">" + obj.ig_name;
			html += "</span>";
		}								
		let igname = document.getElementById("igname");
		igname.innerHTML = html ;	
	}			
	
	param = document.getElementById("searchIng").value;
	
	xhttp.open("GET","${pageContext.request.contextPath}/foodmanage/search.do?name="+param);
	xhttp.send();	
}	

function sele(ingredient){
	const xhttp = new XMLHttpRequest();
	xhttp.onload= function(){
		let val = xhttp.responseText;
		let arr = JSON.parse(val);
		let html = '';
		for(let obj of arr){
			html += obj.ingredient;
		}		
		let textingredient = document.getElementById("textingredient");
		textingredient.value += html;
	}
		xhttp.open("GET","${pageContext.request.contextPath}/foodmanage/temp.do?ingredient="+ingredient);
		xhttp.send();
}		
		
</script>
</head>

<body>
	<nav class="navbar navbar-expand-lg py-3 bgc shadow-lg">
		<div class="container">
			<div class="col col-md-3 text-start">
				<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
					<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
								href="#" role="button" aria-expanded="false">나의 냉장고</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item needlogin" onclick='checkId(this)'  href="${pageContext.request.contextPath }/foodmanage/list.do">식품등록</a></li>
							<li><a class="dropdown-item needlogin" onclick='checkId(this)' href="${pageContext.request.contextPath}/foodlist/mylist.do?id=${sessionScope.loginId}">식품
									전체 리스트</a></li>
							<li><a class="dropdown-item needlogin" onclick='checkId(this)' href="${pageContext.request.contextPath }/recipelist/mylist.do?id=${sessionScope.loginId}">냉장고를
									부탁해</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
								href="#" role="button" aria-expanded="false">레시피</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath }/recipe/AllData.do">레시피
									목록</a></li>
							<li><a class="dropdown-item" href="#scrollspyHeading4">관리자
									픽 레시피</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
								href="#" role="button" aria-expanded="false">게시판</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath }/freeboard/fb_list.do">자유게시판</a></li>
						</ul>
					</li>
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
						src= "${sessionScope.img}" class="rounded-circle userimg"></a>
					<h5>
						<span class="text_margine"><a
							href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a></span>
					</h5>
				</c:if>
			</div>
		</div>
	</nav>
	
	
<div class="body_container"> 
<div class="emptydiv">
</div>
<div class="middlecategories">	
<div class="categories" onclick='a("iii");select();'>전체</div>
<c:forEach var="vo" items="${list}">
<div class="categories" id="${vo.cat_name}" onclick='a("${vo.cat_name}");select();'>${vo.cat_name}</div>
</c:forEach>

</div>




<div class="ingredientsearch">
<form id="ff">
<input type="text" id="searchIng" autocomplete="off" style="width:350px;height:33px">
<input type="button" style="width:45px;height:38px" value ="검색" onclick="searing()">
</form>
</div>





<div class="ingredient" style="width:1200px;height:200px;display:flex">
<div id="igname"></div>
</div>



<div class="addingredient">
<div style="width:1200px;height:80px"><input type="text" id="textingredient" style="width:350px;height:33px">
<button style="width:45px;height:38px"onclick="location.href='${pageContext.request.contextPath}/foodmanage/detail.do'">등록</button></div>
</div>


<div class="emptydiv">
</div>



</div>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>

</body>
</html>