<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  String content = request.getParameter("content")==null ? "" : request.getParameter("content");
  String searchString = request.getParameter("searchString")==null ? "" : request.getParameter("searchString");
	pageContext.setAttribute("content", content);
	pageContext.setAttribute("searchString", searchString);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstlFn_ex.jpg</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
    div {margin: 10px;}
  </style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>특정문자값 3번째위치 검색하기</h2>
  <pre>
    -숙제1-
	String atom = "Welcome to My Homepage!";
	① 찾고자 하는 문자를 입력받는다.
	② '찾고자하는 문자'가 atom변수에서 포함된 3번째 위치를 찾아서 출력하시오.(출력시는 검색한 위치값을 모두 출력할것)
	단, 찾고자 하는 문자가 없다면 '검색문자 없음'이라고 출력하시오. 3번째 문자까지를 모두 검색하였다면 더이상 수행하지 않도록 프로그램을 제작하시오.
  </pre>
  <form>
    문장 :
    <textarea name="content" rows="3" class="form-control">Welcome to My Homepage!</textarea>
    <div>
	    <input type="text" name="searchString" value="o" />
	    <input type="submit" value="3번째문자 검색" class="btn-btn-success"/>
    </div>
    <hr/>
    <!-- el에서의 empty연산자는 null과 공백을 같은것으로본다. 즉 null이나 공백이면 true으로 처리됨. null이나 공백이 아닌것을 참으로 처리하려면 !empty 를 이용한다. -->
		<c:forEach var="i" begin="0" end="${fn:length(content)-1}">
		  <c:if test="${i eq 2}">
		    <c:out value="${fn:substring(content, 0, 3)}" />
		    <c:break />
		  </c:if>
		  <c:out value="${fn:substring(content, i, i+1)}" />
		  <c:if test="${fn:substring(content, i, i+1) eq text}">
		    <c:if test="${i lt 11}">
		      <c:out value="${fn:substring(content, i+1, 12)}" />
		      <c:break />
		    </c:if>
		  </c:if>
		</c:forEach>
  </form>
</div>
<p><br/></p>
</body>
</html>














