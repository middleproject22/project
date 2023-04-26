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
<form action="${pageContext.request.contextPath }/member/selectimg.do" method="post" enctype="multipart/form-data">
<input type="file" name="file">
 <table>
<c:forEach var="img" items="${list }" varStatus="status">
<tr>
 <td class="view_img"><img src='${ img.imgpath}' style="width:200px;height:230px" onclick="select('${img.imgpath}')"></td>
 </tr>
</c:forEach>
</table>
<input type="hidden" id="path" name="path" value="">
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
</script>
</body>
</html>