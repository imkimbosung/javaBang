<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>
     <%@include file="/WEB-INF/views/loading.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVABANG</title>

<!-- Bootstrap -->
<link rel="stylesheet"	href="${ctRoot}/resources/ownerHome/css/bootstrap.min.css">
<!-- font awesome -->
<link	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<!-- Custom style -->
<link rel="stylesheet" href="../plugin/bootstrap/css/style.css" media="screen" title="no title" charset="utf-8">



<script>
function goinsertRentalCompany()
{
	if(is_empty("[name=rt_id]"))
	{
		alert("아이디입력바람");
		$("[name=rt_id]").focus();
		return;
	}
	if(is_valid_email("[name=rt_id]")==false)
	{
		alert("아이디패턴틀림");
		$("[name=email]").focus();
		return;
	}
	if(is_empty("[name=rt_pwd]"))
	{
		alert("비번입력바람");
		$("[name=rt_pwd]").focus();
		return;
	}
	if(is_empty("[name=rt_comname]"))
	{
		alert("회사이름입력바람");
		$("[name=rt_comname]").focus();
		return;
	}
	if(is_empty("#sample4_detailAddress"))
	{
		alert("상세주소입력바람");
		$("#sample4_detailAddress").focus();
		return;
	}
	
	var mainaddr=$("#sample4_jibunAddress").val();
	var detailaddr=$("#sample4_detailAddress").val();
	$("[name=rt_comaddr]").val(mainaddr);
	$("[name=rt_comaddr_detail]").val(detailaddr);
	
	if(is_empty("#sample4_jibunAddress"))
	{
		alert("주소입력바람");
		$("#sample4_jibunAddress").focus();
		return;
	}
	if(is_empty("[name=rt_bnum]"))
	{
		alert("사업자번호입력바람");
		$("[name=rt_bnum]").focus();
		return;
	}
	
	
	if(is_valid_pattern("[name=rt_bnum]",/^[0-9]+$/)==false)
	{
		alert("사업자 번호는 숫자만적어주세요");
		$("[name=rt_bnum]").focus();
		return;
	}
	if(is_empty("[name=rt_phone]"))
	{
		alert("전화번호입력바람");
		$("[name=rt_phone]").focus();
		return;
	}
	if(is_valid_pattern("[name=rt_phone]",/^[0-9]+$/)==false)
	{
		alert("전화 번호는 숫자만적어주세요");
		$("[name=rt_phone]").focus();
		return;
	}
	if($("[name=rt_route_code]").val()==0)
	{
		alert("가입경로를 선택하여주세요")
	}
	if(confirm("회원가입하시겠습니까?")==false){return;}
	
	$.ajax
	({
		url:"${ctRentalRoot}/rentalSignUpProc.do"
		,type:"post"
		,data:$('[name=rentalCompany]').serialize()
		,success : function(rentalCompanycnt)
		{
			if(rentalCompanycnt==1)
			{
				alert("등록성공");
				location.replace("${ctRentalRoot}/rentalLogin.do");
			}
			else if(rentalCompanycnt==-1)
			{
				alert("아이디중복");
			}
			else{alert("등록실패");}
		}

		,error : function()
		{
			alert("서버통신실패");
		}
	});
}
</script>
</head>
<body>


<div class="" style="margin-top:100;">
	<form name="rentalCompany" method=post >
	<div style="width:40%;float:left;margin:0 0 50 150;">
		<div class="page-header">
				<div class="breadcrumb" style="width: fit-content;">법인(사업자)회원가입</div>
		</div>
	<div style="padding: 10px;"></div>
	<div class="col-sm-6" style="margin-left:100px;">
	
			<div class="form-group">
				<label for="inputName">아이디</label> 
					<input type="text"	class="form-control" name="rt_id" placeholder="이메일을 입력해 주세요">
			</div>
			<div class="form-group">
				<label for="inputName">암호</label> 
					<input type="password"	class="form-control" name="rt_pwd" placeholder="암호를 입력해 주세요">
			</div>
			<div class="form-group">
				<label for="inputName">회사명</label> 
					<input type="text"	class="form-control" name="rt_comname" placeholder="회사명을 입력해 주세요">
			</div>
			<div class="form-group">
			<label for="inputName">사업자번호</label>
			 	<input type="text"	class="form-control" name="rt_bnum" placeholder="사업자번호를 '-'을 빼고 입력해 주세요">
		</div>
		<div class="form-group">
			<label for="inputName">전화번호</label>
			 	<input type="text"	class="form-control" name="rt_phone" placeholder="전화번호를 '-'을 빼고 입력해 주세요">
		</div>
	</div>
</div>
			<div style="padding: 10px;"></div>
			<div style="width: 40%; float: right; margin: -25 100 100;">
				<div class="breadcrumb" style="width: fit-content;">사업장주소등록</div>
				<div class="control-group form-group"
					style="float: none; margin: 0 auto">
					<div class="controls" style="margin-left: 350;">
						<button type="button" class="btn btn-info"
							onClick="sample4_execDaumPostcode()">주소검색</button>
					</div>
				</div>
				<div class="col-md-8">
					<div style="margin-left: 100px;">
						<div class="control-group form-group">
							<div class="controls">
								<label>우편번호 : </label> <input type="text" class="form-control"
									id="sample4_postcode" placeholder="우편번호" width="100%">
								<p class="help-block"></p>
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>도로명주소 : </label> <input type="text" class="form-control"
									id="sample4_roadAddress"
									style="background-color: #F2F2F2; resize: none" readonly>
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>지번주소 : </label> <input type="text" class="form-control"
									id="sample4_jibunAddress"
									style="background-color: #F2F2F2; resize: none" readonly>
								<input type=hidden name=rt_comaddr>
							</div>
						</div>
						<span id="guide" style="color: #999; display: none"></span>
						<!--  <div class="control-group form-group">
            <div class="controls">
              <label>세부주소 : </label>
              <input type="text" class="form-control" id="sample4_extraAddress"  style="background-color: #F2F2F2; resize:none" readonly>
            </div>
          </div> -->
						<div class="control-group form-group">
							<div class="controls">
								<label>상세주소 : </label> <input type="text" class="form-control"
									id="sample4_detailAddress"
									style="background-color: #F2F2F2; resize: none"> <input
									type=hidden name=rt_comaddr_detail>
							</div>
						</div>
						<div>
						<select name="rt_route_code">
							<option value="0">--가입경로 선택--</option>
							<option value=1>광고</option>
							<option value=2>지인추천</option>
							<option value=3>블로그</option>
							<option value=4>뉴스/신문</option>
							<option value=5>기타</option>
						</select>
						</div>
					</div>
				</div>
		</form>     
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
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
               /*  if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                } */

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
	
</div>
<div class="col-lg-3" style="margin:auto;">
			<input type=button class="btn btn-success btn-lg" value=가입 onClick="goinsertRentalCompany();">
	</div>
<!-- 	<div style="margin-bottom:800px;"></div> -->
	
	
	<%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
	
</body>
</html>