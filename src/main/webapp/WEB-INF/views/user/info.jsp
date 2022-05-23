<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
                <input type="text" class="form-control" value="${user.userId }" readonly id="username" required=""> 
              </div>
            </div>
            <div class="col-12">
              <label for="username" class="form-label">Password</label>
              <div class="input-group has-validation">         
                <input type="text" class="form-control" id="username" value="${user.userPw }" readonly required="">
              
              </div>
            </div>
            <div class="col-12">
              <label for="username" class="form-label">Name</label>
              <div class="input-group has-validation">         
                <input type="text" class="form-control" id="username" value="${user.userName }" required="">
              
              </div>
            </div>
            <div class="col-12">
              <label for="username" class="form-label">Email</label>
              <div class="input-group has-validation">         
                <input type="text" class="form-control" id="username" value="${user.userEmail }" required="">
              
              </div>
            </div>
       
          </div>

 
      <div>
      <b>가입일자</b> 
                  ${user.userJoinDate} 
                  </div>
                  <div>
                  <b>최근 로그인 일자</b>
                  ${user.userLoginDate} 
                  </div>
                  <form class="info-button">
                  
      <input type="button" class="btn" value="메인으로" onclick="location.href='/'">
      <input type="button" value="회원정보수정" class="btn" onclick="location.href='/user/update'">
   <input type="button" value="로그아웃" class="btn" onclick="location.href='/user/logout'">
   <input type="button" value="회원탈퇴" class="btn" onclick="location.href='/user/delete'">
   </form>

</form>
</body>
</html>