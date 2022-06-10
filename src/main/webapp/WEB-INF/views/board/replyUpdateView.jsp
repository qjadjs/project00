<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="../resources/css/replyUpdateView.css" rel="stylesheet" />	 	
	 	<title>댓글 수정</title>
	</head>
		<script type="text/javascript">
		$(document).ready(function(){
			$(".close_btn").on("click", function(){
				window.close();
			})
			$(".btn").on("click", function(e){
				e.preventDefault();
				$(".d1").submit();
				opener.parent.location.reload();
				alert("수정되었습니다.")
				
			})
		});
	</script>
	
	
	<body>

		<div id="root">
		<fieldset  class=b1>
			<header>

				<h1 class="c1"> 댓글 수정</h1>

			</header>
			<hr />
					
			<section id="container">
				<form class="d1" name="updateForm" role="form" method="post" action="/board/replyUpdate">
					<input type="hidden" name="bno" value="${replyUpdate.bno}" readonly="readonly"/>
					<input type="hidden" id="rno" name="rno" value="${replyUpdate.rno}" />
					<input type="hidden" id="pageNum" name="pageNum" value="${cri.pageNum}"> 
					<input type="hidden" id="amount" name="amount" value="${cri.amount}"> 
					<input type="hidden" id="type" name="type" value="${cri.type}"> 
					<input type="hidden" id="keyword" name="keyword" value="${cri.keyword}"> 
					<table>
						<tbody>
							<tr>
								<td>
								<label for="reply">수정 할 댓글 내용</label><textarea id="reply" name="reply" value="${replyList.reply}"></textarea>	
								</td>
							</tr>	
							
						</tbody>			
					</table>
					<div>
						<button type="submit" class="btn">수정</button>
						<button type="button" class="close_btn">취소</button>
					</div>
				</form>
			</section>
			<hr />
			</fieldset>
		</div>
	</body>
</html>