<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link rel="stylesheet" type="text/css" href="style.css">
<style type="text/css">
	.bbs{
		border: 1px dotted black;
		width: 80%;

		text-align: center;
	    margin: 0 auto;
		margin-top : 40px;
	}
	.cot{
		margin: 0 auto;
		margin-top: 80px;
		width: 90%;
		text-align: left;
	}
	.hiddenText {
   		display: none;

	} 
	
</style>
<script type="text/javascript">
	function re(id) {
	/* 	var hidden = document.getElementsByClassName("hiddenText");
		hidden.style.display = "none"; */
		var a = "a" + id;
		var content = document.getElementById(a);
        content.style.display = "block";
	}
</script>
</head>

<body>
	<div>
	<h1 style="display: inline;">메인페이지</h1>
	<div style="float: right;">
		${nickname }님 반갑습니다.
		<input type="button" value="로그아웃" onclick="location.href = 'logout.jsp'">
	</div>
	<hr>
	</div>
	<div class="bbs">
		<h2>${board.b_title }</h2>
		<div>
			<span style="font-size: 18px; font-weight: bold; float: left; margin-left: 20px;">👤${board.nickname }</span>
			<span style="float: right; margin-right: 10px;">${board.b_regdate }</span>
			<span style="float: right; margin-right: 10px;">조회수 : ${board.b_count }</span>
		</div>
		
		
		
		<div style="margin-top: 50px; margin-bottom: 100px;">
			<div style="position: absolute; right: 11%;">
				<c:if test="${board.id == id }">
					<input type="button" value="수정" onclick="location.href='update.do?b_idx=${board.b_idx }&pageNum=${pageNum }'">
					<input type="button" value="삭제" onclick="location.href='delete.do?b_idx=${board.b_idx }&pageNum=${pageNum }'">
				</c:if>
			</div>
			<hr>
			<div class="cot">
				${content }
			</div>
		</div>

		<div class="comment">
               
                <c:forEach var="comment" items="${list }">
                <div class="getComment">
                    <div class="getWriter">
                    	<c:if test="${comment.re_level > 0 }">
							<img src="images/level.gif" width="${comment.re_level*10 }">
							<img src="images/re.gif">
						</c:if>
						👤${comment.nickname }
					</div>
                    <br>
    				<div style="margin-left: ${comment.re_level*15 }px; ">
	                    <div class="getTxt">${comment.c_content }</div>
	                    <div class="createDate">${comment.c_regdate }</div>
	                    <input type="button" value="답글" onclick="re(${comment.c_idx})">
	                    <c:if test="${comment.id == id }">
							<input type="button" value="수정" onclick="re(${comment.c_idx})">
							<input type="button" value="삭제" onclick="location.href='delete.do?b_idx=${board.b_idx }&pageNum=${pageNum }'">
						</c:if>
	
	               		<div class="hiddenText" id="a${comment.c_idx }">
	                        <form action="reWrite.do?pageNum=${pageNum }" method="post" name="frm1">
	                        	<input type="hidden" name="nickname" value="${nickname }">
								<input type="hidden" name="id" value="${id }">
								<input type="hidden" name="b_idx" value="${board.b_idx }">
								<input type="hidden" name="c_idx" value="${comment.c_idx }">
								<input type="hidden" name="ref" value="${comment.ref }">
								<input type="hidden" name="re_level" value="${comment.re_level }">
								<input type="hidden" name="re_step" value="${comment.re_step }">
	                        	<img src="images/re.gif">
								<div><span class="left"><label for="name">👤${nickname }</label></span></div>
	                            <div> <textarea name="c_content" id="c_content" maxlength="2000" style="height:100px;" required="required"
	                                placeholder="댓글을 입력해주세요"></textarea></div>
	
	                            <div><input type="submit" value="등록" id="submitBtn"></div>
	                        </form>
	                    </div>
    				</div>
                     
                </div>
                </c:forEach>
            


                <div class="inputtxt">
                    <form action="reWrite.do?pageNum=${pageNum }" method="post" name="frm2">
          				<input type="hidden" name="nickname" value="${nickname }">
						<input type="hidden" name="id" value="${id }">
						<input type="hidden" name="b_idx" value="${board.b_idx }">
						<input type="hidden" name="c_idx" value="${c_idx }">
						<input type="hidden" name="ref" value="${ref }">
						<input type="hidden" name="re_level" value="${re_level }">
						<input type="hidden" name="re_step" value="${re_step }">
						
                        <div>
                            <span class="left"><label for="name">👤${nickname }</label></span>
                   
                        </div>
                        <div class="inputComment">
                            <textarea name="c_content" id="c_content" maxlength="2000" style="height:100px;" required="required"
                                placeholder="댓글을 입력해주세요"></textarea>
                        </div>
                        <div class="btnFix"><input type="submit" value="등록" id="submitBtn"></div>

                    </form>
                </div>
            </div>
	
	</div>
</body>
</html>