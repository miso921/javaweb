<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>t1_CookiesCheck.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br /></p>
<div class='container'>
	<h2>저장된 쿠키 확인하기(배열로 읽는다)</h2>
	<hr />
<%
	Cookie[] cookies = request.getCookies();  /* 저장된 쿠키를 배열로 받아온다! */
	
	// System.out.println("cookies = " +cookies);  주소로 배열이 저장됨 
	
	out.println("저장된 쿠키는?<br />");
	for(int i=0; i<cookies.length; i++) {
		out.println("쿠키명 : " + cookies[i].getName() + ",");
		out.println("쿠키값 : " + cookies[i].getValue() + "<br />");
	}
%>
	<hr />
	<div>
		<a href="t1_CookiesMain.jsp" class="btn btn-warning" />돌아가기</a>
	</div>
</div>
<p><br /></p>
</body>
</html>