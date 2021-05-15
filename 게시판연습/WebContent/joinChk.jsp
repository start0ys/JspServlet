<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="dbError.jsp"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="userDto" class="user.UserDTO" scope="page" />
<jsp:setProperty property="id" name="userDto"/>
<jsp:setProperty property="password" name="userDto"/>
<jsp:setProperty property="name" name="userDto"/>
<jsp:setProperty property="nickname" name="userDto"/>
<jsp:setProperty property="email" name="userDto"/>
<jsp:setProperty property="gender" name="userDto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<%	
	if(userDto.getGender() == null) { %>
	<script type="text/javascript">
		alert("성별을 입력해주세요");
		history.back();
	</script>
<%  }
	int chk = Integer.parseInt(request.getParameter("sameChk"));
	if(chk == 0) { %>
	<script type="text/javascript">
		alert("중복체크를 해주세요");
		history.back();
	</script>
<%  } else if(chk == 1 && userDto.getGender() != null) {
		UserDAO userDao = new UserDAO();
		int result = userDao.joinMembership(userDto);
		if (result > 0) { %>
		<script type="text/javascript">
			alert("회원가입을 축하합니다.");
			location.href = "main.jsp";
		</script>
<% 	    } else  { %>
		<script type="text/javascript">
			alert("가입실패");
			history.back();
		</script> 
<%  	} 
	} %>
</body>
</html>