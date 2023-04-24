<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

	<script>
	
	//sysdate 갱신
	window.onload = function (){
		const xhttp = new XMLHttpRequest();
		xhttp.open("GET", "${pageContext.request.contextPath}/foodlist/updatetoday.do);
		xhttp.send();
	}
	
	function getByCategories(){
		$('#btn').click(function(){
			var category = $("#getCat option:selected").val();
			// 카테고리로 검색
			<% 
// 			FoodListService service = new FoodListService();
// 			ArrayList<FoodManageVo> list = service.();
			%>
		})
	}
	</script>
</head>

<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    
    <h2> ${sessionScope.loginId} 님의 냉장고</h2>

    <div class="p-4"></div>

    <div class="container text-center">
        <div class="row">
            <div class="col">
                <li class="list-group-item">
                    <input class="form-check-input me-1" type="checkbox">
                </li>
            </div>
            <div class="col">
                <select name="categories" onchange="window.open(value,'_self');" >
 					 <option>카테고리</option>
 					 <option value="${pageContext.request.contextPath}/foodlist/category.do?cat_num=1">육류</option>
 					 <option value="${pageContext.request.contextPath}/foodlist/category.do?cat_num=3">과일류</option>
					 <option value="${pageContext.request.contextPath}/foodlist/category.do?cat_num=4">유제품류</option>
					 <option value="${pageContext.request.contextPath}/foodlist/category.do?cat_num=2">곡류</option>
					 <option value="${pageContext.request.contextPath}/foodlist/category.do?cat_num=5">채소류</option>
				</select>
            </div>
            <div class="col-2">
                <h6>이름</h6>
            </div>
            <div class="col-2">
                <h6>유통기한</h6>
            </div>
            <div class="col-2">
                <h6>남은 날</h6>
            </div>
            <div class="col">
                <h6>퍼센트</h6>
            </div>
            <div class="col">
                <h6>영양소(100g)</h6>
            </div>
            <div class="col">
                <h6>삭제</h6>
            </div>
        </div>
    </div>

    <!--  for 문으로 리스트 돌리기 -->
    <c:forEach var="vo" items="${list }">

        <div class="container text-center">
            <div class="row">
                <div class="col">
                    <li class="list-group-item">
                        <input class="form-check-input me-1" type="checkbox">
                    </li>
                </div>
                <div class="col-2">
					<h6>${vo. }</h6>               
                </div>
                <div class="col-2">
                    <h6>${vo.ingredient }</h6>
                </div>
                <div class="col-2">
                    <h6>${vo.expiredate }</h6>
                </div>
                <!-- 남은 날짜 (remain) -->
                <div class="col-2" id="">
                    <h6>${vo.dday }</h6>
                </div>
                <div class="col">
                    <h6>${vo.amount }</h6>
                </div>
                <div class="col">
                    <input type="button" value="삭제" onclick="">
                </div>
            </div>
        </div>
    </c:forEach>
    
</body>

</html>

