<%@page import="och12.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="member" class="och12.Member"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
<%
	MemberDao md = MemberDao.getInstance();
	int result = md.insert(member);
	if(result >0 ) { %>
	<script type="text/javascript">
		alert("회원가입을 축하드립니다.");
		location.href="loginForm.jsp";
	</script>
<%  }  else { %>
	<script type="text/javascript">
		alert("가입실패");
		location.href="joinForm.jsp";
	</script>
<%  }  %>
</body>
</html>