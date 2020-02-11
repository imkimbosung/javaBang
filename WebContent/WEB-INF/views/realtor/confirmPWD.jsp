<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/realtor/incloudfile/topBar.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
		function goBeforePage(){
			location.replace("${ctRealtorRoot}/proMyPageHome.do");
		}
		function goUpdateMemberInfo(){
			if(is_empty("[name=r_pwd]")){
				alert("비밀번호 입력 요망");
				$("[name=r_pwd]").val("");
				return; 
			}
			alert( $("[name='confirmPwdForm']").serialize() );
			/* return; */

			$.ajax({
				url : "${ctRealtorRoot}/cofirmPwdProc.do"
				, type : "post"
				, data : $("[name='confirmPwdForm']").serialize()+"&r_no="+${r_no}
				, success : function(confirmPwdCnt){
					if(confirmPwdCnt == 1){
							alert("비밀번호 일치 확인!");
							document.confirmPwdForm.submit();
					}
					else{
						alert("비밀번호 불일치 재입력 바랍니다. >>>" + confirmPwdCnt);
						
					}
				}
				, error : function(request, status, error){
						alert("서버 접속 실패 >> cofirmPwdProc.do 로 못감");
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}	 
			});
			
		}
	</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300"><center>
	<div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay" data-stellar-background-ratio="0.5" style="background-image: url('${ctRoot}/resources/images/hero_1.jpg')">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-7">
              <h1 class="mb-2">공인중개사 회원가입</h1>
              <p class="text-white">잡아방은 여러분들의 최고의 파트너입니다!</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <form name="confirmPwdForm" method="post" action="${ctRealtorRoot}/contentMemberInfo.do">
    	<%-- <input type="hidden" name="r_no" value="${realtorD}"> --%>
    <br><br>
    	<h1>회원정보 수정</h1>
    	<table border=1>
    		<tr>
    			<td colspan='2'><b>비밀번호를 입력하세요</b>
    		<tr>
    			<td>비밀번호
    			<td><input type="password" name="r_pwd" size="15" >
    	</table>
    </form>
    <input type="button" value="나가기" size="40" onClick="goBeforePage();">
	<input type="button" value="회원 정보 수정" size="40" onClick="goUpdateMemberInfo();">
	<br><br><br>
	<p align=center>공인중개사법 제 18조 2의 취지에 적합한 표시의무(상호명, 등록관청에 신고된 전화번호, 소재지, 성명)
				를 기입하시기 바랍니다. 이에 발생한 문제는 (주)잡아방에서 책임을 지지 않습니다.</p>
</body>
<%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
</html>