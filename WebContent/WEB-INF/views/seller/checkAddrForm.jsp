<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/seller/incloudfile/topBar.jsp"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>JAVABANG</title>

<!-- Bootstrap core CSS -->


<!-- Custom styles for this template -->
<link href="${ctRoot}/resources/checkRoom/css/modern-business.css"
   rel="stylesheet">
<script src="${ctRoot}/resources/jquery-1.11.0.min.js"></script>


<!-- Bootstrap core JavaScript -->
<script src="${ctRoot}/resources/checkRoom/vendor/jquery/jquery.min.js"></script>
<script
   src="${ctRoot}/resources/checkRoom/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Contact form JavaScript -->
<!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
<script src="${ctRoot}/resources/checkRoom/js/jqBootstrapValidation.js"></script>
<!-- <script src="/resources/checkRoom/js/contact_me.js"></script> -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>



<script>
$(document).ready(function() {
    $("[name=sr_room_floor]").keyup(function(){
       var roomFloor = $(this).val();
       var num='';
       
       for(var i=0; i<roomFloor.length; i++){
          var str = '0123456789';
          if(str.indexOf( roomFloor.charAt(i) )>=0 ){
             num = num + roomFloor.charAt(i);
          }
       }
       $(this).val(num);
       
    });
 });
jQuery.noConflict();

   function check_addr(){
      // 유효성 체크
      if(is_empty("[name=sr_zip_code]")){   
         alert("주소를 입력해주세요.")
         return;
      }
      
      // 입력받는 층수에 해당하는 유효성 체크를 위한 코딩
      var sr_room_floor = $("[name=sr_room_floor]").val();
      var regExp = new RegExp(/^[1-50]{1,2}$/);

      if(is_empty("[name=sr_room_floor]")){   
         alert("층수를 입력해주세요.")
         return;
      }   
      //유효성 체크
      else if(regExp.test(sr_room_floor)==false){
            alert("층수는 숫자로만 적어주세요.");

         $("[name=regForm] .uid").val( "" );
         $("[name=regForm] .uid").focus();
         return;
         }
      console.log($.ajax);


      document.checkAddrForm.submit();

   }
   
   function before_btn(loc){
	   document.checkAddrForm.action = loc;
	   document.checkAddrForm.submit();
   }

   
</script>

</head>

<body>


   <!-- Page Content -->

   <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">
         JAVABANG <small>팔아방</small>
      </h1>

      <ol class="breadcrumb">
         
         <li class="breadcrumb-item active"><b>판매하는 원룸은 어디에있나요?</b></li>
         <li class="breadcrumb-item active" style="font-size: 13px;">*
            등기부등본 상의 주소를 입력해 주세요.</li>
      </ol>

      <!-- /.row -->
      <form name="checkAddrForm" method="post"
         action="${ctSellerRoot}/goSellTypeForm.do">
         <!-- Contact Form -->
         <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
         <div class="row mt-5 addr_center" style="font-size: x-large;">
            <div class="col-md-8">
               <h3>공실주소등록</h3>
               <br>
               <br>
               <div class="control-group form-group"
                  style="float: none; margin: 0 auto">
                  <div class="controls">
                     <button type="button" class="btn btn-info btn-lg"
                        onClick="sample4_execDaumPostcode()">주소검색</button>
                  </div>
               </div>
               <div class="control-group form-group">
                  <div class="controls">
                     <label>우편번호 : </label> <input type="text" class="form-control" 
                        name="sr_zip_code" id="sample4_postcode" placeholder="우편번호" value="${sr_zip_code}"
                        width="100%">
                     <p class="help-block"></p>
                  </div>
               </div>
               <div class="control-group form-group">
                  <div class="controls">
                     <label>도로명주소 : </label> <input type="text" class="form-control"
                        id="sample4_roadAddress" value="${sample4_roadAddress}"
                        style="background-color: #F2F2F2; resize: none" readonly>
                  </div>
               </div>
               <div class="control-group form-group">
                  <div class="controls">
                     <label>지번주소 : </label> <input type="text" class="form-control"
                        name="sr_addr" id="sample4_jibunAddress" value="${sr_addr}"
                        style="background-color: #F2F2F2; resize: none" readonly>
                  </div>
               </div>
               <span id="guide" style="color: #999; display: none"></span>
               <div class="control-group form-group">
                  <div class="controls">
                     <label>세부주소 : </label> <input type="text" class="form-control"
                        id="sample4_extraAddress" value="${sample4_extraAddress}"
                        style="background-color: #F2F2F2; resize: none" readonly>
                  </div>
               </div>
               <div class="control-group form-group">
                  <div class="controls">
                     <label>상세주소 : </label> <input type="text" class="form-control"
                        name="sr_detail_addr" id="sample4_detailAddress" value="${sr_detail_addr}"
                        style="background-color: #F2F2F2; resize: none">
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

               <br>
               <br>
               <div class="">
                  <div class="">
                     해당매물은 몇층에 있습니까? : <input autocomplete="off" name="sr_room_floor"
                        placeholder="예) 1" size="10"
                        class="Input-sc-1kj3wx2-0 styled__InputDongHo-sc-1sz3lp5-1 hzKSTT"
                        value="${sr_room_floor}">
                     <div class="styled__InputAddon-sc-1sz3lp5-2 eywXKh">&nbsp;&nbsp;</div>
                  </div>
               </div>
               <div id="success"></div>
               <button type="button" class="btn btn-success" id="historyButton"
                  onClick="before_btn('${ctSellerRoot}/checkRoomForm.do')" style="font-size: x-large;">이전</button>
               <button type="button" class="btn btn-success"
                  id="sendMessageButton" onClick="check_addr();" style="font-size: x-large;">다음</button>

               <!-- "hidden tag" -->
               <input type="hidden" name="roomtype_code" value="${roomType_code}">
               <input type="hidden" name="sr_roomsize" value="${sr_roomsize}">
               <input type="hidden" name="sr_builddate" value="${sr_builddate}">
      </form>
      <!-- row -->

      <!-- /.container -->
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp"%>
</body>
</html>