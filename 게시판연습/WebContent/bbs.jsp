<%@page import="bbs.bbsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bbs.bbsDAO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<style type="text/css">
	.bbs{
		border: 1px dotted black;
		width: 80%;
		text-align: center;
		position:absolute;
	    top:50%; left:50%;
	    transform: translate(-50%, -50%);
	}
	table{
		margin-top:30px;
		width: 95%;
	}
	#btn{
		margin-top:30px;
		float: right;
	}
	a{
		text-decoration: none;
		color:black;
	}
</style>
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
	if (nickname == null){%>
	<script type="text/javascript">
		alert("로그인 후 이용할수있습니다.");
		location.href = 'login.jsp';
	</script>
<%  } %>
<body>
<%
	int pages = 1;
 	if(request.getParameter("pages") != null){
		pages = Integer.parseInt(request.getParameter("pages"));
	} 
%>
	<h1 style="display: inline;">메인페이지</h1>
	<div style="float: right;">
		<%=nickname %>님 반갑습니다.
		<input type="button" value="로그아웃" onclick="location.href = 'logout.jsp'">
	</div>
	<hr>
	<div class="bbs">
		<table>
			<tr>
				<td>제목</td>
				<td>작성자</td>
				<td>조회수</td>
				<td>작성일</td>
			</tr>
<%			bbsDAO bbsdao = new bbsDAO();      
			ArrayList<bbsDTO> list = bbsdao.bbsList(pages);
			for ( int i = 0; i < list.size(); i++) { %>
				<tr>
					<td style="width: 55%"><a href="countUp.jsp?b_idx=<%= list.get(i).getB_idx()%>"><%=list.get(i).getB_title() %></a></td>
					<td style="width: 15%"><%= list.get(i).getNickname() %></td>
					<td style="width: 15%"><%= list.get(i).getB_count() %></td>
					<td style="width: 15%"><%= list.get(i).getB_regdate() %></td>
				</tr>
<%         } %>
		</table>
<%		if(pages != 1) { %>
			<button><a href="bbs.jsp?pages=<%=pages - 1%>">이전</a></button>
<%      } if(bbsdao.nextPage(pages + 1)) { %>
			<button><a href="bbs.jsp?pages=<%=pages + 1%>">다음</a></button>
<%      } %>	
		<input type="button" value="글쓰기" id="btn" onclick="location.href = 'write.jsp'">
	</div>
</body>
</html>