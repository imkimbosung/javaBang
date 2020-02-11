<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"	href="${ctRoot}/resources/loginPage/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"	href="${ctRoot}/resources/loginPage/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"	href="${ctRoot}/resources/loginPage/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"	href="${ctRoot}/resources/loginPage/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"	href="${ctRoot}/resources/loginPage/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"	href="${ctRoot}/resources/loginPage/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"	href="${ctRoot}/resources/loginPage/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"	href="${ctRoot}/resources/loginPage/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"	href="${ctRoot}/resources/loginPage/css/util.css">
<link rel="stylesheet" type="text/css"	href="${ctRoot}/resources/loginPage/css/main.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/css/util.css">
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/css/main.css">
  <link href="${ctRoot}/resources/ownerHome/css/stylish-portfolio.min.css" rel="stylesheet">



<script>
$(document).ready(function() {

	
	if(${!empty rt_id}){location.replace("${ctRentalRoot}/rentalCompanyMain.do");}
	
	inputData("[name=rt_id]", '${cookie.rt_id.value}');
	inputData("[name=rt_pwd]", '${cookie.rt_pwd.value}');

	<c:if test="${!empty cookie.rt_id.value}">
		$('[name=is_login]').prop('checked', true);
	//$('.login').trigger("click"); // 자동 로그인
	</c:if>

	
});
	function goSignup()
	{
		location.replace("${ctRentalRoot}/rentalSignUp.do");
	}
	function gologin()
	{
		if (is_empty("[name=rt_id]")) {
			alert("아이디 입력 요망");
			$('[name=rt_id]').val("");
			return;
		}
		/* if(is_valid_email("[name=rt_id]")==false)
		{
			alert("아이디패턴틀림");
			$("[name=rt_id]").focus();
			return;
		} */
		if (is_empty("[name=rt_pwd]")) {
			alert("암호 입력 요망");
			$('[name=rt_pwd]').val("");
			return;
		}
		$.ajax
		({
			url:"${ctRentalRoot}/rentalLoginProc.do"
			,type:"post"
			,data:$('[name=companyLogin]').serialize()
			,success : function(getIdPwdcnt)
			{
				if(getIdPwdcnt.getIdPwdcnt == "-1")
				{
					alert("아이디틀림");
				}
				else if(getIdPwdcnt.getIdPwdcnt == "-2")
				{
					alert("비번틀림");
				}
				else if(getIdPwdcnt.getIdPwdcnt =="1")
				{
					//alert("로그인 성공");
					location.replace("${ctRentalRoot}/rentalCompanyMain.do");
				}	else if(getIdPwdcnt.getIdPwdcnt == "-4"){
					alert("해당아이디는 " + getIdPwdcnt.stopRental.start_date + "부터 " + getIdPwdcnt.stopRental.end_date + "까지" + "정지 되었습니다.\n사유 : " + getIdPwdcnt.stopRental.stop_comment );
				}			
				else{alert("등록실패");}
			}

			,error : function()
			{
				alert("서버통신실패");
			}
		});
	}
	
	function goforgetId()
	{
		var url = "${ctRentalRoot}/forgetRentalId.do";
	    var name = "forgetBuyerPwd";
	    var option = "width = 500, height = 600, top = 70, left = 200, location = no"
	    window.open(url, name, option);
	}
	function goforgetPwd()
	{
		var url = "${ctRentalRoot}/forgetRentalPwd.do";
	    var name = "forgetBuyerPwd";
	    var option = "width = 500, height = 600, top = 70, left = 200, location = no"
	    window.open(url, name, option);
	}
	
</script>
<meta charset="utf-8">
<title>JAVABANG</title>
</head>
<body>

		
	<form method=post name=companyLogin action=${ctRentalRoot}/rentalComanyMain.do>
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
					<span class="login100-form-title p-b-51">JAVABANG - 빌려방 Login</span>

					<%-- <form name="loginForm" method="post" action="${ctBuyerRoot}/homeForm.do"> --%>
					<div class="wrap-input100 validate-input m-b-16"
						data-validate="Username is required">
						<input class="input100" type="text" name="rt_id"
							placeholder="E-mail"> <span class="focus-input100"></span>
					</div>


					<div class="wrap-input100 validate-input m-b-16"
						data-validate="Password is required">
						<input class="input100" type="password" name="rt_pwd"
							placeholder="Password"> <span class="focus-input100"></span>
					</div>

					<div class="flex-sb-m w-full p-t-3 p-b-24">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox"	name="is_login"> 
								<label class="label-checkbox100" for="ckb1"> 아이디 암호 기억하기 </label>
						</div>

						<div>
							<a href="javascript:goforgetId();" class="txt1"> ID찾기 </a>
							<a href="javascript:goforgetPwd();" class="txt1"> 패스워드찾기 </a>
						</div>
					</div>
				<div class="container-login100-form-btn m-t-17">
					<button class="login100-form-btn" name="login" onClick="gologin();" type=button>ENTER</button>
				</div>
				<div class="container-form-btn m-t-2">
					<button class="btn btn-danger" name="signup" type=button
						onclick="goSignup();" 	style="width: 150px; height: 60px;">회원가입</button>
					<button class="btn btn-outline-info btn-sm" name="signup"
						onclick="location.replace('${ctRoot}/Main_javaBang.do')" style="height: 60px;"
						type=button>초기화면</button>
				</div>
			</div>
		</div>
</form>


<!--===============================================================================================-->
<script	src="${ctRoot}/resources/loginPage/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script	src="${ctRoot}/resources/loginPage/vendor/bootstrap/js/popper.js"></script>
<script	src="${ctRoot}/resources/loginPage/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script	src="${ctRoot}/resources/loginPage/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script	src="${ctRoot}/resources/loginPage/vendor/daterangepicker/moment.min.js"></script>
<script	src="${ctRoot}/resources/loginPage/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script	src="${ctRoot}/resources/loginPage/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="${ctRoot}/resources/loginPage/js/main.js"></script>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>

	<%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
</body>
</html>