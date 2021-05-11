<%@page import="javax.sql.DataSource"%>
<%@page import="och10.Emp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../dbError.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String empno    = request.getParameter("empno");
	String sql      = "select empno,ename,sal,hiredate from emp where empno="+empno;
	Context ctx     = new InitialContext();
	DataSource ds   = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	Connection conn = ds.getConnection();
	Statement stmt  = conn.createStatement();
	ResultSet rs    = stmt.executeQuery(sql);
	Emp emp = new Emp();
	if(rs.next()){
		emp.setEmpno(rs.getInt(1));      emp.setEname(rs.getString(2));
		emp.setSal(rs.getInt(3));        emp.setHiredate(rs.getDate(4));
		request.setAttribute("emp", emp);
	}
	rs.close();   stmt.close();   conn.close();
	RequestDispatcher rd = request.getRequestDispatcher("oraResult.jsp");
	rd.forward(request, response);
%>
</body>
</html>