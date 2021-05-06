<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>연산결과</h2>
<%
	try{
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		out.println(num1 + " + " + num2 + " = " + (num1 + num2) + "<p>");
		out.println(num1 + " - " + num2 + " = " + (num1 - num2) + "<p>");
		out.println(num1 + " * " + num2 + " = " + (num1 * num2) + "<p>");
		out.println(num1 + " / " + num2 + " = " + (num1 / num2) + "<p>");
	} catch(NumberFormatException e) { %>
	<script type="text/javascript">
			alert("숫자를 입력해주세요");
			history.go(-1);
	</script>	
<% 	} catch(ArithmeticException e) {   %>
	<script type="text/javascript">
			alert("0으로 나누면 안됩니다");
			history.back();
	</script>
<%	} catch(Exception e) {
		out.println(e.getMessage());   %>
	<script type="text/javascript">
			alert("에러발생");
			location.href = "num2.html";
	</script>
<%  } %>
</body>
</html>