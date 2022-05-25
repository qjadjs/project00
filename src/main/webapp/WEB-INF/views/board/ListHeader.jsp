<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color : #212529;">
      <div class="container px-4 px-lg-5">
      <a href="/">
      <img class="list-img"src="https://o.remove.bg/downloads/f88a2e2d-335e-4bf4-942c-ff40f649fa8a/719795-middle-removebg-preview.png" style="width:50px; height:50px;">   
         </a>
         <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarSupportedContent" style="padding : 3rem">
    
            <div class="register-header">
           <c:choose>
					<c:when test="${empty login.userId }">				
						<form class="login-btn">
							<button class="btn btn-outline-dark" type="submit">
								<a href="/user/login" style="text-decoration: none">로그인</a>
							</button>
						</form>
					
						
						<form class="register-btn">
							<button class="btn btn-outline-dark" type="submit">
								<a href="/user/register" style="text-decoration: none">회원가입</a>
							</button>
						</form>
					</c:when>
					<c:otherwise>
						<form class="register-btn">
							<button class="btn btn-outline-dark" type="submit">
								<a href="/user/info" style="text-decoration: none">회원정보</a>
							</button>
						</form>
							<form class="logout-btn">
							<button class="btn btn-outline-dark" type="submit">
								<a href="/user/logout" style="text-decoration: none">로그아웃</a>
							</button>
						</form>
						
					</c:otherwise>
				</c:choose>
				</div>
				</div>	
         </div>
   </nav>
      <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>