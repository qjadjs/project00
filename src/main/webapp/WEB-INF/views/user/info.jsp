<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <%
response.setHeader("Pragma", "no-cache"); 
response.setHeader("Cache-Control", "no-cache"); 
response.setHeader("Cache-Control", "no-store"); 
response.setDateHeader("Expires", 0L); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/info.css" rel="stylesheet" />
</head>
<body class="info-body">
<form class="info-form">
<h2 class="info-h2">회원 정보</h2>
<hr class="info-hr"/>
<div class="info-div">
             <div class="col-12">
              <label for="username" class="form-label">Id</label>
              <div class="input-group has-validation">  
                <input type="text" class="form-control" value="${user.userId }" readonly id="userId"> 
              </div>
            </div>
            <div class="col-12">
              <label for="username" class="form-label">Password</label>
              <div class="input-group has-validation">         
                <input type="text" class="form-control" id="userPw" value="${user.userPw }" readonly >
              
              </div>
            </div>
            <div class="col-12">
              <label for="username" class="form-label">Name</label>
              <div class="input-group has-validation">         
                <input type="text" class="form-control" id="userName" value="${user.userName }" readonly>
              
              </div>
            </div>
            <div class="col-12">
              <label for="username" class="form-label">Email</label>
              <div class="input-group has-validation">         
                <input type="text" class="form-control" id="userEmail" value="${user.userEmail }" readonly> 
              </div>
            </div>
       
          </div>

 
      <div>
      <b>가입일자</b> 
                 <fmt:formatDate value="${user.userJoinDate}" pattern="yyyy-MM-dd"/> 
                  </div>
                  <div>
                  <b>최근 로그인 일자</b>
                  <fmt:formatDate value="${user.userLoginDate}" pattern="yyyy-MM-dd"/> 
                  </div>
                  <form class="info-button">
                  
      <input type="button" class="btn" value="메인으로" onclick="location.href='/'">
      <input type="button" value="회원정보수정" class="btn" onclick="updateId()">
   <input type="button" value="로그아웃" class="btn" onclick="location.href='/user/mylogout'">
   <input type="button" value="회원탈퇴" class="btn" onclick="deleteId()"><br>

   <input type="button" value="내가 쓴 게시글" class="btn" onclick="MyBoard()" style="font-size:12px";>
   <input type="button" value="내가 쓴 댓글" class="btn" onclick="MyReply()" style="font-size:12px";>
	
   <script type="text/javascript">
  function deleteId(){
		var url="/user/delete";
			 var _width = "505";
		   var _height = "320";
		 var _left = Math.ceil(( window.screen.width - _width )/2);
		    var _top = Math.ceil(( window.screen.height - _height )/2);
		window.open(url, "_blank_1", "toolbar=no,menubar=no,scrollbars=yes,resizable=no,width="+_width+",height="+_height+ ",left=" + _left + ",top="+ _top);
	}
  
  function updateId(){
	  var url="/user/update";
	   var _width = "505";
		   var _height = "575";
		 var _left = Math.ceil(( window.screen.width - _width )/2);
		    var _top = Math.ceil(( window.screen.height - _height )/2);
		window.open(url, "_blank_1", "toolbar=no,menubar=no,scrollbars=yes,resizable=no,width="+_width+",height="+_height+ ",left=" + _left + ",top="+ _top);
  }
  function MyBoard(){
	  var url="/user/MyBoard";
	   var _width = "600";
		   var _height = "575";
		 var _left = Math.ceil(( window.screen.width - _width )/2);
		    var _top = Math.ceil(( window.screen.height - _height )/2);
		window.open(url, "_blank_1", "toolbar=no,menubar=no,scrollbars=yes,resizable=no,width="+_width+",height="+_height+ ",left=" + _left + ",top="+ _top);
  }
  function MyReply(){
	  var url="/user/MyReply";
	  
	   var _width = "505";
		   var _height = "575";
		 var _left = Math.ceil(( window.screen.width - _width )/2);
		    var _top = Math.ceil(( window.screen.height - _height )/2);
		window.open(url, "_blank_1", "toolbar=no,menubar=no,scrollbars=yes,resizable=no,width="+_width+",height="+_height+ ",left=" + _left + ",top="+ _top);
  }
  </script>
   </form>

</form>
</body>
</html>