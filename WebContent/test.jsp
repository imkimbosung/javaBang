<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp" %>
<%@include file="/WEB-INF/views/buyer/incloudfile/topBar.jsp" %>

<html>
<head>
	<title>JAVABANG</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/css/util.css">
<%-- 	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/css/main.css">
 --%><!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/checkbox/check.css">

 </head>
<body>

	<div style="padding:40px;"> </div>
<div class="limiter">
<div class="container">
	<div class="panel-heading"><b>거래종류를 선택하시고 희망가격을 입력 해주세요.</b></div>
	<div class="panel-heading">     * 전세와 월세는 중복선택이 가능합니다.</div>
	<div style="padding:30px;"> </div>
	<div class="row">
		<div class="col-lg-12 ">
			<div class="form-group" style="padding:20px 20px 20px 250px;">
                    <div class="btn-group" data-toggle="buttons">
                    <label class="btn btn-warning active">
                                          <input type="checkbox" > 매매
                    </label>
                    <div style="padding:10px;"> </div>
                    <label class="btn btn-warning">
                                          <input type="checkbox"> 전세
                    </label>
                    <div style="padding:10px;"> </div>
                    <label class="btn btn-warning btn-lg.round">
                                          <input type="checkbox"> 월세
                    </label>
                  </div>
                   
                  </div>
            </div>
        </div>
        <div style="padding:40px;"> </div>
        <div class="panel-heading"><b>매물옵션을 선택 해주세요.</b></div>
	<div style="padding:30px;"> </div>
	<div class="row">
			<div class="dropdown">
		        <div class="select" >반려동물입주
		          <span></span>
		          <i class="fa fa-chevron-left"></i>
		        </div>
		        
			     <input type="hidden" name="pet_available_code">
			        <ul class="dropdown-menu">
			          <li value="1">가능</li>
			          <li value="0">불가능</li>
			        </ul>
      		</div>
      		<div style="padding:10px;"> </div>
      		<div class="dropdown">
		        <div class="select">주차가능여부
		          <span></span>
		          <i class="fa fa-chevron-left"></i>
		        </div>
		        
			        <input type="hidden" name="parking_available_code">
			        <ul class="dropdown-menu">
			          <li value="1">가능</li>
			          <li value="0">불가능</li>
			        </ul>
      		</div>
      		<div style="padding:10px;"> </div>
      		
      		<div class="dropdown">
		        <div class="select">난방종류선택
		          <span></span>
		          <i class="fa fa-chevron-left"></i>
		        </div>
		        
			        <input type="hidden" name="hc_type_code">
			        <ul class="dropdown-menu">
			          <li value="1">개별난방</li>
			          <li value="0">중앙난방</li>
			        </ul>
      		</div>
      		<div style="padding:10px;"> </div>
      		<br>
      		<div class="dropdown">
		        <div class="select">관리비유무
		          <span></span>
		          <i class="fa fa-chevron-left"></i>
		        </div>
		        
			        <input type="hidden" name="manage_fee_available_code">
			        <ul class="dropdown-menu">
			          <li value="1">있음</li>
			          <li value="0">없음</li>
			        </ul>
      		</div>
      		<div style="padding:10px;"> </div>
      		<div class="dropdown">
		        <div class="select">엘리베이터유무
		          <span></span>
		          <i class="fa fa-chevron-left"></i>
		        </div>
		        
			        <input type="hidden" name="elv_available_code">
			        <ul class="dropdown-menu">
			          <li value="1">있음</li>
			          <li value="0">없음</li>
			        </ul>
      		</div>
      		<div style="padding:10px;"> </div>
      		<div class="dropdown">
		        <div class="select">입주시기선택
		          <span></span>
		          <i class="fa fa-chevron-left"></i>
		        </div>
		        
			        <input type="hidden" name="live_in_type_code">
			        <ul class="dropdown-menu">
			          <li value="1">즉시입주</li>
			          <li value="0">협의</li>
			        </ul>
      		</div>
      		

                  </div>
                  
        <div style="padding:40px;"> </div>
          <div class="panel-heading"><b>기본제공옵션</b>을 선택 해주세요.</div>
			<div style="padding:30px;"> </div>
			<div class="row">
				<div class="col-lg-12 ">
			<div class="form-group" style="padding:20px 20px 20px 40px;">
                    <div class="btn-group" data-toggle="buttons">
                    <label class="btn_option btn-warning active ">
  						<input type="checkbox" class="option_select_code" name="option_select_code" value="1">정수기
                    </label>
                    
                    <div style="padding:10px;"> </div>
                    <label class="btn_option btn-warning">
  						<input type="checkbox" class="option_select_code" name="option_select_code" value="2">신발장
                    </label>
                    
                    <div style="padding:10px;"> </div>
                    <label class="btn_option btn-warning">
  						<input type="checkbox" class="option_select_code" name="option_select_code" value="3">wifi(인터넷)
                    </label>
                    <div style="padding:10px;"> </div>
                    <label class="btn_option btn-warning active">
  						<input type="checkbox" class="option_select_code" name="option_select_code" value="4">TV
                    </label>
                    
                    <div style="padding:10px;"> </div>
                    <label class="btn_option btn-warning">
  						<input type="checkbox" class="option_select_code" name="option_select_code" value="5">전자레인지
                    </label>
                   
                    <div style="padding:10px;"> </div>
                    <label class="btn_option btn-warning">
  						<input type="checkbox" class="option_select_code" name="option_select_code" value="6">세탁기
                    </label>
                    <div style="padding:10px;"> </div>
                    <label class="btn_option btn-warning active">
  						<input type="checkbox" class="option_select_code" name="option_select_code" value="7">책상
                    </label>
                    
                    <div style="padding:10px;"> </div>
                    <label class="btn_option btn-warning">
  						<input type="checkbox" class="option_select_code" name="option_select_code" value="8">에어컨
                    </label>
                    
                    <div style="padding:10px;"> </div>
                    <label class="btn_option btn-warning">
  						<input type="checkbox" class="option_select_code" name="option_select_code" value="9">옷장
                    </label>
                    <div style="padding:10px;"> </div>
                    <label class="btn_option btn-warning active">
  						<input type="checkbox" class="option_select_code" name="option_select_code" value="10">냉장고
                    </label>
                    
                  </div>
                   
                  </div>
            </div>
        </div>
                  
                  
                  
                  
            </div>
        </div>
         
         <div style="padding:30px;"> </div>

		<div style="padding:130px;"> </div>
<footer class="footer text-center" style="bottom:0; width:100%; height:70px;background:light;">
    <div class="container">
      <!-- <ul class="list-inline mb-5">
        <li class="list-inline-item">
          <a class="social-link rounded-circle text-white mr-3" href="#">
            <i class="icon-social-facebook"></i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="social-link rounded-circle text-white mr-3" href="#">
            <i class="icon-social-twitter"></i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="social-link rounded-circle text-white" href="#">
            <i class="icon-social-github"></i>
          </a>
        </li>
      </ul> -->
      <div class="border-top pt-5">
	      <p class="text-muted small mb-0">Copyright &copy; JAVABANG IN KOSMO 2019</p>
	      <p>대표 : 김보성, 최소연, 김명우, 최원혁, 권혜수, 박소영, 안성빈  </p>
    </div>
	    <div class="border-top pt-10">
	    </div>
    </div>
  </footer>

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
<!--===============================================================================================-->	
	<script src="${ctRoot}/resources/rentList/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${ctRoot}/resources/rentList/vendor/bootstrap/js/popper.js"></script>
	<script src="${ctRoot}/resources/rentList/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${ctRoot}/resources/rentList/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${ctRoot}/resources/rentList/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function(){
				ps.update();
			})
		});
			
		
	</script>
<!--===============================================================================================-->
	<script src="${ctRoot}/resources/rentList/js/main.js"></script>
<!--===============================================================================================-->
	<script src="${ctRoot}/resources/checkRoom/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script src="${ctRoot}/resources/checkRoom/js/jqBootstrapValidation.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	
	<script src="${ctRoot}/resources/selectbox/select.js"></script> 
	
	
	
	
	
</body>
</html>