<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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

               <li class="nav-item" ><a
                  class="nav-link " id="navbarDropdown" href="#"
                  role="button"  aria-expanded="false"></a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
<!--  
                     <li><a class="dropdown-item" href="#!">1:1문의</a></li>
                     <li><a class="dropdown-item" href="#!">고객센터</a></li>
-->
                  </ul>
                  </li> 
            </ul>
            <a class="navbar-brand" onClick="window.location.reload()">
               <h1>
               <span id="o1">B</span>
               <span id="o1">A</span>
               <span id="o1">L</span>
               <span id="o1">A</span>
               <span id="o1">N</span>
               <span id="o1">C</span>
               <span id="o1">E</span>
               <span id="o1"></span>
               <span id="o1">G</span>
               <span id="o1">A</span>
               <span id="o1">M</span>
               <span id="o1">E</span>
               </h1>
            </a>
           
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