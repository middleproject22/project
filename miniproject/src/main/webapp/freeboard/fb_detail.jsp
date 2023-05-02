<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<script type="text/javascript">
    window.onload=function(){
        const xhttp = new XMLHttpRequest();
        
        xhttp.onload = function() {
 
            let html = "";
            let txt = xhttp.responseText;
            let arr = JSON.parse(txt);
            for (let obj of arr) {//포문을 계속 돌린다
            	html += "<tr style='border-bottom: 1px solid'><td style='width:50px; height:40px'>";
                html += obj.fc_id + "</td>"
                html += "<td style='width:400px'>" + obj.fc_content + "</td>"
                html += "<td>" + obj.date + "</td>"
                if (obj.fc_id === "${sessionScope.loginId}") {
                    html += "<td><button type='button' onclick='deleteComment(" + obj.fc_num + ")'>삭제</button></td><tr/>";
                } else {
                    html += "<td></td><tr/>";
                }
            }
            
            let fc = document.getElementById("test")
            fc.innerHTML = html;    
        }

        let pa = ${vo.fb_num}
        xhttp.open("GET", "${pageContext.request.contextPath}/freecomment/fc_add.do?fb_num=" + pa);
        xhttp.send();
    }

    function deleteComment(fcNum) {
        if (confirm("댓글을 삭제하시겠습니까?")) {
            const xhttp = new XMLHttpRequest();

            xhttp.onload = function() {
                location.reload();
            }

            xhttp.open("GET", "${pageContext.request.contextPath}/freecomment/fc_delete.do?fc_num=" + fcNum);
            xhttp.send();
        }
    }
    
    function likebutton(el){
    	console.log("el : " + el);
    
   if(${empty sessionScope.loginId}){
	   alert("로그인이 필요한 서비스입니다.");
   }
   else{
	   const xhttp = new XMLHttpRequest();//
	   
	   xhttp.onload = function(){
	      let val = xhttp.responseText;
	      let html ="추천 :" + val;
	      console.log("val : " + val);
	      document.getElementById("likebtn").innerHTML=html;
	      
	   }
	   
	   let param = "?fb_num=";
	   param += ${vo.fb_num};//테스트
	   param += "&fl_id=${sessionScope.loginId}";
	   xhttp.open("GET", "${pageContext.request.contextPath}/freelike/fl_up.do"+param);
	   xhttp.send();
   }
	   
   
    	}
    
    function checkId(el) {

		<c:if test="${empty sessionScope.loginId}">
		alert("로그인이 필요한 서비스입니다.");
		el.href = "${pageContext.request.contextPath}/member/login.do";

		</c:if>
	}
    
</script>
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
<link rel="stylesheet" href="/miniproject/css/fb_detail.css">
<title>Document</title>

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
</head>
<body>
	<div class="all-marjin">
		<div class="row">
			<div class="fb-title">
				<h1>게 시 판</h1>
			</div>
		</div>
		<div class="fb-all">
		<div class="container text-left">
			<div class="row"
				style="margin-top: 0px; border: solid 3px #00A652">
				<div class="col-2" style="background-color:#00A652; color:white; font-size: 20px">제목</div>
				<div class="col-4" style="border-bottom: 2px solid #00A652">${vo.title}</div>
				<div class="col-2" style="background-color:#00A652; color:white; font-size: 20px">조회수</div>
				<div class="col-4" style="border-bottom: 2px solid #00A652">${vo.cnt}</div>
				<div class="col-2" style="background-color:#00A652; color:white; font-size: 20px">작성자</div>
				<div class="col-4">${vo.id}</div>
				<div class="col-2" style="background-color:#00A652; color:white; font-size: 20px">작성일</div>
				<div class="col-4">${vo.w_date}</div>
		</div>
		</div>
		<div class="fb-body">${vo.content}</div>
		</div>
		<div class="container text-center">
			<div class="row" style="margin-top: 5px">
				<div class="col"></div>
				<div class="col-5">
					<div class="likebutton" style="text-align: center">
						<button class="button" id="likebtn" onclick="likebutton(this)">추천:
							${like}</button>							
					</div>
				</div>
				<div class="col">
					<div class="fb-tail" style="text-align: right">
						<a href="${pageContext.request.contextPath}/freeboard/fb_list.do">목록</a>
						<c:if test="${sessionScope.loginId == vo.id}">
							<a
								href="${pageContext.request.contextPath}/freeboard/fb_edit.do?fb_num=${vo.fb_num}">수정</a>
							<a
								href="${pageContext.request.contextPath}/freeboard/fb_delete.do?fb_num=${vo.fb_num}">삭제</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<form
			action="${pageContext.request.contextPath}/freecomment/fc_add.do"
			method="post">
			<div class="row" style="margin-top: 5px">
				<div class="col-8">
					<input type="hidden" name="fb_num" value="${vo.fb_num }"> <input
						type="hidden" name="fc_id" value="${sessionScope.loginId }"
						readonly>
					<div class="form-floating">
						<textarea class="form-control" placeholder="Leave a comment here"
							id="floatingTextarea2" style="height: 100px; width: 800px"
							name="fc_content" required></textarea>
						<label for="floatingTextarea2">${sessionScope.loginId }</label>
					</div>
				</div>
				<div class="col-4">
					<input type="submit" value="작성">
				</div>
			</div>
		</form>
		<div class="fc-table">
			<table id="test"></table>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>
