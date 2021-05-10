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
	String [] pet = {"야옹이","진도개","치와와","풍산이","조랑말"};
	request.setAttribute("pet", pet);
%>
	<jsp:forward page="each2result.jsp"></jsp:forward>
</body>
</html>