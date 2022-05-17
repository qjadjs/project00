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
<title>게시글 작성</title>
</head>
<body>


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
			<

			<div class="panel-body">
				<!-- 댓글 시작 -->
				<ul class="chat">
					<!-- 댓글이 들어올 공간 -->
				</ul>
			</div>
			<div class="panel-footer">
				<!-- 페이지 버튼이 들어온다 -->
			</div>
			<form method="post" action="/write">
			<input type="hidden" name="writer"/><br> <input type="text" name="title"
				style="width: 40%;" placeholder="제목" /> <br>
			<br>
			<textarea id="summernote" name="content"></textarea>
			<input id="subBtn" type="button" value="글 작성" style="float: right;"
				onclick="goWrite(this.form)" />
		</form>
		
<!-- 댓글 등록용 새 창 Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dissmiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>Replyer </label> <input class="form-control" name="replyer"
						placeholder="replyer" readonly>
				</div>
				<div id="summernote">Hello Summernote</div>
			</div>
			<!-- 버튼 모음(수정, 삭제, 등록, 닫기) -->
			<div class="modal-footer">
				<button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
				<button id="modalCloseBtn" type="button" class="btn btn-default">Close</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		
		$('#summernote').summernote({
			  toolbar: [
				    // [groupName, [list of button]]
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
		
		
		
		
		
		var bnoValue = '<c:out value="${board.bno}"/>';
		var replyUL = $(".chat");
		showList(1);
		function showList(page) {
			replyService.getList(
				{bno : bnoValue,
				page : page || 1},
				function(replyCnt, list) {
					console.log("replyCnt : " + replyCnt);
					console.log("list : " + list);

					if (page == -1) {
						pageNum = Math.ceil(replyCnt / 10.0);
						showList(pageNum);
						return;
					}

					var comments = "";
					if (list == null || list.length == 0) {
						replyUL.html("");
						return;}
					for (let i = 0; i < list.length; i++) {
						comments += "<li class='left clearfix' data-rno='" + list[i].rno + "'>";
						comments += "<div>";
						comments += "<div class='header'>";
						comments += "<strong class='primary-font'>" + list[i].replyer + "</strong>";
						comments += " <small class='pull-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small>";
						comments += "</div>";
						comments += "<p>" + list[i].reply + "</p>";
						comments += "</div>";
						comments += "</li>";
					}
					replyUL.html(comments);
					showReplyPage(replyCnt);
			});
		} // showList 함수의 끝

		
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
					pageHtml += "<a class='page-link' href='" + (startNum - 1) + "'>";
					pageHtml += "Prev</a></li>";
				}

				for (let i = startNum; i <= endNum; i++) {
					let active = pageNum == i ? "active" : "";
					pageHtml += "<li class='page-item " + active + "'>";
					pageHtml += "<a class='page-link' href='" + i + "'>";
					pageHtml += i + "</a></li>";
				}

				if (next) {
					pageHtml += "<li class='page-item'>";
					pageHtml += "<a class='page-link' href='" + (endNum + 1) + "'>";
					pageHtml += "Next</a></li>";
				}

				pageHtml += "</ul>";

				replyPageFooter.html(pageHtml);
				console.log(pageHtml);

				} // showReplyPage 함수의 끝

				var modal = $(".modal");
						
				var csrfHeaderName = "${_csrf.headerName}";
				var csrfTokenValue = "${_csrf.token}";
						
				$(document).ajaxSend(function(e, xhr, options){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				}) // xhr = xmlHttpRequest의 줄임말
						
				var replyer = null;

				$("#addReplyBtn").on("click", function(e) {
					modal.find("input[name='replyer']").val(replyer);
							
					modal.find("button[id != 'modalCloseBtn']").hide();
					$("#modalRegisterBtn").show();
					$(".close").show();

					modal.modal("show");
				});

				$("#modalCloseBtn").on("click", function(e) {
					modal.modal("hide");
				})
				$(".close").on("click", function(e) {
					modal.modal("hide");
				})

				var modalInputReply = modal.find("input[name='reply']");
				var modalInputReplyer = modal.find("input[name='replyer']");
				$("#modalRegisterBtn").on("click", function(e) {
					var reply = {
						reply : modalInputReply.val(),
						replyer : modalInputReplyer.val(),
						bno : bnoValue
				}

				replyService.add(reply, function(result) {
					alert(result);

					modal.find("input").val("");
					modal.modal("hide");

					showList(-1);
				})
		})

			$(".chat").on("click","li",function(e) {
				var rno = $(this).data("rno");
				replyService.get(rno,function(reply) {
					modalInputReply.val(reply.reply);
					modalInputReplyer.val(reply.replyer);
					modal.data("rno",reply.rno);
					modal.find("button[id != 'modalCloseBtn']").hide();
					$("#modalModBtn").show();
					$("#modalRemoveBtn").show();

					$(".modal").modal("show");
				});
			})

			$("#modalModBtn").on("click", function(e) {
				let originalReplyer = modalInputReplyer.val();
							
				var reply = {
					rno : modal.data("rno"),
					reply : modalInputReply.val(),
					replyer : originalReplyer
				};

				if(replyer != originalReplyer){
					alert("자신이 작성한 댓글만 수정이 가능합니다");
					modal.modal("hide");
					return;
				}
				replyService.update(reply, function(result) {
				alert(result);
				modal.modal("hide");
				showList(pageNum);
				modal.find("input").val("");
				})
			})

			$("#modalRemoveBtn").on("click", function(e) {

				let rno = modal.data("rno");
				let originalReplyer = modalInputReplyer.val();
							
				if(replyer != originalReplyer){
					alert("자신이 작성한 댓글만 삭제가 가능합니다");
					modal.modal("hide");
					return;
				}
							
				replyService.remove(rno, originalReplyer, function(result) {
					alert(result);
					modal.modal("hide");
					showList(pageNum);
				})
			})

			replyPageFooter.on("click", "li a", function(e) {
				e.preventDefault(); // a 태그 기본 동작 제거
				console.log("page click");
				let target = $(this).attr("href");
				console.log("target page : " + target);
				pageNum = target;
				showList(pageNum);

			});

		})
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