<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<link href="/miniproject/css/(FoodList)mylist.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<script>
	
// 	window.onload = function (){
// 		const xhttp = new XMLHttpRequest();
// 		xhttp.onload = function(){
			
// 		}
// 		xhttp.open("GET", "${pageContext.request.contextPath}/foodlist/ingredient.do?name="+${vo.ingredient});
// 		xhttp.send();
		
// 	}

	

	</script>
</head>

<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

	<div class="row">
		<div class="col-8">
			<h2>${sessionScope.loginId} 님의 냉장고</h2>
		</div>
		<div class="col" style="display: flex">
			<h4>${countall}</h4>
			<a href="${pageContext.request.contextPath }/foodmanage/list.do">식품
				추가하기</a>
		</div>

		<div class="p-4"></div>

	</div>
	<div class="container text-center">
		<div class="row">

			<div class="col-2">
				<select name="categories" onchange="window.open(value,'_self');">
					<option>--카테고리--</option>
					<option
						value="${pageContext.request.contextPath}/foodlist/category.do?cat_lnum=1">육류,어패류,
						달걀, 콩류</option>
					<option
						value="${pageContext.request.contextPath}/foodlist/category.do?cat_lnum=3">과일류</option>
					<option
						value="${pageContext.request.contextPath}/foodlist/category.do?cat_lnum=4">유제품류</option>
					<option
						value="${pageContext.request.contextPath}/foodlist/category.do?cat_lnum=2">곡류</option>
					<option
						value="${pageContext.request.contextPath}/foodlist/category.do?cat_lnum=5">채소류</option>
					<option
						value="${pageContext.request.contextPath}/foodlist/mylist.do">전체보기</option>

				</select>
			</div>
			<div class="col-2">
				<h4>이름</h4>
			</div>
			<div class="col-2">
				<h4>유통기한</h4>
			</div>
			<div class="col">
				<h4>남은 날</h4>
			</div>
			<div class="col">
				<h4>남은 양</h4>
			</div>
			<div class="col-2">
				<h4>영양소(100g)</h4>
			</div>
			<div class="col">
				<h4>삭제</h4>
			</div>
		</div>
	</div>
	<hr class="line">

	<!--  for 문으로 리스트 돌리기 -->
	<c:forEach var="vo" items="${list }" varStatus="status">
		<div class="container">
			<c:if test="${vo.dday<0}">
				<div class="row ddayarea0 text-center" style="background-color: gainsboro">
			</c:if>
			<c:if test="${0<=vo.dday&& vo.dday<3}">
				<div class="row ddayarea3 text-center" >
			</c:if>
			<c:if test="${3<=vo.dday&& vo.dday<7}">
				<div class="row ddayarea7 text-center" >
			</c:if>
			<c:if test="${7<=vo.dday}">
				<div class="row ddayareaAll text-center" >
			</c:if>
			<div class="col-2">
				<c:if test="${vo.cat_lnum == 1}">
						육류,어패류, 달걀, 콩류
					</c:if>
				<c:if test="${vo.cat_lnum ==2}">
						곡류
					</c:if>
				<c:if test="${vo.cat_lnum ==3}">
						과일류
					</c:if>
				<c:if test="${vo.cat_lnum ==4}">
						유제품류
					</c:if>
				<c:if test="${vo.cat_lnum ==5}">
						채소류
					</c:if>
			</div>
			<div class="col-2">

				<h6>${vo.ingredient }</h6>
				<div class="col" style="display: flex; justify-content: center">
					${vo.memo }</div>
			</div>
			<div class="col-2">
				<h6>${vo.expiredate }</h6>
			</div>
			<!-- 남은 날짜 (remain) -->
			<div class="col" id="">
				<h6>${vo.dday }</h6>
			</div>
			<div class="col flistsel">
				<!--       vo.amount 일때 기본값으로 보여줌. 근데 바꾸면 저장되도록. 근데 db값이 디폴트되도록 -->

			<c:if test="${0<=vo.dday}">
				<select name="selamount" onchange="window.open(value,'_self');">
				
					<option selected>--${vo.amount}%--</option>
					<option value="${pageContext.request.contextPath}/foodlist/delete.do?num=${vo.fm_num }">0%</option>
					<option	value="${pageContext.request.contextPath}/foodlist/updateamount.do?amount=25&num=${vo.fm_num }">25%</option>
					<option	value="${pageContext.request.contextPath}/foodlist/updateamount.do?amount=50&num=${vo.fm_num }">50%</option>
					<option	value="${pageContext.request.contextPath}/foodlist/updateamount.do?amount=75&num=${vo.fm_num }">75%</option>
					<option	value="${pageContext.request.contextPath}/foodlist/updateamount.do?amount=100&num=${vo.fm_num }">100%</option>

				</select>
		</c:if>
			</div>
			<div class="col-2">

				<!-- 영양소 불러오기. MyList에서 listIng 받아옴. varstatus -->
				<table style="font-size: 15px;">
					<tr>
						<td>칼로리 :${listIng[status.index].ig_kcal }</td>
						<td>단백질 :${listIng[status.index].ig_pt }</td>
					</tr>
					<tr>
						<td>지방 :${listIng[status.index].ig_fat }</td>
						<td>탄수화물 :${listIng[status.index].ig_car }</td>
					</tr>
					<tr>
						<td>당 :${listIng[status.index].ig_sug }</td>
						<td>나트륨 :${listIng[status.index].ig_nat }</td>
					</tr>
				</table>
			</div>
			<div class="col">
				
			<button type="button" class="btn btn-outline-danger" onclick="location.href='${pageContext.request.contextPath}/foodlist/delete.do?num=${vo.fm_num }'">삭제</button>
			</div>
		</div>
		</div>
	</c:forEach>
	
</body>

</html>
