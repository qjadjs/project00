<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>BALANCE GAME</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico"/>
<!-- Bootstrap icons-->

<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/header2.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />

</head>
<body>
<!-- 헤더jsp -->
  <%@include file ="../views/board/Header.jsp" %>
  
   <!-- Header-->
   <header class="bg-dark py-5">
      <div class="container px-4 px-lg-5 my-5">
      </div>
<!--container {-->
<section id="container">

    <div class="slideNum">
        <span id="thisSlide">0</span> / <span id="allSlide">0</span>
    </div>

    <article class="slides" style="width: 100%; height:100%; ">
    <a href="http://localhost:9020/board/get?pageNum=1&amount=10&type=&keyword=&bno=12870">
        <img src="../resources/assets/j1.jpg" >
    </a>
    </article>
    <article class="slides">
    <a href="http://localhost:9020/board/get?pageNum=1&amount=10&type=&keyword=&bno=12869">
        <img src="../resources/assets/j2.jpg">
    </a>
    </article>
    <article class="slides">
    <a href="http://localhost:9020/board/get?pageNum=1&amount=10&type=&keyword=&bno=12866">
        <img src="../resources/assets/j3.jpg">
  </a>
    </article>
    <article class="slides">
        <a href="http://localhost:9020/board/get?pageNum=1&amount=10&type=&keyword=&bno=12871">
        <img src="../resources/assets/j4.jpg">
  </a>
    </article><!--5-->
    <article class="slides">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFLuKNSvms9Y8bhZhbrvLZVRF-3Cl5BwyiJQ&usqp=CAU">
    </article><!--6-->
    
    <div class="arrow prev" onclick = "prevNext(-1)">&#10096;</div>
<div class="arrow next" onclick = "prevNext(1)">&#10097;</div> 
</section><!-- } container-->

<!--pager {-->
<section id="pager">
    <span class="dots on" onclick="currentSlide(1)"></span>
    <span class="dots" onclick="currentSlide(2)"></span>
    <span class="dots" onclick="currentSlide(3)"></span>
    <span class="dots" onclick="currentSlide(4)"></span>
    <span class="dots" onclick="currentSlide(5)"></span>
    <div></div>
    <input class="slideStopStart" type="button" value="STOP" onclick="stopSlide()"/>
<input class="slideStopStart" type="button" value="&#9654;" onclick="showSlides()"/>
</section><!--pager }-->



<br>

<div style="text-align:center" >
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
  <span class="dot" onclick="currentSlide(4)"></span> 
  <span class="dot" onclick="currentSlide(5)"></span> 
</div>
   </header>
   <!-- Section-->
   <section class="py-5">
      <div class="container">
         <div
            class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                  <!-- Product image-->
                  <a href="board/list">
                  <button type="button" class="cardbutton">
                        <img id="img1"
                        src="resources/assets/q11.jpg"
                        onmouseover="this.src='resources/assets/q12.gif'"
                        onmouseout="this.src='resources/assets/q11.jpg'">
                  </button>
                  </a>

               </div>
         </div>
         
   </section>
   
   
  <!-- 푸터jsp -->
  <%@include file ="../views/board/Footer.jsp" %>
  
   <!-- Bootstrap core JS-->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <!-- Core theme JS-->

   <script src="resources/js/scripts.js"></script>
   <script src="resources/js/animation.js"></script>
</body>
</html>