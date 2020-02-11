<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/buyer/incloudfile/topBar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>최근 본 페이지</title>
 

<script>
	function goSearch(){
		
	}
	

	$(document).ready(function(){
		var obj = $('.product');
		obj.css("cursor","pointer");
		obj.click(function(){
			//document.myPageForm.submit();

		});
		
	});

	
	
</script>
<%-- <link rel="stylesheet" href="${ctRoot}/resources/ownerHome/css/style.css">
      <!-- Custom CSS -->
  <link href="${ctRoot}/resources/ownerHome/css/stylish-portfolio.min.css" rel="stylesheet">
  <link rel="stylesheet" href="${ctRoot}/resources/ownerHome/css/bootstrap.min.css">
 	<!-- MAIN CSS -->
	<link rel="stylesheet" href="${ctRoot}/resources/ownerHome/css/style.css">
 <!-- <script src="${ctRoot}/resources/ownerHome/js/jquery-3.3.1.min.js"></script>
    <script src="${ctRoot}/resources/ownerHome/js/jquery-migrate-3.0.0.js"></script> -->
    <script src="${ctRoot}/resources/ownerHome/js/bootstrap.min.js"></script> --%>
<!--===============================================================================================-->
<!--===============================================================================================-->

	<!-- 예쁜셀렉트박스 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="author" content="colorlib.com">
    <link href="${ctRoot}/resources/selectbox/css/main.css" rel="stylesheet" />


</head>
 <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
 
	<div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay"  style="background-image: url('${ctRoot}/resources/images/boodong.jpg');height: 200px;">
        <div class="container" style="margin-top: -72;">
          <div class="row align-items-center justify-content-center text-center" style="height: 200px;margin-top: 72;">
            <div class="col-md-7">
				<h3 class="mb-1" style="padding: 20px;font-size: 40px;font-weight: bold;text-align: center;background-color: #ffffff;opacity: 0.9;width: 600;">마이페이지</h3> 
            </div>
          </div>
        </div>
      </div>
    </div>
    
	   <%@include file="/WEB-INF/views/buyer/incloudfile//myPageFormUpMenu.jsp"%>
    
	<div id="root"">
		<div class="col-md-10" style="float: right;margin: 40 370 0 0;width: 950;">
			<div id="root">
			    <ol class="breadcrumb">
			      <li class="breadcrumb-item active"><b>총 4개의 최근 본 방이 있습니다  </b></li>
			    </ol>	
			</div>
		</div>
		<div class="col-lg-8" style="margin: 50 0 50 500;">
			<img src="/resources/images/oneroom3.jpg" class="product" width=200;>
		</div>	
	</div>

	<div class="col-md-6">
	
	
	<div style="width: 500;padding: 200 0 100 100;position:absolute;top:63%;left:72%;z-index:4;">최근 본 방은 최대 50개까지 저장됩니다</div>
</div>
 <%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>

</body>
</html>

