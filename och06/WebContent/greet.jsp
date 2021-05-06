<%@page import="java.io.FileWriter"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	private PrintWriter pw;
	String date;
	
	public void jspInit() {
		GregorianCalendar gc = new GregorianCalendar();
		date = String.format("%TF %TT",gc,gc);
		System.out.println("date -> "+date);
		String fileName = "c:/log/"+date.replace(":", "")+".txt";
		try{
			pw = new PrintWriter(new FileWriter(fileName,true));
		}catch (Exception e){
			System.out.println("에러발생");
		}
	}
%>
<%
	String name = request.getParameter("name");
	String msg  = name + "님 반갑습니다";
	out.println(msg + "<p> 현재시간 : " + date);
	pw.println(msg + "\r\n 현재시간 : " + date + "\r\n");
%>
<%!
	public void jspDestroy() {
		pw.flush();
		if(pw != null) pw.close();
	}
%>
</body>
</html>