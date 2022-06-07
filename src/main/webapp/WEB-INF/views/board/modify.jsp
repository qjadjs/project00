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
<body>
<%@include file ="../board/Header2.jsp" %>
	<h1 class="hh1">게시물 수정</h1>
	<div style="width: 60%; margin: auto;">
		<form method="post" action="/board/modify" name="frm">
			<div id="hh1">
				<input id="h1" type="text" name="title" value="${board.title}"  />
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
			 <textarea id="summernote1" name="content1">${board.content1}</textarea>
         <textarea id="summernote2" name="content2">${board.content2}</textarea>
			<br> 
			 <textarea id="t1" name="content3"></textarea>
         <textarea id="t2" name="content4"></textarea>
         <br>
			<input id="subBtn" type="button" value="수정"
				onclick="goWrite(this.form)" /> <input id="subBtn2" type="button"
				value="목록" onclick="location.href='/board/list'" />
		</form>
	</div>
	<div id="t3" style="min-height:150px; max-height:1000px;">
          
         </div>
	<%@include file ="../board/Footer.jsp" %>
</body>
<script>
var setting = {
	      placeholder : '이미지 넣기',
	      tabsize : 2, 
	      height : 300,
	      width: 600,
	      disableResizeEditor : true,
	      toolbar : [
	            [ 'insert', [ 'picture' ] ],
	             ],
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
	      $('#summernote1').summernote(setting);
	   });
	   $(document).ready(function() {
	      $('#summernote2').summernote(setting);
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
		var content3 = frm.content3.value;
	      var content4 = frm.content4.value;

		if (title.trim() == '') {
			alert("제목을 입력해주세요");
			return false;
		}
		if (content3.trim() && content4.trim() == '') {
	         alert("내용을 입력해주세요");
	         return false;
	      }

		frm.submit();

	};
</script>
</html>