<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
</body>
</html>