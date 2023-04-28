<!-- 지시자(디렉티브(directive))  -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 페이지 지시자(환경설정/항상 처음에 넣는다!) -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test2.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
</head>
<body>
<p><br /></p>
<div class='container'>
	<h2>JSP 문법</h2>	
	<%-- JSP 주석 --%>
	<%
		// 스크립틀릿(자바코드를 작성하는 영역)
		/*
			자바에서 여러 줄 주석 처리
		*/
		System.out.print("이곳은 JSP파일 안입니다.");
	
		out.println("<font color='red'>이곳은 JSP안에서의 html코드입니다.</font>"); // response 객체 안에 있는 out.println으로 웹에 출력! (JSP는 많이 사용하는 request객체를 내장객체로 심어놨기 때문에 reponse객체를 생성하지 않고 바로 사용가능!)
	%>
	<hr />
	<%="안녕하세요. 이곳은 <b>표현식(Expression)</b> 내부입니다." %> <!-- servlet에서 넘어온 것을 표현했다! -->
</div>
<p><br /></p>
</body>
</html>