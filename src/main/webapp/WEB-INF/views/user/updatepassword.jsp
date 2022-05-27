<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Password</title>
<link href="/resources/css/updatepassword.css" rel="stylesheet" />
</head>
<body>
<fieldset class=b1>
<legend class=c1>비밀번호 변경</legend>
<form method="post" class="form-signin" action="update_password" name="findform">

		<!-- 이름과 비밀번호가 일치하지 않을 때 -->
		<c:if test="${check == 0 }">
		<div class="form-label-group">
		<input type="hidden" id="userId" name="userId" value="${userId }">
		

			<div class=d1>비밀번호</div>

			<input type="password" id="userPw" name="userPw" class="form-control"/>
		</div>
		
		<div class="form-label-group">

			<div class=d1>비밀번호 확인</div>
			<input type="password" id="passwordConfrim" name="passwordConfrim" class="form-control"/>
		</div>
		
		<div class="form-label-group">
				<input class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="button" value="변경" onclick="updatePassword()">
			</div>
		</c:if>

	</form>
	</fieldset>
	<script type="text/javascript">
		function updatePassword(){
			if(document.findform.userPw.value==""){
				alert("비밀번호를 입력해주세요.");
				document.findform.userPw.focus();
			} else if(document.findform.userPw.value != document.findform.passwordConfrim.value){
				alert("비밀번호가 일치하지 않습니다.");
				document.findform.passwordConfrim.value = "";
				document.findform.passwordConfrim.focus();
			} else {
				document.findform.action="update_password";
				document.findform.submit();
			}
		}
	</script>
</body>
</html>