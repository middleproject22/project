<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	let param =""; 
window.onload= function (){
	
	a("iii");
	select();

	
}	

	
function a(el){
		param = el;
	}

function select() {

	const xhttp = new XMLHttpRequest();
	
	
	xhttp.onload= function(){
		let val = xhttp.responseText;
		let arr = JSON.parse(val);
		let html = '';
		
		for(let obj of arr){
			html += obj.ig_name;
				
		}		
					
		
		let igname = document.getElementById("igname");
		igname.innerHTML = html ;	
		
	}
	
	xhttp.open("GET","${pageContext.request.contextPath}/product/select?name="+param);
	xhttp.send();	
	
}
</script>
</head>
<body>	

<div style="width:1200px;height:200px;display:flex">
<div style="width:60px" onclick='a("iii");select();'>전체</div>

<c:forEach var="vo" items="${list}">
<div style="width:60px" id="${vo.cat_name}" onclick='a("${vo.cat_name}");select();'>${vo.cat_name}</div>
</c:forEach>
</div>

<div style="width:1200px;height:80px"><input type="text"><button style="width:25px;height:17px"></button></div>
<div style="width:1200px;height:200px;display:flex">

<%-- <c:forEach var="vo" items="${list}">  --%>
<div id="igname"></div>
<%-- </c:forEach> --%>
</div>


<div style="width:1200px;height:80px"><input type="text" autocomplete="off"><button style="width:25px;height:17px"></button></div>

</body>
</html>


