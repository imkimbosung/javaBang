<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>
<html>
<head>
<title>Login - 공인중개사</title>
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
		// name=loginFrom 가진 폼태그 안의 
		// class=login 가진 태그에 클릭 이벤트 발생 시 실행할 코드
		$("[name=login]").click(function() {

			checkLoginForm();
		});

		inputData("[name=r_id]", '${cookie.r_id.value}');
		inputData("[name=r_pwd]", '${cookie.r_pwd.value}');

		<c:if test="${!empty cookie.r_id.value}">
			$('[name=is_login]').prop('checked', true);
		//$('.login').trigger("click"); // 자동 로그인
		</c:if>
	});

	function checkLoginForm() {

		if (is_empty("[name=r_id]")) {
			alert("아이디 입력 요망");
			$('[name=r_id]').val("");
			return;
		}

		if (is_empty("[name=r_pwd]")) {
			alert("암호 입력 요망");
			$('[name=r_pwd]').val("");
			return;
		}

		//alert($("[name=loginForm]").serialize())
		$.ajax({
			// 서버 쪽 호출 URL 주소 지정
			url : "${ctRealtorRoot}/loginProc.do"

			// form 태그 안의 데이터 즉, 파라미터값을 보내는 방법 지정
			,
			type : "post"

			//서버로 보낼 값 설정
			,
			data : $("[name=loginForm]").serialize()

			,
			success : function(data) {
				//alert(data)
				if (data.realtorCnt == "1") {
					//alert("로긴성공");
					location.replace("${ctRealtorRoot}/proMyPageHome.do");
				} else if (data.realtorCnt == "0") {
					alert("아이디, 암호 존재하지 않음. 재입력바람");
				} else if(data.realtorCnt == "-3"){
					alert("해당아이디는 " + data.stopRealtor.start_date + "부터 " + data.stopRealtor.end_date + "까지" + "정지 되었습니다.\n사유 : " + data.stopRealtor.stop_comment );
				} else {
					alert("서버 오류 발생, 관리자에게 문의 바람");
				}
			}
			// 서버의 응답을 못받을 경우
			,
			error : function() {
				alert("서버 접속 실패");
			}

		})

	}
</script>
<script>

function popupId(){
    
	var url = "${ctRealtorRoot}/forgetRealtorId.do";
    var name = "forgetRealtorId";
    var option = "width = 500, height = 550, top = 70, left = 200, location = no"
    window.open(url, name, option);
}

function popupPwd(){
    
	var url = "${ctRealtorRoot}/forgetRealtorPwd.do";
    var name = "forgetRealtorPwd";
    var option = "width = 500, height = 600, top = 70, left = 200, location = no"
    window.open(url, name, option);
}

</script>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w"
					name="loginForm" method="post">
					<span class="login100-form-title p-b-51">JAVABANG - 공인중개사 Login</span>

					<%-- <form name="loginForm" method="post" action="${ctBuyerRoot}/homeForm.do"> --%>
					<div class="wrap-input100 validate-input m-b-16"
						data-validate="Username is required">
						<input class="input100" type="text" name="r_id"
							placeholder="E-mail"> <span class="focus-input100"></span>
					</div>


					<div class="wrap-input100 validate-input m-b-16"
						data-validate="Password is required">
						<input class="input100" type="password" name="r_pwd"
							placeholder="Password"> <span class="focus-input100"></span>
					</div>

					<div class="flex-sb-m w-full p-t-3 p-b-24">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox"
								name="is_login" value="y"> <label class="label-checkbox100"
								for="ckb1"> 아이디 암호 기억하기 </label>
						</div>

						<div>
							<a href="javascript:popupId()" class="txt1"> ID찾기 </a> &nbsp;
							<a href="javascript:popupPwd()" class="txt1"> PASSWARD찾기 </a>
						</div>
					</div>


					<!-- </form> -->
				</form>
				<div class="container-login100-form-btn m-t-17">
					<button class="login100-form-btn" name="login">ENTER</button>
				</div>
				<div class="container-form-btn m-t-2">
					<button class="btn btn-danger" name="signup"
						onclick="location.replace('${ctRealtorRoot}/proRegisterJoinFir.do')"
						style="width: 150px; height: 60px;">회원가입</button>
					<button class="btn btn-outline-info btn-sm" name="signup"
						onclick="location.replace('${ctRoot}/Main_javaBang.do')" style="height: 60px;"
						>초기화면</button>
				</div>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>



</body>
</html>