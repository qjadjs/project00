<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
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
<title>게시글</title>
</head>
<body>
	<form id="operForm" action="/board/modify" method="get">
		<div>
			<input type="hidden" id="bno" name="bno"
				value='<c:out value="${board.bno}"/>'> <input type="hidden"
				name="pageNum" value='<c:out value="${cri.pageNum}"/>'> <input
				type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
			<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
			<input type="hidden" name="keyword"
				value='<c:out value="${cri.keyword}"/>'>
		</div>
		<div
			style="width: 70%; margin: auto; text-align: center; height: 110%;">
			<div>
				<div style="width: 100%; font-size: 25px;" name="title">
					<c:out value="${board.title}" />
				</div>
				<br>
				<div style="height: 100%; font-size: 10px; float: right;"
					name="writer">
					<c:out value="${board.writer}" />
				</div>
			</div>
			<br>
			<div name="content"
				style="white-space: pre; width: 100%; font-size: 15px; height: 300px; border-color: black;">
				<c:out value="${board.content}" />
			</div>
			<button data-oper="modify" class="btn btn-default">Modify</button>
			<button data-oper="list" class="btn btn-info">List</button>
			<form id="operForm" action="/board/modify" method="get">
				<input type="hidden" id="bno" name="bno"
					value='<c:out value="${board.bno}"/>'>
				<!-- 보고있던 페이지 정보 숨겨놓기 -->
				<input type="hidden" name="pageNum"
					value='<c:out value="${cri.pageNum}"/>'> <input
					type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
				<input type="hidden" name="type"
					value='<c:out value="${cri.type}"/>'> <input type="hidden"
					name="keyword" value='<c:out value="${cri.keyword}"/>'>
			</form>
		</div>
		</div>
	</form>




	<div style="width: 50%; margin: auto;">
		<form method="post" action="/write">
			<input type="hidden" name="replyer" /> <br> <br>
			<textarea id="summernote" name="reply"></textarea>
			<input id="subBtn" type="button" value="댓글 작성" style="float: right;"
				onclick="goWrite(this.form)" />
		</form>
	</div>

	<div style="width: 50%; margin: auto;">
		<div class="panel-body">
			<!-- 댓글 시작 -->
			<ul class="chat">
				<!-- 댓글이 들어올 공간 -->
			</ul>
		</div>
		<div class="panel-footer">
			<!-- 페이지 버튼이 들어온다 -->
		</div>
	</div>

	

	<script type="text/javascript" src="/resources/js/reply.js"></script>
	<script>		
		$(document).ready(function() {
			$('#summernote').summernote({
				placeholder: '내용을 입력하세요',
		        tabsize: 2,
		        height: 100,
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
			  })
			
			var bnoValue = '<c:out value="${board.bno}"/>';
			var replyUL = $(".chat");
			showList(1);

			function showList(page) {
				replyService.getList({
					bno : bnoValue,
					page : page || 1
				},
				function(replyCnt, list) {
					console.log("replyCnt : " + replyCnt);
					console.log("list : " + list);

				if (page == -1) {
					pageNum = Math.ceil(replyCnt / 10.0);
					showList(pageNum);
					return;
				}

				var comments = ""; // 여기에 html 코드를 조립
				if (list == null || list.length == 0) {
					replyUL.html("");
					return; // 함수 바로 종료
				}
				for (let i = 0; i < list.length; i++) {
					comments += "<li class='left clearfix' data-rno='" + list[i].rno + "'>";
					comments += "<div>";
					comments += "<div class='header'>";
					comments += "<strong class='primary-font'>" + list[i].replyer + "</strong>";
					comments += " <small class='pull-right text-muted'>" + replyService .displayTime(list[i].replyDate) + "</small>";
					comments += "</div>";
					comments += "<p>" + list[i].reply + "</p>";
					comments += "</div>";
					comments += "</li>";
				}
				replyUL.html(comments);

				showReplyPage(replyCnt);
			});
		}
			
		
			var pageNum = 1;
			var replyPageFooter = $(".panel-footer");

			function showReplyPage(replyCnt) {
				var endNum = Math.ceil(pageNum / 10.0) * 10;
				var startNum = endNum - 9;

				let prev = startNum != 1;
				let next = false;

				if (endNum * 10 >= replyCnt) {
					endNum = Math.ceil(replyCnt / 10.0);
				}
				if (endNum * 10 < replyCnt) {
					next = true;
				}

				let pageHtml = "<ul class='pagination pull-right'>";

				if (prev) {
					pageHtml += "<li class='page-item'>";
					pageHtml += "<a class='page-link' href='"
							+ (startNum - 1) + "'>";
					pageHtml += "Prev</a></li>";
				}

				for (let i = startNum; i <= endNum; i++) {
					// active : 현재 페이지 번호 표시
					let active = pageNum == i ? "active" : "";
					pageHtml += "<li class='page-item " + active + "'>";
					pageHtml += "<a class='page-link' href='" + i + "'>";
					pageHtml += i + "</a></li>";
				}

				if (next) {
					pageHtml += "<li class='page-item'>";
					pageHtml += "<a class='page-link' href='"
							+ (endNum + 1) + "'>";
					pageHtml += "Next</a></li>";
				}

				pageHtml += "</ul>";

				replyPageFooter.html(pageHtml);
				console.log(pageHtml);

			}

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