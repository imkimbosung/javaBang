<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인중개사 마이페이지</title>

<!--===============================================================================================-->
<link rel="stylesheet" href="${ctRoot}/resources/nav/bootstrap.css">
<%-- <!--===============================================================================================-->
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

	<!-- 예쁜셀렉트박스 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="author" content="colorlib.com">
	
    <link href="${ctRoot}/resources/selectbox/css/main.css" rel="stylesheet" /> --%>


<script>

function checkForm(){
	
	if(is_empty("[name=r_pwd]")){
		alert("비밀번호 재 입력 요망");
		$('[name=r_pwd]').focus();
		return;
	} 
	
	/* alert($('[name=realtorModifyPwdCheck]').serialize()); */
	
	$.ajax({
		url:"${ctRealtorRoot}/realtorModifyPwdCheckProc.do"
		,type:"post"
		,data:$('[name=realtorModifyPwdCheck]').serialize()
		,success:function(pwdCnt){
			
				if(pwdCnt==1){
					alert("비밀번호 확인 완료!");
					location.replace("${ctRealtorRoot}/contentMemberInfo.do");
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


 <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
    
    
    
     <!-- Header -->
		<div class="site-section-cover overlay" style="background-image: url('/javaBang/resources/images/boodong.png')">
			<div class="container">
				<div class="row align-items-center justify-content-center text-center" style="height:200px;margin-left:70;">
					<div class="col-md-10" style="margin-left: 300;">
						<h3 class="mb-1" style="padding: 15px;font-weight: bold;text-align: center;background-color: #ffffff;opacity: 0.9;width: 400;">자바방프로공인중개사</h3>
					</div>
				</div>
			</div>
		</div>
	<%@include file="/WEB-INF/views/realtor/incloudfile/proLeftMenu.jsp" %>



	
<div class="container" align=center> <br><br><br>

	<form name="realtorModifyPwdCheck" method="post" id="realtorDTO" action="${ctRealtorRoot}/realtorModifyPwdCheckProc.do">
		<div id="root">
		<h1 class="mt-4 mb-3">정보 수정 비밀번호 확인</h1>
		</div>
	
	
		<div class="col-md-5" style=" margin-top:50">
			<table class="table" cellspacing=0 cellpadding=10 align=center width=650>
				<tr>
					<td bgcolor="#EAEAEA" align=center>비밀번호 재확인
					<td ><input type="password" size="20" maxlength="12" name="r_pwd" class="r_pwd">
				
				</table>	
					<input type="button" class="btn btn-outline-success" style="width:200pt; height:50pt" value="정보수정" onClick="checkForm();">
					<input type="hidden"  size="20" maxlength="12" name="r_no" class="r_no" value="${realtorDTO.r_no}" >
			
		</div>
		
	</form>
	
	
</div>
 <br><br><br> <br><br><br> <br><br><br>

</body>
</html>






