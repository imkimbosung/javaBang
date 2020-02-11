<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp" %>
<%@include file="/WEB-INF/views/seller/incloudfile/topBar.jsp" %>
<html>
<head>
   <title>JAVABANG</title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
<%-- <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/animate/animate.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/select2/select2.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
    <link rel="stylesheet" href="${ctRoot}/resources/loginPage/css/title_ui.css">
<!--===============================================================================================-->
   <link rel="stylesheet" href="${ctRoot}/resources/checkbox/check_roomsearch.css">--%>
   <link rel="stylesheet" href="${ctRoot}/resources/radio/radio.css">
   <!-- 예쁜셀렉트박스 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <meta name="author" content="colorlib.com">
    <link href="${ctRoot}/resources/selectbox/css/main.css" rel="stylesheet" />
<script>
   jQuery.noConflict();
   
   $(document).ready(function(){
	      $("[name=sell_type_code]").change(function(){
	            var value = $(this).val();                                 // 현재 화면에서 change가 일어난 checkbox 데이터값을 관리하는 jquery 객체
	            var tmp = $(":checked").val();                              // html checkbox 태그 중 체크된 div태그 관리.
	            var divChecked = $("[name=sell_type_code]:checked");            // name=sell_type_code 태그의 체크된 div태그를 관리하는 jquery 객체
	            var divCSSdiv = $('.bundleOfcheck');                        // class=bundleOfcheck 가지는 div태그 를 관리하는 jquery 객체
	            var divSell_MEME = $('.sell_meme');                        // class=sell_meme 를 가지는 div태그를 관리하는 jquery 객체
	            var divSell_JEONSE = $('.sell_jeonse');                     // class=sell_jeonse 를 가지는 div태그를 관리하는 jquery 객체
	            var divSell_MONTHFEE = $('.sell_monthFee');                  // class=sell_monthFee 를 가지는 div태그를 관리하는 jquery 객체
	            var divSale_Price = $('.avgOfPriceSale');	
	            var divJeonse_Price = $('.avgOfPriceJeonse');
	            var divOneRoom_Price = $('.avgOfOneRoomPrice');

				var selectAddr = $("[name='sr_addr']").val();
				var cutAddr = selectAddr.split(' ');
	            // change가 일어난 checkbox 객체의 value 값이 1 일때
	            // name=sell_type_code 인 태그에 포함된 checkbox 태그의 체크값을 모두 해제한다.
	            // change 가 일어난 checkbox 태그의 체크를 true 설정. 체크상태로 변경
	            // divSell_MEME,divSell_JEONSE,divSell_MONTHFEE의 html태그를  모두 지운다.
	            // divCSSdiv 인 div 태그 이후에 html 태그를 추가하는 코딩을 작성.
	            if( value == 1 ){
		            //alert( cutAddr[1] );
	               divChecked.prop("checked", false);
	               $(this).prop("checked", true);
	               divSell_MEME.remove();
	               divSell_JEONSE.remove();
	               divSell_MONTHFEE.remove();
	               divSale_Price.remove();
	               divJeonse_Price.remove();
	               divOneRoom_Price.remove();
	               divCSSdiv.append('<div class="sell_meme" style="margin:30 auto;" ><div><input type="text" name="price_sale" placeholder="매매가"> 만원</input></div></div>');
	               //divCSSdiv.append('<div class="avgOfPriceSale" style="margin:30 auto;" ><div><input type="text" name="salePrice" placeholder="${averageSalePrice[0].price_sale}만원"></input></div></div>');
	               if( ${!empty averageSalePrice[0].price_sale} ){
	            	   divCSSdiv.append('<div class="avgOfPriceSale" style="margin:30 auto;"><div><div class="breadcrumb" name="salePrice" style="width: max-content;background-color: #ffc107;">선택하신 &nbsp;<b>"'+cutAddr[1]+'"</b>의  평균 매매가는&nbsp; <b>"${averageSalePrice[0].price_sale}"</b>만원 입니다.</div></div></div>');
	               }
	               else if( ${empty averageSalePrice[0].price_sale} ){
	            	   divCSSdiv.append('<div class="avgOfPriceSale" style="margin:30 auto;" ><div><div class="breadcrumb" name="salePrice" style="width: max-content;background-color: #ffc107;">선택하신&nbsp;<b>"'+cutAddr[1]+'"</b>의 평균  매매가가 없습니다. </div></div></div>');
	               } 

	               $("[name=price_sale]").keyup(function(){
	                var priceSale = $(this).val();
	                var num='';
	                for(var i=0; i<priceSale.length; i++){
	                   var str = '0123456789';
	                   if(str.indexOf( priceSale.charAt(i) )>=0 ){
	                      num = num + priceSale.charAt(i);
	                   }
	                }
	                $(this).val(num);
	             });
	               /* alert( $("[name=sellTypeForm]").serialize() );
	               $.ajax({
	            	   url : "/javaBang/seller/priceSaleProc.do"
                    , type : "post"
                    , data : $("[name=sellTypeForm]").serialize()
                    , success : function(priceSaleCnt){
                       if(priceSaleCnt != null){
                     	  divCSSdiv.append('<div class="avgOfPriceSale" style="margin:30 auto;" ><div><input type="text" name="salePrice" placeholder="${sellerRoomDTO.price_sale}만원"></input></div></div>');
                       }
                       else{
                          alert("입력하신 지역구의 평균 매매값을 불러오지 못했습니다.");
                       }
                    }
                    , error : function(request, status, error){
                       alert("서버접속실패");
                       alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }
	               }); */
	               
	               return;
	            }
	             // change가 일어난 checkbox 객체의 value 값이 2 일때
	            // name=sell_type_code 인 태그에 포함된 checkbox 태그의 체크값을 모두 해제한다.
	            // change 가 일어난 checkbox 태그의 체크를 true 설정. 체크상태로 변경
	            // divSell_MEME,divSell_JEONSE,divSell_MONTHFEE의 html태그를  모두 지운다.			averageJeonsePrice
	            // divCSSdiv 인 div 태그 이후에 html 태그를 추가하는 코딩을 작성.
	            else if( value == 2 ){
	               divChecked.prop("checked", false);
	               $(this).prop("checked", true);
	               divSell_MEME.remove();
	               divSell_JEONSE.remove();
	               divSell_MONTHFEE.remove();
	               divSale_Price.remove();
	               divJeonse_Price.remove();
	               divOneRoom_Price.remove();
	               divCSSdiv.append('<div class="sell_jeonse" style="margin:30 auto;" ><div><input type="text" name="price_jeonse" placeholder="전세가"> 만원</input></div></div>');
	               //divCSSdiv.append('<div class="avgOfPriceJeonse" style="margin:30 auto;" ><div><input type="text" name="price_jeonse" placeholder="${averageJeonsePrice[0].price_jeonse}만원"></input></div></div>');
	               if( ${!empty averageJeonsePrice[0].price_jeonse} ){
	            	   divCSSdiv.append('<div class="avgOfPriceJeonse" style="margin:30 auto;" ><div><div class="breadcrumb" name="price_jeonse" style="width: max-content;background-color: #ffc107;">선택하신 &nbsp;<b>"'+cutAddr[1]+'"</b>의  평균 전세가는&nbsp; <b>" ${averageJeonsePrice[0].price_jeonse}"</b>만원 입니다.</div></div></div>');
	               }
	               else if( ${empty averageJeonsePrice[0].price_jeonse} ){
	            	   divCSSdiv.append('<div class="avgOfPriceJeonse" style="margin:30 auto;" ><div><div class="breadcrumb" name="price_jeonse" style="width: max-content;background-color: #ffc107;"> 선택하신&nbsp;<b>" '+cutAddr[1]+'"</b>의 평균  전세가가 없습니다.</div></div></div>');
	               } 
	               $("[name=price_jeonse]").keyup(function(){
	                var jeonse = $(this).val();
	                var num='';
	                for(var i=0; i<jeonse.length; i++){
	                   var str = '0123456789';
	                   if(str.indexOf( jeonse.charAt(i) )>=0 ){
	                      num = num + jeonse.charAt(i);
	                   }
	                }
	                $(this).val(num);
	             });
	               return;
	            }
	             // change가 일어난 checkbox 객체의 value 값이 3 일때
	            // name=sell_type_code 인 태그에 포함된 checkbox 태그의 체크값을 모두 해제한다.
	            // change 가 일어난 checkbox 태그의 체크를 true 설정. 체크상태로 변경
	            // divSell_MEME,divSell_JEONSE,divSell_MONTHFEE의 html태그를  모두 지운다.
	            // divCSSdiv 인 div 태그 이후에 html 태그를 추가하는 코딩을 작성.
	            else if( value == 3 ){
	               divChecked.prop("checked", false);
	               $(this).prop("checked", true);
	               divSell_MEME.remove();
	               divSell_JEONSE.remove();
	               divSell_MONTHFEE.remove();
	               divSale_Price.remove();
	               divJeonse_Price.remove();
	               divOneRoom_Price.remove();
	               divCSSdiv.append('<div class="sell_monthFee" style="margin:30 auto;" ><div><input type="text" name="deposit" placeholder="보증금"> / </input><input type="text" name="monthly_rent" placeholder="월세"> 만원</input></div></div>');
	               //divCSSdiv.append('<div class="avgOfOneRoomPrice" style="margin:30 auto;" ><div>평균 <input type="text" name="deposit" placeholder="${averageOneRoomPrice[0].deposit} 만원 / ${averageOneRoomPrice[0].monthly_rent} 만원"></input></div></div>');
	               if( ${!empty averageOneRoomPrice[0].deposit && !empty averageOneRoomPrice[0].monthly_rent} ){
	            	   divCSSdiv.append('<div class="avgOfOneRoomPrice" style="margin:30 auto;" ><div>선택하신 &nbsp;<b>"'+cutAddr[1]+'"</b>의 평균 보증금 및 월세 가는 <div class="breadcrumb" name="deposit" style="width: max-content;background-color: #ffc107;">&nbsp; <b>" ${averageOneRoomPrice[0].deposit} "</b>만원 / &nbsp; <b>" ${averageOneRoomPrice[0].monthly_rent}"</b> 만원"></div></div></div>');
	               }
	               else if( ${empty averageOneRoomPrice[0].deposit && empty averageOneRoomPrice[0].monthly_rent } ){
	            	   divCSSdiv.append('<div class="avgOfOneRoomPrice" style="margin:30 auto;" ><div><div class="breadcrumb" name="salePrice" style="width: max-content;background-color: #ffc107;"> 선택하신 '+cutAddr[1]+'의 평균  보증금 및 월세값이 없습니다.</div></div></div>');
	               } 
	               if( value == 3 ){
	                  $("[name=deposit]").keyup(function(){
	                   var deposit = $(this).val();
	                   var num='';
	                   for(var i=0; i<deposit.length; i++){
	                      var str = '0123456789';
	                      if(str.indexOf( deposit.charAt(i) )>=0 ){
	                         num = num + deposit.charAt(i);
	                      }
	                   }
	                   $(this).val(num);
	                });
	                  $("[name=monthly_rent]").keyup(function(){
	                   var monthlyRent = $(this).val();
	                   var num='';
	                   for(var i=0; i<monthlyRent.length; i++){
	                      var str = '0123456789';
	                      if(str.indexOf( monthlyRent.charAt(i) )>=0 ){
	                         num = num + monthlyRent.charAt(i);
	                      }
	                   }
	                   $(this).val(num);
	                });
	               }
	               return;
	            }
	         });
	   });
      function goMessageForm(){
    	// alert( $("[name=imagesUpload]")[0] ); return;
		
         // 판매 방식 선택 유효성 체크
         if(is_empty("[name=sell_type_code]")){
               alert("판매방식을 선택해 주세요.");
               /* $("[name=sellType]").focus(); */
               return;
            }
         //=======================================================================
            // 판매방식 선택후 생성되는 html input 태그의 유효성 체크
         if( $(':checked').val() == 1 ){
            if(is_empty("[name=price_sale]")){
               alert("매매 가격을 입력해 주세요");
                  $("[name=sr_roomprice]").focus();
                  return;
               }
         }
         if( $(':checked').val() == 2 ){
            if(is_empty("[name=price_jeonse]")){
               alert("전세 가격을 입력해 주세요");
                  $("[name=sr_roomprice]").focus();
                  return;
               }
         }
         if( $(':checked').val() == 3 ){
            if( is_empty("[name=deposit]") && is_empty("name=monthly_rent") ){
               alert("보증금과 월세 가격을 입력해 주세요");
                  $("[name=sr_roomprice]").focus();
                  return;
               }
         }
         //=======================================================================
         /* select 부분의 선택 했는지 물음. */
            if(is_empty("[name=pet_available_code]")){
               alert("반려동물 입주가능여부를 선택해주세요");
               $("[name=pet_available_code]").focus();
               return;
            }if(is_empty("[name=parking_available_code]")){
               alert("주차장 존재 여부를 선택해주세요");
               $("[name=parking_available_code]").focus();
               return;
            }if(is_empty("[name=hc_type_code]")){
               alert("난방종류를 선택해주세요");
               $("[name=hc_type_code]").focus();
               return;
            }if(is_empty("[name=manage_fee_available_code]")){
               alert("관리비 유무를 선택해주세요");
               $("[name=manage_fee_available_code]").focus();
               return;
            }if(is_empty("[name=elv_available_code]")){
               alert("엘리베이터 유무 여부를 선택해주세요");
               $("[name=elv_available_code]").focus();
               return;
            }if(is_empty("[name=live_in_type_code]")){
               alert("입주시기가능 시기를 선택해주세요");
               $("[name=live_in_type_code]").focus();
               return;
            }
       
		//document.imagesUpload.submit();
		
		// image upload 먼저
		var form = $("[name=imagesUpload]")[0];
    	 var imageData = new FormData(form)


    	 $.ajax({
             url : "/javaBang/seller/roomImageSession.do"
             , type : "post"
             , enctype: 'multipart/form-data'
           	, processData: false
             , contentType: false
             , data : imageData
             , success : function(result){
                if(result == 0){
                	ajaxSellTypeProc();
                }else {
					alert("이미지가 입력되지 않았습니다.");
					return;
                }
             }
             , error : function(request, status, error){
                alert("서버접속실패");
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
             }
          });
		
		

        
      }

	function ajaxSellTypeProc(){
		 //비동기 방식을 통한 방등록  
        $.ajax({
           url : "/javaBang/seller/sellTypeProc.do"
           , type : "post"
          // , enctype: 'multipart/form-data'
         	//, processData: false
           //, contentType: false
           , data : $("[name=sellTypeForm]").serialize()
           , success : function(sellRoomRegCnt){
              if(sellRoomRegCnt == 1){
                 alert("판매할 방 정보 등록 성공!");
                    location.replace('${ctSellerRoot}/emptyListForm.do');
              }
              else{
                 alert("판매할 방 등록 실패! 관리자에게  문의 바랍니다.");
              }
           }
           , error : function(request, status, error){
              alert("서버접속실패");
              alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           }
        });

	}
      
      function before_btn(loc){
     	   document.goCheckRoomForm.action = loc;
     	   document.goCheckRoomForm.submit();
     }
   </script>
    <script>
         $(document).ready(function(){
    		 var checkOption = $("[name='checkboxBundle']");
    		 var value;
        	 checkOption.hide();
        	 $("[name='option_type_code']").change(function(){
        		value = $(this).val();
        		console.log(value);
        		$( "[name='option_select_code']" ).attr( 'disabled', value!=0 ? true : false );
        		//일반옵션
        		if(value==0){
        			checkOption.show();
        			$("[name='option_select_code']").prop("checked",false);
        			$( "[id='option_select_code0']" ).attr( 'disabled', value==0 ? true : false );
        			$( 'input[name="option_select_code"]' ).attr( 'checked', true );
        		}
        		else {
        			if(value==1){
            			checkOption.show();
            			$("[name='option_select_code']").prop("checked",false);
                		$( "[id='option_select_code0']" ).attr( 'disabled', false );
        			$("[id='option_select_code0']").prop("checked",true);
        			}
        		}
        	 });
        	 $("[id='option_select_code0']").change(function(){
        		if(value==0){
        			$("[id='option_select_code0']").prop("checked",false);
            	}else{
            		$("[id='option_select_code0']").prop("checked",true);
                }
        	 });
         });
</script>
 </head>
 <body style="font-size:large;">
<div style="padding:40px;"> </div>
<div class="container">
   <form name="sellTypeForm" method="post" action="${ctSellerRoot}/sellTypeForm.do" enctype="multipart/form-data">
      	<div class="limiter" class="goSell">
         <div class="container" style="align:center;">
            <div class="breadcrumb" style="font-size: 18;"><b>거래종류를 선택하시고 희망가격을 입력 해주세요.</b></div>
            <div style="padding:30px;"> </div>
           </div>
         </div>
          	<center>
            <div class="bundleOfcheck" >
				<c:forEach items="${sellTypeCode}" var="sellType" varStatus="status">	
				<label>					
					<div class="form-check">
						<input id="sell_type_code${status.count}" type="checkbox" name="sell_type_code" value="${sellType.sell_type_code}"  >
							 <span class="label-text" style="font-size: xx-large;">${sellType.sell_type}</span>
					</div>
				</label>
				</c:forEach>				
             </div>
           </center>
        <div style="padding:40px;"> </div>
        <div class="breadcrumb" style="font-size: 18;"><b>매물옵션</b>을 선택 해주세요.</div>
   <div style="padding:30px;"> </div>
   <div class="s010">
   <center>
<!-- 2020.01.20 -->
     <div class="inner-form" style="margin:30;">
      <div class="advance-search">
            <div class="row" style="margin:10px;">
              <div class="input-field">
                <div class="input-select">
                <select class="choices" name="pet_available_code" style="font-size: 18;">
                		<option value="">반려동물가능여부</option>
                	<c:forEach items="${codePetAvailable}" var="pet" >	
						<option value="${pet.pet_available_code}">${pet.pet_available}</option>
					</c:forEach>
				</select>	
               </div>
              </div>
              <div class="input-field">
                <div class="input-select">
                <select data-trigger="" name="parking_available_code" style="font-size: 18;">
                		<option value="">주차가능여부</option>
                	<c:forEach items="${codeParkingAvailable}" var="parking" >	
						<option value="${parking.parking_available_code}">${parking.parking_available}</option>
					</c:forEach>
				</select>	
                </div>
              </div>
              <div class="input-field">
                <div class="input-select">
                  <select data-trigger="" name="hc_type_code" style="font-size: 18;">
                		<option value="">난방종류선택</option>
                	<c:forEach items="${codeHcType}" var="hcType" >	
						<option value="${hcType.hc_type_code}">${hcType.hc_type}</option>
					</c:forEach>
                  </select>
                </div>
              </div>
              <div class="input-field">
                <div class="input-select">
                  <select data-trigger="" name="manage_fee_available_code" style="font-size: 18;">
                		<option value="">관리비유무</option>
                	<c:forEach items="${codeManageFee}" var="fee" >	
						<option value="${fee.manage_fee_available_code}">${fee.manage_fee_available}</option>
					</c:forEach>
                  </select>
                </div>
              </div>
              <div class="input-field">
                <div class="input-select">
                  <select data-trigger="" name="elv_available_code" style="font-size: 18;">
                		<option value="">엘리베이터유무</option>
                	<c:forEach items="${codeElv}" var="elv" >	
						<option value="${elv.elv_available_code}">${elv.elv_available}</option>
					</c:forEach>
                  </select>
                </div>
              </div>
              <div class="input-field">
                <div class="input-select">
                  <select data-trigger="" name="live_in_type_code" style="font-size: 18;">
                		<option value="">입주시기선택</option>
                	<c:forEach items="${codeLiveInType}" var="liveIn" >	
						<option value="${liveIn.live_in_type_code}">${liveIn.live_in_type}</option>
					</c:forEach>
                  </select>
                </div>
         </div>
        </div>
       </div>
      </div>
      <!-- 2020.01.20 -->
        </center>

        <div style="padding:40px;"> </div>
          <div class="breadcrumb"><b>기본제공옵션</b>을 선택 해주세요.</div>
         <div style="padding:30px;"> </div>
         <center>
      
        	 <div class="col-sm-12">
           		<c:forEach items="${optionTypeCode}" var="optionType" varStatus="status">
					<div class="form-check">
						<label>
								<input type="radio" id="option_type_code${status.index}" name="option_type_code" class="option_type_code" value="${optionType.option_type_code}">
								<span class="label-text" style="font-size: xx-large;">${optionType.option_type} </span>
						</label>
					</div>
				</c:forEach>
			</div>
      <%--    <div class="option_type">
           	<c:forEach items="${optionTypeCode}" var="optionType" varStatus="status">
				<input id="option_type_code${status.index}" name="option_type_code" style="margin:10;padding:10;" class="option_type_code" type="radio" value="${optionType.option_type_code}">
				${optionType.option_type}
			</c:forEach>
         </div> --%>
         </center>
        
         <!-- 2020.01.21 -->
         <div class="row" name="checkboxBundle" style="padding:0% 10% 0% 10%;" >
			<c:forEach items="${optionSelectCode}" var="optionSelect" varStatus="status">	
				<label style="font-size: xx-large;">					
					<div class="form-check">
						<input type="checkbox" id="option_select_code${optionSelect.option_select_code}" name="option_select_code" class="option_select_code" value="${optionSelect.option_select_code}"> <span class="label-text">${optionSelect.option_select_type}</span>
					</div>
				</label>
			</c:forEach>					
		</div>
	<input type="hidden" name="roomtype_code" value="${roomType_code}">  
      <input type="hidden" name="sr_roomsize" value="${sr_roomsize}">
      <input type="hidden" name="sr_zip_code" value="${sr_zip_code}">
      <input type="hidden" name="sr_addr" value="${sr_addr}">
      <input type="hidden" name="sr_detail_addr" value="${sr_detail_addr}">
      <input type="hidden" name="sr_room_floor" value="${sr_room_floor}">
      <input type="hidden" name="sr_builddate" value="${sr_builddate}">
      
   <!--  <div style="padding:40px;"> </div>
          <div class="breadcrumb"><b>사진을 등록해 주세요. </b>  &nbsp;&nbsp;   최대 4장까지 가능합니다.</div>
 	  <div style="padding:30px;"> </div>
         <center>
     	<div class="col-sm-12">
        		<input type="file" name="imageFile" id="imgfile" multiple>
  		<div id="preview"></div>
		</div>  -->
		
   </form>
   
   <div style="padding:40px;"> </div>
          <div class="breadcrumb"><b>사진을 등록해 주세요. </b>  &nbsp;&nbsp;   최대 4장까지 가능합니다.</div>
 	 <div style="padding:30px;"> </div>
 	  
   <form name="imagesUpload" action="/javaBang/seller/roomImageSession.do"  style="max-width: 1110px;" method="post" enctype="multipart/form-data">
   	  
         <center>
     	<div class="col-sm-12" style="font-size: xx-large;">
        		<input type="file" name="imageFile" id="imgfile" multiple>
        		<div style="padding:30px;"> </div>
  		<div id="preview"></div>
		</div>
	</form>	 

   <form name="goCheckRoomForm" method="post" >
      <input type="hidden" name="roomtype_code" value="${roomType_code}">  
      <input type="hidden" name="sr_roomsize" value="${sr_roomsize}">
      <input type="hidden" name="sr_zip_code" value="${sr_zip_code}">
      <input type="hidden" name="sr_addr" value="${sr_addr}">
      <input type="hidden" name="sr_detail_addr" value="${sr_detail_addr}">
      <input type="hidden" name="sr_room_floor" value="${sr_room_floor}">
      <input type="hidden" name="sr_builddate" value="${sr_builddate}">
   </form>     
			   
         <div style="padding:50px;"> </div>
             <button type="button" class="btn btn-warning" id="goBacktest" onclick="before_btn('${ctSellerRoot}/checkAddrForm.do')" style="padding:20;font-size: 25;">이전</button>
            <button type="button" class="btn btn-Success" id="goNexttest" onclick="goMessageForm()" style="padding:20;font-size: 25;">등록하기</button>
        <%-- <input type="hidden" name="roomtype_code" value="${room.roomtype_code}"> --%>
         <div style="padding:30px;"> </div>
      <div style="padding:130px;"> </div>
  </div>
<!--===============================================================================================-->
<%--    <script src="${ctRoot}/resources/rentList/vendor/bootstrap/js/popper.js"></script>
   <script src="${ctRoot}/resources/rentList/vendor/bootstrap/js/bootstrap.min.js"></script> --%>
<!--===============================================================================================-->

<script type="text/javascript">
  $(document).ready(function (e){
    $("input[type='file']").change(function(e){

      //div 내용 비워주기
      $('#preview').empty();

      var files = e.target.files;
      var arr =Array.prototype.slice.call(files);
      
      //업로드 가능 파일인지 체크
      for(var i=0;i<files.length;i++){
        if(!checkExtension(files[i].name,files[i].size)){
          return false;
        }
      }
      
      preview(arr);
      
      
    });//file change
    
    function checkExtension(fileName,fileSize){

      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 20971520;  //20MB
      
      if(fileSize >= maxSize){
        alert('파일 사이즈 초과');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      
      if(regex.test(fileName)){
        alert('업로드 불가능한 파일이 있습니다.');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      return true;
    }
    
    function preview(arr){
        arr.forEach(function(f){
          //파일명이 길면 파일명...으로 처리
          var fileName = f.name;
          if(fileName.length > 10){
            fileName = fileName.substring(0,7)+"...";
          }
          //div에 이미지 추가
          var str = '<div style="display: inline-flex; padding: 5px;"><li>';
          str += '<span>'+fileName+'</span><br>';
          //이미지 파일 미리보기
          if(f.type.match('image.*')){
            var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
            reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
              //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
              str += '<img src="'+e.target.result+'" title="'+f.name+'" width=200 height=200 />';
              str += '</li></div>';
              $(str).appendTo('#preview');
            }
            reader.readAsDataURL(f);
          }else{
            str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
            $(str).appendTo('#preview');
          }
        });//arr.forEach
      }
    });
  </script>


<!--=셀렉트박스 내려오는 애니메이션======================================================================-->
<script src="/resources/selectbox/js/extention/choices.js"></script>
    <script>
      const customSelects = document.querySelectorAll("select");
      const deleteBtn = document.getElementById('delete')
      const choices = new Choices('select',
      {
        searchEnabled: false,
        itemSelectText: '',
        removeItemButton: true,
      });
      for (let i = 0; i < customSelects.length; i++)
      {
        customSelects[i].addEventListener('addItem', function(event)
        {
          if (event.detail.value)
          {
            let parent = this.parentNode.parentNode
            parent.classList.add('valid')
            parent.classList.remove('invalid')
          }
          else
          {
            let parent = this.parentNode.parentNode
            parent.classList.add('invalid')
            parent.classList.remove('valid')
          }
        }, false);
      }
      deleteBtn.addEventListener("click", function(e)
      {
        e.preventDefault()
        const deleteAll = document.querySelectorAll('.choices__button')
        for (let i = 0; i < deleteAll.length; i++)
        {
          deleteAll[i].click();
        }
      });
    </script>
<%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
</body>
</html>