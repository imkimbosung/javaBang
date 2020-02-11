<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/realtor/incloudfile/topBar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인중개사 회원가입-[1]</title>


	<!-- 예쁜셀렉트박스 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="author" content="colorlib.com">
	
    <link href="${ctRoot}/resources/selectbox/css/main.css" rel="stylesheet" />

<script>
var idCheckCnt = 0;
	$(document).ready(function(){
		
	/* 	$("[name=r_name]").val("김중개");
		$("[name=authority_code]").val(1);
		$("[name=r_phone]").val("01045678901");
		$("[name=r_pwd]").val("1234");
 */
		$("[name=imageFile]").on("change",handleImgFileSelect)
		 $("[name=imageFile]").on("change",function(){


			 //확장자 체크
		    var arr = $("#imageFile").val().split(".");
		    var arrSize = arr.length;
		    if (arr[arrSize-1].toUpperCase()!="PNG" && arr[arrSize-1].toUpperCase()!="JPG")
		    {
		      //  $("#imageUrl").val('');
		      $("#imageFile").val('');
		        alert("지원하지 않는 파일 확장자입니다.");
		        return false;
		    }
		    
		    //파일크기 체크
		    var fileSize = $("input[name='imageFile']")[0].files[0].size;
		    console.log("### fileSize="+fileSize);
		    if (fileSize > 20480) {//20480 = 20Kb
		     //   $("#imageUrl").val('');
		        $("#imageFile").val('');
		        alert("PNG 이미지는 20kbyte 이하여야 합니다.");
		        $("#imageFile").focus();
		        return false;
		    }
		    //파일이 있어야만 함


				
			 //handleImgFileSelect(  $("[name=imageFile]") );

				
			 
		}); 
	})	
	

	function goSearch(){
		
		if(is_empty("[name=r_name]")){
			alert("성명 입력 요망");
			$("[name=r_name]").val("");
			return; 
		}
		
	
		
		if(is_empty("[name=authority_code]")){
			alert("권한/자격 입력 요망");
			$('[name=authority_code]').val("");
			return;
		} 
		
		if(is_empty("[name=r_phone]")){
			alert("휴대폰 번호 입력 요망");
			$('[name=r_phone]').val("");
			return;
		} 
		
		if(is_empty("[name=r_id]")){
			alert("이메일 입력 요망");
			$('[name=r_id]').val("");
			return;
		} 
		
		if (is_valid_email("[name=r_id]") == false) {
			alert("이메일 형식을 벗어납니다");
			$("[name=r_id]").focus();
			return;
		}
		
		if(is_empty("[name=r_pwd]")){
			alert("비밀번호 입력 요망");
			$('[name=r_pwd]').val("");
			return;
		} 
		
		if(idCheckCnt != 1){
			alert("이메일 중복 확인을 해주세요.");
			return;
		}


		
		/* if(is_empty("[name=agreement_01]")){
			alert("약관동의 체크 요망");
			$('[name=agreement_01]').val("");
			return;
		} 
		if(is_empty("[name=agreement_02]")){
			alert("약관동의 체크 요망");
			$('[name=agreement_02]').val("");
			return;
		} 
		if(is_empty("[name=agreement_03]")){
			alert("약관동의 체크 요망");
			$('[name=agreement_03]').val("");
			return;
		} 
		if(is_empty("[name=agreement_04]")){
			alert("약관동의 체크 요망");
			$('[name=agreement_04]').val("");
			return;
		}  */
		
	//	if(confirm("저장하고 다음단계로 넘어가시겠습니까?")==false){return;}
		
		document.proRegisterJoin1.submit();
		//alert( $('[name=proRegisterJoin1]').serialize() );
	}
	
	
	
	
	
	function goSearch2(){
		location.replace("${ctRealtorRoot}/proHome.do")
	}
	
	
	/* function goSearch3(){
		$("input:checkbox[name='agreement_01']").prop("checked", true);
		$("input:checkbox[name='agreement_02']").prop("checked", true);
		$("input:checkbox[name='agreement_03']").prop("checked", true);
		$("input:checkbox[name='agreement_04']").prop("checked", true);
		$("input:checkbox[name='agreement_05']").prop("checked", true);
	} */
	
	function goSearch4(){
		
		if(is_empty("[name=r_id]")){
			alert("이메일을 입력하세요");
			$('[name=r_id]').val("");
			return;
		} 
		
		if (is_valid_email("[name=r_id]") == false) {
			alert("이메일 형식을 벗어납니다");
			$("[name=r_id]").focus();
			return;
		}
		
	
		
		$.ajax({
			url:"${ctRealtorRoot}/realtorIdCheck.do"
			,type:"post"
			,data:$('[name=proRegisterJoin1]').serialize()
			,success:function(realtorRegCnt){
					if(realtorRegCnt==0){
						alert("아이디로 설정이 가능합니다.");
						idCheckCnt = 1;
					}else if(realtorRegCnt == -1){
						alert("아이디가 중복입니다. 다시 입력해주시기 바랍니다.");
						$("[name=r_id]").val("").focus();
					}
					else {
						alert("서버 오류 발생, 관리자에게 문의 바람");
					}	
			}
			,error:function(){
				alert("서버와 통신 실패");
			}
		});
		
		
	}

	function handleImgFileSelect(e) {

        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        filesArr.forEach(function(f) {
     /*        if(!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            } */

            sel_file = f;

            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
	
	
</script>
</head>

 <body >
 
 <div class="col-lg-5" style="margin:auto;margin-top:50px;">
	<h1 class="mt-4 mb-3">JAVABANG <small style="font-size:15pt">공인중개사</small></h1> 
	<ol class="breadcrumb" style="">
    	<li class="breadcrumb-item active">공인중개사 회원가입>><b>개인정보입력</b></li>
  	</ol>
		<form name="proRegisterJoin1" method="post" id="realtorDTO" action="${ctRealtorRoot}/proRegisterJoinSec.do" enctype="multipart/form-data">
			<table class="table">
				<%-- <tr><td colspan=6 align=center><img src="${ctRoot}/resources/images/profileImage/" width=150;> --%>
			
			
				<tr>
					<td bgcolor="#EAEAEA" align=center>프로필사진
					<td > <input type="file" id="imageFile" name="imageFile" /> <font size="2" color="red">*사진 크기는 20kbyte이하 png, jpg파일만 등록 가능합니다.</font>
						
						<div class="img_wrap">
			           		 <img id="img" />
			       		</div> 
					
				<tr>
					<td bgcolor="#EAEAEA" align=center>본인 성명
					<td ><input type="text" size="14" maxlength="10" name="r_name" >
					
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
					<td bgcolor="#EAEAEA" align=center>휴대폰 번호
					<td><input type="text" placeholder="숫자만 입력해주세요." size="20" maxlength="25" name="r_phone">
				<tr>
					<td bgcolor="#EAEAEA" align=center>이메일 주소
					<td><input type="text" placeholder="아이디로 사용하실 이메일을 입력하세요" size="42" name="r_id" >
					&nbsp;&nbsp;<input type="button" style="width:100pt; height:20pt" value="중복 확인"  size="30" onClick="goSearch4();">
				<tr>	
					<td bgcolor="#EAEAEA" align=center>비밀번호
					<td><input type="password" placeholder="8자이상, 문자, 숫자, 특수문자 포함" size="40" maxlength="10" name="r_pwd" >	
				</table>	
				
		
				<input type="button" class="btn btn-warning" value="이전 단계" size="40" onClick="goSearch2();">
				<input type="button" class="btn btn-success" value="다음 단계" size="40" onClick="goSearch();">
				
						
			
			
			
			</form>
		</div>
	<br><br><br><p align=center>공인중개사법 제 18조 2의 취지에 적합한 표시의무(상호명, 등록관청에 신고된 전화번호, 소재지, 성명)	를 기입하시기 바랍니다. 이에 발생한 문제에 (주)자바방은 책임을 지지 않습니다.</p>
				


</body>

  
  <%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
</html>













