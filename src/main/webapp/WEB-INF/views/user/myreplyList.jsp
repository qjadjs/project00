<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Reply List</title>
<link href="/resources/css/updateForm.css" rel="stylesheet" />
</head>
<body>
<fieldset  class=b1>
<legend class=c1>내가 작성한 댓글</legend>
   <form>
      <table class="table table-striped table-bordered table-hover">
               <thead>
                  <tr>
                     <th>#번호</th>
                     <th>제목</th>
                     <th>내용</th>
                     <th>작성일</th>
                  </tr>
               </thead>
               <!--  모든 등록된 board list 출력 -->
               <c:forEach items="${userReplyList }" var="myreply">
                  <tr>
                     <td><c:out value="${myreply.bno }" /></td>
                     <td><a class="move" href="javascript:goList(${myreply.bno });"><c:out
                              value="${myreply.boardVO.title }" />
                        </a></td>
                     <td><c:out value="${myreply.reply }" /></td>
                     <td><fmt:formatDate pattern="yyyy-MM-dd"
                           value="${myreply.replyDate }" /></td>
                  </tr>
               </c:forEach>
            </table>
   </form>
</fieldset>
</body>
<script type="text/javascript">
function goList(bno) {
   
   opener.parent.location = "/board/get?bno="+ bno;
   window.close();
}

</script>
</html>