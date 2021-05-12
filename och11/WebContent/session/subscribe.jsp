<%@page import="util.MemberDto"%>
<%@page import="util.MemberDao"%>
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
	String chk = "";
	String agree = request.getParameter("agree");
	if (agree.equals("y")){
		String   id     = (String)session.getAttribute("id");
		String password = (String)session.getAttribute("password");
		String  name    = (String)session.getAttribute("name");
		MemberDao   md   = new MemberDao();
		MemberDto member = new MemberDto();
		member.setId(id);
		member.setName(name);
		member.setPassword(password);
		int result = md.insert(member); 
		if (result > 0) chk = "success";
		else            chk = "fail";
	}else  chk = "AgreddNo";
	session.invalidate();
	out.print("invalidate() 적용후에도 "+session.getId()+"<br>");
	response.sendRedirect("result.jsp?chk="+chk);
%>
</body>
</html>