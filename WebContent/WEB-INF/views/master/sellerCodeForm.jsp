<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!-- ########################################################## -->
	<!-- 마스터 화면 -> 목록 수정 -> 판매자 code 테이블 목록 입력/수정/삭제 기능 화면 made by kbs-->
	<!-- ########################################################## -->
	
<script src="/javaBang/resources/jquery-1.11.0.min.js"	type="text/javascript"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- jsp페이지에서 사용할 사용자 저의 태그인 spring폼 태그 선언 -->
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet"
	href="/javaBang/resources/assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="/javaBang/resources/assets/css/style.css">
<!-- <link rel="stylesheet" href="/javaBang/resources/checkbox/check.css"> -->
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<link
	href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css"
	rel="stylesheet" />

<script
	src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="/javaBang/resources/assets/js/main.js"></script>

<html>
<head>
<meta charset="UTF-8">
<title>목록수정 - 판매자Code</title>
<style>
.tdl-holder input[type="checkbox"] {
    cursor: pointer;
    opacity: 0;
    position: absolute; }
    .tdl-holder input[type="checkbox"] + i {
      border: 1px solid rgba(153, 171, 180, 0.3);
      display: block;
      height: 18px;
      position: absolute;
      top: 15px;
      width: 18px;
      z-index: 1; }
    .tdl-holder input[type="checkbox"]:checked + i::after {
      content: "\e64c";
      font-family: 'themify';
      display: block;
      color: rgba(153, 171, 180, 0.5);
      left: 0;
      position: absolute;
      top: -16px;
      z-index: 2; }
    .tdl-holder input[type="checkbox"]:checked ~ span {
      text-decoration: line-through; }
  .tdl-holder input[type="text"] {
    height: 60px;
    margin-top: 20px;
    font-size: 14px; }


.login-form .checkbox {
  color: #878787; }

.login-form .checkbox label {
  text-transform: none; }
	
[type="checkbox"] {
  position: relative;
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  cursor: pointer;
}

[type="checkbox"]:before {
  content: "";
  position: absolute;
  left: -1.2em;
  top: -0.9em;
  display: inline-block;
  width: 25px;
  height: 25px;
  border: 2px solid #464444;
  border-radius: 2px 8px 2px 4px / 5px 3px 5px 3px;
}

[type="checkbox"]:checked:after {
  content: "x";
  position: absolute;
  left: -0.64em;
  top: -0.48em;
  font-size: 1.5rem;
  line-height: 0.5;
  color: #464444;
}

[type="checkbox"]:disabled:before {
  border: 2px solid #aaa;
}

[type="radio"] {
  position: relative;
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  cursor: pointer;
}

[type="radio"]:before {
  content: "";
  position: absolute;
  left: -1.2em;
  top: -0.9em;
  display: inline-block;
  width: 16px;
  height: 16px;
  border: 2px solid #464444;
  border-radius: 50% 45% 40% 50% / 40% 50% 50% 45%;
}

[type="radio"]:checked:before {
  background-color: #464444;
}

[type="radio"]:disabled:before {
  border: 2px solid #aaa;
}
</style>
<script>
jQuery(document).ready(function(){


});
var check = "none" ;
	function btn_delete(){
		
			var checkboxObj = $("[name='selectColumn']:checkbox")
			var roomtypeObj = $("[name='selectColumn']")
			//alert("btn");
			if(checkboxObj.css("display") == "none"){ 
				//alert("display, none");
				$("[name='insertRoomtype']").hide();  
				hideforEach();
				hideInsert();
				
				checkboxObj.show();			
				
		        check = "del"; 
		    } else {  
		    	//alert("display,");
		    	roomtypeObj.hide(); 
		        check = "none"
		    }  

		    
		}

	function btn_insert(){  
		var roomObj =  $("[name='insertRoomtype']:text");
		var elvObj =  $("[name='insertElvAvailable']:text");
		var hcObj =  $("[name='insertHcAvailable']:text");

		//----------------------------------
		var optionSelectObj = $("[name='insertOptionSelectType']:text");
		var petObj =$("[name='insertPetAvailable']:text");
		var parkingObj = $("[name='insertParkingAvailable']:text");
		var optionTypeObj = $("[name='insertOptionType']:text");
		var feeObj = $("[name='insertManageFeeAvailable']:text");
		var liveInObj = $("[name='insertLiveInType']:text");
		var sellObj = $("[name='insertSelltype']:text");

		
		if(roomObj.css("display") == "none"){ 
				$("[name='selectColumn']").hide();  
				hideforEach();
				
				roomObj.show(); 
				elvObj.show(); 
				hcObj.show(); 
				//----------------------------------
				optionSelectObj.show();
				petObj.show(); 
				parkingObj.show(); 
				optionTypeObj.show(); 
				feeObj.show(); 
				liveInObj.show(); 
				sellObj.show(); 
				
		        check = "in"; 
		    } else {  
		    	hideInsert();
		        
		        check = "none"
		    }  
		}

	function btn_update(){
		 
			if($("[name=${roomTypeCode[0].roomtype}]").css("display") == "none"){  
	
				hideInsert();
				$("[name='insertRoomtype']").hide();
				$("[name='selectColumn']").hide(); 
				
				<c:forEach items="${roomTypeCode}" var="data">				
				$("[name=${data.roomtype}]").show();  			
				</c:forEach>
				<c:forEach items="${ELVCode}" var="data">				
				$("[name=${data.ELV_AVAILABLE}]").show();  			
				</c:forEach>
				<c:forEach items="${hcTypeCode}" var="data">				
				$("[name=${data.HC_TYPE}]").show();  			
				</c:forEach>


				//----------------------------------
				<c:forEach items="${optionSelectCode}" var="data">				
				$("[name=${data.OPTION_SELECT_TYPE}]").show();  			
				</c:forEach>
				<c:forEach items="${petCode}" var="data">				
				$("[name=${data.PET_AVAILABLE}]").show();  			
				</c:forEach>
				<c:forEach items="${parkingCode}" var="data">				
				$("[name=${data.PARKING_AVAILABLE}]").show();  			
				</c:forEach>
				<c:forEach items="${optionTypeCode}" var="data">				
				$("[name=${data.OPTION_TYPE}]").show();  			
				</c:forEach>
				<c:forEach items="${feeCode}" var="data">				
				$("[name=${data.MANAGE_FEE_AVAILABLE}]").show();  			
				</c:forEach>
				<c:forEach items="${liveInCode}" var="data">				
				$("[name=${data.LIVE_IN_TYPE}]").show();  			
				</c:forEach>
				<c:forEach items="${sellCode}" var="data">				
				$("[name=${data.SELL_TYPE}]").show();  			
				</c:forEach>
				
				
		        
		        check = "up"; 
		    } else {  
			    
				hideforEach();
		        check = "none"
		    }  
			 
		}

	// 추가 부분 안보이게 하기
	function hideInsert(){
		var roomObj =  $("[name='insertRoomtype']:text");
		var elvObj =  $("[name='insertElvAvailable']:text");
		var hcObj =  $("[name='insertHcAvailable']:text");

		//-----------------------
		var optionSelectObj = $("[name='insertOptionSelectType']:text");
		var petObj = $("[name='insertPetAvailable']:text");
		var parkingObj = $("[name='insertParkingAvailable']:text");
		var optionTypeObj = $("[name='insertOptionType']:text");
		var feeObj = $("[name='insertManageFeeAvailable']:text");
		var liveInObj = $("[name='insertLiveInType']:text");
		var sellObj = $("[name='insertSelltype']:text");

		roomObj.hide(); 
		elvObj.hide(); 
		hcObj.hide(); 

		//-----------------------
		optionSelectObj.hide();
		petObj.hide();
		optionSelectObj.hide();
		parkingObj.hide();
		feeObj.hide();
		liveInObj.hide();
		sellObj.hide();
		
	}
	
	function hideforEach(){
			<c:forEach items="${roomTypeCode}" var="data">				
			$("[name=${data.roomtype}]").hide();  			
			</c:forEach>		
			<c:forEach items="${ELVCode}" var="data">				
			$("[name=${data.ELV_AVAILABLE}]").hide();  			
			</c:forEach>
			<c:forEach items="${hcTypeCode}" var="data">				
			$("[name=${data.HC_TYPE}]").hide();  			
			</c:forEach>	
			
			//-----------------------
			<c:forEach items="${optionSelectCode}" var="data">				
			$("[name=${data.OPTION_SELECT_TYPE}]").hide();  			
			</c:forEach>
			<c:forEach items="${petCode}" var="data">				
			$("[name=${data.PET_AVAILABLE}]").hide();  			
			</c:forEach>
			<c:forEach items="${parkingCode}" var="data">				
			$("[name=${data.PARKING_AVAILABLE}]").hide();  			
			</c:forEach>
			<c:forEach items="${optionTypeCode}" var="data">				
			$("[name=${data.OPTION_TYPE}]").hide();  			
			</c:forEach>
			<c:forEach items="${feeCode}" var="data">				
			$("[name=${data.MANAGE_FEE_AVAILABLE}]").hide();  			
			</c:forEach>
			<c:forEach items="${liveInCode}" var="data">				
			$("[name=${data.LIVE_IN_TYPE}]").hide();  			
			</c:forEach>
			<c:forEach items="${sellCode}" var="data">				
			$("[name=${data.SELL_TYPE}]").hide();  			
			</c:forEach>
		}
	
	function changeCodeTable(){
		// 추가할 목록들 ------------------
		var roomObj =  $("[name='insertRoomtype']:text");
		var elvObj =  $("[name='insertElvAvailable']:text");
		var hcObj =  $("[name='insertHcAvailable']:text");

		var optionSelectObj = $("[name='insertOptionSelectType']:text");
		var petObj = $("[name='insertPetAvailable']:text");
		var parkingObj = $("[name='insertParkingAvailable']:text");
		var optionTypeObj = $("[name='insertOptionType']:text");
		var feeObj = $("[name='insertManageFeeAvailable']:text");
		var liveInObj = $("[name='insertLiveInType']:text");
		var sellObj = $("[name='insertSelltype']:text");
		// -------------------------------
		
		// 테이블 명 ----------------------		
		var roomTableObj = $('input:checkbox[id="CODE_SELL_ROOM_TYPE"]')
		var elvTableObj = $('input:checkbox[id="CODE_ELV"]')
		var hcTableObj = $('input:checkbox[id="CODE_HC_TYPE"]')
		
		
		var optionSelectTableObj = $('input:checkbox[id="CODE_OPTION_SELECT_TYPE"]')
		var petTableObj = $('input:checkbox[id="CODE_PET_AVAILABILITY"]')
		var parkingTableObj = $('input:checkbox[id="CODE_PARKING_AVAILABILITY"]')
		var optionTypeTableObj = $('input:checkbox[id="CODE_OPTION_TYPE"]')
		var feeTableObj = $('input:checkbox[id="CODE_MANAGE_FEE"]')
		var liveInTableObj = $('input:checkbox[id="CODE_LIVE_IN_TYPE"]')
		var sellTableObj = $('input:checkbox[id="CODE_SELL_TYPE"]')
		// -------------------------------
		
		// 선택한 칼럼 개수 ----------------------	
		var change_room_cnt = $('input:checkbox[id="room"]').filter(":checked").length;
		var change_elv_cnt = $('input:checkbox[id="elv"]').filter(":checked").length;
		var change_Hc_cnt = $('input:checkbox[id="hc"]').filter(":checked").length;


		var change_select_option_cnt = $('input:checkbox[id="selectoption"]').filter(":checked").length;
		var change_pet_cnt = $('input:checkbox[id="pet"]').filter(":checked").length;
		var change_parking_cnt = $('input:checkbox[id="parking"]').filter(":checked").length;
		var change_option_type_cnt = $('input:checkbox[id="optiontype"]').filter(":checked").length;
		var change_fee_cnt = $('input:checkbox[id="fee"]').filter(":checked").length;
		var change_live_in_cnt = $('input:checkbox[id="livein"]').filter(":checked").length;
		var change_sell_cnt = $('input:checkbox[id="sell"]').filter(":checked").length;
		// -------------------------------
		
		// 칼람 명 ----------------------
		var columnRoom = $('input:checkbox[id="columnRoom"]');
		var columnElv = $('input:checkbox[id="columnElv"]');
		var columnHc = $('input:checkbox[id="columnHc"]');

		
		var columnOptionSelect = $('input:checkbox[id="columnOptionSelect"]');
		var columnPet = $('input:checkbox[id="columnPet"]');
		var columnParking = $('input:checkbox[id="columnParking"]');
		var columnOptionType = $('input:checkbox[id="columnOptionType"]');
		var columnFee = $('input:checkbox[id="columnFee"]');
		var columnLiveIn = $('input:checkbox[id="columnLiveIn"]');
		var columnSell = $('input:checkbox[id="columnSell"]');
		// -------------------------------
		
		
		// ----------------------------------------------------
		// 삭제 
		// ----------------------------------------------------
		if(check == "del"){
			

			if(change_room_cnt==0 && change_elv_cnt== 0 && change_Hc_cnt==0 && change_select_option_cnt==0 && change_pet_cnt== 0 && change_parking_cnt==0 && change_option_type_cnt==0 && change_fee_cnt== 0 && change_live_in_cnt==0 && change_sell_cnt==0){
				alert("삭제하려는 목록을 선택해주세요.");
				return;
				}

			// roomtype중 하나라도 체크되면 테이블 이름 체크
			if(change_room_cnt >0){
				roomTableObj.attr("checked", true)
				$('input:checkbox[id="checkRoom"]').val(change_room_cnt).attr("checked", true);  // 선택된 개수 추가 
				columnRoom.attr("checked", true);
				$('input:checkbox[id="columnCodeRoom"]').attr("checked", true);
			}
			if(change_elv_cnt >0){
				elvTableObj.attr("checked", true)
				$('input:checkbox[id="checkElv"]').val(change_elv_cnt).attr("checked", true);
				columnElv.attr("checked", true)
				$('input:checkbox[id="columnCodeElv"]').attr("checked", true)
			}

			if(change_Hc_cnt >0){
				hcTableObj.attr("checked", true);
				$('input:checkbox[id="checkHc"]').val(change_Hc_cnt).attr("checked", true);
				columnHc.attr("checked", true);
				$('input:checkbox[id="columnCodeHc"]').attr("checked", true);
			}


			//----------------------
			

			
			if(change_select_option_cnt >0){
				optionSelectTableObj.attr("checked", true);
				$('input:checkbox[id="checkOptionSelect"]').val(change_select_option_cnt).attr("checked", true);
				columnOptionSelect.attr("checked", true);
				$('input:checkbox[id="columnCodeOptionselect"]').attr("checked", true);
			}
			
			if(change_pet_cnt >0){
				petTableObj.attr("checked", true);
				$('input:checkbox[id="checkPet"]').val(change_pet_cnt).attr("checked", true);
				columnPet.attr("checked", true);
				$('input:checkbox[id="columnCodePet"]').attr("checked", true);
			}
			
			if(change_parking_cnt >0){
				parkingTableObj.attr("checked", true);
				$('input:checkbox[id="checkParking"]').val(change_parking_cnt).attr("checked", true);
				columnParking.attr("checked", true);
				$('input:checkbox[id="columnCodeParking"]').attr("checked", true);
			}
			
			if(change_option_type_cnt >0){
				optionTypeTableObj.attr("checked", true);
				$('input:checkbox[id="checkOptionType"]').val(change_option_type_cnt).attr("checked", true);
				columnOptionType.attr("checked", true);
				$('input:checkbox[id="columnCodeOptionType"]').attr("checked", true);
			}
			
			if(change_fee_cnt >0){
				feeTableObj.attr("checked", true);
				$('input:checkbox[id="checkFee"]').val(change_fee_cnt).attr("checked", true);
				columnFee.attr("checked", true);
				$('input:checkbox[id="columnCodeFee"]').attr("checked", true);
			}
			
			if(change_live_in_cnt >0){
				liveInTableObj.attr("checked", true);
				$('input:checkbox[id="checkLiveIn"]').val(change_live_in_cnt).attr("checked", true);
				columnLiveIn.attr("checked", true);
				$('input:checkbox[id="columnCodeLiveIn"]').attr("checked", true);
			}
			
			if(change_sell_cnt >0){
				sellTableObj.attr("checked", true);
				$('input:checkbox[id="checkSell"]').val(change_sell_cnt).attr("checked", true);
				columnSell.attr("checked", true);
				$('input:checkbox[id="columnCodeSell"]').attr("checked", true);
			}
			
	/* 		
			alert($('input:checkbox[name="tableName"]').filter(":checked").length)
			return; */

			if(confirm("정말 삭제하시겠습니까?") ==false){return;}
				/* alert($('[name=roomTypeCode]').serialize()); */
			/*return; */

				$.ajax({
					url : "/javaBang/master/allCodeProc.do"
					,type : "post"
					,data : $('[name=roomTypeCode]').serialize() + "&check=" + check
					,success : function(checkRoomCnt){

						if(checkRoomCnt>=1){
							alert("삭제 성공");
							location.replace("/javaBang/master/sellerCodeForm.do");
						}
						else{
							alert("삭제 실패 - 관리자에게 문의 바람");
						}
					}
					, error : function(){
						alert("서버 접속 실패");
					}
				});
				
			// -----------------------------------------------
			// 수정
			// -----------------------------------------------	
		}else if(check == "up"){
			//alert($('[name=roomTypeCode]').serialize());
			var changeCode = [];
			var tableInfo = [];


			<c:forEach items="${roomTypeCode}" var="data">				
				if($("[name=${data.roomtype}]").val() !=  "${data.roomtype}"){
						changeCode.push("${data.roomtype}");
						changeCode.push($("[name=${data.roomtype}]").val());
						tableInfo.push(roomTableObj.val());
						tableInfo.push(columnRoom.val());
					} 			
			</c:forEach>
			
			<c:forEach items="${ELVCode}" var="data">				
				if($("[name=${data.ELV_AVAILABLE}]").val() !=  "${data.ELV_AVAILABLE}"){
					changeCode.push("${data.ELV_AVAILABLE}");
					changeCode.push($("[name=${data.ELV_AVAILABLE}]").val());
					tableInfo.push(elvTableObj.val());
					tableInfo.push(columnElv.val());
				} 	  			
			</c:forEach>


			<c:forEach items="${hcTypeCode}" var="data">				 	
				if($("[name=${data.HC_TYPE}]").val() !=  "${data.HC_TYPE}"){
					changeCode.push("${data.HC_TYPE}");
					changeCode.push($("[name=${data.HC_TYPE}]").val());
					tableInfo.push(hcTableObj.val());
					tableInfo.push(columnHc.val());
				} 			
			</c:forEach>


			//---------------------
			
			
			<c:forEach items="${optionSelectCode}" var="data">
				if($("[name=${data.OPTION_SELECT_TYPE}]").val() !=  "${data.OPTION_SELECT_TYPE}"){
					changeCode.push("${data.OPTION_SELECT_TYPE}");
					changeCode.push($("[name=${data.OPTION_SELECT_TYPE}]").val());
					tableInfo.push(optionSelectTableObj.val());
					tableInfo.push(columnOptionSelect.val());
				}
			</c:forEach>
			
			<c:forEach items="${petCode}" var="data">
				if($("[name=${data.PET_AVAILABLE}]").val() !=  "${data.PET_AVAILABLE}"){
					changeCode.push("${data.PET_AVAILABLE}");
					changeCode.push($("[name=${data.PET_AVAILABLE}]").val());
					tableInfo.push(petTableObj.val());
					tableInfo.push(columnPet.val());
				}
			</c:forEach>	
			
			<c:forEach items="${parkingCode}" var="data">	
				if($("[name=${data.PARKING_AVAILABLE}]").val() !=  "${data.PARKING_AVAILABLE}"){
					changeCode.push("${data.PARKING_AVAILABLE}");
					changeCode.push($("[name=${data.PARKING_AVAILABLE}]").val());
					tableInfo.push(parkingTableObj.val());
					tableInfo.push(columnParking.val());
				}		
			</c:forEach>
			
			<c:forEach items="${optionTypeCode}" var="data">	
				if($("[name=${data.OPTION_TYPE}]").val() !=  "${data.OPTION_TYPE}"){
					changeCode.push("${data.OPTION_TYPE}");
					changeCode.push($("[name=${data.OPTION_TYPE}]").val());
					tableInfo.push(optionTypeTableObj.val());
					tableInfo.push(columnOptionType.val());	
				}
			</c:forEach>
			
			<c:forEach items="${feeCode}" var="data">	
				if($("[name=${data.MANAGE_FEE_AVAILABLE}]").val() !=  "${data.MANAGE_FEE_AVAILABLE}"){
					changeCode.push("${data.MANAGE_FEE_AVAILABLE}");
					changeCode.push($("[name=${data.MANAGE_FEE_AVAILABLE}]").val());
					tableInfo.push(feeTableObj.val());
					tableInfo.push(columnFee.val());
				}			
			</c:forEach>
			
			<c:forEach items="${liveInCode}" var="data">
				if($("[name=${data.LIVE_IN_TYPE}]").val() !=  "${data.LIVE_IN_TYPE}"){
					changeCode.push("${data.LIVE_IN_TYPE}");
					changeCode.push($("[name=${data.LIVE_IN_TYPE}]").val());
					tableInfo.push(liveInTableObj.val());
					tableInfo.push(columnLiveIn.val());	
				}		
			</c:forEach>
			
			<c:forEach items="${sellCode}" var="data">	
				if($("[name=${data.SELL_TYPE}]").val() !=  "${data.SELL_TYPE}"){
					changeCode.push("${data.SELL_TYPE}");
					changeCode.push($("[name=${data.SELL_TYPE}]").val());
					tableInfo.push(sellTableObj.val());
					tableInfo.push(columnSell.val());
				}	
			</c:forEach>
			
			
			/* alert(objCode['테스트']); return; */
			 var objParams = {
							"changeCode" : changeCode,
							"tableInfo" : tableInfo,
							"check" : check
					};

			//alert(tableInfo); return
			
			if(changeCode == ""){
				alert("변경된 항목이 없습니다.")
				return;
				}
		
			
			
			if(confirm("정말 변경하시겠습니까?") ==false){return;} 

			
			$.ajax({
				url : "/javaBang/master/allCodeProc.do"
				,type : "post"
				,data : objParams
				,success : function(checkRoomCnt){
					if(checkRoomCnt>=1){
						alert("변경 성공");
						location.replace("/javaBang/master/sellerCodeForm.do");
					}
					else{
						alert("변경 실패 - 관리자에게 문의 바람");
					}
				}
				, error : function(){
					alert("서버 접속 실패");
				}
			});


		// -----------------------------------------------
		// 추가
		// -----------------------------------------------	
		}else if(check == "in"){
			
			if(roomObj.val()=="" && elvObj.val() =="" && hcObj.val() == ""  && optionSelectObj.val()=="" && petObj.val() =="" && parkingObj.val() == "" && optionTypeObj.val()=="" && feeObj.val() =="" && liveInObj.val() == "" && sellObj.val() == ""){
				alert("추가하려는 컬럼값을 입력하세요");
				return;
			}

			if(roomObj.val()!=""){
				roomTableObj.attr("checked", true)
				$('input:checkbox[id="checkRoom"]').val(change_room_cnt).attr("checked", true);  // 선택된 개수 추가 
				$('input:checkbox[id="columnRoom"]').attr("checked", true);
				$('input:checkbox[id="columnCodeRoom"]').attr("checked", true);
				 $('input:checkbox[id="insertRoomtype"]').attr("checked", true).val(roomObj.val());
			}
			if(elvObj.val() !=""){
				elvTableObj.attr("checked", true)
				$('input:checkbox[id="checkElv"]').val(change_elv_cnt).attr("checked", true);
				$('input:checkbox[id="columnElv"]').attr("checked", true)
				$('input:checkbox[id="columnCodeElv"]').attr("checked", true)
				$('input:checkbox[id="insertElvAvailable"]').attr("checked", true).val(elvObj.val());
			}

			if(hcObj.val() != ""){
				hcTableObj.attr("checked", true);
				$('input:checkbox[id="checkHc"]').val(change_Hc_cnt).attr("checked", true);
				$('input:checkbox[id="columnHc"]').attr("checked", true);
				$('input:checkbox[id="columnCodeHc"]').attr("checked", true);
				$('input:checkbox[id="insertHcAvailable"]').attr("checked", true).val(hcObj.val());
			}



			//--------------


			if(optionSelectObj.val() != ""){
				optionSelectTableObj.attr("checked", true);
				$('input:checkbox[id="checkOptionSelect"]').val(change_option_select_cnt).attr("checked", true);
				$('input:checkbox[id="columnOptionSelect"]').attr("checked", true);
				$('input:checkbox[id="columnCodeOptionselect"]').attr("checked", true);
				$('input:checkbox[id="insertOptionSelectType"]').attr("checked", true).val(optionSelectObj.val());
			}
			
			if(petObj.val() != ""){
				petTableObj.attr("checked", true);
				$('input:checkbox[id="checkPet"]').val(change_pet_cnt).attr("checked", true);
				$('input:checkbox[id="columnPet"]').attr("checked", true);
				$('input:checkbox[id="columnCodePet"]').attr("checked", true);
				$('input:checkbox[id="insertPetAvailable"]').attr("checked", true).val(petObj.val());
			}
			
			if(parkingObj.val() != ""){
				parkingTableObj.attr("checked", true);
				$('input:checkbox[id="checkParking"]').val(change_parking_cnt).attr("checked", true);
				$('input:checkbox[id="columnParking"]').attr("checked", true);
				$('input:checkbox[id="columnCodeParking"]').attr("checked", true);
				$('input:checkbox[id="insertParkingAvailable"]').attr("checked", true).val(parkingObj.val());
			}
			
			if(optionTypeObj.val() != ""){
				optionTypeTableObj.attr("checked", true);
				$('input:checkbox[id="checkOptionType"]').val(change_option_type_cnt).attr("checked", true);
				$('input:checkbox[id="columnOptionType"]').attr("checked", true);
				$('input:checkbox[id="columnCodeOptionType"]').attr("checked", true);
				$('input:checkbox[id="insertOptionType"]').attr("checked", true).val(optionTypeObj.val());
			}
			
			if(feeObj.val() != ""){
				feeTableObj.attr("checked", true);
				$('input:checkbox[id="checkFee"]').val(change_fee_cnt).attr("checked", true);
				$('input:checkbox[id="columnFee"]').attr("checked", true);
				$('input:checkbox[id="columnCodeFee"]').attr("checked", true);
				$('input:checkbox[id="insertManageFeeAvailable"]').attr("checked", true).val(feeObj.val());
			}
			
			if(liveInObj.val() != ""){
				liveInTableObj.attr("checked", true);
				$('input:checkbox[id="checkLiveIn"]').val(change_live_in_cnt).attr("checked", true);
				$('input:checkbox[id="columnLiveIn"]').attr("checked", true);
				$('input:checkbox[id="columnCodeLiveIn"]').attr("checked", true);
				$('input:checkbox[id="insertLiveInType"]').attr("checked", true).val(liveInObj.val());
			}
			
			if(sellObj.val() != ""){
				sellTableObj.attr("checked", true);
				$('input:checkbox[id="checkSell"]').val(change_sell_cnt).attr("checked", true);
				$('input:checkbox[id="columnSell"]').attr("checked", true);
				$('input:checkbox[id="columnCodeSell"]').attr("checked", true);
				$('input:checkbox[id="insertSelltype"]').attr("checked", true).val(sellObj.val());
			}

	

			if(roomObj.val()==""){roomObj.attr("checked", false)}
			if(elvObj.val()==""){elvObj.attr("checked", false)}
			if(hcObj.val()==""){hcObj.attr("checked", false)}

			//----------
			
			if(optionSelectObj.val()==""){optionSelectObj.attr("checked", false)}
			if(petObj.val()==""){petObj.attr("checked", false)}
			if(parkingObj.val()==""){parkingObj.attr("checked", false)}
			if(optionTypeObj.val()==""){optionTypeObj.attr("checked", false)}
			if(feeObj.val()==""){feeObj.attr("checked", false)}
			if(liveInObj.val()==""){liveInObj.attr("checked", false)}
			if(sellObj.val()==""){sellObj.attr("checked", false)}

			
			if(confirm("정말 추가하시겠습니까?") ==false){return;}
			/* 	 alert($('[name=roomTypeCode]').serialize()); 
			return;  */

				$.ajax({
					url : "/javaBang/master/allCodeProc.do"
					,type : "post"
					,data : $('[name=roomTypeCode]').serialize() + "&check=" + check
					,success : function(checkRoomCnt){
					
						if(checkRoomCnt>=1){
							alert("추가 성공");
							location.replace("/javaBang/master/sellerCodeForm.do");
						}else if(checkRoomCnt == -2){
							alert("동일한 이름이 존재합니다. 동일한이름으로는 추가할 수 없습니다.");
						}
						else{
							alert("추가 실패 - 관리자에게 문의 바람");
						}
					}
					, error : function(){
						alert("서버 접속 실패");
					}
				});
		}else{
			alert("추가, 수정, 삭제 중에서 한가지를 선택 해 주세요.");
		}
		
			
	}

	
</script>
</head>
<body style="font-size:15pt;font-weight:600">
	<%@include file="/WEB-INF/views/master/aside.jsp"%>
	<div id="right-panel" class="right-panel">
		<header id="header" class="header">
			<div class="top-left">
				<div class="navbar-header">
					<a class="navbar-brand" href="/javaBang/master/homeForm.do">JAVABANG</a>
				</div>
			</div>
		</header>
		
		<div class="breadcrumb"  style="background-color: hsla(230, 17%, 93%, 0);">
			<div class="breadcrumb"  style="width: 1605;height: 80;margin-left: 12;">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>목록 수정</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">목록 수정</a></li>
                                    <li class="active">판매자Code</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	
			<!-- Content -->
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				
				<!--  Traffic  -->
				<div class="row" style="text-align: -webkit-center;">
					<div class="col-lg-12">
						<div class="card">
						<form name="roomTypeCode" method="post"> 
							<div class="card-body"style="background-color: #eaeade;height: 70;">
								<h4 class="box-title">MENU LIST</h4>
							</div>
							<div class="card-body"style="height: 70;">
								<div style="float:right">
									<input type="button" class="btn btn-success"  value=" 추가 " onClick="btn_insert();"style="font-size:15pt;">
			                        <input type="button" class="btn btn-warning"  value=" 수정 " onClick="btn_update();"style="font-size:15pt;">
			                        <input type="button" class="btn btn-danger"  value=" 삭제 " onClick="btn_delete();"style="font-size:15pt;">
		                        </div> 
							</div>
							<div class="row">
								
	
									<div class="col-lg-4">
					                    <div class="card">
					                        <div class="card-header">
					                            <strong class="card-title">CODE_SELL_ROOM_TYPE&nbsp;<input type="checkbox" name="tableName" id="CODE_SELL_ROOM_TYPE" value="CODE_SELL_ROOM_TYPE" style="display:none"></strong>
					                        </div>
					                        <div class="card-body">
					                            <table class="table table-striped" style="text-align: center;font-size:15pt;">
					                            
					                                <thead>
					                                    <tr>
					                                         <th>ROOMTYPE_CODE</th>
				                                            <th>ROOMTYPE</th>    
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                 <c:forEach items="${roomTypeCode}" var="room" varStatus="loopTagStatus">
					                                        <tr>
					                                            <td><center>${room.roomtype_code}</td>
					                                            <td><center>${room.roomtype} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="selectColumn" id="room" value="${room.roomtype}" style="display:none" >
					                                             <input type="text" size="10" name="${room.roomtype}" value="${room.roomtype}" style="display:none" ></td> 
					                                        </tr>
					                                     </c:forEach>	
					                                </tbody>
					                            </table>
					                           &nbsp;&nbsp;<input type="text" size="25" name="insertRoomtype"  style="display:none" placeholder=" 추가 할 컬럼명을 입력하세요." >
			                                	<input type="checkbox" name="insertValue" id="insertRoomtype" value="" style="display:none">
			                                	<br><br>
					                        </div>
					                    </div>
					                </div>
									<!-- 컬럼명 -->
									<input type="checkbox" name="columnName" id="columnRoom" value="ROOMTYPE" style="display:none" >
									<!-- 코드 컬럼명 -->
									<input type="checkbox" name="columnCodeName" id="columnCodeRoom" value="ROOMTYPE_CODE" style="display:none" >
									<!-- 테이블 선택 개수 -->
									<input type="checkbox" name="checkNum" id="checkRoom" value="" style="display:none">
									

											
									<div class="col-lg-4">
					                    <div class="card">
					                        <div class="card-header">
					                            <strong class="card-title">CODE_ELV&nbsp;<input type="checkbox" name="tableName" id="CODE_ELV" value="CODE_ELV" style="display:none"></strong>
					                        </div>
					                        <div class="card-body">
					                            <table class="table table-striped" style="text-align: center;font-size:15pt;"">
					                            
					                                <thead>
					                                     <tr>
					                                            <th>ELV_AVAILABLE_CODE</th>
					                                            <th>ELV_AVAILABLE</th>                                         
					                                        </tr>
					                                </thead>
					                                <tbody>
					                                  <c:forEach items="${ELVCode}" var="elv" varStatus="loopTagStatus">
						                                        <tr>
						                                            <td><center>${elv.ELV_AVAILABLE_CODE}</td>
						                                            <td><center>${elv.ELV_AVAILABLE} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="selectColumn" id="elv" value="${elv.ELV_AVAILABLE}" style="display:none" >
						                                             <input type="text" size="10" name="${elv.ELV_AVAILABLE}" value="${elv.ELV_AVAILABLE}" style="display:none" ></td>
						                                        </tr>
						                                     </c:forEach>	
					                                </tbody>
					                            </table>
					                           &nbsp;&nbsp;<input type="text" size="25" name="insertElvAvailable"  style="display:none" placeholder=" 추가 할 컬럼명을 입력하세요." >
				                                	<input type="checkbox" name="insertValue" id="insertElvAvailable" value="" style="display:none">
			                                	<br><br>
					                        </div>
					                    </div>
					                </div>
										<!-- 컬럼명 -->
									<input type="checkbox" name="columnName" id="columnElv" value="ELV_AVAILABLE" style="display:none" >
									<!-- 코드 컬럼명 -->
									<input type="checkbox" name="columnCodeName" id="columnCodeElv" value="ELV_AVAILABLE_CODE" style="display:none" >
									<!-- 테이블 선택 개수 -->
									<input type="checkbox" name="checkNum"  id="checkElv" value="" style="display:none">
									
								
									<div class="col-lg-4">
					                    <div class="card">
					                        <div class="card-header">
					                            <strong class="card-title">CODE_HC_TYPE &nbsp;<input type="checkbox" name="tableName" id="CODE_HC_TYPE" value="CODE_HC_TYPE" style="display:none"></strong>
					                        </div>
					                        <div class="card-body">
					                            <table class="table table-striped" style="text-align: center;font-size:15pt;"">
					                            
					                                <thead>
					                                     <tr>
				                                            <th>HC_TYPE_CODE</th>
				                                            <th>HC_TYPE</th>                                         
				                                        </tr>
					                                </thead>
					                                <tbody>
					                                  <c:forEach items="${hcTypeCode}" var="hc" varStatus="loopTagStatus">
						                                        <tr>
						                                            <td><center>${hc.HC_TYPE_CODE}</td>
						                                            <td><center>${hc.HC_TYPE} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="selectColumn" id="hc" value="${hc.HC_TYPE}" style="display:none" >
						                                             <input type="text" size="10" name="${hc.HC_TYPE}" value="${hc.HC_TYPE}" style="display:none" ></td>
						                                        </tr>
						                                     </c:forEach>
					                                </tbody>
					                            </table>
					                          &nbsp;&nbsp;<input type="text" size="25" name="insertHcAvailable"  style="display:none" placeholder=" 추가 할 컬럼명을 입력하세요."  >
				                                	<input type="checkbox" name="insertValue" id="insertHcAvailable" value="" style="display:none">
			                                	<br><br>
					                        </div>
					                    </div>
					                </div>
											<!-- 컬럼명 -->
									<input type="checkbox" name="columnName" id="columnHc" value="HC_TYPE" style="display:none" >
									<!-- 코드 컬럼명 -->
									<input type="checkbox" name="columnCodeName" id="columnCodeHc" value="HC_TYPE_CODE" style="display:none" >
									<!-- 테이블 선택 개수 -->
									<input type="checkbox" name="checkNum"  id="checkHc" value="" style="display:none">
									
									
									<!-- ################################################################################################# -->
									<!-- ################################################################################################# -->
									<!-- ################################################################################################# -->

									
									<div class="col-lg-4">
					                    <div class="card">
					                        <div class="card-header">
					                            <strong class="card-title">CODE_PET_AVAILABILITY&nbsp;<input type="checkbox" name="tableName" id="CODE_PET_AVAILABILITY" value="CODE_PET_AVAILABILITY" style="display:none"></strong>
					                        </div>
					                        <div class="card-body">
					                            <table class="table table-striped" style="text-align: center;font-size:15pt;"">
					                            
					                                <thead>
					                                      <tr>
					                                            <th>PET_AVAILABLE_CODE</th>
					                                            <th>PET_AVAILABLE</th>                                          
					                                        </tr>
					                                </thead>
					                                <tbody>
					                                  <c:forEach items="${petCode}" var="pet" varStatus="loopTagStatus">
						                                        <tr>
						                                            <td><center>${pet.PET_AVAILABLE_CODE}</td>
						                                            <td><center>${pet.PET_AVAILABLE}  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="selectColumn" id="pet" value="${pet.PET_AVAILABLE}" style="display:none" >
						                                             <input type="text" size="10" name="${pet.PET_AVAILABLE}" value="${pet.PET_AVAILABLE}" style="display:none" ></td>
						                                        </tr>
						                                     </c:forEach>
					                                </tbody>
					                            </table>
					                        	 &nbsp;&nbsp;<input type="text" size="25" name="insertPetAvailable"  style="display:none" placeholder=" 추가 할 컬럼명을 입력하세요." >
				                                	<input type="checkbox" name="insertValue" id="insertPetAvailable" value="" style="display:none">
			                                	<br><br>
					                        </div>
					                    </div>
					                </div>
									<!-- 컬럼명 -->
									<input type="checkbox" name="columnName" id="columnPet" value="PET_AVAILABLE" style="display:none" >
									<!-- 코드 컬럼명 -->
									<input type="checkbox" name="columnCodeName" id="columnCodePet" value="PET_AVAILABLE_CODE" style="display:none" >
									<!-- 테이블 선택 개수 -->
									<input type="checkbox" name="checkNum"  id="checkPet" value="" style="display:none">
									
									
									<div class="col-lg-4">
					                    <div class="card">
					                        <div class="card-header">
					                            <strong class="card-title">CODE_PARKING_AVAILABILITY&nbsp;<input type="checkbox" name="tableName" id="CODE_PARKING_AVAILABILITY" value="CODE_PARKING_AVAILABILITY" style="display:none"></strong>
					                        </div>
					                        <div class="card-body">
					                            <table class="table table-striped" style="text-align: center;">
					                            
					                                <thead>
					                                      <tr>
				                                             <th>PARKING_AVAILABLE_CODE</th>
				                                             <th>PARKING_AVAILABLE</th>                                          
					                                        </tr>
					                                </thead>
					                                <tbody>
					                                <c:forEach items="${parkingCode}" var="parking" varStatus="loopTagStatus">
						                                        <tr>
						                                            <td><center>${parking.PARKING_AVAILABLE_CODE}</td>
						                                            <td><center>${parking.PARKING_AVAILABLE} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="selectColumn" id="parking" value="${parking.PARKING_AVAILABLE}" style="display:none" >
						                                             <input type="text" size="10" name="${parking.PARKING_AVAILABLE}" value="${parking.PARKING_AVAILABLE}" style="display:none" ></td>
						                                        </tr>
						                             </c:forEach>
					                                </tbody>
					                            </table>
					                        	 &nbsp;&nbsp;<input type="text" size="25" name="insertParkingAvailable"  style="display:none" placeholder=" 추가 할 컬럼명을 입력하세요." >
				                                	<input type="checkbox" name="insertValue" id="insertParkingAvailable" value="" style="display:none">
			                                	<br><br>
					                        </div>
					                    </div>
					                </div>
									<!-- 컬럼명 -->
									<input type="checkbox" name="columnName" id="columnParking" value="PARKING_AVAILABLE" style="display:none" >
									<!-- 코드 컬럼명 -->
									<input type="checkbox" name="columnCodeName" id="columnCodeParking" value="PARKING_AVAILABLE_CODE" style="display:none" >
									<!-- 테이블 선택 개수 -->
									<input type="checkbox" name="checkNum"  id="checkParking" value="" style="display:none">
									
									
									<div class="col-lg-4">
					                    <div class="card">
					                        <div class="card-header">
					                            <strong class="card-title">CODE_OPTION_TYPE&nbsp;<input type="checkbox" name="tableName" id="CODE_OPTION_TYPE" value="CODE_OPTION_TYPE" style="display:none"></strong>
					                        </div>
					                        <div class="card-body">
					                            <table class="table table-striped" style="text-align: center;font-size:15pt;"">
					                            
					                                <thead>
					                                      <tr>
				                                              <th>OPTION_TYPE_CODE</th>
					                                          <th>OPTION_TYPE</th>                                          
					                                        </tr>
					                                </thead>
					                                <tbody>
					                                <c:forEach items="${optionTypeCode}" var="type" varStatus="loopTagStatus">
						                                        <tr>
						                                            <td><center>${type.OPTION_TYPE_CODE}</td>
						                                            <td><center>${type.OPTION_TYPE} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="selectColumn" id="type" value="${type.OPTION_TYPE}" style="display:none" >
						                                             <input type="text" size="10" name="${type.OPTION_TYPE}" value="${type.OPTION_TYPE}" style="display:none" ></td>
						                                        </tr>
						                            </c:forEach>   
					                                </tbody>
					                            </table>
					                        	 &nbsp;&nbsp;<input type="text" size="25" name="insertOptionType"  style="display:none" placeholder=" 추가 할 컬럼명을 입력하세요." >
				                                	<input type="checkbox" name="insertValue" id="insertOptionType" value="" style="display:none">
			                                	<br><br>
					                        </div>
					                    </div>
					                </div>
									<!-- 컬럼명 -->
									<input type="checkbox" name="columnName" id="columnOptionType" value="OPTION_TYPE" style="display:none" >
									<!-- 코드 컬럼명 -->
									<input type="checkbox" name="columnCodeName" id="columnCodeOptionType" value="OPTION_TYPE_CODE" style="display:none" >
									<!-- 테이블 선택 개수 -->
									<input type="checkbox" name="checkNum"  id="checkOptionType" value="" style="display:none">
									
									
									
									<div class="col-lg-4">
					                    <div class="card">
					                        <div class="card-header">
					                            <strong class="card-title">CODE_MANAGE_FEE&nbsp;<input type="checkbox" name="tableName" id="CODE_MANAGE_FEE" value="CODE_MANAGE_FEE" style="display:none"></strong>
					                        </div>
					                        <div class="card-body">
					                            <table class="table table-striped" style="text-align: center;">
					                            
					                                <thead>
					                                      <tr>
				                                             	 <th>MANAGE_FEE_AVAILABLE_CODE</th>
					                                            <th>MANAGE_FEE_AVAILABLE</th>                                          
				                                        </tr>
					                                </thead>
					                                <tbody>
					                                <c:forEach items="${feeCode}" var="fee" varStatus="loopTagStatus">
						                                        <tr>
						                                            <td><center>${fee.MANAGE_FEE_AVAILABLE_CODE}</td>
						                                            <td><center>${fee.MANAGE_FEE_AVAILABLE}  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="selectColumn" id="fee" value="${fee.MANAGE_FEE_AVAILABLE}" style="display:none" >
						                                             <input type="text" size="10" name="${fee.MANAGE_FEE_AVAILABLE}" value="${fee.MANAGE_FEE_AVAILABLE}" style="display:none" ></td>
						                                        </tr>
				                                     </c:forEach>					                                  
					                                </tbody>
					                            </table>
					                        	 &nbsp;&nbsp;<input type="text" size="25" name="insertManageFeeAvailable"  style="display:none" placeholder=" 추가 할 컬럼명을 입력하세요." >
				                                	<input type="checkbox" name="insertValue" id="insertManageFeeAvailable" value="" style="display:none">
			                                	<br><br>
					                        </div>
					                    </div>
					                </div>
									<!-- 컬럼명 -->
									<input type="checkbox" name="columnName" id="columnFee" value="MANAGE_FEE_AVAILABLE" style="display:none" >
									<!-- 코드 컬럼명 -->
									<input type="checkbox" name="columnCodeName" id="columnCodeFee" value="MANAGE_FEE_AVAILABLE_CODE" style="display:none" >
									<!-- 테이블 선택 개수 -->
									<input type="checkbox" name="checkNum"  id="checkFee" value="" style="display:none">
									
									
									<div class="col-lg-4">
					                    <div class="card">
					                        <div class="card-header">
					                            <strong class="card-title">CODE_LIVE_IN_TYPE&nbsp;<input type="checkbox" name="tableName" id="CODE_LIVE_IN_TYPE" value="CODE_LIVE_IN_TYPE" style="display:none"></strong>
					                        </div>
					                        <div class="card-body">
					                            <table class="table table-striped" style="text-align: center;font-size:15pt;"">
					                            
					                                <thead>
					                                      <tr>
				                                             	<th>LIVE_IN_TYPE_CODE</th>
					                                            <th>LIVE_IN_TYPE</th>                                           
				                                        </tr>
					                                </thead>
					                                <tbody>
					                                <c:forEach items="${liveInCode}" var="livein" varStatus="loopTagStatus">
						                                        <tr>
						                                            <td><center>${livein.LIVE_IN_TYPE_CODE}</td>
						                                            <td><center>${livein.LIVE_IN_TYPE} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="selectColumn" id="livein" value="${livein.LIVE_IN_TYPE}" style="display:none" >
						                                             <input type="text" size="10" name="${livein.LIVE_IN_TYPE}" value="${livein.LIVE_IN_TYPE}" style="display:none" ></td>
						                                        </tr>
			                                        </c:forEach>					                                				                                  
					                                </tbody>
					                            </table>
					                        	 &nbsp;&nbsp;<input type="text" size="25" name="insertLiveInType"  style="display:none" placeholder=" 추가 할 컬럼명을 입력하세요." >
				                                	<input type="checkbox" name="insertValue" id="insertLiveInType" value="" style="display:none">
			                                	<br><br>
					                        </div>
					                    </div>
					                </div>
					                <!-- 컬럼명 -->
									<input type="checkbox" name="columnName" id="columnLiveIn" value="LIVE_IN_TYPE" style="display:none" >
									<!-- 코드 컬럼명 -->
									<input type="checkbox" name="columnCodeName" id="columnCodeLiveIn" value="LIVE_IN_TYPE_CODE" style="display:none" >
									<!-- 테이블 선택 개수 -->
									<input type="checkbox" name="checkNum"  id="checkLiveIn" value="" style="display:none">
									
									
									<div class="col-lg-4">
					                    <div class="card">
					                        <div class="card-header">
					                            <strong class="card-title">CODE_SELL_TYPE&nbsp;<input type="checkbox" name="tableName" id="CODE_SELL_TYPE" value="CODE_SELL_TYPE" style="display:none"></strong>
					                        </div>
					                        <div class="card-body">
					                            <table class="table table-striped" style="text-align: center;font-size:15pt;"">
					                            
					                                <thead>
					                                      <tr>
				                                             	<th>SELL_TYPE_CODE</th>
					                                            <th>SELL_TYPE</th>                                            
				                                        </tr>
					                                </thead>
					                                <tbody>
					                                <c:forEach items="${sellCode}" var="sell" varStatus="loopTagStatus">
						                                        <tr>
						                                            <td><center>${sell.SELL_TYPE_CODE}</td>
						                                            <td><center>${sell.SELL_TYPE} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="selectColumn" id="sell" value="${sell.SELL_TYPE}" style="display:none" >
						                                             <input type="text" size="10" name="${sell.SELL_TYPE}" value="${sell.SELL_TYPE}" style="display:none" ></td>
						                                        </tr>
						                            </c:forEach>				                                				                                  
					                                </tbody>
					                            </table>
					                        	 &nbsp;&nbsp;<input type="text" size="25" name="insertSelltype"  style="display:none" placeholder=" 추가 할 컬럼명을 입력하세요." >
				                                	<input type="checkbox" name="insertValue" id="insertSelltype" value="" style="display:none">
			                                	<br><br>
					                        </div>
					                    </div>
					                </div>
					                <!-- 컬럼명 -->
									<input type="checkbox" name="columnName" id="columnSell" value="SELL_TYPE" style="display:none" >
									<!-- 코드 컬럼명 -->
									<input type="checkbox" name="columnCodeName" id="columnCodeSell" value="SELL_TYPE_CODE" style="display:none" >
									<!-- 테이블 선택 개수 -->
									<input type="checkbox" name="checkNum"  id="checkSell" value="" style="display:none">
									
									
									<div class="col-lg-4">
					                    <div class="card">
					                        <div class="card-header">
					                            <strong class="card-title">CODE_OPTION_SELECT_TYPE&nbsp;<input type="checkbox" name="tableName" id="CODE_OPTION_SELECT_TYPE" value="CODE_OPTION_SELECT_TYPE" style="display:none"></strong>
					                        </div>
					                        <div class="card-body">
					                            <table class="table table-striped" style="text-align: center;font-size:15pt;"">
					                            
					                                <thead>
					                                      <tr>
					                                            <th>OPTION_SELECT_CODE</th>
					                                            <th>OPTION_SELECT_TYPE</th>                                         
					                                        </tr>
					                                </thead>
					                                <tbody>
					                                  <c:forEach items="${optionSelectCode}" var="selectoption" varStatus="loopTagStatus">
						                                        <tr>
						                                            <td><center>${selectoption.OPTION_SELECT_CODE}</td>
						                                            <td><center>${selectoption.OPTION_SELECT_TYPE} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="selectColumn" id="selectoption" value="${selectoption.OPTION_SELECT_TYPE}" style="display:none" >
						                                             <input type="text" size="10" name="${selectoption.OPTION_SELECT_TYPE}" value="${selectoption.OPTION_SELECT_TYPE}" style="display:none" ></td>
						                                        </tr>
						                                     </c:forEach>
					                                </tbody>
					                            </table>
					                        	 &nbsp;&nbsp;<input type="text" size="25" name="insertOptionSelectType"  style="display:none" placeholder=" 추가 할 컬럼명을 입력하세요." >
				                                	<input type="checkbox" name="insertValue" id="insertOptionSelectType" value="" style="display:none">
			                                	<br><br>
					                        </div>
					                    </div>
					                </div>
									<!-- 컬럼명 -->
									<input type="checkbox" name="columnName" id="columnOptionSelect" value="OPTION_SELECT_TYPE" style="display:none" >
									<!-- 코드 컬럼명 -->
									<input type="checkbox" name="columnCodeName" id="columnCodeOptionselect" value="OPTION_SELECT_CODE" style="display:none" >
									<!-- 테이블 선택 개수 -->
									<input type="checkbox" name="checkNum"  id="checkOptionSelect" value="" style="display:none">
									
							</div>
							<!-- /.row -->
							<div class="card-body"></div>
							</form>
							
						</div>
						<div>
									<input type="button"  class="btn btn-info btn-lg" value=" 적용 " onClick="changeCodeTable()" style="font-size:15pt;"">
		                    </div> 
					</div>
					<!— /# column —>
				</div>
				<!—  /Traffic —>
				<div class="clearfix"></div>

			</div>


			<!— /#add-category —>
		</div>
		<!— .animated —>
	</div>
	<!— /.content —>

</body>
</html>