<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Person person = new Person(); 이랑 동일 -->
	<jsp:useBean id="person" class="och08.Person" scope="request" />
	<jsp:setProperty property="name" name="person" param="name"/>
	<jsp:setProperty property="gender" name="person" value="남자"/>
	<jsp:setProperty property="age" name="person" value="23"/>
	
	<h2>인적 사항</h2>
	
	이름 : <jsp:getProperty property="name" name="person"/><p>
	성별 : <jsp:getProperty property="gender" name="person"/><p>
	나이 : <jsp:getProperty property="age" name="person"/><p>
	
	
</body>
</html>