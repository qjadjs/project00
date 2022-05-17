<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"/>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"/>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>게시글</title>
</head>
<body>
	<form id="operForm" action="/board/modify" method="get">
		<div>
			<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno}"/>'>
			<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'> 
			<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
			<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
			<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
		</div>
		<div style="width: 70%; margin: auto; text-align: center; height: 110%;">
			<div>
			<div style="width: 100%; font-size: 25px;">
			<input type="text" name="title" readonly value='<c:out value="${board.title}"/>'/>
			<br>
			<input type="text" style="height: 100%; font-size: 10px; float: right;" name="writer" readonly value='<c:out value="${board.writer}"/>'>
			</div>
			<br>
			</div>
			<div style="width: 100%; font-size: 15px;">
			<textarea readonly cols="100" rows="10"><c:out value="${board.content}"/></textarea>
			</div>
		</div>
	</form>




<div style="width: 50%; margin: auto;">
	<form method="post" action="/write">
		<input type="hidden" name="replyer" />
		<br> 
		<br>
		<textarea id="summernote" name="reply"></textarea>
		<input id="subBtn" type="button" value="댓글 작성" style="float: right;"
			onclick="goWrite(this.form)" />
	</form>
</div>


<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>		
		$(document).ready(function() {
			$('#summernote').summernote({
				placeholder: '내용을 입력하세요',
		        tabsize: 2,
		        height: 100,
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
		

</script>
	<script type="text/javascript">
	$(document).ready(function() {
		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function() {
			operForm.submit();
		});

		$("button[data-oper='list']").on("click", function() {
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/list");
			operForm.submit();
		});
	})
</script>