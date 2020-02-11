<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/realtor/incloudfile/topBar.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JAVABANG</title>
	<script>
		function goRealtorUpProc(){
			if(is_empty("[name=r_pwd]") ){
				alert("암호를 입력해 주세요");
				$("[name=r_pwd]").focus();
				return;
			}
			if(is_empty("[name=ri_name]")){
				alert("중개사 대표자명을 입력해주세요");
				$("[name=ri_name]").val("");
				return; 
			}
			if(is_empty("[name=ri_officename]")){
				alert("중개사무소명을 입력해 주세요");
				$('[name=ri_officename]').val("");
				return;
			} 
			
			if(is_empty("[name=ri_addr]")){
				alert("중개사무소 주소를 입력해주세요");
				$('[name=ri_addr]').val("");
				return;
			} 
			
			if(is_empty("[name=ri_detail_addr]")){
				alert("중개사무소 상세 주소를 입력해주세요");
				$("[name=ri_detail_addr]").val("");
				return;
			} 
			
			if(confirm("정말 [수정] 하시겠습니까?") ==false){return;}
			alert( $("[name=contentMemberInfo]").serialize() );
			
			$.ajax({
				url : "${ctRealtorRoot}/realtorInfoUpProc.do"
					, type : "post"
					, data : $("[name='contentMemberInfo']").serialize()
					, success : function(updateCnt){
						if(updateCnt == -1){
							alert(" updateRealtorCnt update Error 발생 " );
						}
						else if(updateCnt == -2){
							alert(" updateInfoCnt update Error 발생 " );
						}
						else if(updateCnt == -3){
							alert(" updateAddrCnt update Error 발생 " );
						}
						else if(updateCnt == -4){
							alert(" updateAuthCnt update Error 발생 " );
						}
						else{
							alert(" updateCnt " + updateCnt);
							alert("회원 정보가 수정되었습니다.");
							location.replace('${ctRealtorRoot}/proMyPageHome.do');
						}
				
					}
					, error : function(request, status, error){
						alert("서버접속실패");
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

					}
			});

		}
		
		function goRealtorWithdrawalProc(){
			location.replace("${ctRealtorRoot}/realtorWithdrawal.do");
		}
	</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300"><center>
	<!-- Header -->
		<div class="site-section-cover overlay" style="background-image: url('/javaBang/resources/images/boodong.png')">
			<div class="container">
				<div class="row align-items-center justify-content-center text-center" style="height:200px;margin-left:70;">
					<div class="col-md-10" style="margin-left: 300;">
						<h3 class="mb-1" style="padding: 15px;font-weight: bold;text-align: center;background-color: #ffffff;opacity: 0.9;width: 400;">자바방프로정보수정</h3>
					</div>
				</div>
			</div>
		</div>
		
		
	<div class="col-lg-6">	
	<div id="root">
	    <ol class="breadcrumb" style="margin-bottom: auto;margin-top:50px;">
	      <li class="breadcrumb-item active" style="color:#212529"><b>공인중개사 정보수정</b></li>
	    </ol>	
	</div>	
	<form name="contentMemberInfo" method="post" >
		<input type="hidden" name="r_no" value="${realtorDTO.r_no}" >
		<table class="table" border=1  cellspacing=0 cellpadding=10  align=center>
		<tr><td colspan=6 align=center><br><br><img src="${ctRoot}/resources/images/profileImage/${realtorMenuInfoDTO.image_name}" width=150;>
		
		<br><br>
			
			<tr>
				<td bgcolor="#EAEAEA" align=center>아이디
				<td ><input type="text" size="20" maxlength="10" value="${realtorDTO.r_id}" name="r_id" class="r_id" readOnly >
			<tr>
				<td bgcolor="#EAEAEA" align=center>비밀번호
				<td ><input type="password" size="20" maxlength="10" name="r_pwd" class="r_pwd"  >
			<tr>
				<td bgcolor="#EAEAEA" align=center>이름
				<td ><input type="text" size="20" maxlength="10" value="${realtorDTO.r_name}" name="r_name" class="r_name" readOnly >
			<tr>
				<td bgcolor="#EAEAEA" align=center>중개사 대표자명
				<td><input type="text" placeholder="${realtorDTO.ri_name}"  size="30" maxlength="10" name="ri_name" class="ri_name" >
			<tr>
				<td bgcolor="#EAEAEA" align=center>권한/자격 
				<td><select name ="authority_code" >
						<option value="">-권한/자격--</option>
						<option value=1>대표공인중개사</option>
						<option value=2>소속공인중개사</option>
						<option value=3>중개보조원</option>
						<option value=4>중개인</option>
					</select>
			<tr>
				<td bgcolor="#EAEAEA" align=center>중개사무소명
				<td ><input type="text" value="${realtorDTO.ri_officename}" size="50" maxlength="100" name="ri_officename" class="ri_officename"  >
			<tr>
				<tr>
					<td bgcolor="#EAEAEA" align=center>중개사무소 주소
					<td><div class="controls" style="margin-bottom: 20;">
                     <button type="button" class="btn btn-info"
                        onClick="sample4_execDaumPostcode()">주소검색</button>
                  </div>
                  <div class="control-group form-group">
                  <div class="controls">
                     <input type="text" class="form-control"
                        name="ri_zip_code" id="sample4_postcode" placeholder="우편번호"
                        width="100%">
                     <p class="help-block"></p>
                  </div>
               </div>
               <div class="control-group form-group">
                  <div class="controls">
                     <input type="text" class="form-control"
                        id="sample4_roadAddress"
                        style="background-color: #F2F2F2; resize: none" readonly placeholder="도로명 주소">
                  </div>
               </div>
               <div class="control-group form-group">
                  <div class="controls">
                     <input type="text" class="form-control"
                        name="ri_addr" id="sample4_jibunAddress"
                        style="background-color: #F2F2F2; resize: none" readonly placeholder="             ${realtorDTO.ri_addr}">
                  </div>
               </div>
               <span id="guide" style="color: #999; display: none"></span>
               <div class="control-group form-group">
                  <div class="controls">
                     <input type="text" class="form-control"
                        id="sample4_extraAddress"
                        style="background-color: #F2F2F2; resize: none" readonly placeholder="세부 주소">
                  </div>
               </div>
               <div class="control-group form-group">
                  <div class="controls">
                  <input type="text" class="form-control"
                        name="ri_detail_addr" id="sample4_detailAddress"
                        style="background-color: #F2F2F2; resize: none" placeholder="             ${realtorDTO.ri_detail_addr}" >
                  </div>
               </div>
                  
                  <script
                  src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
               <script>
             //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
               function sample4_execDaumPostcode() {
                   new daum.Postcode({
                       oncomplete: function(data) {
                           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                           // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                           var roadAddr = data.roadAddress; // 도로명 주소 변수
                           var jibunAddr = data.jibunAddress;   //지번 주소 변수
                           var extraRoadAddr = ''; // 참고 항목 변수

                           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                               extraRoadAddr += data.bname;
                           }
                           // 건물명이 있고, 공동주택일 경우 추가한다.
                           if(data.buildingName !== '' && data.apartment === 'Y'){
                              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                           }
                           // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                           if(extraRoadAddr !== ''){
                               extraRoadAddr = ' (' + extraRoadAddr + ')';
                           }

                           // 우편번호와 주소 정보를 해당 필드에 넣는다.
                           document.getElementById('sample4_postcode').value = data.zonecode;
                           document.getElementById("sample4_roadAddress").value = roadAddr;
                           document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                           
                           // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                           if(roadAddr !== ''){
                               document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                           } else {
                               document.getElementById("sample4_extraAddress").value = '';
                           }
                       
                           // 지번주소가 뜨지 않을 때 예상주소에 해당하는 주소값을 브라우저 및 파라미터 값에 넣어준다.
                           if(jibunAddr == ''){
                               var expJibunAddr = data.autoJibunAddress;
                               document.getElementById("sample4_jibunAddress").value = 's'+expJibunAddr;
                            }

                           var guideTextBox = document.getElementById("guide");
                           // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                           if(data.autoRoadAddress) {
                               var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                               guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                               guideTextBox.style.display = 'block';

                           } else if(data.autoJibunAddress) {
                               var expJibunAddr = data.autoJibunAddress;
                               guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                               guideTextBox.style.display = 'block';
                           } else {
                               guideTextBox.innerHTML = '';
                               guideTextBox.style.display = 'none';
                           }
                       }
                   }).open();
               }
           </script>
				
			<tr>
				<td bgcolor="#EAEAEA" align=center>중개등록번호 
				<td ><input type="text" size="42" maxlength="50" value="${realtorDTO.ri_realtor_num}" name="ri_realtor_num" class="ri_realtor_num" readOnly>
			<!-- <tr>
				<td bgcolor="#EAEAEA" align=center>중개등록증 첨부
				<td ><input type="file" name="mediation_registration_card" class="mediation_registration_card"> -->
			<tr>
				<td bgcolor="#EAEAEA" align=center>휴대폰 번호
				<td><input type="text" size="42" maxlength="50" placeholder="${realtorDTO.r_phone}" name="r_phone" class="r_phone" >
	
			<tr>
				<td bgcolor="#EAEAEA" align=center>대표 전화번호
				<td><input type="text" size="42" maxlength="50" placeholder="${realtorDTO.ri_main_phone}" name="ri_main_phone" class="ri_main_phone" >
			<!-- <input type="hidden" name="b_no" value="1"> -->
			
		</table>
		<table><tr height=10><td></table>
	</form>	
	</div>
			<input type="button" class="btn btn-warning" value="이전" onClick="history.go(-1);">
			<input type="button" class="btn btn-success" value="회원 정보 수정" onClick="goRealtorUpProc()">&nbsp;
			<br><br>
			<input type="button" class="btn btn-danger text-light" value="회원 탈퇴" onClick="goRealtorWithdrawalProc()">&nbsp;
	<br><br><br><br><br><br><br><br><br><p align=center>공인중개사법 제 18조 2의 취지에 적합한 표시의무(상호명, 등록관청에 신고된 전화번호, 소재지, 성명)
				를 기입하시기 바랍니다. 이에 발생한 문제는 (주)잡아방에서 책임을 지지 않습니다.</p>

</body>
<%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
</html>