<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>
<html>
<head>
<title>Login V10</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
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
<!--===============================================================================================-->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
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
</head>



<script type="text/javascript">
	$(document).ready(function() {

		$("[name=login]").click(function() {
			checkLoginForm();
		});

	
		
	});

	function checkLoginForm() {

		if (is_empty("[name=s_id]")) {
			alert("아이디 입력 요망");
			$('[name=s_id]').val("");
			return;
		}
		
		if (is_empty("[name=s_name]")) {
			alert("이름 입력 요망");
			$('[name=s_name]').val("");
			return;
		}
		
		if (is_empty("[name=s_jumin1]")) {
			alert("주민번호 앞자리 입력 요망");
			$('[name=s_jumin2]').val("");
			return;
		}
		
		$.ajax({
			url : "${ctSellerRoot}/forgetSellerPwdProc.do"
			,type : "post"
			,data : $("[name=forgetSellerPwd]").serialize()
			,success : function(sellerPwdGet) {
				
				
				if (sellerPwdGet!=null) {
					alert("비밀번호는" + sellerPwdGet.sellerPwd + "입니다");
					MovePage();
				} else if (sellerPwdGet == null) {
					alert("정보가 일치하지 않습니다. 재입력바람");
				 
				} else {
					alert("서버 오류 발생, 관리자에게 문의 바람");
				}
			}
			,error : function(request,status,error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

				//alert("서버 접속 실패");
			}
		})
	}
	

</script>
<script>


function MovePage() {
	window.opener.top.location.href="${ctSellerRoot}/loginForm.do";
	window.close()
	}


</script>

<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
			
			
			
				<!-- ======================================================= -->
				<form name="forgetSellerPwd" class="login100-form validate-form flex-sb flex-w"  method="post" id="sellerDTO" action="${ctSellerRoot}/forgetSellerPwdProc.do" >
					<span class="login100-form-title p-b-51">판매자 비밀번호찾기</span>
					
					<div class="wrap-input100 validate-input m-b-16" data-validate="Username is required">
						<input class="input100" type="text" name="s_id" placeholder="아이디"> <span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-16" data-validate="Username is required">
						<input class="input100" type="text" name="s_name" placeholder="이름"> <span class="focus-input100"></span>
					</div>


					<div class="input-group" data-validate="Password is required">
					    <input type="text" class="input100" name="s_jumin1" placeholder="주민번호 앞자리 6자리" maxlength="6" style="background-color: #E6E6E6; font-size:inherit;"/>
					   	 <span class="input-group-addon" style="background-color: #E6E6E6;border: 0;font-size: xx-large;">-</span>
					    <input type="password" class="input100" maxlength="1" name="s_jumin2" placeholder="주민번호 뒷자리 1자리" style="background-color: #E6E6E6;font-size:inherit;"/>
					</div>
				</form>
				<!-- ======================================================= -->
				
				
				<div class="container-login100-form-btn m-t-17">
					<button class="login100-form-btn" name="login">비밀번호 찾기</button>
				</div>

			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>



</body>
</html>