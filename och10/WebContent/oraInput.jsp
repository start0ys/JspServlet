<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>부서정보 입력</h2>
	<form action="oraInput1.jsp" method="post">
	<!-- <form action="oraInput2.jsp" method="post"> -->
		부서코드 :  <input type="number"  name="deptno" required="required"><p>
		부서명 :   <input type="text"    name="dname"   required="required"><p>
		근무지 :   <input type="text"    name="loc"     required="required"><p>
		<input type="submit" value="입력완료">
		<input type="reset" value="입력취소">
	</form>
</body>
</html>