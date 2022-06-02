<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/deleteForm.css" rel="stylesheet" />
</head>
<body>
<fieldset class=b1>
	<legend class=c1>회원탈퇴</legend>
	<form class=d1 action="/user/delete" method="post">
	<!-- input타입중 hidden은 화면에 있는 해당 input태그를 숨겨서 정보 전달   -->
		아이디  <input class="id" type="text" name="userId" value="${user.userId }" readonly><br>
		비밀번호  <input class="pw" type="password" name="userPw"><br>
		<input type="submit" class="btn" value="탈퇴하기">
	</form>
</fieldset>
</body>
</html>