<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- ########################################################## -->
<!-- 마스터 화면  -> 설정 -> 유저 접속 관리 made by kbs-->
<!-- ########################################################## -->

<script src="/javaBang/resources/jquery-1.11.0.min.js"
	type="text/javascript"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- jsp페이지에서 사용할 사용자 저의 태그인 spring폼 태그 선언 -->
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en">

<head>
<meta charset="utf-8">
<title>JAVABANG</title>


<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="javaBang/resources/radio/radio.css">
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<!-- <link rel="stylesheet"	href="/javaBang/resources/assets/css/cs-skin-elastic.css"> -->
<link rel="stylesheet" href="/javaBang/resources/assets/css/style.css">
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<link	href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css"	rel="stylesheet">
<link	href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css"	rel="stylesheet">

<link	href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css"	rel="stylesheet" />
<link	href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css"	rel="stylesheet" />

<script	src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="/javaBang/resources/assets/js/main.js"></script>


<!-- 달력 관련  -->
<link rel="stylesheet"	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"	type="text/css" />
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
	$(document).ready(
					function() {
						var radioObj = $("input:radio[name='checkCode']:radio[value='${checkCode}']");
						//alert($("input:radio[name='checkCode']:radio[value='${checkCode}']").val());
						if ($("input:radio[name='checkCode']:radio[value='${checkCode}']").val() == "Y") {
							radioObj.attr("checked", true);
						} else {
							radioObj.attr("checked", true);
						}

						// 달력 관련 -------------------------------------------------
						$.datepicker.setDefaults($.datepicker.regional['ko']);
						$("#startDate").datepicker(
								{
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
								//	maxDate : 30, // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
									minDate : 0,
									onClose : function(selectedDate) {
										//시작일(startDate) datepicker가 닫힐때
										//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
										$("#endDate").datepicker("option",
												"minDate", selectedDate);
									}

								});
						$("#endDate").datepicker(
								{
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
							//		maxDate : 29, // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
									minDate : 0,
									onClose : function(selectedDate) {
										// 종료일(endDate) datepicker가 닫힐때
										// 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
										$("#startDate").datepicker("option",
												"maxDate", selectedDate);
									}

								});


						
						 var stopObj = $("input[name=checkService]")
						 var stopService = ["${stopValueList[0].buyer}","${stopValueList[0].seller}","${stopValueList[0].rental}","${stopValueList[0].realtor}"]
						 var cnt = 0;

						var stopNoneObj =  $("#stopNone")
						 
						 var checkBuyerObj  = $("#checkBuyer")
						 var checkSellerObj = $("#checkSeller")
						 var checkRentalObj = $("#checkRental")
						 var checkRealtorObj = $("#checkRealtor")
						 
						 var stopBuyerObj = $("#stopBuyer")
						 var stopSellerObj = $("#stopSeller")
						 var stopRentalObj = $("#stopRental")
						 var stopRealtorObj = $("#stopRealtor")
						 
						 var checkBuyerDivObj = $("#checkBuyer_div");
					 	 var checkSellerDivObj = $("#checkSeller_div");
					 	 var checkRentalDivObj = $("#checkRental_div");
					 	 var checkRealtorDivObj = $("#checkRealtor_div");
						 
				
						 
						if(stopService[0] == 'true'){		
							//checkBuyerObj.hide();	
							checkBuyerDivObj.hide();
							stopNoneObj.hide();	
							 stopBuyerObj.show();	
							 cnt++;
						}
			 			 if(stopService[1] == 'true'){
			 				//checkSellerObj.hide();	
			 				checkSellerDivObj.hide();
			 				stopNoneObj.hide();	
			 				stopSellerObj.show();	
							 cnt++;	
						}
						if(stopService[2] == 'true'){
							//checkRentalObj.hide();	
							checkRentalDivObj.hide();
							stopNoneObj.hide();
							stopRentalObj.show();	
							 cnt++;	
						}
						if(stopService[3] == 'true'){
							//checkRealtorObj.hide();	
							checkRealtorDivObj.hide();
							stopNoneObj.hide();
							stopRealtorObj.show();	
							 cnt++;	
						} 
						
						if(cnt == 0){
							$('#checkAll_div').show();
							stopNoneObj.show();
							checkBuyerObj.show();
							checkSellerObj.show();
							checkRentalObj.show();
							checkRealtorObj.show();	
							 	
							stopBuyerObj.hide();
							stopSellerObj.hide();
							stopRentalObj.hide();
							stopRealtorObj.hide();	
						}else{
							$('#checkAll_div').hide();
							//$('#checkAllLabel').hide();
						}

						
					});

	function checkToggle() {

		if (confirm("적용 하시겠습니까?") == false) {
			return;
		}

		$.ajax({
			url : "/javaBang/master/checkingProc.do",
			type : "post",
			data : $('[name=checkingToggle]').serialize(),
			success : function(checkingCnt) {

				if (checkingCnt == 1) {
					alert("적용 성공");
					location.replace("/javaBang/master/checkingForm.do");
				} else {
					alert("적용 실패 - 관리자에게 문의 바람");
				}
			},
			error : function() {
				alert("서버 접속 실패");
			}
		});

	}

	function stopService(){

		var checkValue = [];

		if($("input[name='checkService']:checked").val() == 'all'){
			checkValue = ['buyer', 'seller', 'rental', 'realtor'];
		}else{
			$("input[name='checkService']:checked").each(function(i){
				checkValue.push($(this).val());
				
			});
		}
		

		if(checkValue.length == 0){ alert("한개 이상 체크하세요.");  return;}
		
		if (confirm("적용 하시겠습니까?") == false) {
			return;
		}

		var checkObj = {
					'checkValue' : checkValue
				}
		
		$.ajax({
			url : "/javaBang/master/stoppingProc.do",
			type : "post",
			data : checkObj,
			success : function(checkingCnt) {

				if (checkingCnt == 1) {
					alert("적용 성공");
					location.replace("/javaBang/master/checkingForm.do");
				} else {
					alert("적용 실패 - 관리자에게 문의 바람");
				}
			},
			error : function() {
				alert("서버 접속 실패");
			}
		});
		

	}



	function checkAll(){

	      if( $("input[name=checkServiceAll]").is(':checked') ){
	    	  $("input[name=checkService]").prop("checked", false);
	      }else{
	    	  $("input[name=checkService]").prop("checked", true);
	        
	      }
	}


	function cancelStop(cancelValue){

		if (confirm("취소 하시겠습니까?") == false) {
			return;
		} 
		
		var cancelObj = {
					"cancelValue" : cancelValue
				}
		
		$.ajax({
			url : "/javaBang/master/cancelProc.do",
			type : "post",
			data : cancelObj,
			success : function(checkingCnt) {

				if (checkingCnt == 1) {
					alert("적용 성공");
					location.replace("/javaBang/master/checkingForm.do");
				} else {
					alert("적용 실패 - 관리자에게 문의 바람");
				}
			},
			error : function() {
				alert("서버 접속 실패");
			}
		});

	}


	
</script>
</head>
<body style="font-size:15pt;">
	<%@include file="/WEB-INF/views/master/aside.jsp"%>

	<div id="right-panel" class="right-panel">

		<!-- Header-->
		<header id="header" class="header">
			<div class="top-left">
				<div class="navbar-header">
					<a class="navbar-brand" href="/javaBang/master/homeForm.do">JAVABANG</a>
					<!-- <a class="navbar-brand hidden" href="./"><img
						src="images/logo2.png" alt="Logo"></a> <a id="menuToggle"
						class="menutoggle"><i class="fa fa-bars"></i></a> -->
				</div>
			</div>
		</header>
		<!-- /header -->
		<!-- Header-->

		<div class="breadcrumb"  style="background-color: hsla(230, 17%, 93%, 0);">
			<div class="breadcrumb"  style="width: 1605;height: 80;margin-left: 12;">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>설정</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">설정</a></li>
                                    <li class="active">유저접속관리</li>
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
							<div class="card-body"style="background-color: #eaeade;">
								<h4 class="box-title" style="font-size:20pt;">점검모드</h4>
							</div>

							<form name="checkingToggle" method="post" style="margin:auto;margin-bottom: 45;">
									<div class="row" style="font-size: large;float">
										<div class="card bg-light m-3" style="max-width: 18rem;"> 
											<div class="card-header"><b>ON / OFF</b></div> 
												<div class="card-body" style="padding:30px;"> 
													<div  class="custom-control custom-radio">
															<input type="radio" class="custom-control-input"  id="customRadio1"  name="checkCode"  value="Y"> 
																<label class="custom-control-label" for="customRadio1">사용자 차단</label>
													</div>
													<div  class="custom-control custom-radio">
															<input type="radio"  class="custom-control-input" id="customRadio2"  name="checkCode"  value="N"> 
																<label class="custom-control-label" for="customRadio2">사용자 차단 해제</label>
													</div>
												</div>
											</div>
										 <div class="card bg-light m-3" style="max-width: 18rem;"> 
											<div class="card-header"><b>점검 시작 ~ 끝 날짜 선택</b></div> 
												<div class="card-body" style="padding:30px;"> 
													<p><input type="text" id="startDate" name="startDate" size="15" readonly style="font-size:15pt;">부터 ~ </p>
													<p><input type="text" id="endDate" name="endDate" size="15" readonly style="font-size:15pt;">까지</p>
												</div>
										 </div>
										 <div class="card bg-light m-3"> 
											<div class="card-header"><b>점검 페이지에 보일 메시지</b></div> 
												<div class="card-body" style="padding:30px;"> 
													<p><input type='text'  name="inputMsg" size="50" style="font-size:15pt;"></p>
												</div>
										 </div>
									 </div>
							</form>
						
					</div>
					<!-- /# column -->
					<input type="button" class="btn btn-info btn-lg" value=" 적용 " onClick="checkToggle()" style="font-size:15pt;">
					<br><br>
					
				</div>
				<!--  /Traffic -->


				<div class="clearfix"></div>

			</div>

			

			<div class="row" style="text-align: -webkit-center;">
					<div class="col-lg-12">
						<div class="card" style="font-size: x-large;">
							<div class="card-body"style="background-color: #eaeade;">
								<h4 class="box-title" style="font-size:20pt;">긴급 중단</h4> 
							</div>

							<form name="emergencyMode" method="post" style="margin:auto;margin-bottom: 45;">
								<div class="card-body"></div>
									<div class="row">
										<div class="card bg-light m-3" style="max-width: 18rem;"> 
											<div class="card-header"><b>중지할 서비스</b></div> 
												<div class="card-body" style="padding:30px;"> 
													<div class="custom-control custom-checkbox" id="checkAll_div">
															<input type="checkbox" class="custom-control-input" id="checkAll"  name="checkServiceAll"  value="all" > 
																<label class="custom-control-label" for="checkAll" id="checkAllLabel" onclick="checkAll();">전체 선택</label>
													</div>
													<div class="custom-control custom-checkbox" id="checkBuyer_div">
															<input type="checkbox"  class="custom-control-input" id="checkBuyer" name="checkService"  value="buyer"> 
																<label class="custom-control-label"  for="checkBuyer" id="checkBuyer_label">구해방</label>
													</div>
													<div class="custom-control custom-checkbox" id="checkSeller_div">
															<input type="checkbox"  class="custom-control-input"  id="checkSeller"  name="checkService"  value="seller"> 
																<label class="custom-control-label" for="checkSeller" id="checkSeller_label">팔아방</label>
													</div>
													<div class="custom-control custom-checkbox" id="checkRental_div">
															<input type="checkbox" class="custom-control-input"  id="checkRental"   name="checkService"  value="rental"> 
																<label class="custom-control-label" for="checkRental" id="checkRental_label">렌탈업체등록</label>
													</div>
													<div class="custom-control custom-checkbox" id="checkRealtor_div">
															<input type="checkbox" class="custom-control-input"  id="checkRealtor"   name="checkService"  value="realtor"> 
																<label class="custom-control-label" for="checkRealtor" id="checkRealtor_label">공인중개사</label>
													</div>
											</div>
										 </div>
										 <div class="card bg-light m-3" style="max-width: 18rem;"> 
											<div class="card-header"><b>중지한 서비스</b></div> 
												<div class="card-body" style="padding:30px;"> 
													
														<p id="stopNone" style="color:#333;">중지한 서비스가 없습니다.</p>
													<div class="form-check">
														<p style="display:none" id="stopBuyer">구해방 &nbsp;&nbsp;<input type="button" value="취소" onClick="cancelStop('buyer')" ></p>
														<p style="display:none" id="stopSeller">팔아방 &nbsp;&nbsp;<input type="button" value="취소"  onClick="cancelStop('seller')"></p>
														<p style="display:none" id="stopRental">렌탈업체등록 &nbsp;&nbsp;<input type="button" value="취소"  onClick="cancelStop('rental')"></p>
														<p style="display:none" id="stopRealtor">공인중개사 &nbsp;&nbsp;<input type="button" value="취소"  onClick="cancelStop('realtor')"></p>
														
												</div>
										 </div>
	<!-- 									 <div class="card bg-light m-3"> 
											<div class="card-header"><b>점검 페이지에 보일 메시지</b></div> 
												<div class="card-body" style="padding:30px;"> 
													<p><input type='text'  name="inputMsg" size="50"></p>
												</div>
										 </div> -->
								</div>
							</form>
						
					</div>
					<!-- /# column -->
					
				</div>
				<input type="button" class="btn btn-info btn-lg" value=" 적용 " onClick="stopService()">
				<!--  /Traffic -->


				<div class="clearfix"></div>

			</div>
			
			
			<!-- /#add-category -->
		</div>
		<!-- .animated -->
	</div>
	<!-- /.content -->





</body>

</html>
