<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:import url="/WEB-INF/views/include/header.jsp" />
 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
textarea#textarea_it {
    width: 42.7em;
    height: 16em;
    margin-top: -2px;
}
input#Insert_title {
    width: 153%;
    height: calc(1.5em + .75rem + 25px);
}
input#Insert_title_it {
    width: 152%;
    height: calc(1.5em + .75rem + 16px);
}
input#Insert_text {
    width: 68%;
    height: calc(1.5em + .75rem + 15px);
}
select#Insert_text_jc {
    width: 33.7%;
    height: calc(1.5em + .75rem + 15px);
    position: absolute;
    /* top: 12.5em; */
    top: 13em;
    right: -12.9em;
}
input#Insert_text_da {
    width: 107%;
    height: calc(1.5em + .75rem + 15px);
    margin-left: 166px;
}
select#Insert_text {
    width: 68%;
    height: calc(1.5em + .75rem + 15px);
    margin-left: -17px;
}
.col-lg-4-2t {
    font-size: 18px;
    position: relative;
    top: 13px;
    left: 34px;
}
span.point-2t {
    color: red;
    font-size: 12px;
    position: relative;
    top: 18px;
    left: 40px;
    margin-right: 106px;
}
.col-lg-4-3t {
    font-size: 18px;
    position: relative;
    top: 13px;
    left: 34px;
}
span.point-3t {
    color: red;
    font-size: 12px;
    position: relative;
    top: 18px;
    left: 40px;
    margin-right: 88px;
}
.col-lg-4-4t {
    font-size: 18px;
    position: relative;
    top: 13px;
    left: 34px;
}
span.point-4t {
    color: red;
    font-size: 12px;
    position: relative;
    top: 18px;
    left: 40px;
    margin-right: 70px;
}
.row.mb-4.mt-4_text {
    margin-bottom: 0.7rem!important;
}
.card.mb-4-bt {
    padding: 28px 0px 16px 9px;
    margin-bottom: 57px;
}
.span_notice_title{
	color: #222;
    font-size: 26px;
    font-weight: bold;
    letter-spacing: -2px;
    line-height: 34px;
}
.school_notice{
    /* position: relative; */
    top: -33px;
    left: 110px;
    font-size: 14px;
    letter-spacing: -1px;
    line-height: 28px;
    margin-left: 14px;
}
.hsc{
    color: #222;
    font-size: 20px;
    font-weight: bold;
    letter-spacing: -1px;
    line-height: 28px;
    margin-left: 19px;
    margin-bottom: 30px;
}
a.btn.btn-primary {
    position: relative;
    bottom: 10px;
    left: 105px;
    margin-right: 10px;
}
/*라디오버튼 */
.inpRdoSw .inOption>input:checked+.lbl {
    position: relative;
    z-index: 2;
    border-color: #4876ef;
    background-color: #4876ef;
    color: #fff;
}
.inpRdoSw.sizeXL .inOption>.lbl {
    padding-top: 11px;
    padding-bottom: 11px;
    height: 50px;
    font-size: 16px;
    line-height: 26px;
}
.inpRdoSw .inOption>.lbl {
    display: inline-block;
    padding: 5px 14px 6px;
    height: 32px;
    border: 1px solid #dbdbdb;
    box-sizing: border-box;
    color: #666;
    font-size: 13px;
    letter-spacing: -1px;
    line-height: 19px;
    text-align: center;
    vertical-align: top;
    background-color: #fff;
    cursor: pointer;
    user-select: none;
}
.resume_write .inpRdoSw.resume_right .inOption .lbl {
    width: 104px;
}
.inpRdoSw.sizeXL.resume_right.focus {
    position: absolute;
    /* top: 18.8em; */
    top: 19.6em;
    right: 1.8em;
}
.inpRdoSw .inOption {
    float: left;
    position: relative;
}
label.lbl {
    width: 89px;
    margin-left: -27px;
}
/* 사진 */
.resume_photo {
    position: absolute;
    top: 46px;
    right: 51px;
    padding: 9px;
    width: 120px;
    height: 160px;
    border: 1px solid #e9e9e9;
    box-sizing: border-box;
    text-align: center;
    background-color: #fff;
}
.resume_photo .box_photo {
    display: block;
    position: relative;
    padding-top: 50px;
    width: 100px;
    height: 140px;
    box-sizing: border-box;
    background-color: #fafafa;
}
</style>
<script type="text/javascript">
/* 자기소개서: 남은 글자 수 
 https://gahyun-web-diary.tistory.com/26*/
$( document ).ready(function() {
	$("#textarea_it").keyup(function (e){
    	 var content = $(this).val();       
    	 $('#counter').val(1000-content.length);

         if(content.length > 1000) {
           $(this).val($(this).val().substring(0, 1000));
         }
	});
});
</script>
<c:import url="/WEB-INF/views/include/headend.jsp" />

<body>
<c:import url="/WEB-INF/views/include/navi.jsp" />
  

  <!-- Page Content -->
  <div class="container">
    <div class="row">
    

      <!-- Entries Column -->
      <div class="col-md-8">
      
    	<!-- 이력서 제목 -->
		<div class="row mb-4 mt-4">
			<!-- <div class="col-lg-4">아이디  </div> -->
			<div class="col-lg-8 form-label-group mb-2">
				<input type="text" id="Insert_title" name="RESUME_TITLE" class="form-control" placeholder="이력서 제목을 입력하세요." required autofocus>
			<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		</div>
		

        <!-- 기본정보 -->
       	<span class="span_notice_title">기본정보</span>
        <div class="card mb-4-bt">
        
        <!--기본정보: 사진 -->
        <div class="resume_photo">
            <a href="##" class="box_photo" data-api_type="layer" data-api_id="basic_photo">
               +<br><span>사진추가</span>  </a>
            <a class="photo_delete" href="##" style="display:none;">
            <span class="blind">사진 삭제</span></a>
    	</div>
    	
    	<!--기본정보: 성별선택 -->
        <div class="inpRdoSw sizeXL resume_right focus">
			<span class="inOption"> <input name="sex" id="male"
				type="radio" value="male" checked=""> <label for="male"
				class="lbl">남</label>
			</span> <span class="inOption"> <input name="sex" id="female"
				type="radio" value="female"> <label for="female" class="lbl">여</label>
			</span>
			<p class="txt_error"></p>
		</div>
		
		<!--기본정보: 구직상태 -->
        <div class="row mb-4 mt-4_text">
				<div class="col-lg-8 form-label-group mb-2">
					<select id="Insert_text_jc" class="form-control">
						<option>구직상태선택</option>
						<option>구직준비중(재학생)</option>
						<option>구직중</option>
						<option>재직중</option>
					</select>
				<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		</div>
        
        	<!--기본정보: 이름 -->
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-2t">이름  </div>
				<span class="point-2t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="MEMBER_NAME" class="form-control" placeholder="이름" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			<!--기본정보: 생년월일 -->
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">생년월일  </div>
				<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="BIRTHDAY" class="form-control" placeholder="생년월일" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			<!--기본정보: 이메일 -->
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-3t">이메일  </div>
				<span class="point-3t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="MEMBER_ID" class="form-control" placeholder="이메일" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			<!--기본정보: 전화번호 -->
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">전화번호  </div>
				<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="PHONE" class="form-control" placeholder="전화번호" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			<!--기본정보: 우편번호 -->
	        <div class="row mb-4 mt-4_text">
				<div class="col-lg-4-4t">우편번호  </div>
				<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="ZIP_CODE" class="form-control" placeholder="우편번호" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			<!--기본정보: 주소 -->
			<div class="row mb-4 mt-4_text">
				<div class="col-lg-4-2t">주소  </div>
				<span class="point-2t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="ADDRESS" class="form-control" placeholder="주소" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			<div class="row mb-4 mt-4_text">
					<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text_da" name="DETAIL_ADDRESS" class="form-control" placeholder="상세주소" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
				</div>
			</div>
			
        </div>

        <!-- 학력사항 -->
        <span class="span_notice_title">학력사항</span>
        <span class="school_notice">최종학력 선택 후 학력사항을 입력하세요.</span>
		<span class="col-button">
			<a href="#" class="btn btn-primary"
				onclick="sample1_execDaumPostcode()">고등학교</a>
		</span>
		<span class="col-button">
			<a href="#" class="btn btn-primary"
				onclick="sample2_execDaumPostcode()">대학교</a>
		</span>
		<span class="col-button">
			<a href="#" class="btn btn-primary"
				onclick="sample1_execDaumPostcode()">대학원</a>
		</span>
		
		<div class="card mb-4-bt">
        <h4 class="hsc">고등학교 정보 입력</h4>
        <div class="row mb-4 mt-4_text">
			<div class="col-lg-4-4t">학교이름  </div>
			<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="EDU_NAME" class="form-control" placeholder="학교이름" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		</div>
        <div class="row mb-4 mt-4_text">
			<div class="col-lg-4-4t">재학기간  </div>
			<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name=" PERIOD_STDT" class="form-control" placeholder="전화번호" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		</div>
		
		<hr>
		
		<h4 class="hsc">대학,대학원 정보 입력</h4>
		<div class="row mb-4 mt-4_text">
			<div class="col-lg-4-4t">대학교구분  </div>
			<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<select id="Insert_text" class="form-control">
						<option>2,3년제</option>
						<option>4년제</option>
						<option>대학원(석사)</option>
						<option>대학원(박사)</option>
					</select>
				<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		</div>
		<div class="row mb-4 mt-4_text">
			<div class="col-lg-4-4t">학교이름  </div>
			<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name="EDU_NAME" class="form-control" placeholder="학교이름" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		</div>
        <div class="row mb-4 mt-4_text">
			<div class="col-lg-4-4t">재학기간  </div>
			<span class="point-4t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name=" PERIOD_STDT" class="form-control" placeholder="전화번호" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		</div>
        <div class="row mb-4 mt-4_text">
			<div class="col-lg-4-2t">학점  </div>
			<span class="point-2t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name=" PERIOD_STDT" class="form-control" placeholder="학점" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		</div>
        <div class="row mb-4 mt-4_text">
			<div class="col-lg-4-2t">전공  </div>
			<span class="point-2t">필수</span>
				<div class="col-lg-8 form-label-group mb-2">
					<input type="text" id="Insert_text" name=" PERIOD_STDT" class="form-control" placeholder="전공" required autofocus>
				<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		</div>
        <hr>
		
	    
          
        </div>

        <!-- 희망근무조건 -->
        <span class="span_notice_title">희망근무조건</span>
        <div class="card mb-4-bt">
          
        </div>

        <!-- 경력사항 -->
        <span class="span_notice_title">경력사항</span>
        <span class="col-button">
			<a href="#" class="btn btn-primary"
				onclick="sample1_execDaumPostcode()">신입</a>
		</span>
		<span class="col-button">
			<a href="#" class="btn btn-primary"
				onclick="sample2_execDaumPostcode()">경력</a>
		</span>
        <div class="card mb-4-bt">
          
        </div>

        <!-- 자기소개서 -->
        <span class="span_notice_title">자기소개서</span>
        <div class="card mb-4-bt">
          <!-- <div class="row mb-4 mt-4-it"> -->
			<div class="col-lg-8 form-label-group mb-2">
				<input type="text" id="Insert_title_it" name="RESUME_TITLE" class="form-control" placeholder="자소서 제목" required autofocus>
			<div id="idchkdiv" class="chkmessage"> </div>
			</div>
		 <!--  </div> -->
      	   <!-- <div class="row mb-4 mt-4-it"> -->
			<div class="col-lg-8 form-label-group mb-2">
				<textarea id="textarea_it" class="form-control" name="content" placeholder="자소서 내용" required autofocus></textarea>
				<span class="txsub">남은글자수 : <input type="text" readonly  value="1000" name="counter" id="counter" class="form-control"></span> 
			<div id="idchkdiv" class="chkmessage"> </div>
			<!-- </div> -->
		  </div>
          
        </div>

        <!-- Pagination -->
        <ul class="pagination justify-content-center mb-4">
          <li class="page-item">
            <a class="page-link" href="#">&larr; Older</a>
          </li>
          <li class="page-item disabled">
            <a class="page-link" href="#">Newer &rarr;</a>
          </li>
        </ul>

      </div>

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">

        <!-- Search Widget -->
        <div class="card mb-4">
          <h5 class="card-header">Search</h5>
          <div class="card-body">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Search for...">
              <span class="input-group-btn">
                <button class="btn btn-secondary" type="button">Go!</button>
              </span>
            </div>
          </div>
        </div>

        <!-- Categories Widget -->
        <div class="card my-4">
          <h5 class="card-header">Categories</h5>
          <div class="card-body">
            <div class="row">
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="#">Web Design</a>
                  </li>
                  <li>
                    <a href="#">HTML</a>
                  </li>
                  <li>
                    <a href="#">Freebies</a>
                  </li>
                </ul>
              </div>
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="#">JavaScript</a>
                  </li>
                  <li>
                    <a href="#">CSS</a>
                  </li>
                  <li>
                    <a href="#">Tutorials</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>

        <!-- Side Widget -->
        <div class="card my-4">
          <h5 class="card-header">Side Widget</h5>
          <div class="card-body">
            You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!
          </div>
        </div>

      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>
