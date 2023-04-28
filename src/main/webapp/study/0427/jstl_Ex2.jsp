<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl_Ex2.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<style>
	.container {
		text-align:center;
	}
</style>
<script>
	'use strict';
	
	function imgCheck() {
		let selNum = num.value;
		let imgHtml = "<img src='" + selNum + "' width='700px'>";
		document.getElementById("demo1").innerHTML = imgHtml
	}
		
	function saveCheck() {
		let arr = [];
		let combo = document.getElementById("num");
		if(combo.selected) {
			arr.push(combo.value)
		}
	}
	
	function printCheck() {
		
		
	}
</script>
<body>
<br/>
<div class="container">
  <pre>
    콤보상자에 숫자 1~6까지를 기억시키고 화면에 보여준다.(화면에 보여주는 숫자는 1~6.jpg인 그림파일명이다.)
    콤보상자 옆에 텍스트박스를 위치시키고, 해당 그림의 '그림명'을 입력후 '저장'버튼을 클릭하면,
    '그림명'과, '그림파일명'을 저장시켜준다.(여러개를 저장할 수 있도록 처리)
    마지막으로 '출력'버튼을 클릭하면 아래쪽(demo)으로 저장된 모든 그림파일과 그림파일명을 출력한다.
  </pre>
  파일 선택 :
  <select id="num" name="num" onchange="imgCheck();">
			<option value="">선택</option>
				<c:forEach var="i" begin="1" end="6">
					<option value=${pageContext.request.contextPath}/images/${i}.jpg>${i}</option>
				</c:forEach>
	</select>
		파일명 : <input type="text" name="${title}" />
		<input type="button" value="저장" onclick="saveCheck()" class="btn btn-success" />
		<input type="button" value="출력" onclick="printCheck()" class="btn btn-warning" />
<br /><br />		
<div id="demo1"></div>
<div id="demo2"></div>
</div>
<p><br/></p>
</body>
</html>