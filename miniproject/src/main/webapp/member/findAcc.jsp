<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel='stylesheet' type="text/css" href="/miniproject/css/findAcc.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = function(){
	if('${a}'==1){
		alert("일치하지 않는 정보");
	}else if('${a}'==2){
		window.open('${pageContext.request.contextPath}/member/result.jsp?id="${id}"','result','width=400px,height=300px');
	}else if ('${a}'==3){
		window.open('${pageContext.request.contextPath}/member/result.jsp?pwd="${pwd}"','result','width=400px,height=300px');
	}
	
}
</script>
</head>

<body>
<nav class="navbar navbar-expand-lg py-3 sicky-top bgc shadow-lg">
		<div class="container">
			<div class="col col-md-3 text-start"></div>
			<div class="col col-md-6 text-center">
				<nav class="navbar-brand">
					<a href="${pageContext.request.contextPath }/index.jsp"><img
						class="logo" src="../imgs/logo3.png"></a>
				</nav>
			</div>
			<div class="col col-md-3 text-end"></div>
		</div>
	</nav>
	<div class="main">
	<section class="find-id">
	<h1>FIND ID</h1>
		<form action="${pageContext.request.contextPath}/member/findid.do" method="post">
			<div class="int-area">
				<input type="text" name="name" id="name" required autocomplete="off"> 
				<label for="name">USER NAME</label>
			</div>
			<div class="int-area">
				<input type="text" name="pnum" id="pnum" required autocomplete="off"> 
				<label for="name">PHONE NUMBER</label>
			</div>
			<div class="btn-area"><button type="submit">FIND ID</button></div>
		</form>
		</section>
		
		<section class="find-pwd">
	<h1>FIND PASSWORD</h1>
		<form action="${pageContext.request.contextPath}/member/findpwd.do" method="post">
			<div class="int-area">
				<input type="text" name="name" id="name" required autocomplete="off"> 
				<label for="name">USER NAME</label>
			</div>
			<div class="int-area">
				<input type="text" name="id" id="id" required autocomplete="off"> 
				<label for="id">USER ID</label>
			</div>
			<div class="int-area">
				<input type="text" name="pnum" id="pnum" required autocomplete="off"> 
				<label for="pnum">PHONE NUMBER</label>
			</div>
			<div class="btn-area"><button type="submit">FIND PWD</button></div>
		</form>
	</section>
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>