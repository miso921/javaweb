<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberFindMid.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br /></p>
<div class='container'>
	<div class="modal-dialog">
		<div class="modal-content p-4">
			<h2 class='text-center'><b><font size="5">아 이 디 찾 기</font></b></h2>
			<form name="myform" method="post" action="${ctp}/MemberFindMidOk.mem" class="was-validated">
		    <div class="form-group">
		      <label for="name">이 름</label>
		      <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력하세요" required autofocus />
		    </div>
		    <div class="form-group">
		      <label for="tel">전 화 번 호</label>
		      <input type="tel" class="form-control" name="tel" id="tel" placeholder="전화번호를 입력하세요" required />
		    </div>
		    <div class="form-group text-center">
		    	<button type="submit" class="btn btn-primary mr-1">확인</button>
		    	<button type="reset" class="btn btn-warning mr-1">다시입력</button>
		    	<button type="button" class="btn btn-danger mr-1" onclick="location.href='${ctp}/';">돌아가기</button>  <!-- location에 아무것도 안쓰면 root로 이동(홈) -->
		    	<button type="button" class="btn btn-warning" onclick="location.href='${ctp}/MemberJoin.mem';">회원가입</button>
		    </div>
		  </form>
		</div> 
  </div>
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>