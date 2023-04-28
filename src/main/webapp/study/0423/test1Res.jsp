<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br /></p>
<div class='container'>
	<h2>성적 처리 결과</h2>
	<p>성명 : ${name}</p>
	<p>학번 : ${hakbun}</p>
	<p>국어 : ${kor}</p>
	<p>영어 : ${eng}</p>
	<p>수학 : ${mat}</p>
	<p>사회 : ${soc}</p>
	<p>과학 : ${sci}</p>
	<p>총점 : ${tot}</p>
	<p>평균 : ${avg}</p>
	<p>학점 : ${grade}</p>
	<p><a href="<%=request.getContextPath()%>/study/0423/test1.jsp" class="btn btn-success">돌아가기</a></p>  <%-- dispatcher로 값을 가져오면 같은 폴더여도 돌아갈 때 Test1Ok.java로 가기 때문에 절대좌표로 경로를 찍어야 오류가 나지 않는다 --%> 
</div>
<p><br /></p>
</body>
</html>