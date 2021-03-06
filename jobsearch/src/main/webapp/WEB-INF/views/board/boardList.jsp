<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>글 목록</title>
<meta charset="utf-8">

<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>

<script type="text/javascript">	
	$(function(){
		$(".box2 tbody tr").hover(function(){
			$(this).css("background","lightblue");
		}, function(){
			$(this).css("background","");
		});	
	});
	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		
		document.frmPage.submit();
	}
	
</script>
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }	
</style>	
</head>	
<body>
<c:if test="${!empty param.searchKeyword }">
	<p>검색어 : ${param.searchKeyword}, 
		${pagingInfo.totalRecord }건 검색되었습니다.</p>	
</c:if>

<!-- 페이징 처리 관련 form -->
<form action="<c:url value='/board/list.do'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="searchCondition" 
		value="${param.searchCondition}">
	<input type="hidden" name="searchKeyword" 
		value="${param.searchKeyword}">
	<input type="hidden" name="currentPage" >
</form>

<div class="divList">
<table class="box2"
	 	summary="기본 게시판에 관한 표로써, 번호, 제목, 작성자, 작성일, 조회수에 대한 정보를 제공합니다.">
	<caption>기본 게시판</caption>
	<colgroup>
		<col style="width:10%;" />
		<col style="width:40%;" />
		<col style="width:25%;" />
		<col style="width:15%;" />
		<col style="width:10%;" />		
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">번호</th>
	    <th scope="col">제목</th>
	    <th scope="col">내용</th>
	    <th scope="col">조회수</th>
	    <th scope="col">작성일</th>
	  </tr>
	</thead> 
	<tbody>
		<c:if test="${empty list }">
			<tr class="align_center">
				<td colspan="5">해당 글이 존재하지 않습니다.</td>
			</tr>
		</c:if>  
		<c:if test="${!empty list }">
			<c:forEach var="vo" items="${list }">				
				<tr  style="text-align:center">
					<td>${vo.boardSeq}</td>
					<td style="text-align:left">
					
					<a href
			="<c:url value='/board/countUpdate.do?seq=${vo.boardSeq}'/>">
											${vo.boardTitle}									
							</a>
					
					
					
						</td>
					<td>${vo.boardContents}</td>
					
					<td>${vo.hits}</td>	
					<td><fmt:formatDate value="${vo.regDate}" 
						pattern="yyyy-MM-dd"/>
					</td>	
				</tr> 
			  <!--반복처리 끝  -->
			  
	
			  
	  			<c:forEach var="reply" items="${replylist }">		
	  			
	  					  <c:if test="${vo.boardSeq eq reply.refBoardseq }">	
				<tr  style="text-align:center">
					
					<td colspan="4"  style="text-align:left">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="<c:url value='/resources/images/re.gif'/>" 
									alt="re이미지">
					<a href
			="<c:url value='/board/detail.do?seq=${reply.commentSeq}&type=2'/>">
											${reply.commentDesc}									
							</a>
					
					
					
						</td>
					
					
					
					<td><fmt:formatDate value="${reply.regDate}" 
						pattern="yyyy-MM-dd"/>
					</td>	
				</tr> 
				</c:if>	
			  <!--반복처리 끝  -->
	  			
	  		</c:forEach>
	  			
	  			
	  			
	  		</c:forEach>
	  	</c:if>
	 	
	  </tbody>
</table>	   
</div>
<div class="divPage">
	<!-- 이전블럭으로 이동 -->
	<c:if test="${pagingInfo.firstPage>1 }">	
		<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
			<img src="<c:url value='/resources/images/first.JPG'/>" alt="이전 블럭으로">
		</a>
	</c:if>
	<!-- 페이지 번호 추가 -->						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<c:forEach var="i" begin="${pagingInfo.firstPage }" 
		end="${pagingInfo.lastPage }">		
		<c:if test="${i==pagingInfo.currentPage }">
			<span style="color:blue;font-weight: bold">${i}</span>
		</c:if>
		<c:if test="${i!=pagingInfo.currentPage }">
			<a href="#" onclick="pageFunc(${i})">
				[${i}]</a>
		</c:if>
	</c:forEach>
	<!--  페이지 번호 끝 -->
	
	<!-- 다음블럭으로 이동 -->
	<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
		<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">	
			<img src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로">
		</a>
	</c:if>	
</div>
<div class="divSearch">
   	<form name="frmSearch" method="post" 
   		action='<c:url value="/board/list.do"/>'>
        <select name="searchCondition">
            <option value="board_title" 
            	<c:if test="${param.searchCondition=='board_title' }">
            		selected="selected"
            	</c:if>
            >제목</option>
            <option value="board_contents" 
            	<c:if test="${param.searchCondition=='board_contents' }">
            		selected="selected"
            	</c:if>
            >내용</option>
           
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력"
        	value="${param.searchKeyword}">   
		<input type="submit" value="검색">
    </form>
</div>

<div class="divBtn">
    <a href='<c:url value="/board/write.do"/>' >글쓰기</a>
</div>

</body>
</html>

