<%@page import="och12.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ include file="memberCheck.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String passwd = request.getParameter("passwd");
	MemberDao md = MemberDao.getInstance();
	System.out.println("DeletePro id -> "+id);
	int result = md.delete(id,passwd); 
	if(result == 1){
		session.invalidate();  %>
	<script type="text/javascript">
		alert("탈퇴되었습니다.");
		location.href="main.jsp";
	</script>
<%  } if (result == 0) {  %>
	<script type="text/javascript">
		alert("비밀번호를 정확하게 입력해주세요.");
		history.go(-1);
	</script>
<%  } else { %>
	<script type="text/javascript">
		alert("탈퇴 실패");
		history.go(-1);
	</script>
<%  } %>
</body>
</html>