<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${log == 1 }">
		<script type="text/javascript">
			alert("로그인 후 이용할수있습니다.");
			location.href = 'login.do';
		</script>
	</c:if>
	
	<script type="text/javascript">
		alert("로그인 상태에서는 이용할수없습니다.");
		location.href = 'main.do';
	</script>
	
</body>
</html>