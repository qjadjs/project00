<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<script src="resources/js/summernote/summernote-lite.js"></script>
<script src="resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet"
	href="resources/css/summernote/summernote-lite.css">
<body>
	<div>
		<form method="post">
			<input type="text" name="title"> <input type="hidden"
				name="writer" value="${작성자 이름}">
			<textarea id="summernote" name="editordata"></textarea>
		</form>
	</div>
</body>
<script>
	$(document).ready(function() {

		$("#summernote").summernote({
			height : 300,
			minHeight : null,
			maxHeignt : null,
			focus : true,
			lang : "ko-KR",
			placeholder : '최대 2048자까지 쓸 수 있습니다',
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
		})
	})
</script>
</html>