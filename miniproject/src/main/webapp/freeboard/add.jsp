<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>�ڷ� �ø���</h3>
<form action="${pageContext.request.contextPath }/freeboard/add.do" method="post" enctype="multipart/form-data">
<table border="1">
<tr><th>�ۼ���</th><td><input type="text" name="writer" value="${sessionScope.loginId }" readonly></td></tr>
<tr><th>����</th><td><input type="text" name="title"></td></tr>
<tr><th>����</th><td><input type="text" name="content"></td></tr>
<tr><th>���ε�</th><td><input type="submit" value="����"></td></tr>
</table>
</form>
</body>
</html>