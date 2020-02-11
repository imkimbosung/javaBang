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
   <link href="${ctRoot}/resources/checkRoom/css/modern-business.css"  rel="stylesheet">
   <link href="${ctRoot}/resources/checkRoom/css/bootstrap-datepicker.css"  rel="stylesheet">  
   
	
	       <!-- 달력 관련  -->
	<link rel="stylesheet"	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"	type="text/css" />

   

	
</head>

<body>



   <!-- Page Content -->
   <form id="getcheck" method="post" name="checkRoomForm"
      action="${ctSellerRoot}/checkAddrForm.do">
      <div class="container" style="font-size:large;">

         <!-- Page Heading/Breadcrumbs -->
         <h1 class="mt-4 mb-3">
            JAVABANG <small>팔아방</small>
         </h1>

         <ol class="breadcrumb" style="backgroundcolor:#e9ecef;">
            <li class="breadcrumb-item active"><b>판매하는 원룸은 어떤 타입인가요?</b></li>
         </ol>

         <!-- Content Row -->
         <div class="row">
         </div>
         <!-- Contact Details Column -->
         <br>
         <br>
         <br>
         <br>
         <br>
         
		<div class="btn-round btn-group btn-group-toggle" data-toggle="buttons"  style="font-size: x-large;">
			<b><font color="red">*</font>&nbsp;&nbsp;매물종류를 선택해주세요 </b>&nbsp;&nbsp;&nbsp;&nbsp;
			<c:forEach items="${roomTypeCode}" var="room" varStatus = "status">
			<label class="btn btn-warning <c:if test='${roomType_code eq room.roomtype_code}'> active </c:if>" style="font-size: x-large;">
				
				<input type="radio"  <c:if test='${roomType_code eq room.roomtype_code}'> checked = "checked"</c:if> name="roomtype_code" class="roomtype_code" id="roomtype_code${room.roomtype_code}" value="${room.roomtype_code}">
				<span class="label-text">${room.roomtype}</span>
			</label>&nbsp;&nbsp;
			</c:forEach>
		</div>
			<br><br><br>



         
         <div class="form-inline form-group" style="font-weight:600;font-size: x-large;">
            <label class="col-sm-4 control-label" >몇 평인가요? : </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
            <div class="col-sm-6">
               <input type="text" class="form-control" name="sr_roomsize" value="${sr_roomsize }"
                  maxlength="3" style="background-color: #F2F2F2; resize: none">
               평
            </div>
         </div>
         
          <div class="form-inline form-group"  style="font-size: x-large;">
            <label class="col-sm-5 control-label" style="font-weight:600;">건축년도를 입력해주세요 : </label>
            <div class="col-sm-6">
               <input type="text" class="form-control" id="builddate" name="sr_builddate" placeholder="날짜를 클릭하세요" value="${sr_builddate}"
                  maxlength="10" style="background-color: #F2F2F2; resize: none" readonly>
            </div>
         </div>
        
         
         
      </div>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <div class="container"
         style="display: inline-block; text-align: center;">
         <input type="button" name="getCheck" value=다음 class="btn btn-success"
            onClick="go();" style="height: 50px; width: 80px;font-size: x-large;">
      </div>
      </div>



   </form>


   <!-- /.row -->
   <!-- Contact Form -->
   <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
   <div class="row">
      <div class="col-lg-8 mb-4"></div>
   </div>
   <!-- /.row -->
   
   <!-- /.container -->
   <div class="container"></div>



   <script
      src="${ctRoot}/resources/checkRoom/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

   <script src="${ctRoot}/resources/checkRoom/js/jqBootstrapValidation.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="${ctRoot}/resources/checkRoom/js/bootstrap-datepicker.js"></script>

	
	
	
   <script>
   //--------------------------------------------------------
      // 평수 입력하는 부분에 한글 입력 못하도록 
   //--------------------------------------------------------
      $(document).ready(function() {
    	  $("[name=sr_roomsize]").keyup(function(){
              var roomSize = $(this).val();
              var num='';
              
              for(var i=0; i<roomSize.length; i++){
                 var str = '0123456789';
                 if(str.indexOf( roomSize.charAt(i) )>=0 ){
                    num = num + roomSize.charAt(i);
                 }
              }
              $(this).val(num);
              
           });
            /* $("[name='sr_builddate']").keyup(function(){
               var buildDate = $(this).val();
               var num="";
               
               for(var i=0; i<buildDate.length; i++){
                  var str = "0123456789-";
                  if(str.indexOf( buildDate.charAt(i) )>=0 ){
                     num = num + buildDate.charAt(i);
                  }
               }
               $(this).val(num);
               
            });  */



           // 달력 관련 -------------------------------------------------
   		$.datepicker.setDefaults($.datepicker.regional['ko']);
   		$("#builddate").datepicker(
   				{
   					endDate: '+1d',
   					changeMonth : true,
   					changeYear : true,
   					nextText : '다음 달',
   					prevText : '이전 달',
   					dayNames : [ '일요일', '월요일', '화요일', '수요일',
   							'목요일', '금요일', '토요일' ],
   					dayNamesMin : [ '일', '월', '화', '수', '목',
   							'금', '토' ],
   					monthNamesShort : [ '1월', '2월', '3월', '4월',
   							'5월', '6월', '7월', '8월', '9월',
   							'10월', '11월', '12월' ],
   					monthNames : [ '1월', '2월', '3월', '4월',
   							'5월', '6월', '7월', '8월', '9월',
   							'10월', '11월', '12월' ],
   					dateFormat : "yy-mm-dd",
   					maxDate : 0 // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)


   				});
   		
      });
      
      // jquery 수입에 있어서 충돌을 막아주는 코딩.
      jQuery.noConflict();
      
      // html 입력태그 들의 유효성 체크

      function go() {
         var type_room_cnt = $("[name='roomtype_code']").filter(":checked").length;
         /* alert(type_room_cnt); */
         if (type_room_cnt == 0) {
            alert("매물종류를 선택해주세요.");
            return;
         }
         if (type_room_cnt == 1) {
            if (is_empty("[name=sr_roomsize]")) {
               alert("평수를 입력해주세요.");
               return;
            }
            if (is_empty("[name=sr_builddate]")) {
                alert("건축년도를 입력해주세요.");
                return;
             }

         }
		 //console.log($.ajax);
         
         //form 태그의 action값으로 form 태그내부 파라미터 값들을 전달해줌.
         document.checkRoomForm.submit();

         
      }


  
   </script>
   <%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp"%>
   

		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	




</body>
</html>