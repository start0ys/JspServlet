<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">

	.login{
		border: 1px dotted black;
		width: 500px;
		text-align:center;
		position:absolute;
	    top:50%; left:50%;
	    transform: translate(-50%, -50%);

	}
	table{
		margin: 0 auto;
	}
	tr{
		margin-top: 50px;
	}
	#msg{
		color:red;
	}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
		$(function() {
			$('#chk').click(function() {
				var id = $('#id').val();
				var sendData = 'id='+id;
				
				$.post('samechk.jsp',sendData,function(msg){
					$('#msg').html(msg);
				});
			});
		});
</script>
<script type="text/javascript">
	function chk1() {
		frm.sameChk.value = "1";
	}
</script>
</head>
<%
	String nickname = null;
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("id")){
				session.setAttribute("id", cookie.getValue());
				String id = (String)session.getAttribute("id");
				UserDAO userDao = new UserDAO();
				nickname = userDao.getNickname(id);
			}
		}
	}
	if (nickname != null){%>
	<script type="text/javascript">
		alert("로그인 상태에서는 회원가입을 이용할수없습니다.");
		location.href = 'main.jsp';
	</script>
<%  } %>
<body>
	<div class="login">
		<h1>회원가입</h2>
		<form action="joinChk.jsp" method="post" name="frm">
			<table>
				<tr>
					<td colspan="3" id="msg"></td>
					<td><input type="hidden" name="sameChk" value="0"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" placeholder="아이디" required="required"></td><p>
					<td><input type="button" value="중복체크" id="chk" onclick="chk1()"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" placeholder="비밀번호" required="required"></td>
				</tr>
				
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" placeholder="이름" required="required"></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="nickname" placeholder="닉네임" required="required"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" placeholder="이메일" required="required"></td>
				</tr>
			</table>
			남자 <input type="radio" name="gender" value="남자" > 여자<input type="radio" name="gender" value="여자" ><p>
			
			<input type="submit" value="회원가입" style="width: 100px;">
		</form>
	</div>
	

</body>
</html>