<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test5Res.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
  <style>
  	div.container {width: 500px;}
  </style>
  <script>
  	alert('정렬된 값입니다!');
  </script>
  <style>
  	table {width:200px;}
  </style>
</head>
<body>
<p><br /></p>
<div class='container'>
	<table class="table table-bordered">
		<td>정렬값</td>
		<td>${suPrint}</td>
	</table>
	<br />
	<p class="text-center">
		<a href="${pageContext.request.contextPath}/study/0420/test5Ex.jsp" class="btn btn-secondary">돌아가기</a>
	</p>
</div>
<p><br /></p>
</body>
</html>