<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>게시글 작성</title>
</head>
<body>
<h1 style="text-align: center">게시물 입력</h1>
	<div style="width: 60%; margin: auto;">
		<form method="post" action="/board/write" name="frm">
			<input type="text" name="writer" placeholder="작성자"/>
			<br> 
			<input type="text" name="title"
				style="width: 100%;" placeholder="제목" />
			<br>
			<br>
			<textarea id="summernote" name="content"></textarea>
			<br>
			<input id="subBtn" type="button" value="글 작성" style="float: center;"
				onclick="goWrite(this.form)" />
			<input type="button" value="목록으로" onclick="location.href='/board/list'" />
		</form>
	</div>
</body>
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder: '내용을 입력하세요',
	        tabsize: 2,
	        height: 400,
	        disableResizeEditor: true,
			toolbar: [
				['fontname', ['fontname']],
				['fontsize', ['fontsize']],
				['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				['color', ['forecolor','color']],
				['table', ['table']],
				['para', ['ul', 'ol', 'paragraph']],
				['height', ['height']],
				['insert',['picture','link','video']],
				['view', ['fullscreen', 'help']]
			],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		  });
		

	});
	
	function goWrite(frm) {
		var title = frm.title.value;
		var writer = frm.writer.value;
		var content = frm.content.value;
		
		if (title.trim() == ''){
			alert("제목을 입력해주세요");
			return false;
		}
		if (writer.trim() == ''){
			alert("작성자를 입력해주세요");
			return false;
		}
		if (content.trim() == ''){
			alert("내용을 입력해주세요");
			return false;
		}
		frm.submit();
	};
</script>
</html>