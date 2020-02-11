<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/buyer/incloudfile/topBar.jsp" %>

 <%-- <c:if test="${empty buyerDTO}">
	<script>
	alert("탈퇴할 정보가 없습니다.");
	location.replacement("${ctBuyerRoot}/homeForm.do");
	</script>
</c:if> --%>


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
<!--===============================================================================================-->
    <link rel="stylesheet" href="${ctRoot}/resources/loginPage/css/title_ui.css">
<!--===============================================================================================-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> --%>
	<!-- 예쁜셀렉트박스 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="author" content="colorlib.com">
	
    <link href="${ctRoot}/resources/selectbox/css/main.css" rel="stylesheet" />

<script>

	function deleteForm(){
		
		if(is_empty("[name=b_pwd]")){
			alert("비밀번호 재 입력 요망");
			$('[name=b_pwd]').focus();
			return;
		} 
		
		
		//alert($('[name=withdrawal]').serialize());
		
		
		if(confirm("정말 탈퇴하시겠습니까?")==false){return;}
		
		
		
		
		$.ajax({
			url:"${ctBuyerRoot}/withdrawalProc.do"
			,type:"post"
			,data:$('[name=withdrawal]').serialize()
			,success:function(deleteCnt){
				
					if(deleteCnt==1){
						alert("탈퇴 완료.");
						location.replace("${ctBuyerRoot}/homeForm.do");
					}else if(deleteCnt == -1){
						alert("이미 삭제되어 탈퇴할 수 없습니다.");
					}else if(deleteCnt == -2){
						alert("비밀번호가 잘못 입력되었습니다.");
					}else if(deleteCnt == 0){
						alert("탈퇴 실패");
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

    <div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay" data-stellar-background-ratio="0.5" style="background-image: url('${ctRoot}/resources/images/cry.png')">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-7">
              <h1 class="mb-2">회원 탈퇴</h1>
              <p class="text-white">정말 탈퇴하시겠습니까?</p>
            </div>
          </div>
        </div>
      </div>
    </div>
	<%-- <c:if test="${!empty buyerDTO }"> --%>
<div class="container">
	<form name="withdrawal" method="post" id="buyerDTO" action="${ctBuyerRoot}/withdrawalProc.do">
		<div id="root">
		<h1 class="mt-4 mb-3">JAVABANG</h1>

	    <ol class="breadcrumb" style="margin-bottom: auto;">
	      <li class="breadcrumb-item active" style="color:#212529"><b>회원탈퇴</b></li>
	    </ol>	
	</div>
	
	
		<div class="col-md-5" style=" margin-top:50">
			<table class="table" cellspacing=0 cellpadding=10 align=center width=650>
				<tr>
					<td bgcolor="#EAEAEA" align=center>비밀번호 확인
					<td ><input type="password" placeholder="password" size="20" maxlength="12" name="b_pwd" class="b_pwd">
					
					
				<tr ><td colspan=2 align=center><input type="button" class="btn btn-outline-danger" style="width:200pt; height:50pt" value="회원탈퇴" onClick="deleteForm();">
				
				
				<input type="hidden"  size="20" maxlength="12" name="b_no" class="b_no" value="${buyerDTO.b_no}" >
					
					
					
				
			</table>
		</div>
	</form>
</div>
<%-- </c:if> --%>
</body>
<br><br><br><br><br><br>
<%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
</html>
























