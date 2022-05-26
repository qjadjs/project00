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
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>게시글 수정</title>
<link href="../resources/css/modify.css" rel="stylesheet" />
</head>
<body class="b1">
	<h1 class="hh1">게시물 수정</h1>
	<div style="width: 60%; margin: auto;">
		<form method="post" action="/board/modify" name="frm">
			<div id="title1">
				<input id="title2" type="text" name="title" value="${board.title}" />
			</div>
			<input id="title2" type="hidden" name="writer"
				value="${board.writer}" /><br> <input id="title2"
				type="hidden" name="bno" value="${board.bno}" /> <input id="title2"
				type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
			<input id="title2" type="hidden" name="amount"
				value='<c:out value="${cri.amount}"/>'> <input id="title2"
				type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
			<input id="title2" type="hidden" name="keyword"
				value='<c:out value="${cri.keyword}"/>'> <br> <br>
			<textarea id="summernote" name="content">${board.content}</textarea>
			<br> <input id="subBtn" type="button" value="수정"
				onclick="goWrite(this.form)" /> <input id="subBtn2" type="button"
				value="목록" onclick="location.href='/board/list'" />
		</form>
	</div>
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
		var writer = frm.writer.value;
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