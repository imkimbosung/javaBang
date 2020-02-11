<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/buyer/incloudfile/topBar.jsp"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>




<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->


<script type="text/javascript">
	$(document).ready(function() {

		//$("[name=b_id]").val("test@test.com")
		//$("[name=b_pwd]").val("1234")
		//$("[name=b_pwd2]").val("1234")
		//$("[name=b_name]").val("이사장")
		//$("[name=b_jumin1]").val("123456")
		//$("[name=b_jumin2]").val("1")

	});
	function checkSignupForm() {

		if (is_empty("[name=b_id]")) {
			alert("아이디(이메일) 입력해주세요.");
			$("[name=b_id]").focus();
			return;
		}

		if (is_valid_email("[name=b_id]") == false) {
			alert("이메일 형식을 벗어납니다");
			$("[name=b_id]").focus();
			return;
		}

		if (is_empty("[name=b_pwd]")) {
			alert("비번을  입력해주세요.");
			$("[name=b_pwd]").focus();
			return;
		}

		if (is_empty("[name=b_pwd2]")) {
			alert("비번확인을  입력해주세요.");
			$("[name=b_pwd]").focus();
			return;
		}

		if ($("[name=b_pwd]").val() != $("[name=b_pwd2]").val()) {
			alert("암호 확인과 암호가 일치하지 않습니다.");
			$("[name=b_pwd]").focus();
			return;
		}
		
		if (is_empty("[name=b_name]")) {
			alert("이름을  입력해주세요.");
			$("[name=b_name]").focus();
			return;
		}
		
		if (is_empty("[name=b_jumin1]")) {
			alert("주민번호를 입력해주세요");
			$("[name=b_jumin1]").focus();
			return;
		}
		
		if (is_empty("[name=b_jumin2]")) {
			alert("주민번호를 입력해주세요");
			$("[name=b_jumin2]").focus();
			return;
		}
		
		if (is_empty("[name=b_phone]")) {
			alert("전화번호를  입력해주세요.");
			$("[name=b_phone]").focus();
			return;
		}

		$.ajax({
			// 서버 쪽 호출 URL 주소 지정
			url : "${ctBuyerRoot}/signupProc.do"

			// form 태그 안의 데이터 즉, 파라미터값을 보내는 방법 지정
			,
			type : "post"

			//서버로 보낼 값 설정
			,
			data : $("[name=signupForm]").serialize()

			,
			success : function(data) {
				if (data == 1) {
					alert("회원가입이 완료되었습니다.");
					location.replace("${ctBuyerRoot}/homeForm.do");
				} else if (data == -1) {
					alert("아이디가 중복입니다. 다시 입력해주시기 바랍니다.");
					$("[name=b_id]").val("").focus();
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
<body>
	<article class="container" style="margin-top:100;">
		<div id="root">
		<h1 class="mt-4 mb-3">JAVABANG
     	 <small>구해방</small>
    	</h1>
	    <ol class="breadcrumb" style="width: 725;">
	      <li class="breadcrumb-item active"><b>구매자 회원가입   </b></li>
	    </ol>	
	</div>
		<div style="padding: 20px;"></div>
		<div class="col-sm-8 col-md-offset-3">

			<form name="signupForm" method="post" action="${ctBuyerRoot}/signupProc.do">
				<!-- <form role="form"> -->
					<div class="form-group">
						<label for="inputName">이메일</label> <input type="text"
							class="form-control" name="b_id" placeholder="이메일을 입력해 주세요">
					</div>
					<div class="form-group">
						<label for="InputEmail">암호</label> <input type="password"
							class="form-control" name="b_pwd" placeholder="암호를 입력해주세요">
					</div>
					<div class="form-group">
						<label for="inputPassword">암호확인</label> <input type="password"
							class="form-control" name="b_pwd2"
							placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
					</div>
					<div class="form-group">
						<label for="inputPasswordCheck">이름</label> <input type="text"
							class="form-control" name="b_name" placeholder="이름을 입력 해 주세요">
					</div>
					
					
					<div class="form-group">
						<div style="width:100%;float:left;">
						<label for="inputMobile">주민등록번호</label> 
						</div>
						<div style="width:54%;float:left;">
						<input type="tel" class="form-control" name="b_jumin1" placeholder="주민등록번호 앞 6자리와 뒤 1자리를 입력해 주세요" maxlength="6">
						</div>
						<div style="width:1%;float:left;">
						-
						</div>
						<div style="width:45%;float:left;">
						<input type="password" class="form-control" name="b_jumin2" maxlength="1">
						
						</div>
						<div class="form-group">
						<input type=hidden class="form-control" name="b_jumin" maxlength="7">
						</div>
					</div>
					
					
					<div class="form-group">
						<label for="inputMobile">휴대폰번호</label> <input type="tel"
							class="form-control" name="b_phone"  placeholder="휴대폰번호를 '-'를 제외하고 입력해주세요">
					</div>
					<br>
					<div class="form-group">
						 <label for="route_code" style="margin:10 20 30">회원가입 경로(선택사항)</label> 
						 <select name ="route_code" >
								<option value=0>--가입경로 선택--</option>
								<option value=1>광고</option>
								<option value=2>지인추천</option>
								<option value=3>블로그</option>
								<option value=4>뉴스/신문</option>
								<option value=5>기타</option>
					</select>
					</div>
		<div style="padding: 40px;"></div>

		<div class="form-group">
			<button type="button" id="signup" class="btn btn-secondary"
				onClick="checkSignupForm()">
				회원가입<i class="fa fa-check spaceLeft"></i>
			</button>
			<button type="reset" class="btn btn-warning">
				입력취소<i class="fa fa-times spaceLeft"></i>
			</button>
		</div>
	</form>
</div>

	</article>
</body>
</html>