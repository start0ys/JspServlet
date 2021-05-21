<%@page import="och12.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%	String id = request.getParameter("id"); %>
<script type="text/javascript">
	function wincl() {
		opener.document.frm.id.value = "<%=id%>";
		window.close();
	}
</script>
</head>
<body>
<%
	MemberDao md = MemberDao.getInstance();
	int result = md.confirm(id); 
	if(result == 0) { %>
	<%=id %>는 사용할수 있습니다.<p>
	<input type="button" value="닫기" onclick="wincl()">
<%  } else { %>
	<%=id %>는 이미 존재하는 아이디입니다. 다른것을 입력해주세요<p>
	<form>
		아이디 : <input type="text" name="id"><p>
		<input type="submit" value="확인">
	</form>
<%  }%>

</body>
</html>