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
<h3>자료 올리기</h3>
<form action="${pageContext.request.contextPath }/freeboard/add.do" method="post" enctype="multipart/form-data">
<table border="1">
<tr><th>작성자</th><td><input type="text" name="writer" value="${sessionScope.loginId }" readonly></td></tr>
<tr><th>제목</th><td><input type="text" name="title"></td></tr>
<tr><th>내용</th><td><input type="text" name="content"></td></tr>
<tr><th>업로드</th><td><input type="submit" value="저장"></td></tr>
</table>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>