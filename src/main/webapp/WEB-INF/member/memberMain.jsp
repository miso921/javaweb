<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberMain.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br /></p>
<div class='container'>
	<h2 class='text-center'>회 원 전 용 방</h2>
	<hr />
		<p><font color ="blue">${sNickName}</font>(${strLevel})님 로그인 중입니다.</p>
		<p>누적포인트:&nbsp;${point}점</p>
		<p>총 방문횟수:&nbsp;${visitCnt}회</p>
		<p>오늘 방문횟수:&nbsp;${todayCnt}회</p>
		<p>회원사진:&nbsp;<img src="${ctp}/images/member/${photo}" width="200px" /></p>
		<p>방명록에 올린 글 수:&nbsp;<a href="${ctp}/MemberGuestList.mem">${res}개</a></p>
		<p>게시판에 올린 글 수:&nbsp;개</p>
		<p>자료실에 올린 글 수:&nbsp;개</p>
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>