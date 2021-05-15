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
</style>
</head>
<body>
<% 
	String result1 = (String)request.getAttribute("result");  
	String result2 = (String)request.getAttribute("id");  
	String message = "";
	String  id     = "";
	int    chk     = 0;
	if(result1 != null) {
		message = result1; 
		chk = 1;
	}
	if(result2 != null) id = result2; 
%>
	<div class="login">
		<h1>회원가입</h2>
		<form action="joinChk.jsp" method="post" name="frm">
			<table>
				<tr>
					<td colspan="3"><% out.println(message); %></td>
					<td><input type="hidden" name="sameChk" value="<%=chk%>"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" placeholder="아이디" required="required" value="<%= id %>"></td><p>
					<td><input type="button" value="중복체크" onclick="samechk()"></td>
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
	
	<script type="text/javascript">
		function samechk() {
			location.href = "samechk.jsp?id="+frm.id.value;
			
		}
	</script>
</body>
</html>