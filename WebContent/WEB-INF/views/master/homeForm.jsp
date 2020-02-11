<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	<!-- ########################################################## -->
	<!-- 마스터 화면 홈 made by kbs-->
	<!-- ########################################################## -->
	
	
<script src="/javaBang/resources/jquery-1.11.0.min.js"	type="text/javascript"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<title>MASTER - HOME</title>
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

<!--  Chart js -->
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@2.7.3/dist/Chart.bundle.min.js"></script>

<!--Chartist Chart-->
<script
	src="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chartist-plugin-legend@0.6.2/chartist-plugin-legend.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/flot-pie@1.0.0/src/jquery.flot.pie.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/flot-spline@0.0.1/js/jquery.flot.spline.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/simpleweather@3.1.0/jquery.simpleWeather.min.js"></script>
<script src="/javaBang/resources/assets/js/init/weather-init.js"></script>

<script src="https://cdn.jsdelivr.net/npm/moment@2.22.2/moment.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.js"></script>
<script src="/javaBang/resources/assets/js/init/fullcalendar-init.js"></script>



<!--Local Stuff-->
<script>

	jQuery(document).ready(function($) {
						"use strict";

						
						// 총 방문자 수
						var monthVisit = []
						
						// 총 고객 월별 인원수
						  var monthClient = [] 

						// 총 매물 월별 개수
						 var  monthRoom = [] 

						// 총 렌탈 매물 월별 개수
						 var monthRent = [] 
						
						
					$("[name='selectYear']").change(function(){
					    var yearVal =  $(this).val();

					    var objParams = {
								"yearVal" : yearVal
						};
						
					   $.ajax({
								url : "/javaBang/master/masterHomeProc.do"			
								,
								type : "post"
								,
								data : objParams		
								,
								success : function(data) {
									//alert(data.masterHomeGraph[0].Jan)

									
									$("#TrafficChart").remove();   //  태그 삭제
									
									$("select").after($("<canvas id='TrafficChart'></canvas>"));  // 태그 다시 생성


									
									monthClient = [data.masterHomeGraph[0].Jan, data.masterHomeGraph[0].Feb, data.masterHomeGraph[0].Mar,
										data.masterHomeGraph[0].Apr, data.masterHomeGraph[0].May, data.masterHomeGraph[0].Jun, data.masterHomeGraph[0].Jul
										,data.masterHomeGraph[0].Aug,data.masterHomeGraph[0].Sep,data.masterHomeGraph[0].Oct, data.masterHomeGraph[0].Nov , data.masterHomeGraph[0].Dec]

									// 총 매물 월별 개수
									  monthRoom = [data.masterHomeGraph[1].Jan, data.masterHomeGraph[1].Feb, data.masterHomeGraph[1].Mar,
											data.masterHomeGraph[1].Apr, data.masterHomeGraph[1].May, data.masterHomeGraph[1].Jun, data.masterHomeGraph[1].Jul
											,data.masterHomeGraph[1].Aug,data.masterHomeGraph[1].Sep,data.masterHomeGraph[1].Oct, data.masterHomeGraph[1].Nov , data.masterHomeGraph[1].Dec]

									// 총 렌탈 매물 월별 개수
									  monthRent = [data.masterHomeGraph[2].Jan, data.masterHomeGraph[2].Feb, data.masterHomeGraph[2].Mar,
											data.masterHomeGraph[2].Apr, data.masterHomeGraph[2].May, data.masterHomeGraph[2].Jun, data.masterHomeGraph[2].Jul
											,data.masterHomeGraph[2].Aug,data.masterHomeGraph[2].Sep,data.masterHomeGraph[2].Oct, data.masterHomeGraph[2].Nov , data.masterHomeGraph[2].Dec]

									// 총 방문자 수
									monthVisit = [data.masterHomeGraph[3].Jan, data.masterHomeGraph[3].Feb, data.masterHomeGraph[3].Mar,
										data.masterHomeGraph[3].Apr, data.masterHomeGraph[3].May, data.masterHomeGraph[3].Jun, data.masterHomeGraph[3].Jul
										,data.masterHomeGraph[3].Aug,data.masterHomeGraph[3].Sep,data.masterHomeGraph[3].Oct, data.masterHomeGraph[3].Nov , data.masterHomeGraph[3].Dec]
									
									 mainGraph(monthClient, monthRoom, monthRent , monthVisit); // 그래프 그리기
	
											
								}
								,
								error : function(request,status,error) {
									 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
									alert("서버 접속 실패");
								}
					
							})
					})
						
						

// alert("${masterHomeGrap[0].Apr}")

							
						

						// 총 고객 월별 인원수
						  monthClient = ["${masterHomeGrap[0].Jan}", "${masterHomeGrap[0].Feb}", "${masterHomeGrap[0].Mar}",
							"${masterHomeGrap[0].Apr}", "${masterHomeGrap[0].May}", "${masterHomeGrap[0].Jun}", "${masterHomeGrap[0].Jul}"
							,"${masterHomeGrap[0].Aug}","${masterHomeGrap[0].Sep}","${masterHomeGrap[0].Oct}","${masterHomeGrap[0].Nov}","${masterHomeGrap[0].Dec}"] 

						// 총 매물 월별 개수
						  monthRoom = ["${masterHomeGrap[1].Jan}", "${masterHomeGrap[1].Feb}", "${masterHomeGrap[1].Mar}",
								"${masterHomeGrap[1].Apr}", "${masterHomeGrap[1].May}", "${masterHomeGrap[1].Jun}", "${masterHomeGrap[1].Jul}"
								,"${masterHomeGrap[1].Aug}","${masterHomeGrap[1].Sep}","${masterHomeGrap[1].Oct}","${masterHomeGrap[1].Nov}","${masterHomeGrap[1].Dec}"] 

						// 총 렌탈 매물 월별 개수
						  monthRent = ["${masterHomeGrap[2].Jan}", "${masterHomeGrap[2].Feb}", "${masterHomeGrap[2].Mar}",
								"${masterHomeGrap[2].Apr}", "${masterHomeGrap[2].May}", "${masterHomeGrap[2].Jun}", "${masterHomeGrap[2].Jul}"
								,"${masterHomeGrap[2].Aug}","${masterHomeGrap[2].Sep}","${masterHomeGrap[2].Oct}","${masterHomeGrap[2].Nov}","${masterHomeGrap[2].Dec}"] 

						// 총 방문자 수	
						monthVisit = ["${masterHomeGrap[3].Jan}", "${masterHomeGrap[3].Feb}", "${masterHomeGrap[3].Mar}",
								"${masterHomeGrap[3].Apr}", "${masterHomeGrap[3].May}", "${masterHomeGrap[3].Jun}", "${masterHomeGrap[3].Jul}"
								,"${masterHomeGrap[3].Aug}", "${masterHomeGrap[3].Sep}" , "${masterHomeGrap[3].Oct}",  "${masterHomeGrap[3].Nov}" , "${masterHomeGrap[3].Dec}"]

						 mainGraph(monthClient, monthRoom, monthRent ,monthVisit);
					
						// Bar Chart #flotBarChart
						$.plot("#flotBarChart",
								[ {
									data : [ [ 0, 18 ], [ 2, 8 ], [ 4, 5 ],
											[ 6, 13 ], [ 8, 5 ], [ 10, 7 ],
											[ 12, 4 ], [ 14, 6 ], [ 16, 15 ],
											[ 18, 9 ], [ 20, 17 ], [ 22, 7 ],
											[ 24, 4 ], [ 26, 9 ], [ 28, 11 ] ],
									bars : {
										show : true,
										lineWidth : 0,
										fillColor : '#ffffff8a'
									}
								} ], {
									grid : {
										show : false
									}
								});
						// Bar Chart #flotBarChart End

					
		});

	function mainGraph( monthClient, monthRoom,monthRent, monthVisit ){
		//alert($('#TrafficChart').length);
		
		if ($('#TrafficChart').length) {
			var ctx = document.getElementById("TrafficChart");
			ctx.height = 150;
			var myChart = new Chart(
					ctx,
					{
						type : 'line',
						data : {
							labels : [ "1월", "2월", "3월",
									"4월", "5월", "6월", "7월","8월","9월","10월","11월","12월" ],
							datasets : [
									{
										label : "총 방문자",
										borderColor : "rgba(40, 169, 46, 0.9)",
										borderWidth : "1",
										backgroundColor : "rgba(40, 169, 46, .5)",
										pointHighlightStroke : "rgba(40, 169, 46,.5)",														
										data : monthVisit
									},
									{
										label : "총 렌트물품",
										borderColor : "rgba(245, 23, 66, 0.9)",
										borderWidth : "1",
										backgroundColor : "rgba(245, 23, 66,.5)",
										pointHighlightStroke : "rgba(245, 23, 66,.5)",
										data : monthRent
									},
									{
										label : "총 매물",
										borderColor : "rgba(4, 73, 203,.09)",
										borderWidth : "1",
										backgroundColor : "rgba(4, 73, 203,.5)",
										pointHighlightStroke : "rgba(4, 73, 203,.5)",
										data : monthRoom
									},
									{
										label : "총 고객",
										borderColor : "rgba(255, 102, 000, 0.9)",
										borderWidth : "1",
										backgroundColor : "rgba(255, 102, 000, .5)",
										pointHighlightStroke : "rgba(255, 102, 000, .5)",
										data : monthClient
									}, ]
						},
						options : {
							responsive : true,
							tooltips : {
								mode : 'index',
								intersect : false
							},
							hover : {
								mode : 'nearest',
								intersect : true
							},
							 scales: {
						            xAxes: [{
						                ticks: {
						                    beginAtZero:true,
						                    fontSize: 20
						                }
						            }],
						            yAxes: [{
										ticks: {
							                fontSize: 20
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
		}
		
		//Traffic chart chart-js  End






		var todayVisit = document.getElementById("todayVisit");
		var todayVisitChart = new Chart(todayVisit, {
		    type: 'bar',
		    data: {
		        labels: ["어제", "오늘"],
		        datasets: [{
		            label: '방문자수',
		            data: ["${masterHomeDTO.visitYesterday}", "${masterHomeDTO.visitToday}"],
		            backgroundColor: [
		                'rgba(255, 99, 132, 0.8)',
		                'rgba(54, 162, 235, 0.8)',

		            ],
		            borderColor: [
		                'rgba(255,99,132,1)',
		                'rgba(54, 162, 235, 1)',

		            ],
		            borderWidth: 1
		        }]
		    },
		    options: {
		    	 scales: {
			            xAxes: [{
			                ticks: {
			                    beginAtZero:true,
			                    fontSize: 20
			                }
			            }],
			            yAxes: [{
							ticks: {
								beginAtZero:true,
				                fontSize: 20
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
		
	}


	
</script>

<style>
#weatherWidget .currentDesc {
	color: #ffffff !important;
}

.traffic-chart {
	min-height: 335px;
}

#flotPie1 {
	height: 150px;
}

#flotPie1 td {
	padding: 3px;
}

#flotPie1 table {
	top: 20px !important;
	right: -10px !important;
}

.chart-container {
	display: table;
	min-width: 270px;
	text-align: left;
	padding-top: 10px;
	padding-bottom: 10px;
}

#flotLine5 {
	height: 105px;
}

#flotBarChart {
	height: 150px;
}

#cellPaiChart {
	height: 160px;
}
</style>
</head>

<body style="font-size:15pt;font-weight: 600;">
<!-- left Panel -->
	<%@include file="/WEB-INF/views/master/aside.jsp" %>
	
	<!-- Right Panel -->
	<div id="right-panel" class="right-panel">
		<!-- Header-->
		<header id="header" class="header">
			<div class="top-left">
				<div class="navbar-header">
					<a class="navbar-brand" href="/javaBang/master/homeForm.do">JAVABANG</a>
					<a class="navbar-brand hidden" href="./"><img
						src="/javaBang/resources/images/logo2.png" alt="Logo"></a>
				</div>
			</div>
		</header>
		<!-- /#header -->
		<!-- Content -->
		<div class="content" >
			<!-- Animated -->
			<div class="animated fadeIn">
				<!-- Widgets  -->
				<div class="row" >
					<div class="col-lg-3 col-md-6">
						<div class="card">
							<div class="card-body">
								<div class="stat-widget-five" >  <!-- onclick="" style="cursor:pointer" -->
									<div class="stat-icon dib flat-color-1">
										<i class="pe-7s-cash"></i>
									</div>
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-text">
												<span class="count" style="font-size:20pt;font-weight:800;">${masterHomeDTO.visitCount}</span>
											</div>
											<div class="stat-heading " style="font-size:15pt;color:#333;">총 방문자</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="card">
							<div class="card-body">
								<div class="stat-widget-five" onclick="location.href='/javaBang/master/rentListForm.do';" style="cursor:pointer">
									<div class="stat-icon dib flat-color-2">
										<i class="pe-7s-cart"></i>
									</div>
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-text">
												<span class="count" style="font-size:20pt;font-weight:800;">${masterHomeDTO.rentCount}</span>
											</div>
											<div class="stat-heading" style="font-size:15pt;color:#333;">총 렌트물품</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="card">
							<div class="card-body">
								<div class="stat-widget-five" onclick="location.href='/javaBang/master/roomListForm.do';" style="cursor:pointer">
									<div class="stat-icon dib flat-color-3">
										<i class="pe-7s-browser"></i>
									</div>
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-text">
												<span class="count" style="font-size:20pt;font-weight:800;">${masterHomeDTO.roomCount}</span>
											</div>
											<div class="stat-heading" style="font-size:15pt;color:#333;">총 매물</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="card">
							<div class="card-body">
								<div class="stat-widget-five" onclick="location.href='/javaBang/master/customerListForm.do';" style="cursor:pointer">
									<div class="stat-icon dib flat-color-4">
										<i class="pe-7s-users"></i>
									</div>
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-text">
												<span class="count" style="font-size:20pt;font-weight:800;">${masterHomeDTO.clientCount}</span>
											</div>
											<div class="stat-heading" style="font-size:15pt;color:#333;">총 고객</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /Widgets -->
				<!--  Traffic  -->
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<h4 class="box-title">Traffic</h4>								
							</div>
							<div class="row">
								<div class="col-lg-8">
									<div class="card-body">
										<select id="selectYear" name="selectYear" >
											<option value="2020">2020년</option>
											<option value="2019">2019년</option>								
										</select>
									
										<canvas id="TrafficChart"></canvas>
										
						
									</div>
								</div>
								<div class="col-lg-4">
								<br><br>	<br><br>	<br><br>	<br><br> <br><br> 
									<div class="card-body">
										
										<canvas id="todayVisit"></canvas>
										
									</div>
									<!-- /.card-body -->
								</div>
							</div>
							<!-- /.row -->
							<div class="card-body"></div>
						</div>
					</div>
					<!-- /# column -->
				</div>
				<!--  /Traffic -->
				<div class="clearfix"></div>
				<!-- Orders -->
				<div class="orders">
					<div class="row">

						<div class="col-xl-4">
							<div class="row">
								<!-- <div class="col-lg-6 col-xl-12">
								원판  
									<div class="card br-0">  
										<div class="card-body">
											<div class="chart-container ov-h">
												<div id="flotPie1" class="float-chart"></div>
											</div>
										</div>
									</div>
									/.card
								</div> -->

								<!-- <div class="col-lg-6 col-xl-12">
									<div class="card bg-flat-color-3  ">
										<div class="card-body">
											<h4 class="card-title m-0  white-color ">August 2018</h4>
										</div>
										<div class="card-body">
											<div id="flotLine5" class="flot-line"></div>
										</div>
									</div>
								</div> -->
							</div>
						</div>
						<!-- /.col-md-4 -->
					</div>
				</div>

			</div>


			<!-- /#add-category -->
		</div>
		<!-- .animated -->
	</div>
	<!-- /.content -->
	<div class="clearfix"></div>
	
	</div>
	<!-- /#right-panel -->

</body>
</html>
