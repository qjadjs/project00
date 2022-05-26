<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
   <input type="button" value="로그아웃" class="btn" onclick="location.href='/user/logout'">
   <input type="button" value="회원탈퇴" class="btn" onclick="deleteId()">
    <script type="text/javascript">
  function deleteId(){
		var url="/user/delete";
		
		window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=500");
	}
  
  function updateId(){
	  var url="/user/update";
	  
	  window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=500");
  }
  </script>
   </form>

</form>
</body>
</html>