<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>join.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<style>
	th {
		background-color:#aaa;
	}
</style>
<script>
 'use strict';
 
 	function fCheck() {
 		// 폼의 내용을 가져와서 유효성 검사(아이디/비밀번호/성명..공백과 길이 체크..글자는 모두 20자 이내)
 		// 아이디 체크
 		
 		myform.submit();
 	}
</script>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<p><br /></p>
<div class='container'>
	<h2>회 원 가 입2</h2>
	<form name="myform" method="post" action="${ctp}/database/JoinOk.re">   <!-- /database는 신경안써도되고 뒤에 확장자 .re만 맞으면됨 -->
		<table class="table table-bordered text-center">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="mid" id="mid" required autofocus class="form-control" /></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd" id="pwd" required class="form-control" /></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="text" name="name" id="name" required class="form-control" /></td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<!-- <input type="submit" value="회원가입" onclick="fCheck()" class="btn btn-success mr-2" /> -->
					<input type="submit" value="회원가입" class="btn btn-success mr-2" />
					<input type="reset" value="다시입력" class="btn btn-info mr-2" />
					<input type="button" value="돌아가기" onclick="location.href='${ctp}/dfldfsoehgjseridfdgn/Login.re';" class="btn btn-warning" />
				</td>
			</tr>
		</table>
	</form>
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>