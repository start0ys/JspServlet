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
	<c:set var="animals" value="토끼,고양이*강아지,망아지"></c:set>
	<h2>사자의 생일</h2>
	<c:forTokens items="${animals }" delims=",*" var="an">   <!--delims는 구분자 즉 ,와*를 구분자로 한다는뜻  -->
		${an }<br>
	</c:forTokens>

</body>
</html>