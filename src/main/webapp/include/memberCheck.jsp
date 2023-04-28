<!-- memberCheck.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	//include하면 mid라는 변수가 자주 사용되므로 양보해서 memberMId로 변경했음!
	String memberMid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
	if(memberMid.equals("")) { // 공백이면 불법으로 들어왔다고 간주함
%>
		<script>
			// location.href	= "${ctp}/";
			location.href	= "${pageContext.request.contextPath}/study/0428_database/login.jsp";
		</script>		
<%} %>