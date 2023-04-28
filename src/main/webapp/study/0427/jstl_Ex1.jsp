<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jstl_Ex1.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<style>
	#demo {
	 	margin-top:50px;
	}
</style>
<script>
	function imgCheck() {
		let imgSrc = num.value;
		let imgHtml = "<img src='" + imgSrc + "' width='700px'>";
		document.getElementById("demo").innerHTML = imgHtml
	}
</script>
<body>
<p><br /></p>
<div class='container'>
	<p>
		콤보상자에 숫자 1~6까지를 기억시키고 화면에 보여준다.<br />
		이 때 숫자를 선택하면 아래쪽(demo)으로 선택한 숫자의 그림파일을 출력한다.(onchange 사용) 
	</p>	
		<select id="num" name="num" onchange="imgCheck();">
			<option value="">선택</option>
				<c:forEach var="i" begin="1" end="6">
					<option value=${pageContext.request.contextPath}/images/${i}.jpg>${i}</option>
				</c:forEach>
		</select>	
		<div id="demo"></div>
</div>
<p><br /></p>
</body>
</html>