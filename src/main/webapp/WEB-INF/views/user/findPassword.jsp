<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Password</title>
<link href="/resources/css/findpassword.css" rel="stylesheet" />
</head>
<body>
<fieldset class=b1>
<legend class=c1>비밀번호 찾기</legend>
<form method="post" class="form-signin" action="find_password" name="findform">
<div class="form-label-group">

         <div class=d1>아이디를 입력하세요</div>
         <input type="text" id="userId" autocomplete='off' name="userId" class="form-control"/>
      </div>
      
      <div class="form-label-group">
         <div class=d1>이메일을 입력하세요</div>
         <input type="text" id="userEmail" autocomplete='off' name="userEmail" class="form-control"/>
      </div>
      
      <div class="form-label-group">
         <input class="btn btn-lg btn-secondary btn-block text-uppercase"
            type="submit" value="검색">
      </div>

      <!-- 정보가 일치하지 않을 때-->
      <c:if test="${check == 1}">
         <script>
         alert("일치하는 정보가 존재하지 않습니다.");
         opener.document.findform.userId.value = "";
         opener.document.findform.userEmail.value = "";
         </script>
      </c:if>
      </form>
      </fieldset>
</body>
</html>