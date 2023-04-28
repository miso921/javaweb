<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test8.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
</head>
<body>
<p><br /></p>
<div class='container'>
	<!-- <form name="myform" method="get" action="../../t8Get"> /t8은 서블렛 호출할 때 사용하는 것 -->
<!-- 	<form name="myform" method="post" action="../../t8Post"> --> 
	<form name="myform" method="post" action="<%=request.getContextPath()%>/t8p">  <!-- contextPath를 신경쓰지 않아도 되는 명령을 넣어줌! -->  
		<div>성명 : 
			<input type="text" name="name" class="form-control" />
		</div>
		<div>나이 : 
			<input type="number" name="age" class="form-control" />
		</div>
		<div> 
			<input type="submit" value="전송" class="btn btn-success mt-3" />
		</div>
	</form>
</div>
<p><br /></p>
</body>
</html>