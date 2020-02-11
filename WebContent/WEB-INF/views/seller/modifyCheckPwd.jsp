<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>
<%@include file="/WEB-INF/views/seller/incloudfile/topBar.jsp" %>
    
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <!-- shrink-to-fit=no는 애플의 safari(사파리) 브라우저에만 영향을 미치는 속성..? -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>정보 상세보기</title>

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
<!--===============================================================================================-->
    <link rel="stylesheet" href="${ctRoot}/resources/loginPage/css/title_ui.css">
<!--===============================================================================================-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> --%>
	<!-- 예쁜셀렉트박스 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="author" content="colorlib.com">
	
    <link href="${ctRoot}/resources/selectbox/css/main.css" rel="stylesheet" />
	
	<script>
	
		function checkForm(){
			
			if(is_empty("[name=s_pwd]")){
				alert("비밀번호 재 입력 요망");
				$('[name=s_pwd]').focus();
				return;
			} 
			
	
			$.ajax({
				url:"${ctSellerRoot}/modifyCheckPwdProc.do"
				,type:"post"
				,data:$('[name=modifyCheckPwd]').serialize()
				,success:function(pwdCnt){
					
						if(pwdCnt==1){
							alert("비밀번호 확인 완료!");
							location.replace("${ctSellerRoot}/modifySellerInfo.do");
						}else if(pwdCnt == -2){
							alert("비밀번호를 잘못 입력하였습니다.");
						}
						else {
							alert("서버쪽 DB 연동 실패");
						}
					
				}
				,error:function(){
					alert("서버와 통신 실패");
				}
			});
			
		}
		

	
	</script>
</head>
<body style="font-size:15pt;">
  <!-- Page Content -->
	<div class="container">

    	<!-- Page Heading/Breadcrumbs -->
   
		<div id="root" style="margin-top:150px">
			<h1 class="mt-4 mb-3">JAVABANG
				<small>팔아방</small>
			</h1>
		</div>
	
		<ol class="breadcrumb">
			<li class="breadcrumb-item active">마이페이지</li>
		</ol>
    
		<div class="container" align=center>
		
			<form name="modifyCheckPwd" method="post" id="sellerDTO" action="${ctSellerRoot}/modifyCheckPwdProc.do"><br><br><br><br>
				<div id="root">
					<ol class="breadcrumb" style="margin-bottom: auto;width: 50%; display:flow-root;">
						<li class="breadcrumb-item active" style="color:#212529" ><b>정보수정을 위해 비밀번호를 입력해주세요</b></li>
					</ol>	
				</div>
			
				<div class="col-md-5" style=" margin-top:50">
					<table class="table" cellspacing=0 cellpadding=10 align=center width=650>
						<tr>
							<td bgcolor="#EAEAEA" align=center>비밀번호 재확인
							<td ><input type="password" size="20" maxlength="12" name="s_pwd" class="s_pwd" value="${sellerDTO.s_pwd}" >
					</table>
							<input type="hidden"  size="20" maxlength="12" name="s_no" class="s_no" value="${sellerDTO.s_no}" >
							<input type="button" class="btn btn-outline-success" style="width:200pt; height:50pt" value="정보수정" onClick="checkForm();">
				</div>
			</form>
		</div>
	</div>	
  <!-- Bootstrap core JavaScript -->
  <script src="${ctRoot}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${ctRoot}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Contact form JavaScript -->
  <!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
  <script src="${ctRoot}/resources/js/jqBootstrapValidation.js"></script>
  <script src="${ctRoot}/resources/js/contact_me.js"></script>

<%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>



</body>
</html>