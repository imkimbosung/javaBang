<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/realtor/incloudfile/topBar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인중개사 회원가입-[2]</title>




 <%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>




<script>
	$(document).ready(function(){
		
	});
	function register_proc_realtorNum(){
		if(is_empty("[name=ri_realtor_num]")){
			alert("중개등록번호 입력 요망");
			 
			$("[name=ri_realtor_num]").focus();
			return;
		} 
		alert($("[name=ri_realtor_num]").serialize());
		//return;
		$.ajax({
			url : "/javaBang/realtor/realtorNumProc.do"
			, type : "post"
			, data : $("[name=ri_realtor_num]").serialize()
			, success : function(realtorNumCnt){
				
				if(realtorNumCnt == 0){
	                  alert("중복되는 중개등록번호가 존재하지 않습니다.");
	                  return;
               }
				else if( realtorNumCnt == 1 ){
					alert("중복되는 중개등록번호 존재! 다시 입력해주시기 바랍니다.");
                  	$("[name=ri_realtor_num]").focus();
					$("[name=ri_realtor_num]").val("");
                  	return;
				}
               else if( realtorNumCnt == -1 ){
                   alert(" Controller Error ");
                   return;
                }
               else{
            	  
            	   alert( "realtorNumCnt가 에러  >> " + realtorNumCnt );
            	   return;
            	   
               }
			}
			, error : function(request, status, error){
				alert("서버접속실패");
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	function register_pro_businessNum(){
		if(is_empty("[name=ri_business_num]")){
			alert("사업자등록번호를 입력 요망");
			$("[name=ri_business_num]").val("");
			return; 
		}
		alert($("[name=ri_business_num]").serialize());
		$.ajax({
			url : "/javaBang/realtor/businessNumProc.do"
			, type : "post"
			, data : $("[name=ri_business_num]").serialize()
			, success : function(businessNumCnt){
				
				if(businessNumCnt == 0){
	                  alert("중복되는 사업자등록번호가 존재하지 않습니다.");
	                  return;
               }
				else if( businessNumCnt == 1 ){
					alert("중복되는 사업자등록번호가 존재! 다시 입력해주시기 바랍니다.");
                  	$("[name=ri_business_num]").focus();
                  	$("[name=ri_business_num]").val("");
                  	return;
				}
               else if( businessNumCnt == -1 ){
                   alert(" Controller Error ");
                   return;
                }
               else{
            	  
            	   alert( "businessNumCnt 가 에러  >> " + businessNumCnt );
            	   return;
            	   
               }
			}
			, error : function(request, status, error){
				alert("서버접속실패");
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}


	function goSearch(){
		
			if(is_empty("[name=ri_officename]")){
				alert("중개사무소명 입력 요망");
				$("[name=ri_officename]").val("");
				return; 
			}
			if(is_empty("[name=ri_realtor_num]")){
				alert("중개등록번호 입력 요망");
				$('[name=ri_realtor_num]').val("");
				return;
			} 
			if(is_empty("[name=ri_business_num]")){
				alert("사업자 등록번호 입력 요망");
				$('[name=ri_business_num]').val("");
				return;
			} 
			if(is_empty("[name=ri_addr]")){
				alert("중개사무소 주소 입력 요망");
				$('[name=ri_addr]').val("");
				return;
			} 
			if(is_empty("[name=ri_detail_addr]")){
				alert("상세 주소 입력 요망");
				$('[name=ri_detail_addr]').val("");
				return;
			} 
			if(is_empty("[name=ri_main_phone]")){
				alert("대표 전화번호 입력 요망");
				$('[name=ri_main_phone]').val("");
				return;
			} 
			if(is_empty("[name=ri_name]")){
				alert("중개사 대표자명 입력 요망");
				$('[name=ri_name]').val("");
				return;
			} 	
			if(confirm("회원가입 하시겠습니까?")==false){return;}
			alert( $("[name='proRegisterJoin2']").serialize() );
			
			$.ajax({
				url : "${ctRealtorRoot}/realtorReg2Proc.do"
				, type : "post"
				, data : $("[name='proRegisterJoin2']").serialize()
				, success : function(realtorRegCnt){
					
						if(realtorRegCnt==1){
							alert("공인중개사 회원가입 성공!!");
							location.replace("${ctRealtorRoot}/proHome.do");						
						}else if(realtorRegCnt==-6){
							alert("주소입력실패");
							
						}else if(realtorRegCnt == -4){
							alert("이미지입력실패");
							
						}else if(realtorRegCnt == -5){
							alert("알게된경로입력실패");
							
						}else if(realtorRegCnt == -2){
							alert("컨트롤러 에러");
						}
						else {
							alert("서버 오류 발생, 관리자에게 문의 바람");
						}	
				}
				, error : function(){
					alert("서버와 통신 실패");
				}
			});
		}
	
	
	
	
	
	function goSearch2(){
		location.replace("${ctRealtorRoot}/proRegisterJoin1.do")

	}
	

	


</script>
</head>


 <body>
	<div class="col-sm-6" style="margin:auto;">
		<div id="root">
			<h1 class="mt-4 mb-3">JAVABANG <small style="font-size:15pt">공인중개사</small></h1>
		    <ol class="breadcrumb" style="margin-bottom: auto;">
		      <li class="breadcrumb-item active" style="color:#212529">공인중개사 회원가입>>개인정보입력>><b>공인중개사 정보 입력</b></li>
		    </ol>	
		</div>		
		<form name="proRegisterJoin2" method="post" id="realtorDTO" enctype="Multipart/form-data">
			<table class="table"  style="margin-top: 50;">
				<%-- <tr>
					<td colspan=6 align=center><img src="${ctRoot}/resources/images/eunwoo.png" width=150;> --%>
					
			<%--  	<tr>
					<td colspan=6 align=center> <img src="${image_name.getOriginalFilename()}" width=256 ></img>  --%>
				
				<!-- =========================================================================================================================== -->	
				<!-- 이거 현재 지금 workspace4 에서 하고 있는거야 이건 그냥 고쳐볼려고 여기서 하는거니깐 고치면 옮겨라 꼭. -->
				<!-- =========================================================================================================================== -->
				<tr>
					<td bgcolor="#EAEAEA" align=center>중개사무소명
					<td ><input type="text" placeholder="잡아방공인중개사" size="20" maxlength="10" name="ri_officename" class="ri_officename"  > 
					<!-- <font size="2pt" color="red">*중복불가</font> -->
		
		
				
				<tr>
					<td bgcolor="#EAEAEA" align=center>중개등록번호
					<td ><input type="text" placeholder="'-'를 제외한 중개등록번호를 입력하세요"  size="50" name="ri_realtor_num" class="ri_realtor_num">
					&nbsp;&nbsp;<input type="button" value="중개등록번호 중복확인" onClick="javascript:register_proc_realtorNum();">
					<font size="2pt" color="red">*중복불가</font>


			
				<tr>
					<td bgcolor="#EAEAEA" align=center>사업자 등록번호
					<td><input type="text" placeholder="'-'를 제외한 사업자등록번호를 입력하세요" size="50" name="ri_business_num" class="ri_business_num">
					&nbsp;&nbsp;<input type="button" value="사업자번호 중복확인" onClick="javascript:register_pro_businessNum();">
					<font size="2pt" color="red">&nbsp;&nbsp;*중복불가</font>					
					
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
                        style="background-color: #F2F2F2; resize: none" readonly placeholder="지번 주소">
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
                        style="background-color: #F2F2F2; resize: none" placeholder="상세 주소" >
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
                    document.getElementById("sample4_jibunAddress").value = expJibunAddr;
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
				<td bgcolor="#EAEAEA" align=center>대표 전화번호
				<td><input type="text" placeholder="123" size="20" maxlength="25" name="ri_main_phone">
			<tr>
				<td bgcolor="#EAEAEA" align=center>중개사 대표자명
				<td><input type="text" placeholder="중개사대표자명을 입력해주세요" size="30" maxlength="10" name="ri_name" >
			<!--  <tr>
				<td bgcolor="#EAEAEA" align=center>프로필사진(테스트중)
				<td > <input type="text" placeholder="프로필사진테스트" size="20" maxlength="15" name="image_name" >
				<font size=1pt;>*프로필사진 명은 중복 불가입니다. -->
				
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
			</table>
					<input type="button" class="btn btn-warning"  value="이전 단계" size="40" onClick="goSearch2();">
					<input type="button" class="btn btn-success"  value="회원가입 하기" size="40" onClick="goSearch();">
				
	
	<br><br><br><p align=center>공인중개사법 제 18조 2의 취지에 적합한 표시의무(상호명, 등록관청에 신고된 전화번호, 소재지, 성명)
				를 기입하시기 바랍니다. 이에 발생한 문제는 (주)잡아방에서 책임을 지지 않습니다.</p>
				
				
	<input type=hidden name="r_id" value="${realtorDTO.r_id}">			
	<input type=hidden name="r_name" value="${realtorDTO.r_name}">
	<input type=hidden name="authority_code" value="${realtorDTO.authority_code}">
	<input type=hidden name="r_phone" value="${realtorDTO.r_phone}">
	<input type=hidden name="r_pwd" value="${realtorDTO.r_pwd}">
				
	</form>
	
		
	

	

</body>

  
  <%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
</html>













