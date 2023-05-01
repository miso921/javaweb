<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test5.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br /></p>
<div class='container'>
	<h2>이 곳은 test5_3.jsp 입니다.</h2>
	<p><img src="${ctp}/images/4.jpg" width="350px" /></p>
	<p>
		<a href="${ctp}/mapping/Test5.do" class="btn btn-primary">test5 호출</a>
		<a href="${ctp}/mapping/Test5_2.do" class="btn btn-secondary">test5_2 호출</a>
		<a href="${ctp}/mapping/Test5_4.do" class="btn btn-success">test5_4 호출</a>
		<a href="${ctp}/mapping/Test5_5.do" class="btn btn-success">test5_5 호출</a>
	</p>
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>