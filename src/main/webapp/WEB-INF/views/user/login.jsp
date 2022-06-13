<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN PAGE</title>
<link href="/resources/css/styles.css" rel="stylesheet" />
</head>
<body class="login-body">
   <form class="login-joinForm" action="/user/loginPost" method="post" >
   <div class="login-div">
      <div>
         <input type="text" name="userId" class="login-id" placeholder="아이디">
      </div>
      <div>
         <input type="password" name="userPw" autocomplete='off' class="login-pw" placeholder="비밀번호">
      </div>
      <div class="login-remember">
      <label>
         <input type="checkbox" id="remember" name="useCookie">
      Remember Me </label>
      </div>
      <div >
         <input class="login-join" type="submit" value="L O G I N"/>
      </div>
   <p class="mb-1">
    <a href="javascript:void(0)" onclick="findid()">아이디</a> / 
                          <a href="javascript:void(0)" onclick="findpassword()">비밀번호</a>가 기억나지 않습니다.
   </p>
   <p class="mb-0">
      <a href="/user/register">신규가입하기</a>
   </p>
   </div>
     <script type="text/javascript">
  function findid(){
      var url="find_id_form";
       var _width = "510";
         var _height = "245";
       var _left = Math.ceil(( window.screen.width - _width )/2);
          var _top = Math.ceil(( window.screen.height - _height )/2);
      window.open(url, "_blank_1", "toolbar=no,menubar=no,scrollbars=yes,resizable=no,width="+_width+",height="+_height+ ",left=" + _left + ",top="+ _top);
   }
  
  function findpassword(){
     var url="find_password_form";
      var _width = "510";
         var _height = "280";
       var _left = Math.ceil(( window.screen.width - _width )/2);
          var _top = Math.ceil(( window.screen.height - _height )/2);
     window.open(url, "_blank_1", "toolbar=no,menubar=no,scrollbars=yes,resizable=no,width="+_width+",height="+_height+",left="+ _left +",top="+ _top);
  }
  </script>
   </form>
</body>
</html>