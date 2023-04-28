<!-- t1_CookiesDelete.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	Cookie[] cookies = request.getCookies();
	 
	for(int i=0; i<cookies.length; i++) {
		cookies[i].setMaxAge(0);  // 쿠키의 만료시간을 0으로 설정하여 쿠키를 제거한다! (따로 지우는 메소드가 없기 때문에!)
		response.addCookie(cookies[i]);
	}
%>
<script>
	alert("쿠키 삭제 완료!!!");
	location.href = "t1_CookiesMain.jsp";
</script>