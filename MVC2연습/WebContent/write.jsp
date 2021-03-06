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
		width: 80%;

		text-align: center;
		position:absolute;
	    top:50%; left:50%;
	    transform: translate(-50%, -50%);
	}
	table{
		resize: none;
	}
	#b_content,#b_title{
		width: 95%;
	}
	td{
		width: 28%;	
	}
	#btn{
		float: right;
	}
	a{
		text-decoration: none;
		color:black;
	}
</style>

</head>

<body>
	<h1 style="display: inline;"><a href="main.do">메인페이지</a></h1>
	<div style="float: right;">
		${nickname }님 반갑습니다.
		<input type="button" value="로그아웃" onclick="location.href = 'logout.do'">
	</div>
	<hr>
	<div class="bbs">
		<h2>글쓰기</h2>
		<form action="writePro.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${id }">
			<input type="hidden" name="nickname" value="${nickname }">
			<input type="file" name="uploadFile"><p>
			<input type="text" placeholder="글 제목" name="b_title" id="b_title" maxlength="50" style="height:40px;" required="required"><p>
			<textarea  placeholder="글 내용" name="b_content" id="b_content" maxlength="4000" style="height:350px;" required="required"></textarea><p>
			<input type="submit" value="글쓰기" id="btn" >
		</form>
	</div>
</body>
</html>