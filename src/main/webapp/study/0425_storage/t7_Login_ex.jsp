<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//방문 횟수 카운트하기
	ServeletContext
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>t6_Login.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
		div {
			margin: 10px;
		}
	</style>
</head>
<body>
<p><br /></p>
<div class='container'>
	<form name="loginForm" method="post" action="<%=request.getContextPath()%>/t0425/T7_LoginOk_ex">
		<h2>로 그 인</h2>
		<p>샘플 : admin(1234), hkd1234(1234)</p>
		<div>
			아이디
			<input type="text" name="mid" value="${mid}" class="form-control" />
		</div>
		<div>
			비밀번호
			<input type="password" name="pwd" class="form-control" />
		</div>
		<div class="text-center">
			<input type="submit" value="로그인" class="btn btn-success" /> &nbsp;
			<input type="reset" value="다시입력" class="btn btn-warning" /> &nbsp; &nbsp; &nbsp;
			<input type="checkbox" name="idSave" checked /> 아이디 저장
		</div>
	</form>
</div>
<p><br /></p>
</body>
</html>