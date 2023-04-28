<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");   // parameter는 name 값으로만 가져온다!
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	/* String hobby = request.getParameter("hobby"); 같은 변수의 값이 여러 개 넘어올땐 배열로 넘어오는데 getParameter는 한개 값만 가져오기 때문에 getParameterValues로 가져온다!! */ 
	String[] hobbys = request.getParameterValues("hobby");
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test2Ok.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
  <style>
  	th, td {text-align: center;}
  	th {background-color: #ccc;}
  </style>
  
</head>
<body>
<p><br /></p>
<div class='container'>
	<h2>전송된 값 출력하기</h2>
	<table class="table table-bordered">
		<tr>
			<th>성명</th>
			<td><%=name%></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><%=age%></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=gender%></td>
		</tr>
		<tr>
			<th>취미</th>
			<td>
      	<%--<td><%=hobbys%></td>--%>	
				<%-- <%
					for(String hobby : hobbys) {
						out.print(hobby + "/");
					}
				%> --%>
				<%
					String str = "";
					for(String hobby : hobbys) {
						str += hobby + "/";
					}
					str = str.substring(0,str.length()-1);
					out.println(str);
				%>
			</td>
		</tr>
	</table>
	<br />
	<p class="text-center">
		<a href="test2.jsp" class="btn btn-success">돌아가기</a>
	</p>	
</div>
<p><br /></p>
</body>
</html>