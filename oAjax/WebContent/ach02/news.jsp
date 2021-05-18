<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] nw = {"코로나","머스크","비트코인","한미정상","반도체"};
	for(int i = 0; i < nw.length; i++){
		if(i==0) out.println("<b>");
		out.println(nw[i]);
		if(i==0) out.println("</b>");
		if(i != ( nw.length -1)) out.println(",<br>");
	}
%>