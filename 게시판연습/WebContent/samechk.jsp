<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="dbError.jsp"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	UserDAO userDao = new UserDAO();
	if (userDao.samechk(id)){
		out.println("이미 사용중인 아이디입니다.");
	} else{
		out.println("사용가능한 아이디입니다.");
	}
	
	
%>


</body>
</html>