<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test4.jsp(스파게티 코드로 바꿔보기)</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
</head>
<body>
<p><br /></p>
<div class='container'>
	<%!   // JSP변수와 메소드 등을 선언하는 선언부(메소드를 만들땐 꼭 사용해야함)
		int tot = 0;
	%>
	<h2>1~100까지의 합을 구하세요...</h2>
	<%
		for(int i=1; i<=100; i++) {
			tot += i;
		}
		out.println("1~100까지의 합? "+tot+" 입니다.<br />");
	%>
	<hr />
	일에서 백까지의 합은? <%=tot%> 입니다.
</div>
<p><br /></p>
</body>
</html>