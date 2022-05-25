<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js--> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet"> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script src="/resources/js/summernote-ko-KR.js"></script>
<link href="../resources/css/get.css" rel="stylesheet" />
<title>게시글</title>
</head>
<body class="b1">
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
				<div class="hh1" name="title">
					<c:out value="${board.title}" />
				</div>
				<br>
			<div id="t3">
				<div id="t4">
					<c:out value="${board.writer}" />
				</div>
			<br>
			
			<div id="title3" name="content">
				<c:out value="${board.content}" escapeXml="false" /> 
			</div>
			</div>
			<button data-oper="modify" class="btn-default">수정</button>
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
		<div  style="margin-right:1px;">
	<button type="button" class="btn btn-warning " id="like_btn" onclick="updateLike(); return false;">추천 ${board.likeCnt}</button>
</div>
	</form>

	<form name="replyForm" method="post">
		<input type="hidden" id="bno" name="bno" value="${read.bno }"/>
		<input type="hidden" id="pageNum" name="pageNum" value="${scri.getPageNum }"/>
		<input type="hidden" id="amount" name="amonut" value="${scri.getAmount}"> 
  		<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
  		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">

<<<<<<< HEAD
	<div style="width: 50%; margin: auto;">
		<form method="post" action="/new">
			<input type="hidden" name="replyer" value="${login.userName }"/> <br> <br>
=======

	<div style="width: 55%; margin: auto;">
		
			<input class="form-control input-sm" id="newReplyer"
			name="rpelyer" type="text" placeholder="댓글 작성자">

>>>>>>> branch 'master' of https://github.com/qjadjs/project00.git
			<textarea id="summernote" name="reply"></textarea>

			<input id="subBtn2" type="button" value="목록" onclick="location.href='/board/list'" />
<<<<<<< HEAD
			<input id="subBtn" type="button" value="댓글 작성"  />
		</form>
=======
			<input id="subBtn" type="button" value="댓글 작성" class="replyAddBtn" />

>>>>>>> branch 'master' of https://github.com/qjadjs/project00.git
	</div>

<<<<<<< HEAD
	<div style="width: 50%; margin: auto;">
		<div class="panel-body" style="background-color: white;">
			<!-- 댓글 시작 -->
			<ul class="chat">
				<!-- 댓글이 들어올 공간 -->
			</ul>
		</div>
=======
	</form>
		



<!-- 댓글 -->
<div id="reply">
  <ol class="replyList">
    <c:forEach items="${replyList}" var="replyList">
      <li>
        <p>
          작성자 : ${replyList.replyer}<br />
          작성 날짜 :  <fmt:formatDate pattern="yyyy-MM-dd"
          	   value="${replyList.replyDate }" />
        </p>

        <p>${replyList.reply}</p> <hr/>
      </li>
    </c:forEach>   
  </ol>
</div> <!-- 댓글 끝 -->

>>>>>>> branch 'master' of https://github.com/qjadjs/project00.git
		<div class="panel-footer">
			<!-- 페이지 버튼이 들어온다 -->
		</div>


	

<<<<<<< HEAD
<script type="text/javascript" src="/resources/js/reply.js"></script>
	<script>		
=======
	<script type="text/javascript" src="/resources/js/reply.js"></script>
	<script>	
	
>>>>>>> branch 'master' of https://github.com/qjadjs/project00.git
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
<<<<<<< HEAD
</script>
<script>
$(document).ready(function() {
var sreply = $("#summernote");
var sreplyer = "${login.userName}";
var sbnoVal = '<c:out value="${board.bno}"/>';

$("#subBtn").on("click", function(e) {
	// name 속성이 reply인 input 찾아오기 : 댓글 내용
	// name 속성이 replyer 인 input 찾아아기 : 작성자
	// 게시글 번호 bno 가져와서 reply 객체 만든 뒤에 댓글 달기 기능 실행
	var reply = {
		reply : sreply.val(),
		replyer : sreplyer,
		bno : sbnoVal
	}
	
	
	// add(reply, callback)
	replyService.add(reply, function(result) {
		alert(result);

		showList(-1);
	})
})

})
=======
		
		//댓글 등록 이벤트
		
		$(".replyAddBtn").on("click", function() {
			var formObj = $("form[name='replyForm']");
			formObj.attr("action", "/board/new");
			formObj.submit();
		});
		/*
		$(".replyAddBtn").on("click" , function() {
			
			var replyer = $("#newReplyer");
			var reply_text = $("#summernote");
			
			var replyerVal = replyer.val();
			var reply_textVal = reply_text.val();
			
			
			$.ajax({
				
			type : "post",
			url : "/replies/new",
			contentType : "application/json; charset=utf-8",
			dataType : "text",
			data : JSON.stringify({
				bno : bno,
				replyer : replyerVal,
				reply_text : reply_textVal
			}),
			
			success : function (result) {
				//성공적인 댓글 등록 처리 알림
				if(result == "regSuccess") {
					alert("댓글등록 완료")
				};
				getReplis();
				replyer.val("");
				reply_text.val("");
			}
			
			});
			
			
		});
			*/

>>>>>>> branch 'master' of https://github.com/qjadjs/project00.git
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
	<script>
	
		var bno = ${board.bno};
		var userId = "${login.userId}";
		
		 function updateLike(){ 
		     $.ajax({
		            type : "POST",  
		            url : "/board/updateLike",       
		            dataType : "json",   
		            data : {'bno' : bno, 'userId' : userId},
		            error : function(){
		               alert("로그인 후 이용 가능합니다");
		            },
		            success : function(likeCheck) {
		                
		                    if(likeCheck == 0){
		                    	alert("추천완료.");
		                    	location.reload();
		                    }
		                    else if (likeCheck == 1){
		                     alert("추천취소");
		                    	location.reload();

		                    
		                }
		            }
		        });
		 }
</script>