<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<style type="text/css">
	.bbs{
		border: 1px dotted black;
		width: 80%;

		text-align: center;
		position:absolute;
	    top:50%; left:50%;
	    transform: translate(-50%, -50%);
	}
	#b_content,#b_title{
		width: 95%;
	}
	td{
		width: 28%;	
	}
	#btn{
		float: right;
	}
	/* .bbs input{
		width: 450px;
		height: 150px;
		position:absolute;
	    top:50%; left:50%;
	    transform: translate(-50%, -50%);
	    font-size: 50px;
	} */
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
	if (nickname == null){%>
	<script type="text/javascript">
		alert("로그인 후 이용할수있습니다.");
		location.href = 'login.jsp';
	</script>
<%  } %>
<body>
	<h1 style="display: inline;">메인페이지</h1>
	<div style="float: right;">
		<%=nickname %>님 반갑습니다.
		<input type="button" value="로그아웃" onclick="location.href = 'logout.jsp'">
	</div>
	<hr>
	<div class="bbs">
		<h2>글쓰기</h2>
		<form action="writeChk.jsp" method="post">
			<input type="text" placeholder="글 제목" name="b_title" id="b_title" maxlength="50" style="height:40px;" required="required"><p>
			<textarea  placeholder="글 내용" name="b_content" id="b_content" maxlength="4000" style="height:350px;" required="required"></textarea><p>
			<input type="submit" value="글쓰기" id="btn" >
		</form>
	</div>
</body>
</html>