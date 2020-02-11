<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- ########################################################## -->
<!-- 마스터 화면  -> 구매자 리스트 및 그래프 구현 화면 made by kbs-->
<!-- ########################################################## -->


<script src="/javaBang/resources/jquery-1.11.0.min.js"
	type="text/javascript"></script>
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
<title>Master - 매물현황</title>
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
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://d3js.org/d3.v4.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

					<style>
							.grid line {
							    stroke: lightgrey;
							    stroke-opacity: 0.7;
							}
							.lineChart {
							    fill: none;
							    stroke: steelblue;
							    stroke-width: 1.5px;
							}
							.lineChart:hover {
							    stroke: black;
							    stroke-width: 3px;
							}
							.toolTip {
							    position: absolute;
							    border: 1px solid;
							    border-radius: 4px 4px 4px 4px;
							    background: rgba(0, 0, 0, 0.8);
							    color : white;
							    padding: 5px;
							    text-align: center;
							    font-size: 12px;
							    min-width: 30px;
							}
					</style>


<script>
/* 
var myBarChart = new Chart(ctx, {
    type: 'horizontalBar',
    data: data,
    options: options
}); */

$(document).ready(function(){


		var allRoomctx = document.getElementById("allRoomChart");
		var allRoomChart = new Chart(allRoomctx, {
		    type: 'horizontalBar',
		    data: {
		        labels: ["전체 매물", "원룸", "투룸", "오피스텔"],
		        datasets: [{
		            label: '매물',
		            data: ["${masterRoomGraph[0].all_roomCnt}", "${masterRoomGraph[0].oneRoomCnt}", "${masterRoomGraph[0].twoRoomCnt}", "${masterRoomGraph[0].officeRoomCnt}"],
		            backgroundColor: [
		                'rgba(255, 99, 132, 0.8)',
		                'rgba(54, 162, 235, 0.8)',
		                'rgba(255, 206, 86, 0.8)',
		                'rgba(75, 192, 192, 0.8)',
		            ],
		            borderColor: [
		                'rgba(255,99,132,1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		            ],
		            borderWidth: 1
		        }]
		    },
		    options: {
		        scales: {
		            xAxes: [{
		                ticks: {
		                    beginAtZero:true,
		                    fontSize: 20,
		                    fontStyle:'bold'
		                }
		            }],
		            yAxes: [{
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

		
		
		var oneRoomctx = document.getElementById("oneRoomPieChart");
		var myDoughnutChart = new Chart(oneRoomctx, {
		    type: 'doughnut',
		    data : {
		    	    datasets: [{
		    	        data: ["${masterRoomGraph[0].oneSale}", "${masterRoomGraph[0].oneJeonse}", "${masterRoomGraph[0].oneOneRoom}"],
			    	    backgroundColor: [
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			            ]
		    	    }],

		    	    labels: [
		    	        '매매',
		    	        '전세',
		    	        '월세'
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

		var twoRoomctx = document.getElementById("twoRoomPieChart");
		var myDoughnutChart = new Chart(twoRoomctx, {
		    type: 'doughnut',
		    data : {
		    	    datasets: [{
		    	        data: ["${masterRoomGraph[0].twoSale}", "${masterRoomGraph[0].twoJeonse}", "${masterRoomGraph[0].twoOneRoom}"],
			    	    backgroundColor: [
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			            ]
		    	    }],

		    	    labels: [
		    	        '매매',
		    	        '전세',
		    	        '월세'
		    	    ],
		    	},
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


		var officeRoomctx = document.getElementById("officeRoomPieChart");
		var myDoughnutChart = new Chart(officeRoomctx, {
		    type: 'doughnut',
		    data : {
		    	    datasets: [{
		    	        data: ["${masterRoomGraph[0].officeSale}", "${masterRoomGraph[0].officeJeonse}", "${masterRoomGraph[0].officeOneRoom}"],
			    	    backgroundColor: [
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			            ]
		    	    }],

		    	    labels: [
		    	        '매매',
		    	        '전세',
		    	        '월세'
		    	    ],
		    	},
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





		


			var deelBar = document.getElementById("deelBar");
			var deelBarChart = new Chart(deelBar, {
			    type: 'bar',
			    data: {
			        labels: ["매칭대기중", "소유자 확인중", "공실 광고중", "판매 완료"],
			        datasets: [{
			            label: '거래현황',
			            data: ["${masterRoomGraph[0].standby}", "${masterRoomGraph[0].checkOwner}", "${masterRoomGraph[0].adRoom}", "${masterRoomGraph[0].sellFinish}"],
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.8)',
			                'rgba(54, 162, 235, 0.8)',
			                'rgba(255, 206, 86, 0.8)',
			                'rgba(75, 192, 192, 0.8)',
			            ],
			            borderColor: [
			                'rgba(255,99,132,1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			            ],
			            borderWidth: 1
			        }]
			    },
			    options: {
			        scales: {
			            xAxes: [{
			                ticks: {			                    
			                    fontSize: 15,
				                fontStyle: 'bold',
				                fontFamily: 'sans-serif'
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

			
	
})/* END */

</script>








<script>

	jQuery(document).ready(function($) {
						"use strict";
		
						// 원룸
						var oneRoomSellFin = []
						// 투룸
						  var twoRoomSellFin = [] 
						// 오피스텔
						 var  officeRoomSellFin = [] 

						
					$("[name='selectYear']").change(function(){
					    var yearVal =  $(this).val();

					    var objParams = {
								"yearVal" : yearVal
						};

					   $.ajax({
								url : "/javaBang/master/roomListFormProc.do"			
								,type : "post"
								,data : objParams		
								,success : function(data) {
								
									$("#TrafficChart").remove();   //  태그 삭제
									
									$("select").after($("<canvas id='TrafficChart'></canvas>"));  // 태그 다시 생성


									twoRoomSellFin = [data.roomtypeGraph[1].jan, data.roomtypeGraph[1].feb, data.roomtypeGraph[1].mar,
										data.roomtypeGraph[1].apr, data.roomtypeGraph[1].may, data.roomtypeGraph[1].jun, data.roomtypeGraph[1].jul
										,data.roomtypeGraph[1].aug, data.roomtypeGraph[1].sep, data.roomtypeGraph[1].oct, data.roomtypeGraph[1].nov , data.roomtypeGraph[1].dec]

									// 총 매물 월별 개수
									  officeRoomSellFin = [data.roomtypeGraph[2].jan, data.roomtypeGraph[2].feb, data.roomtypeGraph[2].mar,
											data.roomtypeGraph[2].apr, data.roomtypeGraph[2].may, data.roomtypeGraph[2].jun, data.roomtypeGraph[2].jul
											,data.roomtypeGraph[2].aug,data.roomtypeGraph[2].sep,data.roomtypeGraph[2].oct, data.roomtypeGraph[2].nov , data.roomtypeGraph[2].dec]


									// 총 방문자 수
									oneRoomSellFin = [data.roomtypeGraph[0].jan, data.roomtypeGraph[0].feb, data.roomtypeGraph[0].mar,
										data.roomtypeGraph[0].apr, data.roomtypeGraph[0].may, data.roomtypeGraph[0].jun, data.roomtypeGraph[0].jul
										,data.roomtypeGraph[0].aug,data.roomtypeGraph[0].sep,data.roomtypeGraph[0].oct, data.roomtypeGraph[0].nov , data.roomtypeGraph[0].dec]
									
									
									 mainGraph(twoRoomSellFin, officeRoomSellFin, oneRoomSellFin); // 그래프 그리기
	
											
								}
								,
								error : function(request,status,error) {
									 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
									alert("서버 접속 실패");
								}
					
							})
					})
						
	
						// 총 고객 월별 인원수
						  twoRoomSellFin = ["${roomtypeGraph[1].jan}", "${roomtypeGraph[1].feb}", "${roomtypeGraph[1].mar}",
							"${roomtypeGraph[1].apr}", "${roomtypeGraph[1].may}", "${roomtypeGraph[1].jun}", "${roomtypeGraph[1].jul}"
							,"${roomtypeGraph[1].aug}","${roomtypeGraph[1].sep}","${roomtypeGraph[1].oct}","${roomtypeGraph[1].nov}","${roomtypeGraph[1].dec}"] 

						// 총 매물 월별 개수
						  officeRoomSellFin = ["${roomtypeGraph[2].jan}", "${roomtypeGraph[2].feb}", "${roomtypeGraph[2].mar}",
								"${roomtypeGraph[2].apr}", "${roomtypeGraph[2].may}", "${roomtypeGraph[2].jun}", "${roomtypeGraph[2].jul}"
								,"${roomtypeGraph[2].aug}","${roomtypeGraph[2].sep}","${roomtypeGraph[2].oct}","${roomtypeGraph[2].nov}","${roomtypeGraph[2].dec}"] 

						// 총 방문자 수	
						oneRoomSellFin = ["${roomtypeGraph[0].jan}", "${roomtypeGraph[0].feb}", "${roomtypeGraph[0].mar}",
							"${roomtypeGraph[0].apr}", "${roomtypeGraph[0].may}", "${roomtypeGraph[0].jun}", "${roomtypeGraph[0].jul}"
							,"${roomtypeGraph[0].aug}","${roomtypeGraph[0].sep}","${roomtypeGraph[0].oct}","${roomtypeGraph[0].nov}","${roomtypeGraph[0].dec}"] 

						 mainGraph(twoRoomSellFin, officeRoomSellFin, oneRoomSellFin);
					
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

	function mainGraph( twoRoomSellFin, officeRoomSellFin, oneRoomSellFin ){
		//alert($('#TrafficChart').length);
		
		//if ($('#TrafficChart').length) {
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
										label : "원룸",
										borderColor : "rgba(40, 169, 46, 0.9)",
										borderWidth : "1",
										backgroundColor : "rgba(40, 169, 46, .5)",
										pointHighlightStroke : "rgba(40, 169, 46,.5)",														
										data : oneRoomSellFin
									},
								
									{
										label : "투룸",
										borderColor : "rgba(4, 73, 203,.09)",
										borderWidth : "1",
										backgroundColor : "rgba(4, 73, 203,.5)",
										pointHighlightStroke : "rgba(4, 73, 203,.5)",
										data : officeRoomSellFin
									},
									{
										label : "오피스텔",
										borderColor : "rgba(255, 102, 000, 0.9)",
										borderWidth : "1",
										backgroundColor : "rgba(255, 102, 000, .5)",
										pointHighlightStroke : "rgba(255, 102, 000, .5)",
										data : twoRoomSellFin
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
		//}




		
		
		
		




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
		            yAxes: [{
		                ticks: {
		                    beginAtZero:true
		                }
		            }]
		        },
		        
		    }
		});
		
	}


	
</script>



</head>
<body style="font-size: 15pt;    font-weight: 600;">
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
								<h1>매물 현황</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<!--    <li><a href="#">Dashboard</a></li> -->
									<li><a href="#">데이터 조회</a></li>
									<li class="active">매물 현황</li>
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
								<strong class="card-title">매물 종류 별 개수</strong> 총 ${masterRoomGraph[0].all_roomCnt} 개
							</div>
							<div class="card-body">
									<canvas id="allRoomChart" height="50" ></canvas><!--  width="400" height="400" -->
							</div>
						</div>
					</div>
					
					
					</div>
					
					<div class="row">
						<div class="col-lg-4"  >
							<div class="card"  >
								<div class="card-header">
									<strong class="card-title">원룸</strong> 
								</div>
									<div class="card-body"   >								
										<center><canvas id="oneRoomPieChart"  ></canvas></center>																
									</div>
							</div>
						</div>
						
						<div class="col-lg-4">
							<div class="card"  >
								<div class="card-header">
									<strong class="card-title">투룸</strong> 
								</div>
									
								<div class="card-body"  >
										<center><canvas id="twoRoomPieChart" ></canvas></center>										 
								</div>
							</div>
						</div>
						
						<div class="col-lg-4">
							<div class="card"  >
								<div class="card-header">
									<strong class="card-title">오피스텔</strong> 
								</div>
								<div class="card-body" >
									<center><canvas id="officeRoomPieChart" ></canvas></center>									 
								</div>  
							</div>
						</div>

				</div>
				
				<div class="row">
							
					<div class="col-xl-8">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">날짜별 매물 판매 현황</strong>
							</div>
							<div class="card-body">
								
								
							<!-- ================================================================================== -->
						
							
								<select id="selectYear" name="selectYear">
									<option value="2020">2020
									<option value="2019">2019	
								</select>
							
						<canvas id="TrafficChart"></canvas>
							</div>







						</div>
					</div>
					
					<div class="col-lg-4 col-md-6">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">매물 거래 현황</strong>
							</div>
							<div class="card-body">
									<canvas id="deelBar" height="340" ></canvas>
							</div>
						</div>
					</div>
				</div>
				
				
			</div>
			<!-- .animated -->
		</div>
		<!-- .content -->


		<div class="clearfix"></div>

		<footer class="site-footer">
			<div class="footer-inner bg-white">
				<div class="row">
					<div class="col-sm-6">Copyright &copy; 2018 Ela Admin</div>
					<div class="col-sm-6 text-right">
						Designed by <a href="https://colorlib.com">Colorlib</a>
					</div>
				</div>
			</div>
		</footer>

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


	
<!-- 
	<script
		src="/javaBang/resources/assets/js/lib/data-table/datatables.min.js"></script>
	<script
		src="/javaBang/resources/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
	<script
		src="/javaBang/resources/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
	<script
		src="/javaBang/resources/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
	<script src="/javaBang/resources/assets/js/lib/data-table/jszip.min.js"></script>
	<script src="/javaBang/resources/assets/js/lib/data-table/vfs_fonts.js"></script>
	<script
		src="/javaBang/resources/assets/js/lib/data-table/buttons.html5.min.js"></script>
	<script
		src="/javaBang/resources/assets/js/lib/data-table/buttons.print.min.js"></script>
	<script
		src="/javaBang/resources/assets/js/lib/data-table/buttons.colVis.min.js"></script>
	<script src="/javaBang/resources/assets/js/init/datatables-init.js"></script>
 -->



</body>
</html>
