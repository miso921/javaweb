<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>guestInput.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br /></p>
<div class='container'>
	<h2 class='text-center'><b><font size="5">방 명 록 작 성</font></b></h2>
	<form name="myform" method="post" action="${ctp}/GuestInputOk.gu" class="was-validated">
    <div class="form-group">
      <label for="name">작성자명</label>
      <input type="text" class="form-control" id="name" placeholder="성명을 입력하세요" name="name" required />
      <div class="valid-feedback">올바르게 입력했습니다.</div>
      <div class="invalid-feedback">성명을 입력해주세요.</div>
    </div>
    <div class="form-group">
      <label for="email">E-mail</label>
      <input type="text" class="form-control" id="email" placeholder="이메일 주소를 입력하세요" name="email" />
    </div>
    <div class="form-group">
      <label for="homePage">HomePage</label>
      <input type="text" class="form-control" id="homePage" placeholder="홈페이지 주소를 입력하세요" name="homePage" value="https://" />
    </div>
    <div class="form-group">
      <label for="content">방문소감</label>
      <textarea rows="5" name="content" id="content" required class="form-control"></textarea>
      <div class="valid-feedback">올바르게 입력했습니다.</div>
      <div class="invalid-feedback">방문소감을 입력해주세요.</div>
    </div>
    <div class="form-group text-center">
    	<button type="submit" class="btn btn-primary mr-3">방명록 등록</button>
    	<button type="reset" class="btn btn-warning mr-3">방명록 다시쓰기</button>
    	<button type="button" class="btn btn-danger" onclick="location.href='${ctp}/*GuestList.gu';">돌아가기</button>
    </div>
    <input type="hidden" name="hostIp" value="<%=request.getRemoteAddr()%>" />
  </form>
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>