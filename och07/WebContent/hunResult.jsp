<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1부터 100까지 합</h2>
<%
	String sum = request.getAttribute("sum").toString();
%>
	Expression : <%= sum %><p>
	Expression Language : ${ sum1 }
</body>
</html>