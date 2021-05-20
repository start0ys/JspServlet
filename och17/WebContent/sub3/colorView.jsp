<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head>
<body>
<%
	String[] color = request.getParameterValues("color");
	String str = "당신이 좋아하는 색은 ";
	for (int i = 0; i < color.length; i++) {
		str += color[i];
		if (i != (color.length-1)) str += ", "; 
	}
	str += "입니다";
%>
<%=str %>
</body>
</html>