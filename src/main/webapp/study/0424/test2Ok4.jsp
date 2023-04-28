<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  <!-- prefix(접두어) : 태그 언어에 c를 사용하면 core lib를 사용할 수 있다! -->
<%-- 스크립틀릿 대신에 jstl을 사용한다. --%>
<%-- 앞에서 전송된 값들을 변수에 담지 않고 vo 객체에 담아보자 --%>
<%-- jsp에서 객체를 사용하기 위해서는 해당 객체를 jsp 액션태그(useBean)를 사용해서 생성해야 한다.   --%>
<jsp:useBean id="vo" class="study.t0424.Test1VO" /> <%-- jsp에서 객체 생성하는 방법 >> java에서는... Atom vo = new Atom(); 이렇게 생성함 --%>

<%-- servlet에서는 getter()와 setter()를 이용해서 값을 불러오거나 저장시켜준다. --%>
<%-- jsp에서는 getProperty와 setProperty를 이용해서 값을 불러오거나 저장시켜준다. --%>
<jsp:setProperty property="name" name="vo" />    <%-- vo에 있는 name 변수에 form태그에서 넘어온 name값을 setProperty 액션태그에 저장한다!  --%>
<jsp:setProperty property="age" name="vo" value="25" />
<jsp:setProperty property="gender" name="vo" />
<jsp:setProperty property="job" name="vo" />
<jsp:setProperty property="address" name="vo" />



<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test2Ok4.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br /></p>
<div class='container'>
	<h2>처리된 자료를 view에 출력</h2>
	<table class="table table-bordered">
		<tr>
			<th>성명</th>
			<td>${name} / <jsp:getProperty property="name" name="vo" /></td> 
		</tr>
		<tr>
			<th>나이</th>
			<%-- <td><c:out value="${age}" /></td>  원래 JSTL로 출력할 때 사용하는 방법 --%>
			<td>${age + 1} / <jsp:getProperty property="age" name="vo" /></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${gender} / <jsp:getProperty property="gender" name="vo" /></td>
		</tr>
		<tr>
			<th>직업</th>
			<td>${job} / <jsp:getProperty property="job" name="vo" /></td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${address} / <jsp:getProperty property="address" name="vo" /></td>
		</tr>
	</table>
	<p>
		<%-- <a href="<%=request.getContextPath()%>/study/0424/test1.jsp" class= "btn btn-warning">돌아가기</a> --%>
		<a href="test2.jsp" class= "btn btn-warning">돌아가기</a>
	</p>
</div>
<p><br /></p>
</body>
</html>