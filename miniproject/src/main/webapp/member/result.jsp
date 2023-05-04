<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel='stylesheet' type="text/css" href="../css/login.css">
<script type="text/javascript">
	
<%String id = request.getParameter("id");
System.out.println(id);
String pwd = request.getParameter("pwd");
System.out.println(pwd);
String html = "";
if (id == null) {
	html += "<h3>패스워드 검색결과</h3>" + "<h5>" + pwd + "</h5>";
} else if (pwd == null) {
	html += "<h3>아이디 검색결과</h3>" + "<h5>" + id + "</h5>";
}%>
	
</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg sicky-top bgc shadow-lg">
		<div class="container">
			<div class="col col-md-3 text-start"></div>
			<div class="col col-md-6 text-center">
				<nav class="navbar-brand">
					<a
						href="${pageContext.request.contextPath }/mainindex/mainIndex.do"><img
						class="logo" src="../imgs/logo3.png"></a>
				</nav>
			</div>
			<div class="col col-md-3 text-end"></div>
		</div>
	</nav>

	<div class="result_area"
		style="margin: auto; text-align: center; width: 250px; position: relative; top: 50px;">
		<%=html%>
		<div class="btn-area">
			<button type="button" style="width: 90%;height: " onclick="a()">로그인 페이지로 이동</button>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
		
	<script type="text/javascript">
	function a() {
		window.close()
		opener.location.href="${pageContext.request.contextPath}/member/login.do"
	}
	
	
	
	</script>	
		
		
		
</body>
</html>