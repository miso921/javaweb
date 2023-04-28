<!-- t3_ApplicationSave.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% /* 서버에 저장되기 때문에 클라이언트에서는 볼 수 없음 */
	String mid = request.getParameter("mid")==null ? "admin" : request.getParameter("mid"); 
	String nickName = request.getParameter("nickName")==null ? "관리맨" : request.getParameter("nickName"); 
	String name = request.getParameter("name")==null ? "관리자" : request.getParameter("name");
	
	System.out.println("mid : " + mid);
	
	application.setAttribute("aMid", mid);
	application.setAttribute("aNickName", nickName);
	application.setAttribute("aName", name);
%>
<script>
	alert("어플리케이션에 저장 완료!! 값: ${aMid}");   /* session은 브라우저와 관계되어있으며 브라우저가 열렸다가 닫힐 때까지가 생명주기! */
	location.href = "t3_ApplicationMain.jsp";
</script>

