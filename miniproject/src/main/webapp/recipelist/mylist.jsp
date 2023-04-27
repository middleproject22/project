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
    <div class="row">
    <!--  주소가 ??일때 카테고리를 다르게 보여주기 -->
 
	<form action="/recipelist/recplist.do">
  	  <c:forEach var="vo" items="${list }">
		<div class="col">
		<c:if test="${vo.cat_lnum == 1 }">
		육류,어패류, 달걀, 콩류
                <input class="inglist" type="checkbox" value="${vo.ingredient }" name="${vo.ingredient }">
                [${vo.dday }]
                ${vo.ingredient }
		</c:if>
		</div>
		<div class = "col">
		<c:if test="${vo.cat_lnum == 2 }">
		곡류
                <input class="inglist" type="checkbox" value=" ${vo.ingredient }" name="${vo.ingredient }">
                [${vo.dday }]
                ${vo.ingredient }
               
		</c:if>
        </div>
        <div class = "col">
		<c:if test="${vo.cat_lnum == 3 }">
				과일류
                <input class="inglist" type="checkbox" value=" ${vo.ingredient }" name="${vo.ingredient }">
                [${vo.dday }]
                ${vo.ingredient }
               
		</c:if>
        </div>
        <div class = "col">
		<c:if test="${vo.cat_lnum == 4 }">
				유제품류
                <input class="inglist" type="checkbox" value=" ${vo.ingredient }" name="${vo.ingredient }">
                [${vo.dday }]
                ${vo.ingredient }
               
		</c:if>
        </div>
          <div class = "col">
		<c:if test="${vo.cat_lnum == 5 }">
				채소류
                <input class="inglist" type="checkbox" value=" ${vo.ingredient }" name="${vo.ingredient }">
                [${vo.dday }]
                ${vo.ingredient }
               
		</c:if>
        </div>
       
		</c:forEach>
	
        <input type="submit" value="레시피 검색하기">
        </form>
	</div>
	 
</body>
</html>