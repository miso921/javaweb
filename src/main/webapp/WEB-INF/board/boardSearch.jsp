<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>boardSearch.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<script>
	'use strict';
	
	function pageCheck() {
		let pageSize = document.getElementById("pageSize").value;
		location.href="${ctp}/BoardList.bo?pag=${pag}&pageSize="+pageSize;
	}
	
	function searchCheck() {
		let searchString = $("#searchString").val();
		
		if(searchString.trim() == "") {
			alert("검색어를 입력하세요!");
			searchForm.searchString.focus();
		}
		else{
			searchForm.submit();
		}
	}
</script>
<body>
<jsp:include page="/include/header.jsp" />
<p><br /></p>
<div class='container'>
	<h2 class="text-center">게 시 판 검 색 결 과 목 록</h2>
	<div class="text-center">
		<font color="blue">${searchTitle}</font>(으)로 <font color="green">${searchString}</font>(을)를 검색한 결과 <font color="red"><b>${searchCount}</b></font>건이 검색되었습니다!
	</div>
	<br />
	<table class="table talbe-borderless m-0 p-0 btn-sm">
		<tr>
			<td><a href="${ctp}/BoardList.bo?pag=${pag}&pageSize=${pageSize}" class="btn btn-warning">돌아가기</a></td>
		</tr>
	</table>
<%-- 	<table class="table table-borderless">
		<tr>
			<td><a href="${ctp}/BoardInput.bo" class="btn btn-secondary btn-sm">글쓰기</a></td>
			<td>
		</tr>
	</table>		
	<!-- 한 페이지 분량 처리 -->
	<table class="table table-borderless mb-0 p-0">
		<tr>
			<td>
				<select name="pageSize" id="pageSize" onchange="pageCheck()">
					<option <c:if test="${pageSize == 3}">selected</c:if>>3</option>
					<option <c:if test="${pageSize == 5}">selected</c:if>>5</option>
					<option <c:if test="${pageSize == 10}">selected</c:if>>10</option>
					<option <c:if test="${pageSize == 15}">selected</c:if>>15</option>
					<option <c:if test="${pageSize == 20}">selected</c:if>>20</option>
				</select>건
			</td>
			<td class="text-right">
				<!-- 처음으로 / 이전 페이지 / (현재 페이지 번호 / 총 페이지 수) / 다음 페이지 / 마지막 페이지  -->
				<c:if test="${pag > 1}">
					<a href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=1" title="첫 페이지로">◁◁</a> 	
					<a href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${pag-1}" title="이전 페이지로">◀</a> 	
				</c:if>
					${pag} / ${totPage} 
				<c:if test="${pag < totPage}">
					<a href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${pag+1}" title="다음 페이지로">▶</a> 	
					<a href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${totPage}" title="마지막 페이지로">▷▷</a> 	
				</c:if>
			</td>
		</tr>
	</table> --%>
	<table class="table table-hover text-center">
		<tr class="table-dark text-dark">
			<th>글번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>글쓴날짜</th>
			<th>조회수</th>
			<th>좋아요</th>
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${searchCount}</td> <!-- 가장 큰 번호 -->
				<td> 
					<a href="${ctp}/BoardContent.bo?flag=search&search=${search}&searchString=${searchString}&idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.title}</a> <!-- 검색결과 글을 보고 다시 돌아가기 할 때도 이전 목록이 보여야해서 pag,pageSize가져가야함 -->
					<c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif"/></c:if>
				</td>
				<td>${vo.nickName}</td>
				<td>
					<c:if test="${vo.hour_diff > 24}">${fn:substring(vo.wDate,0,10)}</c:if>
					<c:if test="${vo.hour_diff <= 24}">
						${vo.day_diff == 0 ? fn:substring(vo.wDate,11,19) : fn:substring(vo.wDate,0,16)}
					</c:if>
				</td>
				<td>${vo.readNum}</td>
				<td>${vo.good}</td>
			</tr>
			<c:set var="searchCount" value="${searchCount - 1}" /> <!-- 하나씩 빼면서 번호가 출력됨 -->
		</c:forEach>
		<tr><td colspan="6" class="m-0 p-0"></td></tr>
	</table>
	<%-- <br />
	<!-- 블록 페이징 처리 -->
	<div class="text-center">
		<ul class="pagination pagination-sm justify-content-center mt-1" style="margin:20px 0">
			<c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=1">첫페이지</a></li></c:if>
			<c:if test="${curBlock > 0 }"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li></c:if>
			<c:forEach var = "i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
				<c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if> <!-- 현재 페이지 -->
				<c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if> <!-- 배타적 처리 -->
			</c:forEach>
			<c:if test="${curBlock > lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li></c:if>
			<c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${totPage}">마지막 페이지</a></li></c:if>
		</ul>	
	</div>
	<br />
	<!-- 검색기 처리 -->
	<div class="container text-center">
		<form name="searchForm" method="post" action="${ctp}/BoardSearch.bo">
			<b>검색</b>
			<select name="search">
				<option value="title" selected>제목</option>
				<option value="nickName">글쓴이</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchString" id="searchString" />
			<input type="button" value="검색" onclick="searchCheck()" class="btn btn-secondary btn-sm" />
			<input type="hidden" name="pag" value="${pag}" />
			<input type="hidden" name="pageSize" value="${pageSize}" />
	  </form>
	</div>	
</div> --%>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>