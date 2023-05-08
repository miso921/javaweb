<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br /></p>
<div class='container'>
	<h2>회 원 전 용 방</h2>
	<hr />
		<p><font color ="blue">${sNickName}</font>(${strLevel})님 로그인 중입니다.</p>
		<p>누적포인트:${point}</p>
		<p>총 방문횟수:${visitCnt}</p>
		<p>오늘 방문횟수:${todayCnt}</p>
		<p>방명록에 글 쓴 횟수:name,mid,nickname이 같으면 동명이인이어도 내가 쓴 것으로 처리(횟수 클릭 시 내가 쓴 글 보기)</p>
		<p>회원사진:<img src="${ctp}/images/member/${photo}" width="200px" /></p>
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>