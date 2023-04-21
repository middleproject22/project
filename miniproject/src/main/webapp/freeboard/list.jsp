<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
<h3>자유게시판</h3>
<table border="1">
<tr><th>전체</th><th>잡담</th><th>후기</th><th>요청</th></tr>
</table>
<table border="1">
<tr><th>작성자</th><th>글내용</th><th>추천수</th></tr>
</table>
<table border="1">
<tr><th>글내용</th><th>글내용</th><th>추천수</th></tr>
</table>
<table border="1">
<a href="${pageContext.request.contextPath }/freeboard/add.do">글작성</a><br/>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>