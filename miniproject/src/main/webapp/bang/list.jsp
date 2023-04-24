<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="width:1200px;height:200px">
<a href="">전체</a>
<c:forEach var="vo" items="${list2}">
<a href="">${vo.cat_name}</a>
</c:forEach>
</div>


<div style="width:1200px;height:80px"><input type="text"><button style="width:25px;height:17px"></button></div>


<div style="width:1200px;height:200px">
${view}


</div>


<div style="width:1200px;height:80px"><input type="text" autocomplete="off"><button style="width:25px;height:17px"></button></div>


</body>
</html>


