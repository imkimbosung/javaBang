<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/buyer/incloudfile/topBar.jsp" %>

 <c:if test="${empty buyerDTO}">
	<script>
	alert("수정할 정보가 없습니다.");
	location.replacement("${ctBuyerRoot}/homeForm.do");
	</script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>

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

	function checkBuyerUpDelForm(){
			if(is_empty("[name=b_name]")){
				alert("성명 입력 요망");
				$("[name=b_name]").focus();
				return; 
			}
			if(is_empty("[name=b_id]")){
				alert("이메일 입력 요망");
				$('[name=b_id]').focus();
				return;
			} 
			
			
			if(is_empty("[name=b_pwd]")){
				alert("새 비밀번호 입력 요망");
				$('[name=b_pwd]').focus();
				return;
			} 
			

			
			if(confirm("정말 수정하시겠습니까?")==false){return;}

			
		
		$.ajax({
			url:"${ctBuyerRoot}/buyerUpDelProc.do"
			,type:"post"
			,data:$('[name=buyerUpDelForm]').serialize()
			,success:function(upDelCnt){
				
					if(upDelCnt==1){
						alert("수정 완료.");
						location.replace("${ctBuyerRoot}/homeForm.do");
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
		location.replace("${ctBuyerRoot}/withdrawal.do");
	}
	


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

    <%@include file="/WEB-INF/views/buyer/incloudfile/myPageFormUpMenu.jsp"%>
    

	
	<div class="col-lg-5" style="margin: 0 auto;">
		<div id="root">
	    <ol class="breadcrumb" style="margin-top:50px;margin-bottom: auto;width: 80%;">
	      <li class="breadcrumb-item active" style="color:#212529"><b>회원정보수정</b></li>
	    </ol>	
	</div>
			<c:if test="${!empty buyerDTO }">
		<div class="col-lg-5">
			<form name="buyerUpDelForm" method="post" id="buyerDTO" action="${ctBuyerRoot}/buyerUpDelProc.do">
			<table class="table" style="border:0; width:550px;">
			<tr>
				<td colspan=6 align=center><br><br><img src="${ctRoot}/resources/images/user.png" width=130;>
					<br><br><br>
			<tr>
				<td bgcolor="#EAEAEA" align=center>본인 성명
				<td > <input type="text" placeholder="김자바" size="14" maxlength="10" name="b_name" class="b_name" value="${buyerDTO.b_name}" readOnly>		
			<tr>
				<td bgcolor="#EAEAEA" align=center>이메일 주소
				<td ><input type="text" placeholder="아이디로 사용하실 이메일을 입력하세요" size="42" maxlength="25" name="b_id" class="b_id" value="${buyerDTO.b_id}" readOnly>
			<tr>
				<td bgcolor="#EAEAEA" align=center>휴대폰번호
				<td > <input type="text" size="14" maxlength="40" name="b_phone" class="b_phone" value="${buyerDTO.b_phone}">	
			<tr>
				<td bgcolor="#EAEAEA" align=center>새 비밀번호
				<td ><input type="password" placeholder="변경될 비밀번호를 입력하세요"  size="40" maxlength="10" name="b_pwd" class="b_pwd" value="${buyerDTO.b_pwd}">
				<td><input type="hidden"  size="20" maxlength="12" name="b_no" class="b_no" value="${buyerDTO.b_no}" >	
					
				
		
				<tr><td colspan=2 align=center><input type="button" class="btn btn-outline-success" style="width:100pt; height:40pt" value="수정완료" onClick="checkBuyerUpDelForm();">
				<br><br>
				<tr><td colspan=6 ><input type=button value="회원탈퇴" class="btn btn-outline-danger" onClick="goWithdrawal();">
						
			
			
			</table>
			</form>
		</div>
	</c:if>
	
	
	

</body>

  
  <%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
</html>













