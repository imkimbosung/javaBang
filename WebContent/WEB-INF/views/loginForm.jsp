<!-- page directive 라 한다. JSP파일 상단에 항상 들어간다 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- jsp 기술의 한 종류인 Include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하는 코딩 -->

<%@include file="/WEB-INF/views/common.jsp"%>
<!-- topbar -->
<%@include file="/WEB-INF/views/buyer/topBar.jsp" %>



<!--  로그인 화면 구성하는 HTML 태그 코딩하기 -->
<head>
<meta charset="UTF-8">
<title>다자방</title>
<style>
#wrap {
	width: 100%;
	height: 50%;
/* 	margin-left: auto;
	margin =right: auto;
	text =algin: center; */
}

table {
	border: 3px solid gold
}

td {
	border: 1px solid black
}

.button{
	test-algin: center;
	margin-top: 5%;
}

.button-login{
	float: left;
	width: 50%;
}

.button-signup{
	float: left;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		// name=loginFrom 가진 폼태그 안의 
		// class=login 가진 태그에 클릭 이벤트 발생 시 실행할 코드
		$("[name=loginForm] .login").click(function() {

			checkLoginForm();
		});
	});

	function checkLoginForm() {

		if (is_empty(".b_id")) {
			alert("아이디 입력 요망");
			$('.b_id').val("");
			return;
		}

		if (is_empty(".b_pwd")) {
			alert("암호 입력 요망");
			$('.b_pwd').val("");
			return;
		}


		// 현재 화면에서 페이지 이동 없이(비동기 방식)
		// 서버쪽 loginProc.do 로 접속하여 아이디, 암호 존재 개수 얻기
		// -- {}는 사용자 정의 객체 or json형태 -- 
		$.ajax({
			// 서버 쪽 호출 URL 주소 지정
			url : "${ctRoot}/loginProc.do"

			// form 태그 안의 데이터 즉, 파라미터값을 보내는 방법 지정
			,
			type : "post"

			//서버로 보낼 값 설정
			,
			data : $("[name=loginForm]").serialize()



			// 서버 응답을 성공적으로 받을 경우 실행할 익명함수
			// data 매개변수는 서버가 응답한 데이터가 들어옴
			// 현재 data라는 매개변수에는 아이디, 암호의 존재 개수가 들어옴
			,
			success : function(data) {
				if (data == 1) {
					//alert("로긴성공");
					location.replace("${ctBuyerRoot}/homeForm.do?b_id=" + $('.b_id').val());
				} else if (data == 0) {
					alert("아이디, 암호 존재하지 않음. 재입력바람");
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
</head>
<body><center>
	<div id="wrap">
		<br>
		<br>
		<br> <b><font size="8" color="gold">다자방</font></b> <br>
		<br>
		<br>

		<form name="loginForm" method="post" action="${ctBuyerRoot}/home.do">
			<table>
				<tr>
					<td id="title">아이디</td>
					<td><input type="text" name="b_id" maxlength="20" class="b_id"></td>
				</tr>

				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="b_pwd" maxlength="15" class="b_pwd">
					</td>
				</tr>

			</table>
		<div class="button">
			<div class="button-login">
				<input type="button" value="로그인" class="login"> 
			</div>

			<div class="button-signup">
				 <input type="button" value="회원가입" class="signup">
			</div>
		 
	
		
		</div>

		</form>

	</div>
</body>
</html>