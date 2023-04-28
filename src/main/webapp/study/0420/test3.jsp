<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test3.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
  <style>
  	div {margin: 10px;}
  </style>
  <script>
  	'use strict';
  	
  	function fCheck() {
  		let name = document.myform.name.value.trim();
  		let age = document.getElementById("age").value.trim();
  		
  		if(name == '') {
  			alert("성명을 입력하세요!");
  			myform.name.focus();
  		}
  		else if(age < 20) {
  			alert("20세 이상만 가입 가능합니다.");
  			myform.name.select();
  		}
  		else {
  			myform.submit();   // myform에 있는 모든 내용이 action의 주소로 값을 보내준다!		
  		}
  	}
  </script>
</head>
<body>
<p><br /></p>
<div class='container'>
	<h2>스파게티 코드(막코딩) 정리하기 연습</h2>
	<!-- <form name="myform" method="post" action="test3Ok.jsp"> -->
	  <form name="myform" method="post" action="<%=request.getContextPath()%>/t0420/Test3Ok">
		<div class="border">
			<div>
				성명 :<input type="text" name="name" id="name" value="Hon kil Dong" class="form-control" />
			</div>
			<div>
				나이 :<input type="number" name="age" id="age" value="25" class="form-control" />
			</div>
			<div>
				성별 :<input type="radio" name="gender" value="여자" checked />여자 &nbsp;
						 <input type="radio" name="gender" value="남자" />남자
			</div>
			<div>
				취미 :
				<input type="checkbox" name="hobby" value="등산" checked />등산 &nbsp;
				<input type="checkbox" name="hobby" value="낚시" />낚시 &nbsp;
				<input type="checkbox" name="hobby" value="독서" />독서 &nbsp;
				<input type="checkbox" name="hobby" value="수영" />수영 &nbsp;
				<input type="checkbox" name="hobby" value="바둑" />바둑 &nbsp;
				<input type="checkbox" name="hobby" value="음악감상" />음악감상 &nbsp;
				<input type="checkbox" name="hobby" value="영화감상" />영화감상
			</div>
		</div>	
		<div class="text-center">
			<input type="button" value="전송" onclick="fCheck()" class="btn btn-success mr-3" />
			<input type="reset" value="다시입력" class="btn btn-warning text-center" />
		</div>
	</form>
</div>
<p><br /></p>
</body>
</html>