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
<link rel="stylesheet" href="/miniproject/css/navoutline.css">
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
			html += "<span class='aa' id='"+obj.ig_name +"'" ;
			html += " onclick=\"sele('" + obj.ig_name + "')\">";
			html += "<img class='imgingredient' src ='../ingredientimg/"+obj.ig_path+"'>";
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
			html += "<span class ='aa' id='"+obj.ig_name +"'" ;
			html += " onclick=\"sele('" + obj.ig_name + "')\">";
			html += "<img class='imgingredient' src ='/miniproject/ingredientimg/"+obj.ig_path+"'>";
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
		
</script>
</head>
<body>
	<nav class="navbar py-3 bgc shadow-lg ">
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
								<li><a class="dropdown-item" href="#scrollspyHeading3">식품등록</a></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath }/foodlist/mylist.do">식품
										전체 리스트</a></li>

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
								<li><a class="dropdown-item" href="#scrollspyHeading3">자유게시판</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
			<div class="col col-md-6 text-center">
				<nav class="navbar-brand">
					<a href="${pageContext.request.contextPath }/index.jsp"><img class="logo"
						src="/miniproject/imgs/logo3.png"></a>
				</nav>
			</div>
			<div class="col col-md-3 text_flex">
				<c:if test="${empty sessionScope.loginId }">
					<h3 class="text_margine">
						<a href="#">로그인</a>
					</h3>
					<h3 class="text_margine">
						<a href="#">회원가입</a>
					</h3>
				</c:if>
				<c:if test="${not empty sessionScope.loginId }">
					<a href="${pageContext.request.contextPath }/member/detail.do"><img
						src="${sessionScope.img}"
						class="rounded-circle userimg"></a>
					<h5>
						<span class="text_margine"><a
							href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a></span>
					</h5>
				</c:if>
			</div>
		</div>
	</nav>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	
	
<div class="body_container"> 

	<div class="empty_div">
	</div>
	
	
	

<div class="category-container">




  <div class="category-row">
   <div class="category-item">   
      <img src="../categoryimg/all.png" onclick='a("iii");select();'>
    </div> 
<c:forEach var="vo" items="${list}">

    <div class="category-item">   
      <img src="../categoryimg/${vo.cat_name}.png" onclick='a("${vo.cat_name}");select();'>
        </div> 
    
    
 	
</c:forEach>
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
	</div>



<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"> 
		
		</script>

</body>
</html>