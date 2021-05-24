
<%@page import="bbs.bbsDAO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="dbError.jsp"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bbsDto" class="bbs.bbsDTO" scope="page" />
<jsp:setProperty property="*" name="bbsDto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
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
	bbsDAO bbsDao = new bbsDAO();
	int result = bbsDao.write(bbsDto.getB_title(), nickname, bbsDto.getB_content());
	if (result > 0) { %>
	<script type="text/javascript">
		alert("작성완료");
		location.href = "bbs.jsp";
	</script>
<% 	} else  { %>
	<script type="text/javascript">
		alert("글쓰기에 실패했습니다.");
		history.back();
	</script> 
<%  } %>

</body>
</html>