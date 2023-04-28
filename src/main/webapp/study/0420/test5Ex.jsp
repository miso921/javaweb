<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test5.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
</head>
<style>
 div.container {width: 500px;}
</style>
<script>
	'use strict';
	
		function alignCheck() {
  		let su1 = document.getElementById("su1").value.trim();
  		let su2 = document.getElementById("su2").value.trim();
  		let su3 = document.getElementById("su3").value.trim();
  		let su4 = document.getElementById("su4").value.trim();
  		let su5 = document.getElementById("su5").value.trim();
			
  		if(isNaN(su1) || isNaN(su2) || isNaN(su3) || isNaN(su4) || isNaN(su5)) {
  			alert("숫자만 입력하세요.");
  		}
  		else {
	  		myform.submit(); 
  		}
		}
</script>
<body>
<p><br /></p>
<div class='container'>
	<h2>수업 중 과제</h2>
	<p>5개의 수를 입력받아 Servlet에서 정렬 후 view로 값을 넘겨보기</p>
	<form name="myform" method="post" action="<%=request.getContextPath()%>/t0420/Test5OkEx">
		<div class="border">
			<div>
				수1 : <input type="number" name="su" id="su1" class="form-control" />
			</div>	
			<div>
				수2 : <input type="number" name="su" id="su2" class="form-control" />
			</div>	
			<div>
				수3 : <input type="number" name="su" id="su3" class="form-control" />
			</div>	
			<div>
				수4 : <input type="number" name="su" id="su4" class="form-control" />
			</div>	
			<div>
				수5 : <input type="number" name="su" id="su5" class="form-control" />
			</div>	
		</div>
		<div class="text-center">
			<input type="button" value="전송" onclick="alignCheck()" class="btn btn-success mt-3" />
			<input type="reset" value="다시입력" onclick="location.reload()" class="btn btn-primary mt-3" />
		</div>
	</form>
<p><br /></p>
</body>
</html>