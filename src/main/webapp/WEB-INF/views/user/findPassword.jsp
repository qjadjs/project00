<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Password</title>
</head>
<body>
<form method="post" class="form-signin" action="find_password" name="findform">
<div class="form-label-group">
			<input type="text" id="userId" name="userId" class="form-control"/>
			<label for="id">ID</label>
		</div>
		
		<div class="form-label-group">
			<input type="text" id="userEmail" name="userEmail" class="form-control"/>
			<label for="name">Email</label>
		</div>
		
		<div class="form-label-group">
			<input class="btn btn-lg btn-secondary btn-block text-uppercase"
				type="submit" value="check">
		</div>

		<!-- 정보가 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<script>
			opener.document.findform.userId.value = "";
			opener.document.findform.userEmail.value = "";
			</script>
			<label>일치하는 정보가 존재하지 않습니다.</label>
		</c:if>
		</form>
</body>
</html>