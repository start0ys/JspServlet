<%@page import="oAjax.MemberDao"%>
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
	String id = request.getParameter("id");
	MemberDao md = MemberDao.getInstance();
	int result = md.confirm(id);
	if(result==0){
		out.println("사용할 수 있는 ID입니다.");
	} else{
		out.println("이미 존재하는 ID입니다.");
	}
%>
</body>
</html>