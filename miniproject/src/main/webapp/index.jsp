<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="
https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css
" rel="stylesheet">
<style>

</style>
</head>
<body>

<a href="${pageContext.request.contextPath}/mainindex/mainIndex.do"><video src="/miniproject/introvideo/opener.mp4" id="introvideo"style="width: 100%;height: 100%;" muted autoplay></video></a>

<script type="text/javascript">
document.getElementById('introvideo').addEventListener('ended', goToMain, false);
function goToMain(e) {
	window.location.href="${pageContext.request.contextPath}/mainindex/mainIndex.do"
}
</script>
</body>
</html>