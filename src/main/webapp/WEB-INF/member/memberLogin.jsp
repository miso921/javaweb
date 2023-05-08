<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberLogin.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br /></p>
<div class='container'>
	<div class="modal-dialog">
		<div class="modal-content p-4">
			<h2 class='text-center'><b><font size="5">회 원 로 그 인</font></b></h2>
			<p class="text-center"> 회원 아이디와 비밀번호를 입력해주세요</p>
			<form name="myform" method="post" action="${ctp}/MemberLoginOk.mem" class="was-validated">
		    <div class="form-group">
		      <label for="mid">회원아이디</label>
		      <input type="text" class="form-control" name="mid" id="mid" value="${cMid}" placeholder="아이디를 입력하세요" required autofocus />
		      <div class="valid-feedback">올바르게 입력했습니다.</div>
		      <div class="invalid-feedback">아이디를 입력해주세요.</div>
		    </div>
		    <div class="form-group">
		      <label for="email">비밀번호</label>
		      <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요" required />
		      <div class="valid-feedback">올바르게 입력했습니다.</div>
		      <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
		    </div>
		    <div class="form-group text-center">
		    	<button type="submit" class="btn btn-primary mr-1">로그인</button>
		    	<button type="reset" class="btn btn-warning mr-1">다시입력</button>
		    	<button type="button" class="btn btn-danger mr-1" onclick="location.href='${ctp}/';">돌아가기</button>  <!-- location에 아무것도 안쓰면 root로 이동(홈) -->
		    	<button type="button" class="btn btn-warning" onclick="location.href='${ctp}/MemberJoin.mem';">회원가입</button>
		    </div>
		    <div class="row text-center" style="font-size=12px">
		    	<span class="col"><input type="checkbox" name="idSave" checked />아이디 저장</span>
		    	<span class="col">
		    		[<a href="${ctp}/MemberFindMid.mem">아이디 찾기</a>] 
		    		[<a href="${ctp}/MemberFindPwd.mem">비밀번호 찾기</a>]
		    	</span>
		    </div>
		    <input type="hidden" name="hostIp" value="<%=request.getRemoteAddr()%>" />
		  </form>
		</div> 
  </div>
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>