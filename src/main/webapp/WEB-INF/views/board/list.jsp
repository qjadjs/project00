<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<link href="../resources/css/header.css" rel="stylesheet" />
<link href="../resources/css/board.css" rel="stylesheet" />
<link href="../resources/css/footer.css" rel="stylesheet" />
</head>
<body>
<div class="row">
<!-- 헤더-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container px-4 px-lg-5">   
         <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">


               <li class="nav-item dropdown"><a
                  class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
                  role="button" data-bs-toggle="dropdown" aria-expanded="false">메뉴</a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                     <li><a class="dropdown-item" href="#!">1:1문의</a></li>
                     <li><a class="dropdown-item" href="#!">고객센터</a></li>
                  </ul>
                  </li> 
            </ul>
            <a class="navbar-brand" onClick="window.location.reload()">
               <span class="d-1">밸</span>
               <span class="d-2">런</span>
               <span class="d-3">스</span>
               <span class="d-4">게</span>
               <span class="d-5">임</span>
            </a>
            <form class="login-btn">
               <button class="btn btn-outline-dark" type="submit" ><a href = "/user/login"  style="text-decoration:none">로그인</a></button>
            </form>
            <form class="login-btn">
               <button class="btn btn-outline-dark" type="submit" ><a href = "/user/logout"  style="text-decoration:none">로그아웃</a></button>
            </form>
            <form class="register-btn">
               <button class="btn btn-outline-dark" type="submit" ><a href = "/user/register" style="text-decoration:none">회원가입</a></button>
            </form>
            <form class="register-btn">
               <button class="btn btn-outline-dark" type="submit" ><a href = "/user/profile" style="text-decoration:none">회원정보</a></button>
            </form>
         </div>
      </div>
   </nav>



	<div class="col-lg-12">
		<h1 class="page-header">게시판</h1>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				전체글
				<button id="regBtn" type="button" class="btn btn-xs pull-right">글쓰기</button>
			</div>
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<!--  모든 등록된 board list 출력 -->
					<c:forEach items="${list }" var="board">
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
						</tr>
					</c:forEach>
				</table>
				<!-- 검색 기능 -->
				<!-- 페이지 번호 파라미터는 유지 + 검색 조건, 키워드 -->
				<!-- 화면에서 검색을 하면 새로 검색을 한다는 의미 -> 1페이지로 이동 -->
				<div class="row">
					<div class="col-la-12">
						<form id="searchForm" action="/board/list" method="get">
							<select name="type">
								<option value=""
									<c:out value="${pageMaker.cri.type == null? 'selected' : '' }"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'? 'selected' : '' }"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'? 'selected' : '' }"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'? 'selected' : '' }"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'? 'selected' : '' }"/>>제목
									or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'? 'selected' : '' }"/>>제목
									or 작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'? 'selected' : '' }"/>>제목
									or 내용 or 작성자</option>
							</select> 
							<input type="text" name="keyword" value="<c:out value='${pageMaker.cri.keyword }'/>" />
							<!-- 페이지 정보 포함 -->
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }" /> 
							<input type="hidden" name="amount" value="${pageMaker.cri.amount }" />
							<button class="btn btn-default">검색</button>
						</form>
					</div>
				</div>

				<!-- 페이지 처리 -->
				<!-- 페이지 정보를 저장하는 form 사용자에게 보여주지 않는다 -->
				<!-- 이 폼을 submit하면 pageNum에 맞는 페이지를 보여주도록 한다 -->
				<form id="actionForm" action="/board/list" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }" /> 
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }" /> 
					<input type="hidden" name="type" value="<c:out value='${pageMaker.cri.type }'/>" /> 
					<input type="hidden" name="keyword" value="<c:out value='${pageMaker.cri.keyword }'/>" />
				</form>
				<div class="pull-right">
					<ul class="pagination">
						<c:if test="${pageMaker.prev }">
							<li class="paginate_button previous">
							<a href="${pageMaker.startPage-1 }">Prev</a>
							</li>
						</c:if>
						<!-- 이전 1 2 3 4 5 다음 -->
						<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class="paginate_button"><a href="${num }">${num }</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li class="paginate_button next">
							<a href="${pageMaker.endPage+1 }">Next</a>
							</li>
						</c:if>
					</ul>
				</div>

				<!-- 알림 추가/ 지금까지 사용한 알림 방법-alert() : 브라우제에서 제공하는 기본 함수, 
							 Modal : 커스터마이징한 창을 띄워서 알려준다 -->
				
				</div>
			</div>
		</div>
	</div>
	
	
 <!-- Footer-->
   <footer class="bg-dark1">
      <div class="container-bottom">
         <p class="text-center text-white">Globalin &copy; Your
            Website 2022</p>
      </div>
   </footer>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		var result = "<c:out value = '${result}'/>";
		

	
		$("#regBtn").on("click", function() {
			self.location = "/board/write";
		})

		var actionForm = $("#actionForm")

		$(".paginate_button a").on("click",function(e) {
			e.preventDefault();
			console.log("click");
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.attr("action", "/board/list");
			actionForm.submit();
		})

		$(".move").on("click",function(e) {
			e.preventDefault();
			if (actionForm.find("input[name='bno']").val() == null) {
				actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
				actionForm.attr("action","/board/get");
			} else {
				actionForm.find("input[name='bno']").val($(this).attr("href"))
			}
			actionForm.submit();
		})

		var searchForm = $("#searchForm");

		$("#searchForm button").on("click",function(e) {
			e.preventDefault();

			if (!searchForm.find("option:selected").val()) {
				alert("검색 조건을 선택하세요");
				return false;
			}

			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();

			searchForm.submit();
		})
	})
</script>
</body>
</html>