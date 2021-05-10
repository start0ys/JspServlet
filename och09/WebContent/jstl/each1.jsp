<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="cnt" begin="1" end="7" step="2"> <!--step주면 2개씩늘어남 for문 조건의 i++ 대신 i +=2랑 같음  -->
		<font size="${cnt }">안녕하세요</font><br>
	</c:forEach>
</body>
</html>