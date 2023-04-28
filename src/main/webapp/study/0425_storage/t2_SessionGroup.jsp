<!-- t2_SessionGroup.jsp -->
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/include/bs4.jsp" />
<div class="container">
<%
	/* String name = (String)session.getAttribute("sName");  강제 캐스팅을 하지 않으면 오류가 나는 것으로 보아 문자열이 아닌듯하다.. */
	
	Enumeration names = session.getAttributeNames();  // 열거형(Enumeration)으로 생성
	
	while(names.hasMoreElements()) {                // session 값을 읽어오는 방법
		String name = (String) names.nextElement();
		out.println("세션명 : " + name + "<br />");
	}
%>
	<p>
		<a href = "t2_sessionMain.jsp" class="btn btn-success">돌아가기</a>
	</p>
</div>
