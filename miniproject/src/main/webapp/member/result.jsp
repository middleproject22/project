<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
<%String id = request.getParameter("id");
System.out.println(id);
String pwd = request.getParameter("pwd");
System.out.println(pwd);
String html="";
if(id == null){
	html += "Password =" +pwd;
}else if(pwd == null){
	html += "Id =" +id;
}

%>
</script>
</head>
<body>


<h3><%=html %></h3>
</body>
</html>