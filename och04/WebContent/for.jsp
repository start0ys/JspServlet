<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	td:hover {
		background-color: green;
	}
</style>
</head>
<body>
	<h2>구구단</h2>
	<table	border="1" bgcolor="yellow">
		<tr>
		<%
			for(int i = 2; i <= 9; i++){
				out.println("<th>"+i+"단</th>");
			}
			out.println("</tr>");
			for(int i = 1; i <= 9; i++){
				out.println("<tr>");
				for(int j = 2; j <= 9; j++){
					if(j%2==0) out.println("<td bgcolor=pink>"+j+" * "+i+" = "+(i*j)+"</td>");
					else       out.println("<td bgcolor=orange>"+j+" * "+i+" = "+(i*j)+"</td>");
					
				}
				out.println("</tr>");
			}
		%>
	</table>
</body>
</html>