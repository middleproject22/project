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
		let inputinfo = document.getElementById("inputinfo");
		inputinfo.style.display='none';
		let chkvalue = /^[a-zA-Z0-9]{4,12}$/
		if (!chkvalue.test(f.id.value)) {
			let html = '<p class="h6"'+'style="color : red">4~12자의 영문으로 입력해주세요</p>'
			let res = document.getElementById("res");
			res.innerHTML = html;
			f.id.value = "";
			f.id.focus();
		}

		else {
			const xhttp = new XMLHttpRequest();
			//비동기 요청 응답이 왔을때 자동 실행될 핸들러 등록
			xhttp.onload = function() {
				let val = xhttp.responseText;
				let html = '<p class="h6"';
				let obj = JSON.parse(val);

				if (obj.flag == "insertid") {
					html += 'style="color : red">아이디를 입력해주세요</p>'

				} else if (obj.flag) {
					html += 'style="color : blue">사용가능한 아이디입니다.</p>'
				} else {
					html += 'style="color : red">이미 사용중인 아이디 입니다.</p>'
						f.id.value = "";
					f.id.focus();
				}
				let res = document.getElementById("res");
				res.innerHTML = html;

			}

			let param = "?id=" + f.id.value;
			xhttp.open("GET",
					"${pageContext.request.contextPath}/member/checkid.do"
							+ param);
			xhttp.send();

		}

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
	
	window.onload=function(){
		if('${ck}'=="ck"){
			alert("이미 가입된 회원입니다.")
			history.go(-1);
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
					<a href="${pageContext.request.contextPath }/mainindex/mainIndex.do"><img
						class="logo" src="../imgs/logo3.png"></a>
				</nav>
			</div>
			<div class="col col-md-3 text-end"></div>
		</div>
	</nav>
	<div class="title">
		<h1>JOIN</h1>
	</div>
	<section class=loginform>
		<form name="f" id="f"
			action="${pageContext.request.contextPath}/member/join.do"
			method="post">
			<div class=int-area>
				<input type="text" class='id' name="id" id="id" required autocomplete="off"
					onblur="a()" > <label for="id">USER ID</label>
				<div class="ck-res" id="inputinfo">* 4~12자의 영문과 숫자로 입력해주세요</div>
				<div class="ck-res" id="res"></div>

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