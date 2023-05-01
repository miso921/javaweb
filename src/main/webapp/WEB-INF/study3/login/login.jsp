<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br /></p>
<div class='container'>
	<form name="myform" method="post" action="${ctp}/login/LoginOk.pa">
		<table class="table table-bordered text-center">
			<tr>
				<td colspan="2"><b><font size="5">로 그 인 3</font></b></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="mid" autofocus required class="form-control" /></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd" required class="form-control" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인" class="btn btn-success mr-2" />
					<input type="reset" value="다시입력" class="btn btn-secondary mr-2" />
					<input type="button" value="회원가입" onclick="location.href='${ctp}/o__home/Join.pa';" class="btn btn-info mr-2" />
					<input type="checkbox" name="idSave" checked />아이디 저장
				</td>	
			</tr>
		</table>
	</form>
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>