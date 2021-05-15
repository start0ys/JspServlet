<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	input{
		width: 250px;
	}
	.login{
		border: 1px dotted black;
		width: 500px;
		text-align: center;
		position:absolute;
	    top:50%; left:50%;
	    transform: translate(-50%, -50%);

	}

</style>
</head>
<body>
	<div class="login">
		<h1>로그인</h2>
		<form action="">
			<input type="text" name="id" placeholder="아이디를 입력해주세요"><p>
			<input type="password" name="password" placeholder="비밀번호를 입력해주세요"><p>
			<input type="submit" value="로그인" style="width: 100px;">
			<input type="submit" value="회원가입" style="width: 100px;">
		</form>
	</div>
</body>
</html>