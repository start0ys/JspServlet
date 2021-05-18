<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String context = request.getContextPath();
    System.out.println("context->"+context);
%>
<body>
<h2> 파일 업로드 전송결과 upLoadFilename</h2>
  upLoad 사진2 : <img src="<%=context%>/${filename }"><p>
</body>
</html>