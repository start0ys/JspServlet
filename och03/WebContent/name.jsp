<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
	%>
	<h1><%=name %>님<%=addr %>에 사시는군요</h1>
</body>
</html>