<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ajax1.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		// 일반 아이디 검색
		function idCheck() {
			/* let mid = document.myform.mid.value;  // jsp1 */
			/* let mid = document.getElementById("mid").value;  // jsp2 */ 
			let mid = $("#mid").val();            // jQuery
			
			if(mid.trim() == "") {
				alert("아이디를 입력하세요!");
				/* document.myform.mid.focus(); */
				/* document.getElementById("mid").focus(); */
				$("#mid").focus();
				return false;
			}
			location.href= "${ctp}/AjaxTest1_1?mid="+mid;   //자바스크립트에서 온 것이기 때문에 "밖에 +로 추가
		}
		
		// aJax를 이용한 아이디 검색
		function idCheck1() {
			// 1. jQuery lib 올리기
			// 2. jQuery로 값 가져오기
			let mid = $("#mid").val();
			
			if(mid.trim() == "") {
				alert("아이디를 입력하세요!");
				$("#mid").focus();
				return false;
			}
			// aJax에서는 항상 중괄호에 담아서 가져감 {변수명: 값}
			let query = {
					mid:mid,
			}
			// aJax임을 알리기 위해 .ajax를 써줌
			$.ajax({
				url : "${ctp}/AjaxTest1_2",
				type : "post",
				data : query,
				contextType : "application/json",
				charset : "utf-8",
				success : function(res) {  /* 처리가 끝나고 호출 */
					alert("서버에 성공적으로 다녀왔습니다." + res);
					$("#demo").html(res);
				}, 
				error : function() {
					alert("서버에 전송 실패..");
				}   /* 마지막 명령문에는 ,를 사용하지 않음! */
			});
		}
		
		function idCheck2() {
			let mid = $("#mid").val();
			
			if(mid.trim() == "") {
				alert("아이디를 입력하세요!");
				$("#mid").focus();
				return false;
			}
			
			$.ajax({
				url  : "${ctp}/AjaxTest2",	
				type : 'post',
				data : {mid: mid},
				success : function(res) {
					$("#demo").html(res);
					let str = res.split("/");
					$("#tMid").html(str[0]);
					$("#name").html(str[1]);
					$("#nickName").html(str[2]);
					$("#gender").html(str[3]);
					$("#point").html(str[4]);
				},
				error : function() {
					alert("전송오류!");
				}
			});
		}
		
		function idCheck3() {
			let mid = $("#mid").val();

			if(mid.trim() == "") {
				alert("아이디를 입력하세요!");
				$("#mid").focus();
				return false;
			}
			
			$.ajax({
				type : "post",
				url :  "${ctp}/AjaxTest3",
				data : {mid: mid},
				success : function(res) {
					res = res.substring(res.indexOf("[")+1,res.lastIndexOf("]"));
					$("#demo").html(res);
					
					$("#tMid").html(res.substring(res.indexOf("mid=")+4,res.indexOf(",",res.indexOf("mid="))));
    			$("#name").html(res.substring(res.indexOf("name=")+5,res.indexOf(",",res.indexOf("name="))));
    			$("#nickName").html(res.substring(res.indexOf("nickName=")+8,res.indexOf(",",res.indexOf("nickName="))));
    			$("#gender").html(res.substring(res.indexOf("gender=")+6,res.indexOf(",",res.indexOf("gender="))));
    			$("#point").html(res.substring(res.indexOf("point=")+5,res.indexOf(",",res.indexOf("point="))));
				}
			});
		}
		
		function idCheck4() {
			let mid = $("#mid").val();

			if(mid.trim() == "") {
				alert("아이디를 입력하세요!");
				$("#mid").focus();
				return false;
			}
			
			$.ajax({
				type : "post",
				url  : "${ctp}/AjaxTest4",
				data : {mid: mid},
				success : function(res) {
					console.log("res",res);
					$("#demo").html(res);
					let js = JSON.parse(res);  /* JSON 형식을 parsing처리해 자바스크립트화 */
					console.log("js",js);
					
					$("#tMid").html(js.mid);
					$("#name").html(js.name);
					$("#nickName").html(js.nickName);
					$("#gender").html(js.gender);
					$("#point").html(js.point);
				},
				error : function() {
					alert("전송실패");
				} 
			});
		}
		
		// vos형태의 값을 처리
		function idCheck5() {
			let mid = $("#mid").val();

			if(mid.trim() == "") {
				alert("아이디를 입력하세요!");
				$("#mid").focus();
				return false;
			}
			
			$.ajax({
				type : "post",
				url : "${ctp}/AjaxTest5",
				data : {mid: mid},
				success : function(res) {
					$("#demo").html(res);
					let js = JSON.parse(res);
					console.log("js",js);
				/*	
					$("#tMid").html(js[0].mid);
					$("#name").html(js[0].name);
					$("#nickName").html(js[0].nickName);
					$("#gender").html(js[0].gender);
					$("#point").html(js[0].point);
				*/
				let tMid= "", tName= "", tNickName="", tGender="", tPoint="";
				for(let j of js) {
					tMid += j.mid + "/";
					tName += j.name + "/";
					tNickName += j.nickName + "/";
					tGender += j.gender + "/";
					tPoint += j.point + "/";
				}
				$("#tMid").html(tMid);
				$("#name").html(tName);
				$("#nickName").html(tNickName);
				$("#gender").html(tGender);
				$("#point").html(tPoint);
			},
				error : function() {
					alert("전송오류~");
				}
			});
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br /></p>
<div class='container'>
	<h2>aJax 연습</h2>
	<hr />
	<form name="myform">
		아이디 : <input type="text" name="mid" id="mid" /> &nbsp;
		<input type="button" value="아이디일반검색" onclick="idCheck()" class="btn btn-success" /><br />
		<hr />
		aJax 검색 :<br />
		<input type="button" value="아이디검색1" onclick="idCheck1()" class="btn btn-info" /> &nbsp;
		<input type="button" value="아이디검색2" onclick="idCheck2()" class="btn btn-warning" /> &nbsp;
		<input type="button" value="아이디검색3" onclick="idCheck3()" class="btn btn-danger" /> &nbsp;
		<input type="button" value="아이디검색4" onclick="idCheck4()" class="btn btn-secondary" /> &nbsp;
		<input type="button" value="아이디검색5" onclick="idCheck5()" class="btn btn-primary" /> &nbsp;
		
		<div>출력결과: <span id="demo"></span></div>
		<hr />
		<div>
			<div>아이디 : <span id="tMid"></span></div>
			<div>성명 : <span id="name"></span></div>
			<div>별명 : <span id="nickName"></span></div>
			<div>성별 : <span id="gender"></span></div>
			<div>포인트 : <span id="point"></span></div>
		</div>
		<hr />	
	</form>
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>