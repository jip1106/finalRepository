<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% String ctx = request.getContextPath();  %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

<title>답변달기</title>
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
	
<script type="text/javascript">
	
	function replyedit() {
		var a = "<%=ctx%>/board/edit.do";
		alert(a);
	}
	
</script>

</head>
<body>
<div class="divForm">
<c:choose>
			<c:when test="${empty replyrw }">
			<form name="frmWrite" method="post" 
	action="<c:url value='/board/reply.do'/>" >
			</c:when>
			<c:when test="${!empty replyrw }">
			<form name="frmWrite" method="post" 
	action="<c:url value='/board/edit.do'/>" >
			</c:when>
		</c:choose>


	
	<c:choose>
			<c:when test="${empty replyrw }">
				<input type="hidden" name="boardSeq" value="${vo.boardSeq}">
			</c:when>
			<c:when test="${!empty replyrw }">
				<input type="hidden" id="commentSeq" name="commentSeq" value="${seq}">
				<input type="hidden" id="type" name="type" value="${param.type}">
			</c:when>
		</c:choose>

 <fieldset>
	<legend>
		<c:choose>
			<c:when test="${empty replyrw }">
			답변달기
			</c:when>
			<c:when test="${!empty replyrw }">
			답변수정
			</c:when>
		</c:choose>
	</legend>
	
	<c:if test="${empty replyrw }">
        <div class="firstDiv">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" 
            	value="Re : ${vo.boardTitle }" />
        </div>
    </c:if>
        <div>  
        	<label for="content">내용</label>        
 			<textarea id="commentDesc" name="commentDesc" rows="12" cols="40">
 				<c:if test="${!empty replyrw }">
 					${vo.commentDesc }
 				</c:if>
 			</textarea>
        </div>             
        <div class="center">
            <c:choose>
				<c:when test="${empty replyrw }">
					<input type = "submit" value="등록"/>
				</c:when>
				<c:when test="${!empty replyrw }">
					<input type = "submit" value="수정"/>
				</c:when>
			</c:choose>
            <input type = "Button" value="글목록" 
            onclick
            ="location.href	='<c:url value='/board/list.do'/>'" />         
        </div>
    </fieldset>
</form>
</div>   

              
</body>
</html>