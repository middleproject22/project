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
	window.onload function (){
	
		//1. gettoday= sysdate
		//2. getdday= 유통기한
		//3. getreamin= 남은 날 (sysdate-expiredate) 새로고침마다 갱신
	
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
		//받은 응답을 가지고 처리 코드 작성
		 var today = $('#startDate').val();
         var endDate = $('#endDate').val();
         //-을 구분자로 연,월,일로 잘라내어 배열로 반환
         var startArray = startDate.split('-');
         var endArray = endDate.split('-');   
         //배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성
         var start_date = new Date(startArray[0], startArray[1], startArray[2]);
         var end_date = new Date(endArray[0], endArray[1], endArray[2]);
              //날짜를 숫자형태의 날짜 정보로 변환하여 비교한다.
         if(start_date.getTime() > end_date.getTime()) {
             alert("종료날짜보다 시작날짜가 작아야합니다.");
             return false;
		
		}
		xhttp.open(”GET”, “ajax_info.txt”);
	
	}
	</script>
</head>

<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <div class="row">
        <div class="col">
            <div class="accordion" id="accordionExample">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            =
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                        data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <h4>나의 레시피</h4>
                            식품 등록<br />
                            식품 전체리스트<br />
                            냉장고를 부탁해 (레시피)<br />

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="p-4"></div>


    <h2> ${sessionScope.loginId} 님의 냉장고</h2>

    <div class="p-4"></div>

    <div class="container text-center">
        <div class="row">
            <div class="col">
                <li class="list-group-item">
                    <input class="form-check-input me-1" type="checkbox">
                </li>
            </div>
            <div class="col-2">
                <h6>카테고리</h6>
            </div>
            <div class="col-3">
                <h6>이름</h6>
            </div>
            <div class="col-3">
                <h6>유통기한</h6>
            </div>
            <div class="col-3">
                <h6>남은 날</h6>
            </div>
            <div class="col">
                <h6>퍼센트</h6>
            </div>
            <div class="col">
                <input type="button" value="삭제">
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
<!--                  	cat_num이 1~5일때에 따라 다른 카테고리명 보여줌  -->
                  
                </div>
                <div class="col-3">
                    <h6>${vo.ingredient }</h6>
                </div>
                <div class="col-3">
                    <h6>${vo.expiredate }</h6>
                </div>
                <!-- 남은 날짜 (remain) -->
                <div class="col-3" id="">
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

