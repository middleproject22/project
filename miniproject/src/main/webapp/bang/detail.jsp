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
<title>Document</title>
<script type="text/javascript">
function expiredateselect(el){
	
	let selectdate = new Date(el.value);
	let sysdate = new Date();
	
			
		if( selectdate < sysdate ){
			alert("유효하지 않은 날짜입니다");
			el.valueAsDate = new Date();
		}
		
	}
		
function alram(){
	
	let check = document.getElementsByclassName("ing").value;
	
	for(let obj of check){
		if(obj==null){
			alert("등록된 재료가 없습니다.")
		}
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
								<li><a class="dropdown-item" href="${pageContext.request.contextPath }/recipelist/mylist.do">냉장고를
										부탁해</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
							href="#" role="button" aria-expanded="false">리시피</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="${pageContext.request.contextPath }/recipe/AllData.do">레시피
										목록</a></li>
								<li><a class="dropdown-item" href="#scrollspyHeading4">관리자
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
					<a href="${pageContext.request.contextPath }/mainindex/mainIndex.jsp"><img class="logo"
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
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    
    
    
    
    
    
    <h2> 상품 등록</h2>

    <div class="p-4"></div>

    <div class="container text-center">
        <div class="row">
            
            <div class="col-2">
                <h4>이름</h4>
            </div>
            <div class="col-2">
                <h4>유통기한</h4>
            </div>
           
            <div class="col">
                <h4>메모</h4>
            </div>
            <div class="col-2">
                <h4>삭제</h4>
            </div>
           
        </div>
    </div>
    
	<form id="add" action= "${pageContext.request.contextPath}/foodmanage/add.do" method="post">
    <!--  for 문으로 리스트 돌리기 -->
    <c:forEach var="vo" items="${list}">

        <div class="container text-center">
            <div class="row">
                <div class="col-2" >
                    <input type="text" name="ing" class="ing" value="${vo.ingredient}">
                </div>
                <div class="col-2">
                <h6><input type="date" id="datecheck" name="expiredate" class="expiredate" onchange="expiredateselect(this)"></h6>
            	</div>
                <div class="col">
                    <h6><input type="text" name="content" class="content"></h6>
                </div>
                <div class="col-2">	
                    <input type="button" id="delete" value="삭제" onclick='location.href="${pageContext.request.contextPath}/foodmanage/delete.do?num=${vo.temp_num}"'>
                	
                </div>
            </div>
        </div>
    </c:forEach>
    <div><input type="submit"  value="등록" onclick="alram()"></div>
    	</form>
    	
    	
    	
    	
    	
    	
 <script>
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>	   	
  <script>
  
  
  
  </script>  	
</body>	
		
</html>
