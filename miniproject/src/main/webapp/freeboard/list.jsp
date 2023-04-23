<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel='stylesheet' type="text/css" href="../css/join.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg py-3 sicky-top bgc shadow-lg">
        <div class="container">
            <div class="col col-md-3 text-start">
                <sapn class="text_margine"><a href="#">나의 냉장고</a></sapn>
                <span class="text_margine"><a href="#">레시피</a></span>
                <span class="text_margine"><a href="${pageContext.request.contextPath }/freeboard/list.do">게시판</a></span>
            </div>
            <div class="col col-md-6 text-center">
                <nav class="navbar-brand">
                    <a href="index.jsp"><img class="logo" src="../imgs/logo3.png"></a>
                </nav>
            </div>
            <div class="col col-md-3 text-end">
               <span class="text_margine"><a href="#">로그인</a></span>
                <span class="text_margine"><a href="#">회원가입</a></span>
            </div>
        </div>
    </nav>
	<div class="container text-center">
  <div class="row align-items-start">
    <div class="col">
 <div class="title">
		<h1>게시판</h1>
	</div>
    </div>
    <div class="col">
    </div>
    <div class="col">
     <h3>검색창</h3>
    </div>
  </div>
  <div class="row align-items-center">
    <div class="col">
	글내용
    </div>
    <div class="col">
	작성자
    </div>
    <div class="col">
	날짜---조회수
    </div>
    
  </div>
  
    <div class="row align-items-center">
    <div class="col">
      괸리자
    </div>
    <div class="col">
      잘하자
    </div>
    <div class="col">
	날짜---조회수
    </div>
    
  </div><br/>
  <div class="row align-items-end">
    <div class="col">
	글내용
    </div>
    <div class="col">
	작성자
    </div>
    <div class="col">
	날짜---조회수
    </div>
     </div>
       <div class="row align-items-end">
    <div class="col">
	글내용

    </div>
    <div class="col">
	작성자
    </div>
    <div class="col">
	날짜---조회수
    </div>
     </div>
<br/>
 <a href="${pageContext.request.contextPath }/freeboard/add.do">글작성</a><br/>
      </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>