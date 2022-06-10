<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="../resources/css/getHeader.css" rel="stylesheet" />

<title>게시글</title>
<style>
      body {
        font-family: sans-serif;
      }
      .re {
        word-break: keep-all;
      }
</style>
</head>
<body class="b1">
  <%@include file ="../board/Header2.jsp" %>z
    
   <form id="operForm" action="/board/modify" method="get" style="width: 70%; margin:auto; height:auto; background-color:white;">
      <div>
         <input type="hidden" id="bno" name="bno"
            value='<c:out value="${board.bno}"/>'> <input type="hidden"
            name="pageNum" value='<c:out value="${cri.pageNum}"/>'> <input
            type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
         <input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
         <input type="hidden" name="keyword"
            value='<c:out value="${cri.keyword}"/>'>
            <input type="hidden" name="type" value='<c:out value="${board.btype}"/>'/>
      </div>
      
            <div class="hh1" name="title" class="get-title">
              <h3 style="padding-top:20px; padding-bottom:20px;"><c:out value="${board.title}" /></h3>
            </div>
            
              <div id="t4">
               <c:out value="${board.writer}" />
            </div>
          
            
            <br>
            
         <div id="t3" style="min-height:500px; max-height:1000px;">
          
         <br>
         

         <div id="div-img" style="display:flex; justify-content:center;">
         <div id="title1" name="content" class="get-content" onclick="updateSelectA(); return false;">

            <c:out value="${board.content1}" escapeXml="false" /> 
         </div>
         <img id="vs-img" src="/resources/assets/vs.png">
         <div id="title2" name="content" class="get-content" onclick="updateSelectB(); return false;">
            <c:out value="${board.content2}" escapeXml="false" /> 
         </div>
         </div>
         <div>
         <div id="title3" name="content" class="get-content"
      style="float: left;  border: solid 1px; width: 50%; min-width:50%; text-align: center;border-radius: 10px; font-size:17px; min-height:50px;">
            <c:out value="${board.content3}" escapeXml="false" /> 
         </div>
         <div id="title4" name="content" class="get-content"
         style="float: right;  border: solid 1px;width:50%; min-width:50%; text-align:center; border-radius: 10px; font-size:17px; min-height:50px;">
            <c:out value="${board.content4}" escapeXml="false" /> 
         </div>
         <input type="hidden" value='<c:out value="${board.btype }"/>'>
         </div>
         <div id="t3-div" style="display:flex; margin-top:5rem; justify-content:center">
         <div  style="margin-right:1px;">
   <button style="background:#5858FA; border-color:#5858FA;" type="button" class="btn btn-warning " id="like_btn" onclick="updateLike(); return false;"> 추천 ${board.likeCnt}</button>
</div>
<div  style="margin-right:1px;">
   <button type="button" class="btn btn-danger " id="like_btn" onclick="updateDisLike(); return false;">비추 ${board.dislikeCnt}</button>
</div>
</div>
         
         </div>
        
        <div class="modify-remove-div">
         <c:choose>
         <c:when test="${login.userName == board.writer}">   
         <form id="operForm" action="/board/modify" method="get">
         <button data-oper="modify" class="modify-btn">수정</button>
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
      <button data-oper="delete" class="delete-btn">삭제</button>
      </form>
               
         </c:when>
         <c:otherwise>
         </c:otherwise>
         </c:choose>  
         </div> 
   </form>
   


  <div style="width: 70%; margin: auto;">
  <div class="reply_title">
            <h4>댓글<span style="color:#f68400;">${board.replyCnt}</span></h4>
        </div>
      <div class="panel-body-top" style="background-color: white;">
         <!-- 댓글 시작 -->
         <ul class="chat" style="list-style : none;  padding-inline-start:0;">
            <!-- 댓글이 들어올 공간 -->           
         </ul>
         <!-- 댓글 -->
      </div>
      <div id="reply">
  <ol class="replyList">
    <c:forEach items="${replyList}" var="replyList">
      <li>
        <p>
        작성자 : ${replyList.replyer}<br />
        작성 날짜 :  <fmt:formatDate value="${replyList.replyDate}" pattern="yyyy-MM-dd" />
        </p>
 
        <p style="width:350px;" class="re">${replyList.reply}
        </p>     
     <div>
     <c:if test="${login.userName == replyList.replyer}">
  		<button type="button" class="replyUpdateBtn" data-rno="${replyList.rno}" style="border-radius: 0.25rem; border-color: white;">수정</button>
  		<button type="submit" class="replyDeleteBtn" data-rno="${replyList.rno}" style="border-radius: 0.25rem; border-color: white;">삭제</button> 
  		</c:if>       
  		<hr> 		
	</div>
      </li>
    </c:forEach>   
  </ol>
</div>


      
      <div class="panel-footer" style="height:100px; background:white; border-top : 0;">
         <!-- 페이지 버튼이 들어온다 -->
      </div>
      <div class="reply_write">
            <h4>댓글작성</h4>
        </div>
   </div>


<div style="width: 70%; margin: auto;">
      <form method="post" action="/new" class="get-replyform" style="padding-bottom : 100px;">
          <c:choose>
         <c:when test="${login.userName != null}">
         <input type="hidden" name="replyer" value="${login.userName }" /> <br>
         <br>
         <textarea id="summernote" name="reply"></textarea>
         <input id="subBtn2" type="button" value="목록"
            onclick="location.href='/board/list'" /> <input id="subBtn"
            type="button" value="등록" />
            </c:when>
            <c:otherwise>
            <br> <br>
            <input style="width:100%; text-align:center; font-size:15px" value="댓글 기능은 로그인후 이용 가능합니다"/> <br>
            <input id="subBtn2" type="button" value="목록"
            onclick="location.href='/board/list'" />
            </c:otherwise>
            </c:choose>
      </form>
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
            
            ['style', ['bold','strikethrough']],
            ['insert',['picture' ]],
         ],
         fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
         fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']}
   
         var bnoValue = '<c:out value="${board.bno}"/>';
         var replyUL = $(".chat");
         
         
   $(document).ready(function() {
      $('#summernote').summernote(setting);
         console.log("btype :" + "${board.btype}");
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
	  var suserId = "${login.userId}";
      
      $("#subBtn").on("click", function(e) {
         // name 속성이 reply인 input 찾아오기 : 댓글 내용
         // name 속성이 replyer 인 input 찾아아기 : 작성자
         // 게시글 번호 bno 가져와서 reply 객체 만든 뒤에 댓글 달기 기능 실행
         var reply = {
            reply : sreply.val(),
            replyer : sreplyer,
            bno : sbnoVal,
            userId : suserId
            
         };
         
         
         // add(reply, callback)
         replyService.add(reply, function(result) {
            
         
            showList(-1);
            $('#summernote').summernote('reset');//댓글 등록시 텍스트 초기화
            window.location.reload();
           
         })
      });

      //댓글 수정view
   $(".replyUpdateBtn").on("click", function(){
         var url= "/board/replyUpdateView?bno=${board.bno}"
         window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=500")
                       + "&pageNum=${cri.pageNum}"
                       + "&amount=${cri.amount}"
                       + "&type=${cri.type}"
                       + "&keyword=${cri.keyword}"
                       + "&rno="+$(this).attr("data-rno")
      });
      
   //댓글 삭제 View
   $(".replyDeleteBtn").on("click", function(){
      if(!confirm("댓글을 삭제하시겠습니까?")) {
         
      } else{
          location.href = "/board/replyDeleteView?bno=${board.bno}"
              + "&pageNum=${cri.pageNum}"
              + "&amount=${cri.amount}"
              + "&type=${cri.type}"
              + "&keyword=${cri.keyword}"
              + "&rno="+$(this).attr("data-rno")   
      }
       
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
   });
</script>


   <script type="text/javascript">
   $(document).ready(function() {
      var operForm = $("#operForm");
      var operForm2 = $("#operForm2");
      $("button[data-oper='modify']").on("click", function() {
         operForm.submit();
      });
      $("button[data-oper='list']").on("click", function() {
         operForm.find("#bno").remove();
         operForm.attr("action", "/board/list");
         operForm.submit();
      });
      $("button[data-oper='delete']").on("click",function(e){
         e.preventDefault();
         if(confirm("게시글을 삭제하시겠습니까?")){
           operForm2.submit();
         }else{
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
                             location.reload();
                          }
                          else if (likeCheck == 1){
                             location.reload();
                      }
                  }
              });
       }
       
       function updateDisLike(){ 
           $.ajax({
                  type : "POST",  
                  url : "/board/updateDisLike",       
                  dataType : "json",   
                  data : {'bno' : bno, 'userId' : userId},
                  error : function(){
                     alert("로그인 후 이용 가능합니다");
                  },
                  success : function(dislikeCheck) {
                      
                          if(dislikeCheck == 0){
                             location.reload();
                          }
                          else if (dislikeCheck == 1){
                             location.reload();
                      }
                  }
              });
       }
       function updateSelectA(){
    	   var stype = 'a';
    	   $.ajax({
               type : "POST",  
               url : "/board/updateSelectA",       
               dataType : "json",   
               data : {'bno' : bno, 'userId' : userId, 'stype' : stype},
               error : function(){
                  alert("로그인 후 이용 가능합니다");
               },
               success : function(selectCheck) {
                   
            	   if(selectCheck == 0){
                	   alert("선택하셨습니다");
                      location.reload();
                   }
                   else if (selectCheck == 1){
                	   alert("선택이 취소되었습니다");
                      location.reload();
                   }
               }
           });
       }
       function updateSelectB(){
    	   var stype = 'b';
    	   $.ajax({
    		   type : "POST",
    		   url : "/board/updateSelectB",
    		   dataType : "json",
    		   data : {'bno' : bno, 'userId' : userId, 'stype' : stype},
               error : function(){
                  alert("로그인 후 이용 가능합니다");
               },
               success : function(selectCheck) {
                   
                       if(selectCheck == 0){
                    	   alert("선택하셨습니다");
                          location.reload();
                       }
                       else if (selectCheck == 1){
                    	   alert("선택이 취소되었습니다");
                          location.reload();
                   }
               }
           });
       }
</script>