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
   href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
   rel="stylesheet">
<script
   src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
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
         
         <c:choose>
         <c:when test="${login.userName == board.writer}">   
         <form id="operForm" action="/board/modify" method="get">
         <button data-oper="modify" class="btn-default">수정</button>
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
		<form method="post" action="/board/remove" id="operForm2">
		<input type="hidden" id="bno" name="bno"
               value='<c:out value="${board.bno}"/>'>
		<button data-oper="delete" class="btn-danger">삭제</button>
		</form>
               
         </c:when>
         <c:otherwise>
         </c:otherwise>
         </c:choose>
      <div  style="margin-right:1px;">
   <button type="button" class="btn btn-warning " id="like_btn" onclick="updateLike(); return false;">추천 ${board.likeCnt}</button>
</div>
   </form>
	<div style="width: 50%; margin: auto;">
		<form method="post" action="/new">
			<input type="hidden" name="replyer" value="${login.userName }" /> <br>
			<br>
			<textarea id="summernote" name="reply"></textarea>
			<input id="subBtn2" type="button" value="목록"
				onclick="location.href='/board/list'" /> <input id="subBtn"
				type="button" value="등록" />
		</form>
	
	</div>

   <div style="width: 50%; margin: auto;">
      <div class="panel-body" style="background-color: white;">
         <!-- 댓글 시작 -->
         <ul class="chat">
            <!-- 댓글이 들어올 공간 -->
         </ul>
      </div>
      <div class="panel-footer">
         <!-- 페이지 버튼이 들어온다 -->
      </div>
   </div>

<!-- 푸터 -->
<%@include file ="../board/Footer.jsp" %>

<script type="text/javascript" src="/resources/js/reply.js"></script>
	<script>	
	var setting = {placeholder: '내용을 입력하세요',
	        tabsize: 1,
	        height: 100,
	        disableResizeEditor: true,
			toolbar: [
				['fontname', ['fontname']],
				['fontsize', ['fontsize']],
				['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				['color', ['forecolor','color']],
				['para', ['ul', 'ol', 'paragraph']],
				['height', ['height']],
				['insert',['link']],
			],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']}
	
			var bnoValue = '<c:out value="${board.bno}"/>';
			var replyUL = $(".chat");
         
   $(document).ready(function() {
      $('#summernote').summernote(setting);
         
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
            comments += " <small class='pull-right text-muted'>" + replyService .displayTime(list[i].replyDate)
						+ "</br> <c:choose><c:when test='${login.userName == reply.replyer}'><span class='btn update'>수정</span>&nbsp;&nbsp;&nbsp;<span class='btn delete'>삭제</span></c:when><c:otherwise></c:otherwise></c:choose></small>";
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
            pageHtml += "<a class='page-link' href='" + (startNum - 1) + "'>";
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
            pageHtml += "<a class='page-link' href='" + (endNum + 1) + "'>";
            pageHtml += "Next</a></li>";
         }

         pageHtml += "</ul>";

         replyPageFooter.html(pageHtml);
         console.log(pageHtml);

      }
      
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
           
         };
         
         
         // add(reply, callback)
         replyService.add(reply, function(result) {
            alert(result);
            
           
            showList(-1);
            $('#summernote').summernote('reset');
         })
      });
		
		
		replyPageFooter.on("click", "li a", function(e) {
			e.preventDefault(); // a 태그 기본 동작 제거
			console.log("page click");
			// 이동할 페이지 번호
			// href 속성에 페이지 번호를 저장해놨기에 꺼내 쓴다
			let target = $(this).attr("href");
			console.log("target page : " + target);
			pageNum = target;
			showList(pageNum);

		});
		
		replyUL.on("click", "span .delete", function(e){
			e.preventDefault();
			let rno = $(this).attr("rno");
			replyService.remove(rno, originalReplyer, function(result) {
				alert(result);
				showList(pageNum);
			})
		})
     
      
      replyUL.on("click", ".delete", function(e){
         e.preventDefault();
         let rno = $(this).attr("rno");
         
         $.ajax({
        	 url: "replies/{rno}"
        	 , data : 'rno'
        	 , type : 'DELETE'
        	 , dataType : 'text'
        	 , success: function(result){
        		 showList(PageNum);
        		 }
        	 , error: function(error){
        		 console.log("에러 : " + error);
        		 }
        	 });
        
      });
      
   });
</script>


   <script type="text/javascript">
   $(document).ready(function() {
      var operForm = $("#operForm");
      $("button[data-oper='modify']").on("click", function() {
         operForm.submit();
      });
      var operForm2 = $("#operForm2");
      $("button[data-oper='delete']").on("click", function(e) {
    	  e.preventDefault();
    	  if (confirm("게시글을 삭제하시겠습니까?")) {
    		  operForm2.submit();
          } else {
        	  return;
          }
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
		                    	alert("추천완료");
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