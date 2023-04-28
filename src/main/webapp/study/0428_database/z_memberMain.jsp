<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/include/memberCheck.jsp" />
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>memberMain.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br /></p>
<div class='container'>
	<h2>로그인 성공한 사람들만의 공간입니다.(회원전용방)</h2>
	<p>현재 ${sMid},${sName}님 로그인 중이십니다.</p>
	<hr />
	<p>보유 포인트 : ${sPoint} / 최종 접속일 : ${fn:substring(sLastDate,0,16)} / 오늘 접속 횟수 : ${sTcnt}회</p>
	<hr />
	<p><img src="${ctp}/images/6.jpg" width="300px" /></p>
	<hr />
	<div>
		<a href="${ctp}/database/z_Logout" class="btn btn-success">로그아웃</a>
	</div>
</div>
<p><br /></p>
</body>
</html>