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
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	MemberDao md = new MemberDao();
	int result = md.check(id,password); 
	if(result == 1){
		session.setAttribute("id", id);
		response.sendRedirect("sessionMain.jsp");
	} else if (result == 0) { %>
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