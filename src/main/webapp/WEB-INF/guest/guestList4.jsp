<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n");%> 
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>guestList4(블록 페이징 처리).jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<style>
	th {
		background-color: #eee;
		text-align: center;
	}
</style>
<body>
<jsp:include page="/include/header.jsp" />
<p><br /></p>
<div class='container'>
	
	<h2 class="text-center"><font size="5">방 명 록</font></h2>
	<table class="table table-borderless mb-0 p-0">
		<tr>
			<td>
				<c:if test="${sAdmin != 'adminOk' }"><a href="${ctp}/AdminLogin.gu" class="btn btn-success btn-sm">관리자</a></c:if>
				<c:if test="${sAdmin == 'adminOk' }"><a href="${ctp}/AdminLogout.gu" class="btn btn-danger btn-sm">관리자 로그아웃</a></c:if>
			</td>
			<td style="text-align:right;"><a href="${ctp}/GuestInput.gu" class="btn btn-secondary btn-sm">글쓰기</a></td>
		</tr>
	</table>
	<table class="table table-borderless mb-0 p-0">
		<tr>
			<td class="text-right">
				<!-- 처음으로 / 이전 페이지 / (현재 페이지 번호 / 총 페이지 수) / 다음 페이지 / 마지막 페이지  -->
				<c:if test="${pag > 1}">
					<a href="${ctp}/GuestList.gu?pag=1" title="첫 페이지로">◁◁</a> 	
					<a href="${ctp}/GuestList.gu?pag=${pag-1}" title="이전 페이지로">◀</a> 	
				</c:if>
				${pag} / ${totPage} 
				<c:if test="${pag < totPage}">
					<a href="${ctp}/GuestList.gu?pag=${pag+1}" title="다음 페이지로">▶</a> 	
					<a href="${ctp}/GuestList.gu?pag=${totPage}" title="마지막 페이지로">▷▷</a> 	
				</c:if>
			</td>
		</tr>
	</table>
	<c:forEach var="vo" items="${vos}" varStatus="st">
		<table class="table table-borderless">
			<tr>
				<td>번호 : ${vo.idx}</td>
				<td style="text-align:right;">방문IP : ${vo.hostIp}</td>
			</tr>
		</table>
		<table class="table table-bordered mb-0 mt-0">
			<tr>
				<th style="20%">성명</th>
				<td style="25%">${vo.name}</td>
				<th style="20%">방문일자</th>
				<td style="35%">${fn:substring(vo.visitDate,0,19)}</td>
			</tr>
			<tr>
				<th>메일주소</th>
				<td colspan="3">
					<c:if test="${empty vo.email || fn:length(vo.email)<5 || fn:indexOf(vo.email,'@')== -1 || fn:indexOf(vo.email,'.')== -1}">- 없음 -</c:if>
					<c:if test="${!empty vo.email && fn:length(vo.email)>=5 && fn:indexOf(vo.email,'@')!= -1 && fn:indexOf(vo.email,'.')!= -1}">${vo.email}</c:if>
					${vo.email}
				</td>
			</tr>
			<tr>
				<th>홈페이지 주소</th>
					<td colspan="3">
		        <c:if test="${empty vo.homePage || fn:length(vo.homePage)<10 || fn:indexOf(vo.homePage,'.')==-1}">- 없음 -</c:if>
		        <c:if test="${!empty vo.homePage && fn:length(vo.homePage)>=10 && fn:indexOf(vo.homePage,'.')!=-1}">${vo.homePage}</c:if>
	       </td> 
			</tr>
			<tr>
				<th>방문소감</th>
				<td colspan="3" style="height:150px">${fn:replace(vo.content, newLine, '<br />')}</td>
			</tr>
		</table>
	</c:forEach>
	<br />      <!-- 4페이지(1블록)에서 0블록으로 가면 현재 페이지는 1페이지가 블록의 시작페이지가 된다.(이전 블록 구하는 법)-->
	<!-- 첫페이지 / 이전 블록 / 1(4) 2(5) 3 / 다음 블록 / 마지막 페이지 -->
	<div class="text-center">
		<c:if test="${pag > 1}">[<a href="${ctp}/GuestList.gu?pag=1">첫페이지</a>]</c:if>
		<c:if test="${curBlock > 0 }">[<a href="${ctp}/GuestList.gu?pag=${(curBlock-1)*blockSize + 1}">이전블록</a>]</c:if>
		<c:forEach var = "i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
			<c:if test="${i <= totPage && i == pag}"><font color="red">${i}</font></c:if> <!-- 현재 페이지 -->
			<c:if test="${i <= totPage && i != pag}">[<a href="${ctp}/GuestList.gu?pag=${i}">${i}</a>]</c:if> <!-- 배타적 처리 -->
		</c:forEach>
		<c:if test="${curBlock > lastBlock}">[<a href="${ctp}/GuestList.gu?pag=${(curBlock+1)*blockSize + 1}">다음블록</a>]</c:if>
		<c:if test="${pag < totPage}">[<a href="${ctp}/GuestList.gu?pag=${totPage}">마지막 페이지</a>]</c:if>
	</div>
	
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>