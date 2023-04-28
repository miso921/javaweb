<!-- test4out.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	pageContext.setAttribute("name", name); // 이렇게 하면 EL표기법으로 사용할 수 있다.
%>
	<script>
	 <%-- alert('<%=name%>님 로그아웃 되었습니다!');  4번라인만 썼을때  --%>
	 alert('${name}님 로그아웃 되었습니다!'); <%-- 4,5번 함께 썼을때 --%>
	 <%-- location.href = '<%=request.getContextPath()%>/study/0420/test4.jsp'; --%> 
	 location.href = '${pageContext.request.contextPath}/study/0420/test4.jsp'; <%-- EL표기법으로 사용하고 싶을 때! 함수니까 get과 ()를 제거하고 맨 앞자리가 소문자가 된다! --%> 
	</script>
