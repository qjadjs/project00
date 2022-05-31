<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<script>
	
</script>
<title>게시글 작성</title>
<link href="../resources/css/write.css" rel="stylesheet" />
</head>
<body>
<%@include file ="../board/Header2.jsp" %>
	<h1 class="hh1">게시글 작성</h1>
		<form method="post" action="/board/write" name="frm" style="width: 70%; margin:auto; height:auto; background-color:white;">
			<input id="t4" type="text" name="writer" value="${login.userName }" readonly="readonly"/>
			<input type="hidden" name="userId" value="${login.userId}">
				<input class="h1" type="text" name="title" placeholder="제목">
			<textarea id="summernote" name="content"></textarea>
			<input id="subBtn" type="button" value="작성"
				onclick="goWrite(this.form)" /> <input id="subBtn2" type="button"
				value="목록" onclick="location.href='/board/list'" />
		</form>
          
            
            
         <div id="t3" style="min-height:150px; max-height:1000px;">
          
         </div>
	<%@include file ="../board/Footer.jsp" %> 
</body>
<script>
	var setting = {
		placeholder : '내용을 입력하세요',
		tabsize : 2,
		height : 400,
		disableResizeEditor : true,
		toolbar : [
				[ 'fontname', [ 'fontname' ] ],
				[ 'fontsize', [ 'fontsize' ] ],
				[
						'style',
						[ 'bold', 'italic', 'underline', 'strikethrough',
								'clear' ] ],
				[ 'color', [ 'forecolor', 'color' ] ],
				[ 'table', [ 'table' ] ],
				[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
				[ 'height', [ 'height' ] ],
				[ 'insert', [ 'picture', 'link', 'video' ] ],
				[ 'view', [ 'fullscreen', 'help' ] ] ],
		fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New',
				'맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체' ],
		fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18', '20', '22',
				'24', '28', '30', '36', '50', '72' ],
		callbacks : {
			onImageUpload : function(files, editor, welEditable) {
				// 파일 업로드(다중업로드를 위해 반복문 사용)
				for (var i = files.length - 1; i >= 0; i--) {
					uploadSummernoteImageFile(files[i], this);
				}
			}
		}
	}

	$(document).ready(function() {
		$('#summernote').summernote(setting);
	});

	function uploadSummernoteImageFile(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "uploadSummernoteImageFile",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				$(el).summernote('editor.insertImage', data.url);
			}
		});
	}

	function goWrite(frm) {
		var title = frm.title.value;
		var content = frm.content.value;

		if (title.trim() == '') {
			alert("제목을 입력해주세요");
			return false;
		}

		if (content.trim() == '') {
			alert("내용을 입력해주세요");
			return false;
		}
		frm.submit();
	};
</script>
</html>