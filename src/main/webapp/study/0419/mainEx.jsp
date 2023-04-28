<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>main.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
</head>
<style>
	@font-face {
	  font-family: 'Pretendard-Regular';
	  src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	  font-weight: 400;
	  font-style: normal;
	}
	/* 공통사항 */
	a {
	  text-decoration: inherit;
	  color: inherit;
	}
	
	/* pc 모드 설정하기 */
	#container {
	  width: 960px;
	  margin: 0px auto;
	}
	
	#top {
	  font-family: 'Pretendard-Regular';
	  font-size: 1.1em;
	  line-height: 40px;
	  height: 40px;
	  color: white;
	  background-color: #000;
	  text-align: center;
	}
	
	#top a:hover {
	  color: orangered;
	  text-decoration: none;
	}
	
	.nav-link {
	  margin-right: 50px;
	  margin-top: 20px;
	  position: relative;
	  top: 15px;
	  right: 500px;
	  font-family: 'Pretendard-Regular';
	  font-size: 1.7em;
	}
	
	.nav-link:hover {
	  color: orangered;
	}
	
	
	.logo {
	  height: 40px;
	  margin: 10px 0px 0px 550px;
	  text-align: center;
	}
	
	
	.carousel-inner {
	  text-align: center;
	  margin-left: 30px;
	}
	
	#plant1 {
	  position: absolute;
	  left: 500px;
	  top: 450px;
	  font-family: 'Pretendard-Regular';
	  font-size: 3em;
	  font-weight: 900;
	  color: #fff;
	  text-align: left;
	}
	#plant2 {
	  position: absolute;
	  left: 500px;
	  top: 600px;
	  font-family: 'Pretendard-Regular';
	  font-size: 2em;
	  color: #fff;
	}
</style>
<body>
<div>
  <header>
    <div>
      <h5 id="top"><a href="#">집에서 나만의 것을 만드는 사람들의 커뮤니티 ></a></h5>
    </div>  
      <nav class="navbar">
        <div class="logo">
          <a href="main.jsp"><img src="../../images/Life_zip.jpg" alt="Logo"></a>
        </div>
        <div>
        <ul class="nav justify-content-end">
          <li class="nav-item">
            <a class="nav-link" href="#">프로그램</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">시간상점</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="loginEx.jsp">로그인</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#"><i class="fa-solid fa-magnifying-glass"></i></a>
          </li>
        </ul>
        </div>
      </div>
      </nav>
  </header>
  <section><br />
  <hr />
    <div id="demo" class="carousel slide" data-ride="carousel">

      <!-- Indicators -->
      <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <li data-target="#demo" data-slide-to="1"></li>
      </ul>
      
      <!-- The slideshow -->
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="../../images/plants.jpg" style="width:1800px; height:750px;">
          <div id="plant1">집 안을 싱그럽게 만드는<p>식물 루틴</p></div>
          <div id="plant2"><p>당신의 식물 루틴은 무엇인가요?</p></div>
        </div>
        <div class="carousel-item">
          <img src="../../images/6.jpeg" alt="Chicago" width="1800" height="750">
        </div>
      </div>
      
      <!-- Left and right controls -->
      <a class="carousel-control-prev" href="#demo" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
      </a>
      <a class="carousel-control-next" href="#demo" data-slide="next">
        <span class="carousel-control-next-icon"></span>
      </a>
    </div>
  </section>  
</div>  
</body>
</html>