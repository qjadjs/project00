<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${board.title}</title>
</head>
<body>
<div>
<div>
<form>
<div>
<ul>
<li>${board.title }</li>
<li>${board.writer }</li>
<li>${board.regDate}</li>
<li>${board.content}</li>
</ul>
</div>
</form>
</div>
</div>
</body>
</html>