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
			html += "<span id='"+obj.ig_name +"'" ;
			html += " onclick=\"sele('" + obj.ig_name + "')\">" + obj.ig_name;
			html += "</span>";
		}								
		let igname = document.getElementById("igname");
		igname.innerHTML = html ;	
	}			
	if(document.getElementById("id").value==""){
		xhttp.open("GET","${pageContext.request.contextPath}/foodmanage/select.do?name="+param);
	} else{
		xhttp.open("GET","${pageContext.request.contextPath}/foodmanage/search.do?name="+param);
	}
	xhttp.send();	
}					
				
				
function sele(ingredient){
	const xhttp = new XMLHttpRequest();
	xhttp.onload= function(){
		let val = xhttp.responseText;
		let arr = JSON.parse(val);
		let html = '';
		for(let obj of arr){
			html += obj.ingredient;
		}		
		let textingredient = document.getElementById("textingredient");
		textingredient.value += html;
	}
		xhttp.open("GET","${pageContext.request.contextPath}/foodmanage/temp.do?ingredient="+ingredient);
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
<div style="width:1200px;height:80px">
<form id="ff">
<input type="text" id="searchIng" autocomplete="off" style="width:350px;height:33px"><button style="width:45px;height:38px" onclick="location.href='${pageContext.request.contextPath}/foodmanage/search.do'">
검색</button>
</form>
</div>
<div style="width:1200px;height:200px;display:flex">
<div id="igname"></div>
</div>
<div style="width:1200px;height:80px"><input type="text" id="textingredient" style="width:350px;height:33px">
<button style="width:45px;height:38px"onclick="location.href='${pageContext.request.contextPath}/foodmanage/detail.do'">등록</button></div>
</body>
</html>