<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	
	<script type="text/javascript">
	function addIng(){
		let inin = document.getElementsByClassName("ing").innerHTML;
		let expiredate = document.getElementsByClassName("expiredate").value;
		let content = document.getElementsByClassName("content").value;
		let param = "?ingredient="+ingredient;
		param += "&expiredate="+expiredate;
		param += "&content="+content;
// 		let param = `?ingredient=${ingredient}&expiredate=${expiredate}&content=${content}`;
// 		window.location.href ="${pageContext.request.contextPath}/foodmanage/add.do?ingredient="+ingredient+"&expiredate="+expiredate+"&content="+content;
		window.location.href ="${pageContext.request.contextPath}/foodmanage/add.do"+param	;
		
	}			
				
	</script>	
</head>
<body>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    
    <h2> 상품 등록</h2>

    <div class="p-4"></div>

    <div class="container text-center">
        <div class="row">
            
            <div class="col-2">
                <h4>이름</h4>
            </div>
            <div class="col-2">
                <h4>유통기한</h4>
            </div>
           
            <div class="col">
                <h4>메모</h4>
            </div>
            <div class="col-2">
                <h4>삭제</h4>
            </div>
           
        </div>
    </div>
	<form id="add" action= "${pageContext.request.contextPath}/foodmanage/add.do" method="post">

    <!--  for 문으로 리스트 돌리기 -->
    <c:forEach var="vo" items="${list}">

        <div class="container text-center">
            <div class="row">
                <div class="col-2" >
                    <input type="text" name="ing" class="ing" value="${vo.ingredient}">
                </div>
                <div class="col-2">
                <h6><input type="date" name="expiredate" class="expiredate"></h6>
            	</div>
                <div class="col">
                    <h6><input type="text" name="content" class="content"></h6>
                </div>
                <div class="col-2">	
                    <input type="button" id="delete" value="삭제" onclick='location.href="${pageContext.request.contextPath}/foodmanage/delete.do?num=${vo.temp_num}"'>
                </div>
            </div>
        </div>
    </c:forEach>
    <div><input type="submit"  value="등록"></div>
    	</form>
    	
</body>	
		
</html>
