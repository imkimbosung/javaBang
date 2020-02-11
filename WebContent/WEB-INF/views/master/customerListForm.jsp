<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- ########################################################## -->
<!-- 마스터 화면  -> 구매자 리스트 및 그래프 구현 화면 made by kbs-->
<!-- ########################################################## -->
<style>
	#loading {
		 width: 100%;
		 height: 100%;
		 top: 0px;
		 left: 0px;
		 position: fixed;
		 display: block;
		 background-color: #fff;
		 z-index: 99;
		 text-align: center; 
	}
	#loading-image {
		position: absolute;
		 top: 30%;
		 left: 40%;
		 z-index: 100; 
	}
	div.dt-buttons {
	position: relative;
    float: right;
}
</style>

<div id="loading"><img id="loading-image" src="/javaBang/resources/images/loading.gif" alt="Loading..." /></div>

<script src="/javaBang/resources/jquery-1.11.0.min.js"
	type="text/javascript"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(window).load(function() {
	    $('#loading').fadeOut(1500);
	  });
</script>
     
<script src="/javaBang/resources/common.js" type="text/javascript"></script>
<!-- jsp페이지에서 사용할 사용자 저의 태그인 spring폼 태그 선언 -->
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Master - 고객현황</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- UI 담당 -->
 <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css"> 
 <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"> 
	
	<!-- 왼쪽 바 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css"> -->
<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css"> -->
<!-- <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css"> -->
<!-- <link rel="stylesheet"
	href="/javaBang/resources/assets/css/cs-skin-elastic.css"> -->
<!-- <link rel="stylesheet"
	href="/javaBang/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css"> -->
	
	<!-- !!! 매우중요 전체적인 UI -->
<link rel="stylesheet" href="/javaBang/resources/assets/css/style.css">

<!-- <link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'> -->

<!-- 화면 비율 맞춰주는 것  -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

 
    



	<script src="/javaBang/resources/assets/js/lib/data-table/datatables.min.js"></script>
    <script src="/javaBang/resources/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
    
 
  
    <script src="/javaBang/resources/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="/javaBang/resources/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="/javaBang/resources/assets/js/lib/data-table/jszip.min.js"></script>
    <script src="/javaBang/resources/assets/js/lib/data-table/vfs_fonts.js"></script>
    <script src="/javaBang/resources/assets/js/lib/data-table/buttons.html5.min.js"></script>
    <script src="/javaBang/resources/assets/js/lib/data-table/buttons.print.min.js"></script>
    <script src="/javaBang/resources/assets/js/lib/data-table/buttons.colVis.min.js"></script>
    <script src="/javaBang/resources/assets/js/init/datatables-init.js"></script>
    
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">

    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>

<!--     <script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
 -->


    <!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script> -->
    
         <!-- 달력 관련  -->
  <!-- <link rel="stylesheet"	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"	type="text/css" />
        <script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> -->
    
    
    <link rel="stylesheet" href="/javaBang/resources/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/style.css">

<script>

	



$(document).ready(function(){
	 $(".stopVal").hide(); 
	 $(".stopping").hide();
	 
	 
	 /*  $(".table").dataTable().fnDestroy();*/
	 $(".table").dataTable({"language": {
			"emptyTable": "데이터없음",
			"lengthMenu": "페이지당 _MENU_ 개씩 보기",
			"info": "현재 _START_ - _END_ / _TOTAL_건",
			"infoEmpty": "데이터 없음",
			"infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
			"search": "검색: ",
			"zeroRecords": "일치하는 데이터가 없어요.",
			"loadingRecords": "로딩중...",
			"processing":     "잠시만 기다려 주세요...",
			"paginate": {
			"next": "다음",
			"previous": "이전"
			}},
			dom: 'Blfrtip',
	        buttons: [{
	            extend: 'excelHtml5',
	            text: 'excel 파일 다운',
	            footer: true,
	            className: 'Btn-info',
    	        title: 'customerList'
	        }]
		}) 
		
	
		
		

		var allRoomctx = document.getElementById("allRoomChart");
		var allRoomChart = new Chart(allRoomctx, {
		    type: 'horizontalBar',
		    data: {
		        labels: ["전체 고객", "구매자", "판매자", "공인중개사","렌트업체수"],
		        datasets: [{
		            label: '고객수 ',
		            data: ["${masterCustomerGraph[0].clientCount}",  "${masterCustomerGraph[0].buyerCnt}","${masterCustomerGraph[0].sellerCnt}", "${masterCustomerGraph[0].realtorCnt}","${masterCustomerGraph[0].rentalCnt}"],
		            backgroundColor: [
		                'rgba(255, 99, 132, 0.8)',
		                'rgba(54, 162, 235, 0.8)',
		                'rgba(255, 206, 86, 0.8)',
		                'rgba(75, 192, 192, 0.8)',
		                'rgba(255, 153, 000, 0.8)'
		            ],
		            borderColor: [
		                'rgba(255,99,132,1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(255, 153, 000, 1)'
		            ],
		            borderWidth: 1
		        }]
		    },
		    options: {
		        scales: {
		            yAxes: [{
		                ticks: {
		                    beginAtZero:false,
		                    fontSize: 20,
		                    fontStyle:'bold'
		                }
		            }],
		            xAxes: [{
			            ticks: {
			                fontSize: 20,
			                fontStyle:'bold'
			            }
		        }]
		    },
	        legend: {
	            labels: {
	                fontSize:20,
	                fontStyle:'bold'
	            }
	        }	
		}
		});

		var signUprootOfRealtor = []
		var signUprootOfRealtorCnt = []
		var signUprootOfRealtorColor = 
			[ '#92C53E',
                '#21A4F3',
                '#FFABAB',
                '#8890D7',
                '#85CED6',
                '#C85B5B']
		<c:forEach items="${getSignUpRoot}" var="data">				
			signUprootOfRealtor.push("${data.route_code}");
			signUprootOfRealtorCnt.push("${data.route_codeCnt}");
			var getRandom = getRandomRgb();
			//signUprootOfRealtorColor.push(getRandom + ',' + 0.2 + ')');
			//regionOfRealtorBorderColor.push(getRandom + ',' + 1 + ')')
		</c:forEach>
	  	
	  		new Chart(
	  		  		document.getElementById("chartjs-5")
	  		  		,{
	  	  		  		"type":"polarArea"
	  	  	  		  	,"data":
	  	  	  	  		  	{"labels": signUprootOfRealtor
			  	  	  		  	,"datasets":
			  	  	  	  		  	[{
				  	  	  	  		  	"label":
			  	  	  	  	  		  		"My First Dataset"
			  	  	  	  	  		  	,"data": signUprootOfRealtorCnt
				  	  	  	  		  	,"backgroundColor": signUprootOfRealtorColor
					  	  	  	  		  	
			  	  	  	  		  	}]
				  	  		}
		  	  		,options: {
			  	  		 legend: {
	                         display: true,
	                         position: 'top',
	                         labels: {
	                                 fontSize: 18,
	                                 fontFamily: 'sans-serif',
	                                 fontColor: '#000000',
	                                 fontStyle: 'bold'
	                            		}
	                        	 } 

			  	  		}
		  	  		}
		  	  	);

	  	  	//--------------------------------------

	  		var oneRoomctx = document.getElementById("genderPieChart");
			var myDoughnutChart = new Chart(oneRoomctx, {
			    type: 'doughnut',
			    data : {
			    	    datasets: [{
			    	        data: ["${getGender[0].count}", "${getGender[1].count}"],
				    	    backgroundColor: [
				                'rgba(255, 99, 132, 1)',
				                'rgba(54, 162, 235, 1)',
				            ]
			    	    }],

			    	    labels: [
			    	        '여자 ${getGender[0].count}',
			    	        '남자 ${getGender[1].count}'
			    	    ],
			    	} ,
	    	  options: {
	                    maintainAspectRatio: true,
	                    responsive: false,
	                    legend: {
	                         display: true,
	                         position: 'top',
	                         labels: {
	                                 fontSize: 18,
	                                 fontFamily: 'sans-serif',
	                                 fontColor: '#000000',
	                                 fontStyle: 'bold'
	                            		}
	                        	 } 
	               }
			});


			var age10  = 0;
			var age20 = 0 ;
			var age30 = 0;
			var age40 = 0;

			<c:forEach items="${getAge}" var="data">				
				if(10 >= Number("${data.age}")){
					age10 = age10 +Number("${data.count}")
				}else if(20 == Number("${data.age}")){
					age20 = age20 + Number("${data.count}")
				}else if(30 == Number("${data.age}")){
					age30 = age30 +Number("${data.count}")
				}else {
					age40 = age40 + Number("${data.count}")
				}
			</c:forEach>


			var deelBar = document.getElementById("ageBar");
			var deelBarChart = new Chart(deelBar, {
			    type: 'bar',
			    data: {
			        labels: [ "20대", "30대", "40대이상"],
			        datasets: [{
			            label: '거래현황',
			            data: [ age20 , age30, age40],
			            backgroundColor: [
			               /*  'rgba(255, 99, 132, 0.8)', */
			                'rgba(54, 162, 235, 0.8)',
			                'rgba(255, 206, 86, 0.8)',
			                'rgba(75, 192, 192, 0.8)',
			            ],
			            borderColor: [
			                /* 'rgba(255,99,132,1)', */
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			            ],
			            borderWidth: 1
			        }]
			    },
			    options: {
			        scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero:true
			                }
			            }]
			        },
			        legend: {
                        display: true,
                        position: 'top',
                        labels: {
                                fontSize: 18,
                                fontFamily: 'sans-serif',
                                fontColor: '#000000',
                                fontStyle: 'bold'
                           		}
                       	 } 
			    }
			});

		// 고객 정보에서 페이징 누른 후 그 누른 페이지로 가도록 하는 장치
	/* 	if("${selectInfo}" == "buyerSubmit"){
			$('[name=buyerTitle]').addClass('active');
			$('[name=buyerInfo]').addClass('show active');
		}else if("${selectInfo}" == "sellerSubmit"){
			$('[name=sellerTitle]').addClass('active');
			$('[name=sellerInfo]').addClass('show active'); 
		}else if("${selectInfo}" == "realtorSubmit"){
			$('[name=realtorTitle]').addClass('active');
			$('[name=realtorInfo]').addClass('show active'); 
		}else if("${selectInfo}" == "rentalSubmit"){
			$('[name=rentalTitle]').addClass('active');
			$('[name=rentalInfo]').addClass('show active'); 
		} 
 */
		



		
		
		// 구매자 페이징처리
		/* $('[name=rowCntPerPageBuyer]').change(function(){
			goSearchBuyer();
		});
	
		$(".pagingNumberBuyer").html(
				getPagingNumber(
		  				"${buyerListAllCnt}"
		  				, "${masterBuyerListDTO.selectPageNoBuyer}"
		  				, "${masterBuyerListDTO.rowCntPerPageBuyer}"
		  				,"5"
		  				,"goSearchBuyer();"
		  				,'selectPageNoBuyer'
		  			)
		  		);
			$('[name=selectPageNoBuyer]').val("${masterBuyerListDTO.selectPageNoBuyer}");
	  		$('[name=rowCntPerPageBuyer]').val("${masterBuyerListDTO.rowCntPerPageBuyer}"); */
	  		
			//============================================================================

			// 판매자 페이징처리
	/* 	$('[name=rowCntPerPageSeller]').change(function(){
			goSearchSeller();
		});
	
		$(".pagingNumberSeller").html(
		  			getPagingNumber(
		  				"${sellerListAllCnt}"
		  				, "${masterSellerListDTO.selectPageNoSeller}"
		  				, "${masterSellerListDTO.rowCntPerPageSeller}"
		  				,"5"
		  				,"goSearchSeller();"
		  				,'selectPageNoSeller'
		  			)
		  		);
			$('[name=selectPageNoSeller]').val("${masterSellerListDTO.selectPageNoSeller}");
	  		$('[name=rowCntPerPageSeller]').val("${masterSellerListDTO.rowCntPerPageSeller}"); */
	  		
			//============================================================================

		// 공인중개사 페이징처리
	/* 	$('[name=rowCntPerPageRealtor]').change(function(){
			goSearchRealtor();
		});
	
		$(".pagingNumberRealtor").html(
		  			getPagingNumber(
		  				"${realtorListAllCnt}"
		  				, "${masterRealtorListDTO.selectPageNoRealtor}"
		  				, "${masterRealtorListDTO.rowCntPerPageRealtor}"
		  				,"5"
		  				,"goSearchRealtor();"
		  				,'selectPageNoRealtor'
		  			)
		  		);
			$('[name=selectPageNoRealtor]').val("${masterRealtorListDTO.selectPageNoRealtor}");
	  		$('[name=rowCntPerPageRealtor]').val("${masterRealtorListDTO.rowCntPerPageRealtor}"); */
	  		
			//============================================================================


			// 렌트업체 페이징처리
/* 		$('[name=rowCntPerPageRental]').change(function(){
			goSearchRental();
		});
	
		$(".pagingNumberRental").html(
		  			getPagingNumber(
		  				"${rentalListAllCnt}"
		  				, "${masterRentalListDTO.selectPageNoRental}"
		  				, "${masterRentalListDTO.rowCntPerPageRental}"
		  				,"5"
		  				,"goSearchRental();"
		  				,'selectPageNoRental'
		  			)
		  		);
			$('[name=selectPageNoRental]').val("${masterRentalListDTO.selectPageNoRental}");
	  		$('[name=rowCntPerPageRental]').val("${masterRentalListDTO.rowCntPerPageRental}"); */
	  		
			//============================================================================


	  		
	
	  		
	  		
})/* END */

/* 

function goSearchBuyer(){
	document.buyerInfoForm.submit();
}

function goSearchSeller(){
	document.sellerInfoForm.submit();
}

function goSearchRealtor(){
	document.realtorInfoForm.submit();
}

function goSearchRental(){
	document.rentalInfoForm.submit();
} */

function getRandomRgb() {
	  var num = Math.round(0xffffff * Math.random());
	  var r = num >> 16;
	  var g = num >> 8 & 255;
	  var b = num & 255;
	  return 'rgb(' + r + ', ' + g + ', ' + b;
} 

function showInputTextForm(num, id, selectTable){

	//$.datepicker.setDefaults($.datepicker.regional['ko']);
	$("#startDate").datepicker(
			{
				format: "yyyy-mm-dd",   //data format
				startDate: '-0d',	// 선택할 수 있는 범위
				autoclose : true,    // 탈력 선택시 자동으로 캘린더가 닫히는 옵션
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
				language : "ko"
			});
	$("#endDate").datepicker(
			{
				format: "yyyy-mm-dd",   //data format
				startDate: '-0d',	// 선택할 수 있는 범위
				autoclose : true,    // 탈력 선택시 자동으로 캘린더가 닫히는 옵션
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
				language : "ko"
			}); 



	
	  	 if($(".stopVal").css("display") == "none")       {
	  		 $(".stopVal").show();  
	  		 $("#stopNo").val( num);
	  		 $("#stopId").val( id);
	  		 $("#tableName").val( selectTable);
		}else{
			$(".stopVal").hide();
		} 

}

function hideInputTextForm(){
	$(".stopVal").hide();  
}


function showDetailStopInfo(tableName, reg_no, reg_id, start_date, end_date, stop_comment){

	
	 if($(".stopping").css("display") == "none")       {


		 $("#stopping_startDate").datepicker(
					{
						format: "yyyy-mm-dd",   //data format
						startDate: '-0d',	// 선택할 수 있는 범위
						autoclose : true,    // 탈력 선택시 자동으로 캘린더가 닫히는 옵션
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
						language : "ko"

					});
			$("#stopping_endDate").datepicker(
					{
						format: "yyyy-mm-dd",   //data format
						startDate: '-0d',	// 선택할 수 있는 범위
						autoclose : true,    // 탈력 선택시 자동으로 캘린더가 닫히는 옵션
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
						language : "ko"
					});  


			
		 $(".stopping").show();
		 $("#stopping_tableName").val( tableName);
		 $("#stoppingNo").val( reg_no);
		 $("#stoppingId").val( reg_id);
		 $("#stopping_startDate").val( start_date);
		 $("#stopping_endDate").val( end_date);
		 $("#stop_comment").val( stop_comment);
	}else{
		$(".stopping").hide();
	} 
		
	
	
}

function startInputTextForm(){

//	alert($('[name=stopCustomerForm]').serialize()	); return;

	if(confirm("해당 고객을 정지 시키겠습니까?") ==false){return;}
	
	  $.ajax({
			url : "/javaBang/master/customerStopProc.do"			
			,
			type : "post"
			,
			data : $('[name=stopCustomerForm]').serialize()	
			,
			success : function(data) {
						if(data == 1){
							alert('적용 성공');
							location.replace("/javaBang/master/customerListForm.do");
						}else if(data == -1){
							alert('서버 에러');
						}
			}
			,
			error : function(request,status,error) {
				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("서버 접속 실패");
			}

		})

}

function upDelInputTextForm(upDel){
	if(confirm("해당 고객 정지 정보를 변경 하시겠습니까?") ==false){return;}
	
	$.ajax({
		url : "/javaBang/master/customerUpDelProc.do"			
		,
		type : "post"
		,
		data : $('[name=stoppingCustomerForm]').serialize()	 + "&upDel=" + upDel
		,
		success : function(data) {
					if(data == 1){
						alert('적용 성공');
						location.replace("/javaBang/master/customerListForm.do");
					}else if(data == -1){
						alert('서버 에러');
					}
		}
		,
		error : function(request,status,error) {
			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("서버 접속 실패");
		}

	})
	
}









</script>



</head>
<body style="font-size: 15pt;">
	 <%@include file="/WEB-INF/views/master/aside.jsp"%> 


	<!-- Right Panel -->

	<div id="right-panel" class="right-panel">

		<!-- Header-->
		<header id="header" class="header">
			<div class="top-left">
				<div class="navbar-header">
					<a class="navbar-brand" href="/javaBang/master/homeForm.do">JAVABANG</a>

				</div>
			</div>
		</header>
		<!-- /header -->
		<!-- Header-->

		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
				<div class="row m-0">
					<div class="col-sm-4">
						<div class="page-header float-left">
							<div class="page-title">
								<h1>고객 현황</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<!--    <li><a href="#">Dashboard</a></li> -->
									<li><a href="#">데이터 조회</a></li>
									<li class="active">고객 현황</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="content">
			<div class="animated fadeIn">
					<div class="row">


							<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<strong class="card-title">총 고객 수</strong> 총 ${masterCustomerGraph[0].clientCount} 명
									</div>
									<div class="card-body">
											<canvas id="allRoomChart" height="50" ></canvas><!--  width="400" height="400" -->
									</div>
								</div>
							</div>
					
					
					</div>
					
					<div class="row">
		                    <div class="col-md-12">
		                        <div class="card">
		                            <div class="card-header">
		                                <h4>고객 정보</h4>
		                            </div>
		                            <div class="card-body">
		                                <%-- <p class="text-muted m-b-15">To center/justify the tabs and pills, use the <code>.nav-justified</code> class.</p> --%>
		

										<!-- href 와 id의 값이 같아야 연동이 된다. 중복 안됨!! -->
		                                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
		                                    <li class="nav-item">
		                                        <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true" name="buyerTitle">구매자</a>
		                                    </li>		                                    
		                                    <li class="nav-item">
		                                       <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile1" role="tab" aria-controls="pills-profile" aria-selected="false" name="sellerTitle">판매자</a>
		                                 	</li>
		                                	 <li class="nav-item">
		                                       <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile2" role="tab" aria-controls="pills-profile" aria-selected="false" name="realtorTitle">공인중개사</a>
		                                 	</li>
		                                 	 <li class="nav-item">
		                                       <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile3" role="tab" aria-controls="pills-profile" aria-selected="false" name="rentalTitle">렌트업체</a>
		                                 	</li>
		                                  
		                                </ul>
		                                
		                                
		                                <div class="tab-content" id="pills-tabContent">
		                                
		                                  <!-- 구매자 -->
		                                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" name="buyerInfo">
		                                        <table id="bootstrap-data-table" class="table table-striped table-bordered" style="font-size: 15pt;">
				                                    <thead>
				                                        <tr>
				                                            <th>no</th>
				                                            <th>아이디</th>
				                                            <th>이름</th>
				                                            <th>가입날짜</th> 
				                                            <th>정지 기능</th>                                           
				                                        </tr>
				                                    </thead>
				                                    <tbody>
				                                    <c:forEach items="${boardListBuyer}" var="board" varStatus="loopTagStatus">
				                                    <c:set var="flag" value="false"></c:set>
				                                        <tr>
				                                            <td>${board.b_no}</td>
				                                            <td>${board.b_id}</td>
				                                            <td>${board.b_name}</td>
				                                            <td>${board.b_date}</td>
				                                            
				                                            <c:forEach items="${stopBuyer}" var="stopValue"  varStatus="loopTagStatus">
				                                            	<c:choose >
				                                            		<c:when test="${stopValue.reg_no == board.b_no}">
				                                            			<td><input type="button" value="정지중" class="btn btn-danger btn-sm" style="font-size: 15pt;" onclick="showDetailStopInfo('${stopValue.reg_table}', ${stopValue.reg_no},'${stopValue.reg_id}','${stopValue.start_date}','${stopValue.end_date}','${stopValue.stop_comment}' );"></td>
				                                            			<c:set var="flag" value="true"></c:set>
				                                            		</c:when>
				                                            	</c:choose>
				                                            </c:forEach>
				                                            <c:if test="${!empty stopBuyer and flag eq false}">
				                                            	<td><input type="button" value="정지 시작" class="btn btn-success btn-sm" style="font-size: 15pt;" onclick="showInputTextForm(${board.b_no},'${board.b_id}', 'buyer');"></td>
				                                            </c:if>
				                                            <c:if test="${empty stopBuyer}">
				                                            	<td><input type="button" value="정지 시작" class="btn btn-success btn-sm" style="font-size: 15pt;" onclick="showInputTextForm(${board.b_no},'${board.b_id}', 'buyer');"></td>
				                                            </c:if>
				                                            
				                                        </tr>
				                                     </c:forEach>
				                                    </tbody>
				                                </table>
				                                
				                                <%-- <div>&nbsp;<span class="pagingNumberBuyer" align="center"></span>&nbsp;</div>
										 
												 <form name="buyerInfoForm" method="post" action="/javaBang/master/customerListForm.do">
												      <div style="width:800">
												         <input type="hidden" name="selectPageNoBuyer">
												         <input type="hidden" name="selectInfo" value="buyerSubmit">
												      </div><br>
												      <table border=0 width=700 align="center">
												         <tr>
												         <td align="center">
												         <select name="rowCntPerPageBuyer">
												            <option value="5">5
												            <option value="10">10
												            <option value="15">15
												         </select>행보기
												      </table>
											      </form> --%>
										 

		
		                                     </div>
		                                     
		                                     <!-- 판매자 -->
		                                     <div class="tab-pane fade" id="pills-profile1" role="tabpanel" aria-labelledby="pills-profile-tab" name="sellerInfo">
				                                 <!--      <h3>판매자(팔아방)</h3> -->
												<table id="bootstrap-data-table" class="table table-striped table-bordered" style="font-size: 15pt;">
				                                    <thead>
				                                        <tr>
				                                            <th>no</th>
				                                            <th>아이디</th>
				                                            <th>이름</th>
				                                            <th>가입날짜</th> 
				                                            <th>정지 기능</th>                                             
				                                        </tr>
				                                    </thead>
				                                    <tbody>
				                                    <c:forEach items="${boardListSeller}" var="board" varStatus="loopTagStatus">
				                                    <c:set var="flag" value="false"></c:set>
				                                        <tr>
				                                            <td>${board.s_no}</td>
				                                            <td>${board.s_id}</td>
				                                            <td>${board.s_name}</td>
				                                            <td>${board.s_date}</td>
				                                            
				                                             <c:forEach items="${stopSeller}" var="stopValue"  varStatus="loopTagStatus">
				                                            	<c:if test="${stopValue.reg_no == board.s_no}">
				                                            		<td><input type="button" value="정지중" class="btn btn-danger btn-sm"  style="font-size: 15pt;" onclick="showDetailStopInfo('${stopValue.reg_table}', ${stopValue.reg_no},'${stopValue.reg_id}','${stopValue.start_date}','${stopValue.end_date}','${stopValue.stop_comment}' );"></td>
				                                            		<c:set var="flag" value="true"></c:set>
				                                            	</c:if>
				                                            </c:forEach>
				                                             <c:if test="${!empty stopSeller and flag eq false}">
				                                            	<td><input type="button" value="정지 시작" class="btn btn-success btn-sm" style="font-size: 15pt;" onclick="showInputTextForm(${board.s_no},'${board.s_id}', 'seller');"></td>
				                                            </c:if>
				                                            <c:if test="${empty stopSeller}">
				                                            	<td><input type="button" value="정지 시작" class="btn btn-success btn-sm" style="font-size: 15pt;" onclick="showInputTextForm(${board.s_no},'${board.s_id}', 'seller');"></td>
				                                            </c:if>
				                                        </tr>
				                                     </c:forEach>
				                                     
				                                    </tbody>
				                                </table>
				                                
				                               <%--  <div>&nbsp;<span class="pagingNumberSeller" align="center"></span>&nbsp;</div>
										 
												 <form name="sellerInfoForm" method="post" action="/javaBang/master/customerListForm.do">
												      <div style="width:800">
												         <input type="hidden" name="selectPageNoSeller">
												          <input type="hidden" name="selectInfo" value="sellerSubmit">
												      </div><br>
												      <table border=0 width=700 align="center">
												         <tr>
												         <td align="center">
												         <select name="rowCntPerPageSeller">
												            <option value="5">5
												            <option value="10">10
												            <option value="15">15
												         </select>행보기
												      </table>
											      </form> --%>
										 

		

				                              </div>
				                              
				                              <!-- 공인중개사 -->
				                              <div class="tab-pane fade" id="pills-profile2" role="tabpanel" aria-labelledby="pills-profile-tab" name="realtorInfo">
				                                 <!--      <h3>판매자(팔아방)</h3> -->
												<table id="bootstrap-data-table" class="table table-striped table-bordered" style="font-size: 15pt;">
				                                    <thead>
				                                        <tr>
				                                            <th>no</th>
				                                            <th>아이디</th>
				                                            <th>이름</th>
				                                            <th>가입날짜</th>
				                                            <th>정지 기능</th>                                            
				                                        </tr>
				                                    </thead>
				                                    <tbody>
				                                    <c:forEach items="${boardListRealtor}" var="board" varStatus="loopTagStatus">
				                                    <c:set var="flag" value="false"></c:set>
				                                        <tr>
				                                            <td>${board.r_no}</td>
				                                            <td>${board.r_id}</td>
				                                            <td>${board.r_name}</td>
				                                            <td>${board.r_date}</td>
				                                            <c:forEach items="${stopRealtor}" var="stopValue"  varStatus="loopTagStatus">
				                                            	<c:if test="${stopValue.reg_no == board.r_no}">
				                                            		<td><input type="button" value="정지중" class="btn btn-danger btn-sm" style="font-size: 15pt;" onclick="showDetailStopInfo('${stopValue.reg_table}', ${stopValue.reg_no},'${stopValue.reg_id}','${stopValue.start_date}','${stopValue.end_date}','${stopValue.stop_comment}' );"></td>
				                                            		<c:set var="flag" value="true"></c:set>
				                                            	</c:if>
				                                            </c:forEach>
				                                             <c:if test="${!empty stopRealtor and flag eq false}">
				                                            	<td><input type="button" value="정지 시작" class="btn btn-success btn-sm" style="font-size: 15pt;" onclick="showInputTextForm(${board.r_no},'${board.r_id}', 'realtor');"></td>
				                                            </c:if>
				                                            <c:if test="${empty stopRealtor}">
				                                            	<td><input type="button" value="정지 시작" class="btn btn-success btn-sm" style="font-size: 15pt;" onclick="showInputTextForm(${board.r_no},'${board.r_id}', 'realtor');"></td>
				                                            </c:if>
				                                        </tr>
				                                     </c:forEach>
				                                    </tbody>
				                                </table>
				                                
				                               <%--  <div>&nbsp;<span class="pagingNumberRealtor" align="center"></span>&nbsp;</div>
										 
												 <form name="realtorInfoForm" method="post" action="/javaBang/master/customerListForm.do">
												      <div style="width:800">
												         <input type="hidden" name="selectPageNoRealtor">
												          <input type="hidden" name="selectInfo" value="realtorSubmit">
												      </div><br>
												      <table border=0 width=700 align="center">
												         <tr>
												         <td align="center">
												         <select name="rowCntPerPageRealtor">
												            <option value="5">5
												            <option value="10">10
												            <option value="15">15
												         </select>행보기
												      </table>
											      </form> --%>


		

				                              </div>
								
											 <!-- 렌트업체 -->
				                              <div class="tab-pane fade" id="pills-profile3" role="tabpanel" aria-labelledby="pills-profile-tab" name="rentalInfo">
				                                 <!--      <h3>판매자(팔아방)</h3> -->
												<table id="bootstrap-data-table" class="table table-striped table-bordered" style="font-size: 15pt;">
				                                    <thead>
				                                        <tr>
				                                            <th>no</th>
				                                            <th>아이디</th>
				                                            <th>업체명</th>
				                                            <th>가입날짜</th>   
				                                            <th>정지 기능</th>                                         
				                                        </tr>
				                                    </thead>
				                                    <tbody>
				                                    <c:forEach items="${boardListRental}" var="board" varStatus="loopTagStatus">
				                                    <c:set var="flag" value="false"></c:set>
				                                        <tr>
				                                            <td>${board.rt_no}</td>
				                                            <td>${board.rt_id}</td>
				                                            <td>${board.rt_comname}</td>
				                                            <td>${board.rt_date}</td>
				                                            <c:forEach items="${stopRental}" var="stopValue"  varStatus="loopTagStatus">
				                                            	<c:if test="${stopValue.reg_no == board.rt_no}">
				                                            		<td><input type="button" value="정지중" class="btn btn-danger btn-sm" style="font-size: 15pt;" onclick="showDetailStopInfo('${stopValue.reg_table}', ${stopValue.reg_no},'${stopValue.reg_id}','${stopValue.start_date}','${stopValue.end_date}','${stopValue.stop_comment}' );"></td>
				                                            		<c:set var="flag" value="true"></c:set>
				                                            	</c:if>
				                                            </c:forEach>
				                                            
				                                             <c:if test="${!empty stopRental and flag eq false}">
				                                            	<td><input type="button" value="정지 시작" class="btn btn-success btn-sm" style="font-size: 15pt;" onclick="showInputTextForm(${board.rt_no},'${board.rt_id}', 'rental');"></td>
				                                            </c:if>
				                                            <c:if test="${empty stopRental}">
				                                            	<td><input type="button" value="정지 시작" class="btn btn-success btn-sm" style="font-size: 15pt;" onclick="showInputTextForm(${board.rt_no},'${board.rt_id}', 'rental');"></td>
				                                            </c:if>
				                                        </tr>
				                                     </c:forEach>
				                                    </tbody>
				                                </table>
				                                
				                                <%-- <div>&nbsp;<span class="pagingNumberRental" align="center"></span>&nbsp;</div>
										 
												 <form name="rentalInfoForm" method="post" action="/javaBang/master/customerListForm.do">
												      <div style="width:800">
												         <input type="hidden" name="selectPageNoRental">
												          <input type="hidden" name="selectInfo" value="rentalSubmit">
												      </div><br>
												      <table border=0 width=700 align="center">
												         <tr>
												         <td align="center">
												         <select name="rowCntPerPageRental">
												            <option value="5">5
												            <option value="10">10
												            <option value="15">15
												         </select>행보기
												      </table>
											      </form> --%>
										 

		

				                              </div>
								
								
								
								
								
								
		                                </div>
		                                
		                                
		                               <div class="stopVal" >
		                               		<form name="stopCustomerForm" method="post" >
				                              	<table class="asd">
				                              		<tr>
				                              			<th>정지 할 회원
				                              			<th>시작 날짜
				                              			<th>끝 날짜
				                              			<th>입력 문구
				                              		<tr>
				                              		 
				                              			<th style="display: flex;"> no : <input type="text" class="breadcrumb" id="stopNo" name="stopNo" size="10" style="width: 80;" readonly> &nbsp;&nbsp;&nbsp; id : <input type="text"  class="breadcrumb" id="stopId" name="stopId" size="35" style="width: 250;"  readonly>
				                              			<th><p><input type="text"  class="breadcrumb" id="startDate" name="startDate" size="15" readonly ></p>
														<th><p><input type="text" class="breadcrumb" id="endDate" name="endDate" size="15" readonly></p>
				                              			<th><input type="text" class="breadcrumb"  name="stop_comment">          
				                              	</table>
				                              	 <input type="hidden" id="tableName" name="tableName">
	                              				<input type="button" class="btn btn-success" value="시작" onclick="startInputTextForm();">			                              	
	                              				<input type="button" class="btn btn-danger" value="취소" onclick="hideInputTextForm();">
				                             </form>  
			                        </div>
			                        
			                        
			                          <div class="stopping" >
		                               		<form name="stoppingCustomerForm" method="post" >
				                              	<table class="asd">
				                              		<tr>
				                              			<th>정지된 회원
				                              			<th>시작 날짜
				                              			<th>끝 날짜
				                              			<th>입력 문구
				                              		<tr>
				                              		 
				                              			<th style="display: flex;"> no : <input type="text" class="breadcrumb"  id="stoppingNo" style="width: 80;" name="stopNo" size="10" readonly>&nbsp;&nbsp;&nbsp; id : <input type="text" class="breadcrumb" id="stoppingId" name="stopId" size="35"  style="width: 250;" readonly>
				                              			<th><p><input type="text" class="breadcrumb" id="stopping_startDate" name="startDate" size="15" readonly></p>
														<th><p><input type="text" class="breadcrumb" id="stopping_endDate" name="endDate" size="15" readonly></p>
				                              			<th><input type="text" class="breadcrumb" id="stop_comment" name="stop_comment">          
				                              	</table>
				                              	<input type="hidden" id="stopping_tableName" name="tableName">
	                              				<input type="button" class="btn btn-success"   value="수정" onclick="upDelInputTextForm('up');">			                              	
	                              				<input type="button"  class="btn btn-danger" value="정지 취소" onclick="upDelInputTextForm('del');">
				                             </form>  
			                        </div>

		
		                            </div>
		                        </div>
		                    </div>
					
						
					</div>
					
					<div class="row">
						<div class="col-lg-4">
							<div class="card">
								<div class="card-header">
									<strong class="card-title">가입경로 별 통계</strong> 
								</div>
								<div class="card-body">
									<div >
   											<canvas id="chartjs-5" class="chartjs" height="340" 	></canvas>
  										</div>
  									</div>
  								</div>
  							</div>
  							
  							<div class="col-lg-4">
								<div class="card">
									<div class="card-header">
										<strong class="card-title">연령 [구매자]</strong> 
									</div>
									<div class="card-body">
										<div >
   											<center><canvas id="ageBar"  height="340" ></canvas></center>
	  										</div>
	  									</div>
	  								</div>
  							</div>
  							
  							<div class="col-lg-4">
								<div class="card">
									<div class="card-header">
										<strong class="card-title">성별 [구매자]</strong> 
									</div>
									<div class="card-body">
										<div >
   											<center><canvas id="genderPieChart" height="340"  ></canvas></center>
  										</div>
  									</div>
  								</div>
  							</div>
  							
  							
					</div>
				
				
			</div>
			<!-- .animated -->
		</div>
		<!-- .content -->


		<div class="clearfix"></div>

		

	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->

	<!-- Scripts -->
	 <script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="/javaBang/resources/assets/js/main.js"></script> 
	
	


</body>
</html>
