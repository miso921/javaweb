<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>hw_Member.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br /></p>
<div class='container'>
	<h2>회원님의 공간입니다.</h2>
	<hr />
	${sMid}님 환영합니다~
	<p><a href="<%=request.getContextPath()%>/t0424/Hw_LogOut" class="btn btn-info">로그아웃</a></p>
</div>
<p><br /></p>
</body>
</html>