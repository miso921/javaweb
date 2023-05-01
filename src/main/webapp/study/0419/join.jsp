<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>join.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
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
  </script>
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
	  .container {
	    width: 100%;
	    text-align: center;
	  }
	  input[type="button"] {
	    width: 150px;
	  }
  </style>
</head>
<body>
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="#"> <!-- form태그에서 값을 전송할때는 보안을 위해 post메소드로 전송해야함! (post는 폼형태만 가능함!)-->
    <h2 class="text-center mb-4">회원가입</h2><br />
      <div>
        <div><label for="mid">아이디<span style="color:red">*</span></label></div>
        <div><input type="text" name="mid" id="mid" autofocus required min="5" max="11" placeholder="아이디를 입력해주세요. (5~11자)" /></div>
      </div><br /><br />
      <div>
        <div><label for="nick">닉네임<span style="color:red">*</span></label></div>
        <div><input type="text" name="nick" id="nick" required min="2" max="15" placeholder="닉네임을 입력해주세요. (2~15자)" /></div>
      </div><br /><br />
      <div>
        <div><label for="pwd">비밀번호<span style="color:red">*</span></label></div>
        <div><input type="password" name="pwd" id="pwd" required min="8" placeholder="비밀번호를 입력해주세요. (최소 8자)" /></div>
      </div><br /><br />
      <div>
        <div><label for="phone">휴대전화번호<span style="color:red">*</span></label></div>
        <div><input type="tel" name="phone" id="phone" required placeholder="-없이 숫자만 입력해주세요." /></div>
      </div><br /><br />
      <div>
        <div><label for="mail">이메일<span style="color:red">*</span></label></div>
        <div><input type="email" name="mail" id="mail" required placeholder="이메일 주소를 입력해주세요." /></div>
      </div><br /><br />
      <div>
        <div>성별<span style="color:red">*</span></div>
          <select name="gender" id="gender" required>
            <option value="">성별을 선택해주세요.</option>
            <option>남성</option>
            <option>여성</option>
            <option>선택안함</option>
          </select>
      </div><br /><br />
      <div>
        <div>생년월일<span style="color:red">*</span></div>
        <div><input type="date" name="birthday" id="birthday" required min="5" placeholder="생년월일을 입력해주세요." /></div>
      </div><br /><br />
      <div>
        <div><input type="button" value="회원가입" onclick="fCheck()" class="btn btn-warning btn-sm form-control mb-2" /></div>
        <div><a href="loginEx.jsp"><input type="button" value="로그인" class="btn btn-success btn-sm form-control mb-2" /></a></div>
      </div>
  </form>
</div>
<p><br/></p>
</body>
</html>