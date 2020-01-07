<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html lang="ko">
<head>
<title>글 수정</title>
<meta charset="utf-8">

<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>


</head>
<body>
<div class="divForm">
<form name="frmEdit" method="post" enctype="multipart/form-data"
	action="<c:url value='/board/edit.do'/>"> 
    <!-- 수정처리시 no가 필요하므로 hidden 필드에 넣는다-->
    <input type="hidden" name="boardSeq" value="${vo.boardSeq}">
   
    
    <fieldset>
	<legend>글수정</legend>
        <div class="firstDiv">
            <label for="title">제목</label>
            <input type="text" id="boardTitle" name="boardTitle"  
            	value="${vo.boardTitle}" class="infobox" />
        </div>
           
        <div>  
        	<label for="content">내용</label>        
 			<textarea id="boardContents" name="boardContents" rows="12" cols="40">${vo.boardContents}</textarea>
        </div>
        <div class="center">
            <input type = "submit" value="수정"/>
            <input type = "Button" value="글목록" 
onclick="location.href='<c:url value='/board/list.do'/>'" />         
        </div>
	</fieldset>
</form>    
</div>

</body>
</html>