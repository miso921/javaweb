<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	alert("자료가 저장되었습니다.");
	location.href = "<%=request.getContextPath()%>/study/0421/test1.jsp"  <%-- Test1Ok의 값을 Res에 넘기고 새로고침 하면 DB에 값이 중복으로 들어가는데 그것을 방지하기 위해 3~4번 라인을 적어준다..? --%>
</script>
