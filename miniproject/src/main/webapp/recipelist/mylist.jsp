<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="./jquery-3.4.1.min.js"></script>

</head>
<body>
    <div class="row">
    <!--  주소가 ??일때 카테고리를 다르게 보여주기 -->
     <select name="categories" onchange="window.open(value,'_self');" >
 					 <option> 카테고리
<%-- 	 					 <c:if test="/recipelist/category.do?cat_num=1 ==1" > --%>
<!-- 							육류,어패류, 달걀, 콩류 -->
<%-- 						</c:if>     --%>
<%-- 						 <c:if test="${vo.cat_num ==2}" > --%>
<!-- 							과일류 -->
<%-- 						</c:if>  --%>
<%-- 						 <c:if test="${vo.cat_num ==3}" > --%>
<!-- 							유제품류 -->
<%-- 						</c:if>  --%>
<%-- 						 <c:if test="${vo.cat_num ==4}" > --%>
<!-- 							곡류 -->
<%-- 						</c:if>  --%>
<%-- 						 <c:if test="${vo.cat_num ==5}" > --%>
<!-- 							채소류 -->
<%-- 						</c:if>        --%>
					</option>
 					 <option value="${pageContext.request.contextPath}/recipelist/category.do?cat_num=1">육류,어패류, 달걀, 콩류</option>
 					 <option value="${pageContext.request.contextPath}/recipelist/category.do?cat_num=3">과일류</option>
					 <option value="${pageContext.request.contextPath}/recipelist/category.do?cat_num=4">유제품류</option>
					 <option value="${pageContext.request.contextPath}/recipelist/category.do?cat_num=2">곡류</option>
					 <option value="${pageContext.request.contextPath}/recipelist/category.do?cat_num=5">채소류</option>
					<option value="${pageContext.request.contextPath}/recipelist/mylist.do?id=test">전체보기</option>
					
				</select>
    <c:forEach var="vo" items="${list }">
		<div class="col">
                <input class="form-check-input me-1" type="checkbox">
                
                [${vo.dday }]
                ${vo.ingredient }
        </div>
	</c:forEach>
	</div>
</body>
</html>