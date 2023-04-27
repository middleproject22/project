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
	function recBttn(){
		//체크 데이터를 담을 배열
		const arr=[];
		//Name 이 myrecipelist인 속성 취득
		const myrecipelist = document.getElementsByName("myrecipelist");
		//취득한 속성만큼 루프
		for(let i=0;i<myrecipelist.length;i++){
			//속성중에 체크 된 항목이 있을 경우
			if(myrecipelist[i].checked == true){
				arr.push(myrecipelist[i].value);
			}
		}
		//결과 표시
		document.getElementById("result").textContent = arr;
		System.out.println(arr);
	}
// ${"input:checkbox[name=myrecipelist]:checked }.length{

// }
</script>
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
                <input class="form-check-input me-1" type="checkbox" name="myrecipelist">
                
                [${vo.dday }]
                ${vo.ingredient }
        </div>
        <input type="button" value="recbttn" onclick="recBttn()">
	</c:forEach>
	</div>
</body>
</html>