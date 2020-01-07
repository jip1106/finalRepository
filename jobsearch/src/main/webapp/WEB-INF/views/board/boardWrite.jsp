<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

<title>글쓰기</title>
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
<form name="frmWrite" method="post" enctype="multipart/form-data"
	action="<c:url value='/board/write.do'/>" >
 <fieldset>
	<legend>글쓰기</legend>
        <div class="firstDiv">
            <label for="boardtitle">제목</label>
            <input type="text" id="boardTitle" name="boardTitle"  />
        </div>
      
        <div>  
        	<label for="boardcontents">내용</label>        
 			<textarea id="boardContents" name="boardContents" rows="12" cols="40"></textarea>
        </div>
            
        <div class="center">
            <input type = "submit" value="등록"/>
            <input type = "Button" value="글목록" 
            onclick
            ="location.href	='<c:url value='/board/list.do'/>'" />         
        </div>
    </fieldset>
</form>
</div>   

              
</body>
</html>