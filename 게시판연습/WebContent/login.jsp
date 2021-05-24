<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
	input{
		width: 250px;
	}
	.login{
		border: 1px dotted black;
		width: 500px;
		text-align: center;
		position:absolute;
	    top:50%; left:50%;
	    transform: translate(-50%, -50%);

	}

</style>
</head>
<%
	String nickname = null;
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("id")){
				session.setAttribute("id", cookie.getValue());
				String id = (String)session.getAttribute("id");
				UserDAO userDao = new UserDAO();
				nickname = userDao.getNickname(id);
			}
		}
	}
	if (nickname != null){%>
	<script type="text/javascript">
		alert("로그인 상태에서는 로그인을 이용할수없습니다.");
		location.href = 'main.jsp';
	</script>
<%  } %>
<body>

	<div class="login">
		<h1>로그인</h2>
		<form action="loginChk.jsp">
			<input type="text" name="id" placeholder="아이디를 입력해주세요"><p>
			<input type="password" name="password" placeholder="비밀번호를 입력해주세요"><p>
			<input type="checkbox" value="autolog" style="width: 10px;">자동로그인<p>
			<input type="submit" value="로그인" style="width: 100px;">
		</form>
	</div>
</body>
</html>