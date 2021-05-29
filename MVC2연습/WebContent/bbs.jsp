<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
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
		margin: 0 auto;
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
	th{
		border-top: solid 2px #aaaaaa;
    	background-color: #eeeeee;
	}
</style>
</head>

<body>

	<h1 style="display: inline;"><a href="main.do">메인페이지</a></h1>
	<div style="float: right;">
		${nickname }님 반갑습니다.
		<input type="button" value="로그아웃" onclick="location.href = 'logout.do'">
	</div>
	<hr>
	<div class="bbs">
		<table>
			<tr><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr>
			<c:forEach var="board" items="${best }">
				<tr>
					<td style="width: 55%; font-weight: bold; font-size: 18px;background-color: #ffe3df;">
						<img src="images/hot.gif">
						<a href="view.do?b_idx=${board.b_idx }&pageNum=${currentPage}">${board.b_title }</a>
					</td>
					<td style="width: 15%;background-color: #ffe3df;">👤${board.nickname }</td>
					<td style="width: 15%;background-color: #ffe3df;">${board.b_regdate }</td>
					<td style="width: 15%;background-color: #ffe3df;">${board.b_count }</td>
				</tr>
			</c:forEach>
			<c:if test="${totCnt > 0 }">
			<c:forEach var="board" items="${list }">
				<tr>
					<td style="width: 55%; font-weight: bold; font-size: 18px;">
						<a href="view.do?b_idx=${board.b_idx }&pageNum=${currentPage}">${board.b_title }</a>
					</td>
					<td style="width: 15%;">👤${board.nickname }</td>
					<td style="width: 15%;">${board.b_regdate }</td>
					<td style="width: 15%;">${board.b_count }</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${toCnt == 0 }">
			<tr>
				<td colspan="7">데이터가 없습니다</td>
			</tr>
		</c:if>

				

		</table>
		
		<div style="text-align: center; margin-top: 20px;">
		<c:if test="${startPage > blockSize }">
			<a href="bbs.do?pageNum=${startPage-blockSize }">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${pageNum == i }">
				<a href="bbs.do?pageNum=${i }" style="color: red;">[${i }]</a>
			</c:if>
			<c:if test="${pageNum != i }">
				<a href="bbs.do?pageNum=${i }">[${i }]</a>
			</c:if>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href="bbs.do?pageNum=${startPage+blockSize }">[다음]</a>
		</c:if>
	</div>

		<input type="button" value="글쓰기" id="btn" onclick="location.href = 'write.do'">
	</div>
</body>
</html>