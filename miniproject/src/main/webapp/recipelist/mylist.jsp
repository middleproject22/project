<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<script>

//체크박스 개수 제한
$(document).ready(function(){
	$("input[type='checkbox']").on("click",function(){
		let count = $("input:checked[type='checkbox']").length;
		
		if(count>3){
			$(this).prop("checked",false);
				alert("3개만 선택 가능합니다.");
		}
	});
	$("input:checkbox[name=${vo.ingredient }]").length; 
	$("input:checkbox[name=${vo.ingredient }]:checked").length; 
	
	$("input:checkbox[name=menu]").each(function(){
		if(this.checked){
			//체크된 것 수행할 것 구현
		}
	})
});





</script>
</head>
<body>
    <div class="row">
    <!--  주소가 ??일때 카테고리를 다르게 보여주기 -->
 
	<form method="post" action="${pageContext.request.contextPath }/recipe/getMat.do">
  	  <c:forEach var="vo" items="${list }">
		<div class="col">
		<c:if test="${vo.cat_lnum == 1 }">
		육류,어패류, 달걀, 콩류
                <input class="inglist" type="checkbox" value="${vo.ingredient }" name="inglist">
                [${vo.dday }]
                ${vo.ingredient }
		</c:if>
		</div>
		<div class = "col">
		<c:if test="${vo.cat_lnum == 2 }">
		곡류
                <input class="inglist" type="checkbox" value="${vo.ingredient }" name="inglist" >
                [${vo.dday }]
                ${vo.ingredient }
              
		</c:if>
        </div>
        <div class = "col">
		<c:if test="${vo.cat_lnum == 3 }">
				과일류
                <input class="inglist" type="checkbox" value="${vo.ingredient }" name="inglist">
                [${vo.dday }]
                ${vo.ingredient }
               
		</c:if>
        </div>
        <div class = "col">
		<c:if test="${vo.cat_lnum == 4 }">
				유제품류
                <input class="inglist" type="checkbox" value="${vo.ingredient }" name="inglist">
                [${vo.dday }]
                ${vo.ingredient }
               
		</c:if>
        </div>
          <div class = "col">
		<c:if test="${vo.cat_lnum == 5 }">
				채소류
                <input class="inglist" type="checkbox" value="${vo.ingredient }" name="inglist">
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