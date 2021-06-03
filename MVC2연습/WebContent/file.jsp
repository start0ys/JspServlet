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
	<% System.out.println("file.jsp"); %>
	<c:set var="file" value="${file }" scope="request"/>
	<c:set var="fileResult" value="${fileResult }" scope="request"/>
	<script type="text/javascript">
		history.go(-1);
	</script>

</body>
</html>