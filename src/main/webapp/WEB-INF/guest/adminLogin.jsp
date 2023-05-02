<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>adminLogin.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<style>
	th {
		background-color: #eee;
		text-align: center;
	}
</style>
<body>
<jsp:include page="/include/header.jsp" />
<p><br /></p>
<div class='container'>
	<form name="myform" method="post" action="${ctp}/AdminLoginOk.gu">
		<h2 class="text-center">관 리 자 로 그 인</h2>
		<table class="table table-bordered">
			<tr>
				<th>관리자 아이디</th>
				<td colspan="2"><input type="text" name="mid" id="mid" class="form-control" required /></td>
			</tr>
			<tr>
				<th>관리자 비밀번호</th>
				<td colspan="2"><input type="password" name="pwd" id="pwd" class="form-control" required /></td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<input type="submit" value="관리자로그인" class="btn btn-success" />
					<input type="reset" value="다시입력" class="btn btn-info" />
					<input type="button" value="돌아가기" onclick="location.href='${ctp}/GuestList.gu';" class="btn btn-warning" />
				</td>
			</tr>
		</table>
	</form>
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>