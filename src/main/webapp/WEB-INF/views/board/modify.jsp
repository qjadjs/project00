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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>게시글 수정</title>
</head>
<body>
<h1 style="text-align: center;">게시물 수정</h1>
	<div style="width: 60%; margin: auto;">
		<form method="post" action="/board/modify" name="frm">
			<input type="hidden" name="writer" value="${board.writer}" /><br> 
			<input type="hidden" name="bno" value="${board.bno}"/> 
			<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'> 
			<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
			<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'> 
			<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
			<input type="text" name="title" style="width: 100%;" value="${board.title}"  />
			<br>
			<br>
			<textarea id="summernote" name="content">${board.content}</textarea>
			<br>
			<input id="subBtn" type="button" value="수정" style="float: center;"
				onclick="goWrite(this.form)" />
			<input type="button" value="목록으로" onclick="location.href='/board/list'" />
		</form>
	</div>
</body>
<script>
$(document).ready(function() {
	$('#summernote').summernote({
		placeholder: '${board.content}',
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
		$("#content").html(data.replace(/&amp;/g, "&").replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&quot;/g,'"').replace(/&#40;/g,'(').replace(/&#41;/g,')').replace(/&#35;/g,'#'));
	
	function goWrite(frm) {
		var title = frm.title.value;
		var writer = frm.writer.value;
		var content = frm.content.value;
		
		if (title.trim() == ''){
			alert("제목을 입력해주세요");
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