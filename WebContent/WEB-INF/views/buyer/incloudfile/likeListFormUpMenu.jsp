<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>관심 페이지 메뉴</title>

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
    <link rel="stylesheet" href="${ctRoot}/resources/loginPage/css/title_ui.css">
<!--===============================================================================================-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<!-- 예쁜셀렉트박스 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="author" content="colorlib.com">
	
    <link href="${ctRoot}/resources/selectbox/css/main.css" rel="stylesheet" />

<script>

</script>
</head>
<body align=center>



<br><br><br>
	<div class="container" >
		<div class="col-md-10">
			<div id="root">
				<h1 class="mt-4 mb-3">JAVABANG
		     	 <small>구해방</small>
		    	</h1>
		
			    <ol class="breadcrumb">
			      <li class="breadcrumb-item active"><b>최근에 본 공실목록   </b></li>
			    </ol>	
			</div>
			<div class="col-md-10" style="margin-left: 350;margin-bottom: 100;">
				<input type=button class="btn btn-outline-dark" value="최근 본 방" onClick="${ctBuyerRoot}/latestLookList.do">
				<input type=button class="btn btn-outline-dark" value="찜한 방" onClick="${ctBuyerRoot}/likeRoomList.do">
			</div>
		</div>
	</div>
</body>
</html>











