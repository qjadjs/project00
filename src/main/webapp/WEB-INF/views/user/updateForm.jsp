<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/updateForm.css" rel="stylesheet" />
</head>
<body>
<fieldset  class=b1>
<legend class=c1>회원정보수정</legend>
	<form class=d1 action="/user/update" method="post">
		아이디 <input type="text" name="userId" class="id" value="${user.userId}" readonly><br>
		비밀번호 <input type="text" name="userPw" class="pw" placeholder="${user.userPw}" ><br>
		이름 <input type="text" name="userName" class="name" placeholder="${user.userName} "><br>
		이메일 <input type="text" name="userEmail" class="email" placeholder="${user.userEmail}"><br>
		<div class=btn-div>
		<input type="submit" class="btn" value="회원정보수정하기">
		</div>
	</form>
</fieldset  class=b1>
</body>
</html>