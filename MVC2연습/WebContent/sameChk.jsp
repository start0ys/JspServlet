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
	<c:if test="${chk == 0 }">
		<script type="text/javascript">
			alert("중복체크를 해주세요");
			history.back();
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		사용가능한 아이디입니다.
	</c:if>
	<c:if test="${result == 1 }">
		이미 사용중인 아이디입니다.
	</c:if>
</body>
</html>