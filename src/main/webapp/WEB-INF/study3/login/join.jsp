<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>join.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
	  @font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
	  }
	  body {
	    font-family: Pretendard-Regular;
	    width: 100%;
	  }
	  input[type="text"], input[type="password"], input[type="tel"], input[type="email"], input[type="number"] {
	    border: none;
	    border-bottom: 1px solid black;
	    outline: none;
	    width: 300px;
	  }		
	</style>
	<script>
		'use strict';
		
		function fCheck() {
	    let mid = document.getElementById("mid").value.trim();
	    let nick = document.getElementById("nick").value;
	    let pwd = document.getElementById("pwd").value.trim();
	    let phone = document.getElementById("phone").value;
	    let mail = document.getElementById("mail").value;
	    let gender=document.getElementById("gender").value;
	    let birthday = document.getElementById("birthday").value;
	
	    if(mid == "") {
	      alert("아이디를 입력하세요!")
	      myform.mid.focus();
	    }
	    else if(nick == "") {
	      alert("닉네임을 입력하세요!")
	      myform.nick.focus();
	    }
	    else if(pwd == "") {
	      alert("비밀번호를 입력하세요!")
	      myform.pwd.focus();
	    }
	    else if(phone == "") {
	      alert("휴대폰 번호를 입력하세요!")
	      myform.phone.focus();
	    }
	    else if(mail == "") {
	      alert("이메일을 입력하세요!")
	      myform.mail.focus();
	    }
	    else if(gender == "") {
	      alert("성별을 골라주세요!")
	    }
	    else if(birthday == "") {
	      alert("생년월일을 입력하세요!")
	      myform.birthday.focus();
	    }
	    else {
	      myform.mid.value = mid;
	      myform.pwd.value = pwd;
	      myform.submit();
	    }
	  }
	}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br /></p>
<div class='container'>
	<form name="myform" method="post" action="${ctp}/login/JoinOk.pa">
		<table class="text-center">
			<tr>
				<td colspan="2"><font size="5"><b>회 원 가 입 3</b></font></td>
			</tr>
			<tr>
				<th><font size="3">아이디</font><span style="color:red">*</span></th>
				<td><input type="text" name="mid" id="mid" min="5" max="11" placeholder="5~11자 이내의 아이디를 입력하세요" required/></td>
			</tr>
			<tr>
				<th><font size="3">닉네임</font><span style="color:red">*</span></th>
				<td><input type="text" name="nick" id="nick" min="2" max="15" placeholder="2~15자 이내의 닉네임을 입력하세요" required/></td>
			</tr>
			<tr>
				<th><font size="3">비밀번호</font><span style="color:red">*</span></th>
				<td><input type="password" name="pwd" id="pwd" min="8" placeholder="최소 8자 이내의 비밀번호를 입력하세요" required/></td>
			</tr>
			<tr>
				<th><font size="3">전화번호</font><span style="color:red">*</span></th>
				<td><input type="tel" name="phone" id="phone" placeholder="-없이 숫자만 입력하세요" required/></td>
			</tr>
			<tr>
				<th><font size="3">이메일</font><span style="color:red">*</span></th>
				<td><input type="email" name="mail" id="mail" placeholder="이메일 주소를 입력하세요" required/></td>
			</tr>
			<tr>
				<th><font size="3">성별</font><span style="color:red">*</span></th>
				<td>
					<select name="gender" id="gender" required>
						<option value="">성별을 선택해주세요</option>
						<option>남성</option>
						<option>여성</option>
					</select>
				</td>
			</tr>
			<tr>
				<th><font size="3">생년월일</font><span style="color:red">*</span></th>
				<td><input type="date" name="birthday" id="birthday" required /></td>
			</tr>
			<tr>
				<td><input type="button" value="회원가입" onclick="fCheck()" class="btn btn-success" />
				<td><input type="button" value="로그인" onclick="location.href='${ctp}/Login.pa';" class="btn btn-success" />
			</tr>
		</table>
	</form>
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>