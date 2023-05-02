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
<link rel='stylesheet' type="text/css" href="../css/login.css">
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<nav class="navbar navbar-expand-lg py-3 sicky-top bgc shadow-lg">
		<div class="container">
			<div class="col col-md-3 text-start"></div>
			<div class="col col-md-6 text-center">
				<nav class="navbar-brand">
					<a href="${pageContext.request.contextPath }/mainindex/mainIndex.do"><img
						class="logo" src="../imgs/logo3.png"></a>
				</nav>
			</div>
			<div class="col col-md-3 text-end"></div>
		</div>
	</nav>
	<div class="title">
		<h1>LOGIN</h1>
	</div>
	<section class="loginform">
		<form action="${pageContext.request.contextPath}/member/login.do"
			method="post">
			<div class="int-area">
				<input type="text" name="id" id="id" autocomplete="off" required
					autofocus> <label for="id">USER ID</label>
			</div>
			<div class="int-area">
				<input type="password" name="pwd" id="pwd" autocomplete="off"
					required> <label for="pwd">PASSWORD</label>
			</div>
			<div class="btn-area">
				<button type="submit">LOGIN</button>
			</div>
		</form>
	</section>
	<div class="subsection">
		<div class="caption">
			<a href="${pageContext.request.contextPath }/member/findAcc.jsp">Forgot
				Account?</a>
		</div>
		<div class="caption2">
			<a href="${pageContext.request.contextPath }/member/join.do">Join</a>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		window.onload = function() {
			if ('${ck}' == "ck") {
				alert('${msg}')
			}
		}
	</script>
</body>
</html>