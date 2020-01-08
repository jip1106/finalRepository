<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

<title>답변달기</title>
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("form[name=frmWrite]").submit(function(){
			if($("#title").val()==''){
				alert("제목을 입력하세요");
				$("#title").focus();
				event.preventDefault();
			}else if($("#name").val().length<1){
				alert("이름을 입력하세요");
				$("#name").focus();
				event.preventDefault();
			}else if(!$("#pwd").val()){
				alert("비밀번호를 입력하세요");
				$("#pwd").focus();
				event.preventDefault();
			}
		});
	});
</script>

</head>
<body>
<div class="divForm">
<form name="frmWrite" method="post" 
	action="<c:url value='/board/reply.do'/>" >
	
	<c:choose>
			<c:when test="${empty replyrw }">
				<input type="hidden" name="boardSeq" value="${vo.boardSeq}">
			</c:when>
			<c:when test="${!empty replyrw }">
				<input type="hidden" name="boardSeq" value="${seq}">
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