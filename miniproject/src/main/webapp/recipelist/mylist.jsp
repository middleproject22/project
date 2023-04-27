<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="./jquery-3.4.1.min.js"></script>
	<script>
// 	function recBttn(){
// 		//체크 데이터를 담을 배열
// 		const arr=[];
// 		//Name 이 myrecipelist인 속성 취득
// 		const myrecipelist = document.getElementsByName("myrecipelist");
// 		//취득한 속성만큼 루프
// 		for(let i=0;i<myrecipelist.length;i++){
// 			//속성중에 체크 된 항목이 있을 경우
// 			if(myrecipelist[i].checked == true){
// 				arr.push(myrecipelist[i].value);
// 			}
// 		}
// 		//결과 표시
// 		document.getElementById("result").textContent = arr;
// 		System.out.println("recipelistarr:"+arr);
// 		alert(arr);
// 	}

	</script> 
</head>
<body>
    <div class="row">
    <!--  주소가 ??일때 카테고리를 다르게 보여주기 -->
 
		<form action="mylist.jsp">
    <c:forEach var="vo" items="${list }">
		<div class="col">
		<c:if test="${vo.cat_lnum == 1 }">
		고기
                <input class="form-check-input me-1" type="checkbox" value="${vo.ingredient }" name="myrecipelist">
                [${vo.dday }]
                ${vo.ingredient }
		</c:if>
		<c:if test="${vo.cat_lnum == 5 }">
		채소
                <input class="form-check-input me-1" type="checkbox" value=" ${vo.ingredient }" name="myrecipelist">
                [${vo.dday }]
               
		</c:if>
        </div>
       
		</c:forEach>
	
        <input type="submit" value="레시피 검색하기">
        </form>
	</div>
	 
</body>
</html>