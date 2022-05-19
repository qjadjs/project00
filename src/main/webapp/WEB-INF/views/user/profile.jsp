<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/user/profile" method="post">
<div>
	<ul class="list-group list-group-unbordered mb-5">
		<li class="list-group-item"><b>아이디</b> <a >${login.userId}</a></li>
		<li class="list-group-item"><b>이메일</b> <a >${login.userEmail}</a></li>
		<li class="list-group-item"><b>가입일자</b> <a >${login.userJoinDate }"</a></li>
	</ul>
</div>
	</form>
</body>
</html>