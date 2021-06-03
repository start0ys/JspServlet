<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		function makeImg(img_path){
			 var str = "<img src=" + img_path + ">" // 이미지 태그 삽입
			 frames.myEditor.focus();
			 frames.myEditor.document.selection.createRange().pasteHTML(str);
		}
	</script>
</head>
<body>

	<table>
		 <tr>
			  <td>
				   <input type="button" name="11" onclick="makeImg
				('http://wstatic.naver.com/w/n_c600.gif')" value="이미지추가" class="EditorImg">
			  </td>
		 </tr>
		 <tr>
			  <td>
				   <textarea  name="comment"></textarea>
				   <IFRAME width=800 height=650 id=myEditor></iframe>
			  </td>
		 </tr>
	</table>
	<script>
		frames.myEditor.document.designMode= "On";
	</script>

</body>

</html>