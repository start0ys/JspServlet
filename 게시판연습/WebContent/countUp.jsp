<%@page import="bbs.bbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="dbError.jsp"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%
	int b_idx = Integer.parseInt(request.getParameter("b_idx"));
	bbsDAO bbs = new bbsDAO();
	bbs.countUp(b_idx);
	RequestDispatcher dispatcher = request.getRequestDispatcher("bbsView.jsp?b_idx="+b_idx);
	dispatcher.forward(request, response);
%>

</body>
</html>