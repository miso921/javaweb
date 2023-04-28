<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>loginEx.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
  <script>
  	'use strict'
  	
  	function midCheck() {
  		let mid = document.getElementById("mid").value.trim();
  		const regex = /[a-z0-9_]{4,20}$/gi;
  		
  		if(mid == '') {
  			alert("아이디를 입력해주세요..");
  			document.getElementById("mid").focus();
  		}
  		else if(!regex.test(mid)) {
  			alert("아이디 형식이 올바르지 않습니다!");
  			document.getElementById("mid").select();
  		}	
  		else {
  			alert("사용할 수 있는 아이디입니다~");
  		}
  	}
  	
  	function pwdCheck() {
  		let pwd = document.getElementById("pwd").value.trim();
  		const regex1 = /[a-z0-9\!\@\#\$\%\^\&\*\(\)\-\=\_\+\[\]\{\}\,\.\/\<\>\?\;\:]{4,20}$/gi;
  		
  		if(pwd == '') {
  			alert("비밀번호를 입력해주세요..")
  			document.getElementById("pwd").focus();
  		}
  		else if(!regex1.test(pwd)) document.getElementById("demo").style.display="block";
  		else document.getElementById("demo").style.display="none";
  	}
  </script>
  <style>
	  @font-face {
	  font-family: 'Pretendard-Regular';
	  src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	  font-weight: 400;
	  font-style: normal;
	  }
	  
	  body {
	    font-family: Pretendard-Regular;
	    width: 100%;
	  }
	  
	  .container {
	  	margin-top: 150px;
	  }
	
	  input[type="text"], input[type="password"] {
	    border: none;
	    border-bottom: 1px solid black;
	    outline: none;
	    width: 150px;
	  }
	  
	  .a label {font-size: 1.3em;}
	  
	  #mid {margin-left: 8px;}
	  
	  .dt {
	  	font-size: 1em;
	  	color: #ED4C00;
	  }
  </style>
</head>
<body>
  <br />
  <form name="myform" method="post" action="<%=request.getContextPath()%>/LoginOk">
	  <div class="container text-center">
	    <div><h2><b style="color:#993800;">로그인</b></h2><br /></div>
	    <div class='a'>
	    	<label class="mr-4">아이디</label>
	      <input type="text" name="mid" id='mid' onchange="midCheck()" /><br />
	      <div class='dt'>4~20자의 영문 대소문자, 숫자, 밑줄(_)허용</div>
	    </div><p><br /></p>
	    <div class='a'>
	    	<label class="mr-3">비밀번호</label>
	      <input type="password" name="pwd" id="pwd" onchange="pwdCheck()" /><br />
	      <div class='dt'>4~20자의 영문 대소문자, 숫자, 특수글자 허용</div>
	      <div id='demo' style="display:none; font-size:18px; color:red">올바르지 않는 비밀번호 형식입니다.</div>
	    </div><br />
	    <input type="submit" value="로그인" class="text-center btn btn-success btn-lg" />
	    <input type="button" value="다시 입력" onclick="location.reload()" class="text-center btn btn-secondary btn-lg" />
	    <a href="join.jsp"><input type="button" value="회원가입" class="text-center btn btn-warning btn-lg" /></a>
	    <p><br /></p>
	    <hr />
		  <a href="mainEx.jsp"><font size="4">돌아가기</font></a>
	  </div>
	</form>  
</body>
</html>