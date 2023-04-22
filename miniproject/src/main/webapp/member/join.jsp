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
<link rel='stylesheet' type="text/css" href="../css/join.css">
<script type="text/javascript">
	function a() {
		const xhttp = new XMLHttpRequest();
		//비동기 요청 응답이 왔을때 자동 실행될 핸들러 등록
		xhttp.onload = function() {
			let val = xhttp.responseText;
			let html = '<h5 style="color : ';
			let obj = JSON.parse(val);
			if (obj.flag) {
				html += 'blue">available </5>'
			} else {
				html += 'red">already in use</h5>'
			}
			let res = document.getElementById("res");
			res.innerHTML = html;

		}

		let param = "?id=" + f.id.value;
		xhttp.open("GET", "${pageContext.request.contextPath}/member/checkid"
				+ param);
		xhttp.send();
	}

	function b() {
		let x = document.getElementById('ckid');
		x.style.opacity = '1';
		x.style.visibility = 'visible';

	}
	function c() {
		let x = document.getElementById("ckid");
		x.style.opacity = '0';
		x.style.visibility = 'hidden';
	}
</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg py-3 sicky-top bgc shadow-lg">
		<div class="container">
			<div class="col col-md-3 text-start">
				<span class="text_margine"> <a href="#">나의 냉장고</a></span> <span
					class="text_margine"><a href="#">레시피</a></span> <span
					class="text_margine"><a href="#">게시판</a></span>
			</div>
			<div class="col col-md-6 text-center">
				<nav class="navbar-brand">
					<a href="index.html"><img class="logo" src="../imgs/logo3.png"></a>
				</nav>
			</div>
			<div class="col col-md-3 text-end">
				<span class="text_margine"><a href="#">로그인</a></span> <span
					class="text_margine"><a href="#">회원가입</a></span>
			</div>
		</div>
	</nav>
	<div class="title">
		<h1>JOIN</h1>
	</div>
	<section class=loginform>
		<form name="f" action="${pageContext.request.contextPath}/member/join"
			method="post">
			<div class=int-area>
				<input type="text" name="id" id="id" required autocomplete="off"
					onfocus="b()" onblur="c()"> <label for="id">USER ID</label>
				<div class="ck-res" id="res"></div>
				<div class="checkbtn" id="ckid">
					<button onclick='a()'>CHECK</button>
				</div>
			</div>
			<div class=int-area>
				<input type="password" name="pwd" id="pwd" required
					autocomplete="off"> <label for="pwd">PASSWORD</label>
			</div>
			<div class=int-area>
				<input type="text" name="name" id="name" required autocomplete="off">
				<label for="name">NAME</label>
			</div>
			<div class=int-area>
				<input type="text" name="pnum" id="pnum" required autocomplete="off">
				<label for="pnum">PHONE NUMBER</label>
			</div>
			<div class=int-area>
				<input type="text" name="email" id="email" required
					autocomplete="off"> <label for="email">EMAIL</label>
			</div>
			<div class=btn-area>
				<button type="submit">JOIN</button>
			</div>
		</form>
	</section>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>