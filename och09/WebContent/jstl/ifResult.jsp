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
	<c:if test="${num1>=num2 }">
		${num1 }이 ${num2 }보다 크거나 같습니다.
	</c:if>
	<c:if test="${num1<num2 }">
		${num1 }이 ${num2 }보다 작다.
	</c:if>
</body>
</html>