<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<style type="text/css">
	.bbs{
		border: 1px dotted black;
		width: 500px;
		height: 200px;
		text-align: center;
		position:absolute;
	    top:50%; left:50%;
	    transform: translate(-50%, -50%);
	}
	.bbs input{
		width: 450px;
		height: 150px;
		position:absolute;
	    top:50%; left:50%;
	    transform: translate(-50%, -50%);
	    font-size: 50px;
	}
	a{
		text-decoration: none;
		color:black;
	}
</style>
</head>
<body>
	<h1 style="display: inline;"><a href="main.do">메인페이지</a></h1>
	<c:if test="${empty m_nickname }">
		<div style="float: right;" id="right">
			<input type="button" value="로그인" onclick="location.href = 'login.do'">
			<input type="button" value="회원가입" onclick="location.href = 'join.do'"> 
		</div>
		<hr>
	</c:if>
	<c:if test="${not empty m_nickname }">
		<div style="float: right;">
			${nickname }님 반갑습니다.
			<input type="button" value="로그아웃" onclick="location.href = 'logout.do'">
		</div>
		<hr>
	</c:if>


	<div class="bbs">
		<input type="button" value="커뮤니티" onclick="location.href = 'bbs.do'">
	</div>
</body>
</html>