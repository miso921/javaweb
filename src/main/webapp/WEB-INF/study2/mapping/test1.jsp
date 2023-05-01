<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test1.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br /></p>
<div class='container'>
	<h2>이 곳은 /WEB-INF/study2/mapping/test1.jsp</h2>
	<div>
		<div>두 수의 합 : ${hap}</div>
		<div>두 수의 차 : ${cha}</div>
	</div>>
	<p>
		<a href="${ctp}/mapping/Test2" class="btn btn-success">test2.jsp 바로가기</a>
		<a href="${ctp}/mapping/Test3" class="btn btn-warning">test3.jsp 바로가기</a>
		<a href="${ctp}/mapping/Test4?su1=100&su2=50" class="btn btn-info">test4.jsp 바로가기</a>
	</p>
	<pre>이 곳은 보안폴더로 URL로 들어갈 수 없고 Controller를 통해 접근 가능</pre>
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>