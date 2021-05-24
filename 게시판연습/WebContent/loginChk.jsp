<%@page import="user.UserDAO"%>
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
	String    id    = request.getParameter("id");
	String password = request.getParameter("password");
	String  autolog = request.getParameter("autolog");
	UserDAO userDao = new UserDAO();
	int result = userDao.login(id, password);
	if(result == 1){
		session.setAttribute("id", id);
		Cookie cookie = new Cookie("id",id);
		cookie.setMaxAge(600);
		cookie.setPath("/");
		response.addCookie(cookie); %>
	<script type="text/javascript">
		alert("로그인 성공하셨습니다.\n환영합니다.");
		location.href = 'main.jsp';
	</script>
<% 	} else if (result == 0) { %>
	<script type="text/javascript">
			alert("비밀번호를 다시 확인해주세요.");
			history.go(-1);
	</script>
<%  } else { %>
	<script type="text/javascript">
			alert("존재하지 않는 아이디입니다.");
			history.go(-1);
	</script>
<%  } %>
</body>
</html>