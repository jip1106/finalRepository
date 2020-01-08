<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%
				pageContext.setAttribute("newLine", "\r\n");
%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>상세보기</title>

<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }
	.divForm {
		width: 500px;
		}
</style>  
</head>

<body>
	<h2>글 상세보기</h2>
	<div class="divForm">
		<c:choose>
			<c:when test="${type eq 1 }">
			<div class="firstDiv">
				<span class="sp1">제목</span> <span>${vo.boardTitle}</span>
			</div>
			
			<div>
				<span class="sp1">등록일</span> <span>${vo.regDate}</span>
			</div>
			<div>
				<span class="sp1">조회수</span> <span>${vo.hits}</span>
			</div>
			
			
			<div class="lastDiv">	
			
			
				<c:set var="content" value="${fn:replace(vo.boardContents, newLine,'<br>') }"/>		
				<p class="content">${content }</p>
			</div>
			</c:when>
			<c:when test="${type eq 2 }">
			<div>
				<span class="sp1">등록일</span> <span>${vo.regDate}</span>
			</div>
			<div class="lastDiv">	
			
			
				<c:set var="content" value="${fn:replace(vo.commentDesc, newLine,'<br>') }"/>		
				<p class="content">${content }</p>
			</div>
			</c:when>
		</c:choose>
		
		<div class="center">
			<a href
			='<c:url value="/board/edit.do?seq=${param.seq}&type=${type}"/>'>수정</a> |
        	<a href
        	='<c:url value="/board/delete.do?seq=${param.seq}&type=${type}"/>'>삭제</a> |
        	<c:choose>
        		<c:when test="${type eq 1 }">
		        	<a href
					='<c:url value="/board/reply.do?seq=${param.seq}"/>'>답변</a> |
        		</c:when>
        	</c:choose>
        	<a href='<c:url value="/board/list.do"/>'>
        		목록</a>			
		</div>
	</div>

	
</body>
</html>