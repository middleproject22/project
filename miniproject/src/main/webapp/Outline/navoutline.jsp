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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="/miniproject/css/navoutline.css">
</head>

<body>
    <nav class="navbar py-3 fixed-top bgc shadow-lg">
        <div class="container">
            <div class="col col-md-3 text-start location">
                <button class="navbar-toggler outline" type="button" data-bs-toggle="offcanvas"
                    data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                    <span class="material-symbols-outlined">
                        menu
                        </span>
                </button>
                <h3>나의 냉장고</h3>
            </div>
            <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar"
                aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasNavbarLabel">메뉴</h5>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                        aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button"
                                aria-expanded="false">나의 냉장고</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#scrollspyHeading3">식품등록</a></li>
                                <li><a class="dropdown-item" href="#scrollspyHeading4">식품 전체 리스트</a></li>
                                <li><a class="dropdown-item" href="#scrollspyHeading5">냉장고를 부탁해</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button"
                                aria-expanded="false">리시피</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#scrollspyHeading3">레시피 목록</a></li>
                                <li><a class="dropdown-item" href="#scrollspyHeading4">관리자 픽 레시피</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button"
                                aria-expanded="false">게시판</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#scrollspyHeading3">자유게시판</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col col-md-6 text-center">
                <nav class="navbar-brand">
                    <a href="index.html"><img class="logo" src="/miniproject/imgs/logo3.png"></a>
                </nav>
            </div>
            <c:if test="${empty sessionScope.loginId }">
            	<div class="col col-md-3 text_flex">
                	<h3 class="text_margine"><a href="#">로그인</a></h3>
                	<h3 class="text_margine"><a href="#">회원가입</a></h3>
           	 </div>
            </c:if>
            <c:if test="${not empty sessionScope.loginId }">
            <a href="${pageContext.request.contextPath }/member/detail.do"><img src ="/miniproject/imgs/user.png" class= "img-circle"></a>
				<h3 class="text_margine"><a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a></h3>
            </c:if>
        </div>
    </nav>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>

</html>