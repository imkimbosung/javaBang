<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/buyer/incloudfile/topBar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매자 회원정보수정 비밀번호확인</title>

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
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<!-- 예쁜셀렉트박스 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="author" content="colorlib.com">
	
    <link href="${ctRoot}/resources/selectbox/css/main.css" rel="stylesheet" /> --%>
	
	
	
	<script>
	
		function checkForm(){
			
			if(is_empty("[name=b_pwd]")){
				alert("비밀번호 재 입력 요망");
				$('[name=b_pwd]').focus();
				return;
			} 
			
			/* alert($('[name=modifyPwdCheck]').serialize()); */
			
			$.ajax({
				url:"${ctBuyerRoot}/modifyPwdCheckProc.do"
				,type:"post"
				,data:$('[name=modifyPwdCheck]').serialize()
				,success:function(pwdCnt){
					
						if(pwdCnt==1){
							alert("비밀번호 확인 완료!");
							location.replace("${ctBuyerRoot}/modifyInfo.do");
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



<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" style="font-size:20pt">
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

    <%@include file="/WEB-INF/views/buyer/incloudfile/myPageFormUpMenu.jsp"%>
    
	
	
	
	
	
<div class="container" align=center>

	<form name="modifyPwdCheck" method="post" id="buyerDTO" action="${ctBuyerRoot}/modifyPwdCheckProc.do"><br><br><br><br>
		<div id="root">
		    <ol class="breadcrumb" style="margin-bottom: auto;width: 50%;">
		      <li class="breadcrumb-item active" style="color:#212529"><b>정보수정을 위해 비밀번호를 입력해주세요</b></li>
		    </ol>	
	</div>
	
	
		<div class="col-md-5" style=" margin-top:50">
			<table class="table" cellspacing=0 cellpadding=10 align=center width=650>
				<tr>
					<td bgcolor="#EAEAEA" align=center>비밀번호 재확인
					<td ><input type="password" size="20" maxlength="12" name="b_pwd" class="b_pwd">
			</table>
					<input type="hidden"  size="20" maxlength="12" name="b_no" class="b_no" value="${buyerDTO.b_no}" >
					<input type="button" class="btn btn-outline-success" style="width:200pt; height:50pt" value="정보수정" onClick="checkForm();">
		</div>
		
	</form>
	
	
</div>
</body>
<br><br><br><br><br><br>
<%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
</html>















