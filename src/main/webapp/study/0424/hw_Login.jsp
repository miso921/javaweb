<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();  // 저장된 쿠키를 배열로 받아온다!
	
	if(cookies != null) {  // NullPointerException 오류가 발생할 수 있기 때문에 != 조건을 준다.
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")){  // cookie 배열에 있는 값이 저장된 cMid와 같다면
				pageContext.setAttribute("mid", cookies[i].getValue()); // pageContext에 그 값을 저장하고 mid에 value로 찍어주면 아이디 저장완료! 
				break;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>hwLogin.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
		div {
			width:500px;
			margin-bottom:7px;	
		}
	</style>
</head>
<body>
<p><br /></p>
<div class='container'>
	<form name="LoginForm" method="post" action="<%=request.getContextPath()%>/t0424/Hw_LoginOk">
		<h2>로 그 인</h2>
		<!-- 
		1. 로그인 화면에 아이디 저장 체크박스 만들고 체크하면 쿠키에 저장해서 아이디 입력창에 계속 떠 있게 하고 해제하면 쿠키에서 삭제되어 지워지게 하기
		2. 방문 카운트 (로그인 시 방문 카운트 숫자가 늘어나지만 아이디 하나 당 한번만 늘어난다)
		-->
		<div>
			아이디
			<input type="text" name="mid" value="${mid}" autofocus class="form-control" /> 
		</div>
		<div>
			비밀번호
			<input type="password" name="pwd" class="form-control" />
		</div><br />
		<div class="text-center mb-2">
			<input type="submit" value="로그인" class="btn btn-success" />&nbsp; 
			<input type="reset" value="취소" class="btn btn-info" />
		</div>
		<div class="text-center">
			<input type="checkbox" name="idSave" />아이디 저장
		</div> 
	</form>
</div>
<p><br /></p>
</body>
</html>