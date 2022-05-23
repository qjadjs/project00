<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container px-4 px-lg-5">   
         <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">


               <li class="nav-item dropdown"><a
                  class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
                  role="button" data-bs-toggle="dropdown" aria-expanded="false">메뉴</a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                     <li><a class="dropdown-item" href="#!">1:1문의</a></li>
                     <li><a class="dropdown-item" href="#!">고객센터</a></li>
                  </ul>
                  </li> 
            </ul>
            <a class="navbar-brand" onClick="window.location.reload()">
               <span class="d-1">밸</span>
               <span class="d-2">런</span>
               <span class="d-3">스</span>
               <span class="d-4">게</span>
               <span class="d-5">임</span>
            </a>
            <form class="login-btn">
               <button class="btn btn-outline-dark" type="submit" ><a href = "/user/login"  style="text-decoration:none">로그인</a></button>
            </form>
            <form class="login-btn">
               <button class="btn btn-outline-dark" type="submit" ><a href = "/user/logout"  style="text-decoration:none">로그아웃</a></button>
            </form>
            <form class="register-btn">
               <button class="btn btn-outline-dark" type="submit" ><a href = "/user/register" style="text-decoration:none">회원가입</a></button>
            </form>
            <form class="register-btn">
               <button class="btn btn-outline-dark" type="submit" ><a href = "/user/info" style="text-decoration:none">회원정보</a></button>
            </form>
         </div>
      </div>
   </nav>
</body>
</html>