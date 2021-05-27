<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
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
	#b_content,#b_title{
		width: 95%;
	}
	td{
		width: 28%;	
	}
	#btn{
		float: right;
	}
</style>
</head>

<body>
	<h1 style="display: inline;">메인페이지</h1>
	<div style="float: right;">
		${nickname }님 반갑습니다.
		<input type="button" value="로그아웃" onclick="location.href = 'logout.do'">
	</div>
	<hr>
	<div class="bbs">
		<h2>글쓰기</h2>
		<form action="updatePro.do" method="post">
			<input type="hidden" name="num" value="${board.b_idx }">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<input type="hidden" name="id" value="${id }">
			<input type="hidden" name="nickname" value="${nickname }">
			<input type="text" placeholder="글 제목" name="b_title" id="b_title" maxlength="50" style="height:40px;" required="required" value="${board.b_title }"><p>
			<pre><textarea  placeholder="글 내용" name="b_content" id="b_content" maxlength="4000" style="height:350px;" required="required">${board.b_content }</textarea></pre><p>
			<input type="submit" value="글쓰기" id="btn" >
		</form>
	</div>
</body>
</html>