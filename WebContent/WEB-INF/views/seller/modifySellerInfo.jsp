<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>
<%@include file="/WEB-INF/views/seller/incloudfile/topBar.jsp" %>

 <c:if test="${empty sellerDTO}">
	<script>
	alert("수정할 정보가 없습니다.");
	location.replacement("${ctSellerRoot}/ownerHomeForm.do");
	</script>
</c:if>
    
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <!-- shrink-to-fit=no는 애플의 safari(사파리) 브라우저에만 영향을 미치는 속성..? -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

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
<!--===============================================================================================-->
    <link rel="stylesheet" href="${ctRoot}/resources/loginPage/css/title_ui.css">
<!--===============================================================================================-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> --%>
	<!-- 예쁜셀렉트박스 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="author" content="colorlib.com">
	
    <link href="${ctRoot}/resources/selectbox/css/main.css" rel="stylesheet" />
    
<script>

	function checkSellerUpDelForm(){
			if(is_empty("[name=s_pwd]")){
				alert("새 비밀번호 입력 요망");
				$('[name=s_pwd]').focus();
				return;
			} 
			if(confirm("정말 수정하시겠습니까?")==false){return;}

			
		
		$.ajax({
			url:"${ctSellerRoot}/sellerUpDelProc.do"
			,type:"post"
			,data:$('[name=sellerUpDelForm]').serialize()
			,success:function(upDelCnt){
				
					if(upDelCnt==1){
						alert("수정 완료.");
						location.replace("${ctSellerRoot}/ownerHomeForm.do");
					}else if(upDelCnt == 0){
						alert("수정 실패.");
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
	
	function goWithdrawal(){
		location.replace("${ctSellerRoot}/withdrawal.do");
	}
	


</script>

</head>
<body>
	<!-- Page Content -->
	<div class="container">

    	<!-- Page Heading/Breadcrumbs -->
   
		<div id="root" style="margin-top:50px">
			<h1 class="mt-4 mb-3">JAVABANG
				<small>팔아방</small>
			</h1>
		</div>
	
		<ol class="breadcrumb">
			<li class="breadcrumb-item active">마이페이지 >><b>고객 정보수정/회원탈퇴</b></li>
		</ol>
		
		<c:if test="${!empty sellerDTO }">
		
		<div class="col-lg-5">
			<form name="sellerUpDelForm" method="post" id="sellerDTO" action="${ctSellerRoot}/sellerUpDelProc.do">
			<table class="table" style="border:0; width:550px;">
			<tr>
				<td bgcolor="#EAEAEA" align=center>본인 성명
				<td > <input type="text" placeholder="김자바" size="14" maxlength="10" name="s_name" class="s_name" value="${sellerDTO.s_name}" readOnly>		
			<tr>
				<td bgcolor="#EAEAEA" align=center>이메일 주소
				<td ><input type="text" placeholder="아이디로 사용하실 이메일을 입력하세요" size="42" maxlength="25" name="s_id" class="s_id" value="${sellerDTO.s_id}" readOnly>
			<tr>
				<td bgcolor="#EAEAEA" align=center>새 비밀번호
				<td ><input type="password" placeholder="변경될 비밀번호를 입력하세요"  size="40" maxlength="10" name="s_pwd" class="s_pwd" value="${sellerDTO.s_pwd}">
			<tr>
				<td bgcolor="#EAEAEA" align=center>회원가입 경로(선택사항)
				<td><select name ="route_code" >
								<option value="">--가입경로 선택--</option>
								<option value=1>광고</option>
								<option value=2>지인추천</option>
								<option value=3>블로그</option>
								<option value=4>뉴스/신문</option>
								<option value=5>기타</option>
					</select>
				<tr><td colspan=2 align=center><input type="button" class="btn btn-outline-success" style="width:100pt; height:40pt" value="수정완료" onClick="checkSellerUpDelForm();">
				<br><br>
				
						
			
			
			</table>
			<input type=button value="회원탈퇴" class="btn btn-outline-danger" onClick="goWithdrawal();">
			</form>
		</div>
	</c:if>
	
	</div>
	

</body>
		
		

	
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

























