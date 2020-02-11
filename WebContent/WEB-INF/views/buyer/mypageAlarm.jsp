<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/buyer/incloudfile/topBar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>JAVABANG</title>


<%-- <!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================--> --%>
<!--===============================================================================================-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="/javaBang/resources/table/css/main.css">	<!-- 예쁜셀렉트박스 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="author" content="colorlib.com">
	
    <link href="${ctRoot}/resources/selectbox/css/main.css" rel="stylesheet" />

<script>

/* 	$(document).ready(function(){
		var obj = $('.product');
		obj.css("cursor","pointer");
		
		
		obj.click(function(){
			document.myPageForm.submit();
		});
	}); */

	
	
</script>
</head>


 <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	
    <div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay"  style="background-image: url('${ctRoot}/resources/images/boodong.jpg');height: 200px;">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center" style="height: 200px;">
            <div class="col-md-7">
				<h3 class="mb-1" style="padding: 20px;font-size: 40px;font-weight: bold;text-align: center;background-color: #ffffff;opacity: 0.9;">마이페이지</h3> 
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <%@include file="/WEB-INF/views/buyer/incloudfile//myPageFormUpMenu.jsp"%>
    
<div class="container">
	<div id="root" style="margin-top:50px;">
	    <ol class="breadcrumb" style="margin-bottom: auto;    width: 100%;">
	      <li class="breadcrumb-item active" style="color:#212529"><b>관심 원룸 정보</b></li>
	    </ol>	
	</div>
	<div class="site-section bg-light"  style="padding:30">
      <div class="row text-center">

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo magni sapiente, tempore debitis beatae culpa natus architecto.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo magni sapiente, tempore debitis beatae culpa natus architecto.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div>
      </div>

    </div>
    </div>

<div style="margin-top:20"></div>

	<div id="root">
	    <ol class="breadcrumb" style="margin-bottom: auto;">
	      <li class="breadcrumb-item active"  style="color:#212529"><b>렌탈서비스알림</b></li>
	    </ol>	
	</div>
    <div class="site-section bg-light" style="padding:30">
      <div class="container block-13">
     	<table class="table" border="0" cellspacing="0" cellpadding="5" width="90%">
		<tbody><tr bgcolor="lightblue" align="center">
			<th>공실번호</th><th>공실정보</th><th>공실센터 공개기간</th><th>공실현황</th><th>공실관리
		
			</th></tr><tr style="cursor:pointer" onclick="goRoomContentForm(22626);">
			<td align="center">22626
			</td><td><p style="line-height:30%" ;=""> <!-- 탭과 공실정보(룸타입) 사이간격 -->
			<br>
			<!-- 	
					
					
					
					
			-->
					<font size="3" color="blue" ><b>투룸</b></font>
					
						<font size="3" color="black"><b>월세35만원/보증금4000만원</b></font>
					

					
					
				</p>
				<p style="line-height:30%" ;=""><font size="2" color="gray" >서울 강남구 도곡동 953-11</font></p>
				<p style="line-height:30%" ;=""><font size="2" color="gray" >123동</font></p>
				<p style="line-height:30%" ;=""><font size="1" color="darkgray" >2020-01-08</font></p>
			</td>	
			<!-- 공실 공개일 -->	
			
			
				<td align="center"> 소유자 확인 중 </td>
			
			<!-- 공실 현황 -->
 			<td align="center"> 소유자 확인 중	</td>
 			<!-- 2020.01.03 수정 -->	
			<td align="center">
				<p><input type="button" class="emptyUpDel" value="정보수정" onclick="goEmptyUpDel();"></p>
				<!-- <p><input type="button" class="emptyUpDelForm" value="삭제" onClick="goEmptyUpDel();"></p> -->
			</td>
		
			</tr><tr style="cursor:pointer" onclick="goRoomContentForm(22628);">
			<td align="center">22628
			</td><td><p style="line-height:30%" ;=""> <!-- 탭과 공실정보(룸타입) 사이간격 -->
			<br>
			<!-- 	
					
					
					
					
			-->
					<font size="3" color="blue" ><b>투룸</b></font>
					

					
					
						<font size="3" color="black"><b>매매5000만원</b></font>
					
				</p>
				<p style="line-height:30%" ;=""><font size="2" color="gray" >인천 서구 원창동 333-6</font></p>
				<p style="line-height:30%" ;=""><font size="2" color="gray" ></font></p>
				<p style="line-height:30%" ;=""><font size="1" color="darkgray" >2020-01-08</font></p>
			</td>	
			<!-- 공실 공개일 -->	
			
				<td align="center"> 2020-01-08 ~  </td>
			
			
			<!-- 공실 현황 -->
 			<td align="center"> 공실 광고중	</td>
 			<!-- 2020.01.03 수정 -->	
			<td align="center">
				<p><input type="button" class="emptyUpDel" value="정보수정" onclick="goEmptyUpDel();"></p>
				<!-- <p><input type="button" class="emptyUpDelForm" value="삭제" onClick="goEmptyUpDel();"></p> -->
			</td>
		
			</tr><tr style="cursor:pointer" onclick="goRoomContentForm(22636);">
			<td align="center">22636
			</td><td><p style="line-height:30%" ;=""> <!-- 탭과 공실정보(룸타입) 사이간격 -->
			<br>
			<!-- 	
					
					
					
					
			-->
					<font size="3" color="blue" ><b>원룸</b></font>
					

					
					
						<font size="3" color="black"><b>매매1233만원</b></font>
					
				</p>
				<p style="line-height:30%" ;=""><font size="2" color="gray" >서울 강남구 도곡동 953-11</font></p>
				<p style="line-height:30%" ;=""><font size="2" color="gray" >123동</font></p>
				<p style="line-height:30%" ;=""><font size="1" color="darkgray" >2020-01-09</font></p>
			</td>	
			<!-- 공실 공개일 -->	
			
				<td align="center"> 2020-01-09 ~  </td>
			
			
			<!-- 공실 현황 -->
 			<td align="center"> 공실 광고중	</td>
 			<!-- 2020.01.03 수정 -->	
			<td align="center">
				<p><input type="button" class="emptyUpDel" value="정보수정" onclick="goEmptyUpDel();"></p>
				<!-- <p><input type="button" class="emptyUpDelForm" value="삭제" onClick="goEmptyUpDel();"></p> -->
			</td>
		
			</tr><tr style="cursor:pointer" onclick="goRoomContentForm(22641);">
			<td align="center">22641
			</td><td><p style="line-height:30%" ;=""> <!-- 탭과 공실정보(룸타입) 사이간격 -->
			<br>
			<!-- 	
					
					
					
					
			-->
					<font size="3" color="blue" ><b>원룸</b></font>
					

					
						<font size="3" color="black"><b>전세5000만원</b></font>
					
					
				</p>
				<p style="line-height:30%" ;=""><font size="2" color="gray" >s대구 달서구 감삼동 172-1</font></p>
				<p style="line-height:30%" ;=""><font size="2" color="gray" >15-2</font></p>
				<p style="line-height:30%" ;=""><font size="1" color="darkgray" >2020-01-10</font></p>
			</td>	
			<!-- 공실 공개일 -->	
			
			
				<td align="center"> 공인중개사 매칭 대기중 </td>
			
			<!-- 공실 현황 -->
 			<td align="center"> 공인중개사 매칭 대기중	</td>
 			<!-- 2020.01.03 수정 -->	
			<td align="center">
				<p><input type="button" class="emptyUpDel" value="정보수정" onclick="goEmptyUpDel();"></p>
				<!-- <p><input type="button" class="emptyUpDelForm" value="삭제" onClick="goEmptyUpDel();"></p> -->
			</td>
		
			</tr><tr style="cursor:pointer" onclick="goRoomContentForm(22642);">
			<td align="center">22642
			</td><td><p style="line-height:30%" ;=""> <!-- 탭과 공실정보(룸타입) 사이간격 -->
			<br>
					<font size="3" color="blue" ><b>투룸</b></font>
					

					
						<font size="3" color="black"><b>전세1000만원</b></font>
					
					
				</p>
				<p style="line-height:30%" ;=""><font size="2" color="gray" >대구 남구 대명동 3019-30</font></p>
				<p style="line-height:30%" ;=""><font size="2" color="gray" ></font></p>
				<p style="line-height:30%" ;=""><font size="1" color="darkgray" >2020-01-10</font></p>
			</td>	
			<!-- 공실 공개일 -->	
			
			
				<td align="center"> 공인중개사 매칭 대기중 </td>
			
			<!-- 공실 현황 -->
 			<td align="center"> 공인중개사 매칭 대기중	</td>
 			<!-- 2020.01.03 수정 -->	
			<td align="center">
				<p><input type="button" class="emptyUpDel" value="정보수정" onclick="goEmptyUpDel();"></p>
				<!-- <p><input type="button" class="emptyUpDelForm" value="삭제" onClick="goEmptyUpDel();"></p> -->
			</td>
		
	</tr></tbody></table>
      </div>
    </div>
</div>
	
		
</body>

  
  <%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
</html>
