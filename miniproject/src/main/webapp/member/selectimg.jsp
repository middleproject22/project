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
<form action="${pageContext.request.contextPath }/member/selectimg.do" method="post">
 <table>
<c:forEach var="img" items="${list }" varStatus="status">
<c:if test = '${status.index%3 ==0}'>
<tr>
</c:if>
 <td class="view_img"  style="border:none" id="${status.index}" onclick="b(${status.index})"><img src='${ img.imgpath}' style="width:200px;height:230px;" onclick="select('${img.imgpath}')" ></td>
 <c:if test = '${status.index%3==2 }'>
 </tr>
 
 </c:if>
</c:forEach>
</table>
<input type="hidden" id="path" name="path" value="" >
<button type="submit">선택</button>
</form>

<script type="text/javascript">
let path = document.getElementById("path")
function select(imgpath) {
	path.value = imgpath;
	
}
window.onload=function(){
	if('${ck}'=="ck"){
		opener.location.reload();
		window.close();
	}
}

function b(num){
	for(let i=0;i<9;i++){
		let bordline = document.getElementById(i);
		if(num == i){
			bordline.style.border='1px solid blue'
		}else if(num!=i){
			bordline.style.border= '';
		}
	}
}
</script>
</body>
</html>