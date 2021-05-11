<%@page import="java.util.ArrayList"%>
<%@page import="och10.Dept"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="dbError.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String  url   = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String  sql   = "select deptno,dname,loc from dept";	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");
	Statement  stmt = conn.createStatement();
	ResultSet   rs  = stmt.executeQuery(sql);
	ArrayList<Dept> al = new ArrayList<Dept>();
	if(rs.next()){
		do{
			Dept dept = new Dept();
			dept.setDeptno(rs.getInt("deptno"));
			dept.setDname(rs.getString("dname"));
			dept.setLoc(rs.getString("loc"));
			al.add(dept);
		} while(rs.next());
		request.setAttribute("al", al);
		rs.close();
		stmt.close();
		conn.close();
		RequestDispatcher rd = request.getRequestDispatcher("oraDresult.jsp");
		rd.forward(request, response);
		
	} else{
		out.println("데이터가 없습니다");
		stmt.close();
		conn.close();
	
	}
	
	
	
	
	
%>
</body>
</html>