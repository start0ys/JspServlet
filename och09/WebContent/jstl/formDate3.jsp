<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="date" value="<%= new Date() %>"></c:set>
	날짜 : <fmt:formatDate value="${date }" type="date" pattern="YYYY년 MM월 dd일 (E)"/><br>
	시간 : <fmt:formatDate value="${date }" type="time" pattern="[a] hh시 mm분 ss초"/>
</body>
</html>