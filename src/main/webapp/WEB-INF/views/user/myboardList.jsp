<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Board List</title>
<link href="/resources/css/updateForm.css" rel="stylesheet" />
</head>
<body>
<fieldset  class=b1>
<legend class=c1>내가 작성한 게시글</legend>
	<form class=d1 action="/user/update" method="post" onsubmit="return checked()">
		<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
							<th>조회수</th>
							<th>추천수</th>
						</tr>
					</thead>
					<!--  모든 등록된 board list 출력 -->
					<c:forEach items="${userBoardList }" var="board">
						<tr>
							<td><c:out value="${board.bno }" /></td>
							<td><a class="move" href="<c:out value='${board.bno}'/>"><c:out
										value="${board.title }" /><b>[<c:out
											value="${board.replyCnt }" />]
								</b></a></td>
							<td><c:out value="${board.writer }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regDate }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updateDate }" /></td>
							<td><c:out value="${board.viewCnt}"/></td>
							<td><c:out value="${board.likeCnt}"/></td>
						</tr>
					</c:forEach>
				</table>
	</form>
</fieldset>
</body>
</html>