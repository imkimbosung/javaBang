<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/realtor/incloudfile/topBar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인중개사 회원가입완료</title>



<script>
	function goSearch(){
		location.replace("${ctRealtorRoot}/proHome.do")
	}
	
	function goSearch2(){
		location.replace("${ctRealtorRoot}/proMyPageHome.do?r_no=1")
		
	}
</script>

</head>


 <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<!-- Header -->
		<div class="site-section-cover overlay" style="background-image: url('/javaBang/resources/images/boodong.png')">
			<div class="container">
				<div class="row align-items-center justify-content-center text-center" style="height:200px;margin-left:70;">
					<div class="col-md-10" style="margin:0 auto;">
						<h3 class="mb-1" style="padding: 15px;font-weight: bold;text-align: center;background-color: #ffffff;opacity: 0.9;">공인중개사 회원가입이 완료되었습니다.</h3>
						<h3 class="mb-1" style="padding: 15px;font-weight: bold;text-align: center;background-color: #ffffff;opacity: 0.9;">지금바로 공인중개사 서비스를 이용해보세요!</h3>
					</div>
				</div>
			</div>
		</div>
    
    
	
	<div class="row" style="margin:100 600 10;">
		<input type="button" class="btn btn-outline-dark" style="width:200pt; height:200pt; margin:10px;" value="메인 화면 가기" onClick="goSearch();"><br>
		<input type="button" class="btn btn-outline-dark" style="width:200pt; height:200pt; margin:10px;" value="공인중개사 마이페이지 바로 가기" onClick="goSearch2();"><br>
	</div>			
		
</body>

  
  <%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
</html>













