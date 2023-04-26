<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글 수정</title>
</head>
<body>
	<h1>자유게시판 글 수정</h1>
	
	<c:if test="${empty vo}">
		<p>수정할 글 정보를 가져올 수 없습니다.</p>
	</c:if>
	
	<c:if test="${not empty vo}">
		<form action="${pageContext.request.contextPath }/freeboard/fb_edit.do" method="post">
			<input type="hidden" name="fb_num" value="${vo.fb_num}"/>
			<p>작성자 : ${vo.id }</p>
			<p>작성일 : ${vo.w_date }</p>
			<p>제목 : <input type="text" name="title" value="${vo.title }"/></p>
			<p>내용 : <textarea name="content" rows="10" cols="100">${vo.content }</textarea></p>
			<p><input type="submit" value="수정"/></p>
		</form>
	</c:if>
	
	<p><a href="${pageContext.request.contextPath }/freeboard/fb_list.do">목록으로 돌아가기</a></p>
</body>
</html>