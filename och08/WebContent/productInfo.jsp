<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <jsp:useBean id="pt" class="och08.Product" scope="request"></jsp:useBean> --%>
	<%-- <jsp:useBean id="pt" class="och08.Book" scope="request"></jsp:useBean> --%>
	<jsp:useBean id="pt" class="och08.Product" scope="request"></jsp:useBean>
	<h2>제품정보</h2>
	코드 : <jsp:getProperty property="code" name="pt"/><p>
	이름 : <jsp:getProperty property="name" name="pt"/><p>
	가격 : <jsp:getProperty property="price" name="pt"/><p>
</body>
</html>