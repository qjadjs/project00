<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!-- include summernote css/js-->
<link
   href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
   rel="stylesheet">
<script
   src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<script>
   
</script>
<title>게시글 작성</title>
<link href="../resources/css/write.css" rel="stylesheet" />
</head>
<body>
<%@include file ="../board/Header2.jsp" %>
   <h1 class="hh1">게시글 작성</h1>
      <form method="post" action="/board/write" name="frm" style="width: 70%; margin:auto; height:auto; background-color:white;">
         <input id="t4" type="text" name="writer" value="${login.userName }" readonly="readonly"/>
         <input type="hidden" name="userId" value="${login.userId}">
            <input class="h1" type="text" name="title" placeholder="제목">
            <select name="btype">
            <option selected="selected" value="0">게시판을 선택해주세요
            <option value="1">정치
            <option value="2">스포츠
            <option value="3">문화
            </select>
            <div class="y1">
         <textarea id="summernote1" name="content1"></textarea>
         <textarea id="summernote2" name="content2"></textarea>
            </div>
            <div class="y2">
         <textarea id="t1" name="content3"></textarea>
         <textarea id="t2" name="content4"></textarea>
            </div>
         <input id="subBtn" type="button" value="작성"
            onclick="goWrite(this.form)" /> <input id="subBtn2" type="button"
            value="목록" onclick="location.href='/board/list'" />
      </form>
          
            
            
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
              alert("Success");
          }
         ,error:function(request,status,error, data){
                          alert("이미지를 업로드 할 수 없습니다.");
                   }
      });
   }
   function goWrite(frm) {
      var title = frm.title.value;
      var content3 = frm.content3.value;
      var content4 = frm.content4.value;
      var btype = frm.btype.value;
      if (title.trim() == '') {
         alert("제목을 입력해주세요");
         return false;
      }

      if (content3.trim() && content4.trim() == '') {
         alert("내용을 입력해주세요");
         return false;
      }
      
      if(btype.trim() == 0){
    	  alert("게시판을 선택해주세요");
    	  return false;
      }
      frm.submit();
   };
</script>
</html>