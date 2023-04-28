<!--test6Ok.jsp-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String[] hobbys = request.getParameterValues("hobby");

	String strHobby = "";
	for(String hobby : hobbys) {
		strHobby += hobby + "/";
	}
	strHobby = strHobby.substring(0,strHobby.length()-1);
%>

<p>전송된 값...</p>
<p>성명: <%=request.getParameter("name")%></p>  <%--표현식에는 ; 붙이지 않음!--%>
<p>나이: <%=request.getParameter("age")%></p>  
<p>성별: <%=request.getParameter("gender")%></p>  
<p>취미: <%=request.getParameter("strHobby")%></p>  
<p>호스트IP: <%=request.getParameter("hostIp")%></p>  
<p>전송방식: <%=request.getMethod()%></p>  
<p>접속URL: <%=request.getRequestURL()%></p>  
<p>접속URI: <%=request.getRequestURI()%></p>  
<p>접속 서버이름: <%=request.getServerName()%></p>  
<p>접속 서버포트: <%=request.getServerPort()%></p>  
<p>접속 Context명: <%=request.getContextPath()%></p>  
<p>접속 프로토콜: <%=request.getProtocol()%></p>  
<!-- <p><input type="button" value="돌아가기" onclick="location.href='test6.jsp';" /></p> -->
<p><input type="button" value="뒤로가기" onclick="history.back()" /></p>  <%-- 뒤로가는 자바스크립트 명령어(-1넣으면 전전으로 돌아감) 단, 데이터베이스를 저장하고 이 함수를 사용하면 전에 작업했던 DB를 왔다갔다 하면서 빠져나가지 못함! --%>