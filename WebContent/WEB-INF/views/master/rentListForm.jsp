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
<title>Master - 렌트물품</title>
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



    <link rel="stylesheet" href="/javaBang/resources/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/style.css">



<script>


/* 
function goSearchProduct(){
		document.rentListProductForm.submit();
	}

function goSearchCompany(){
	document.rentListCompanyForm.submit();
} */
	
$(document).ready(function(){

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
 	        title: 'rentalCompanyList'
	        }]
		}) 

	/* // 물품 페이징
		 $('[name=rowCntProductPerPageProduct]').change(function(){
		 goSearchProduct();
		});
		$(".pagingNumberProduct").html(
	  			getPagingNumber(
	  				"${productRankingAllCnt}"
	  				, "${masterRentListDTO.selectProductPageNoProduct}"
	  				, "${masterRentListDTO.rowCntProductPerPageProduct}"
	  				,"5"
	  				,"goSearchProduct();"
	  				,'selectProductPageNoProduct'
	  			)
	  		);
		$('[name=selectProductPageNoProduct]').val("${masterRentListDTO.selectProductPageNoProduct}");
		$('[name=rowCntProductPerPageProduct]').val("${masterRentListDTO.rowCntProductPerPageProduct}");


		// 회사 페이징
		$('[name=rowCntProductPerPageCompany]').change(function(){
			goSearchCompany();
			});
			$(".pagingNumberCompany").html(
		  			getPagingNumber(
		  				"${companyCnt}"
		  				, "${masterRentCompanyListDTO.selectProductPageNoCompany}"
		  				, "${masterRentCompanyListDTO.rowCntProductPerPageCompany}"
		  				,"5"
		  				,"goSearchCompany();"
		  				,'selectProductPageNoCompany'
		  			)
		  		);
			$('[name=selectProductPageNoCompany]').val("${masterRentCompanyListDTO.selectProductPageNoCompany}");
			$('[name=rowCntProductPerPageCompany]').val("${masterRentCompanyListDTO.rowCntProductPerPageCompany}");

	 */

		//-------------------------------------------------------------

	 	var avgDataJan  = 0;
	 	var avgDataFeb = 0;
	 	var avgDataMar = 0;
	 	var avgDataApr= 0 ;
	 	var avgDataMay = 0;
	 	var avgDataJun = 0;
	 	var avgDataJul= 0 ;
	 	var avgDataAug= 0;
	 	var avgDataSep= 0 ;
	 	var avgDataOct= 0 ;
	 	var avgDataNov = 0;
	 	var avgDataDec = 0;
	 	var cnt = 0;
	 	// 평균 구하기
	 	<c:forEach items="${productMonthCnt}" var="data" varStatus="status">	
		
					avgDataJan = avgDataJan + ${data.Jan}
					avgDataFeb = avgDataFeb + ${data.Feb}
					avgDataMar = avgDataMar + ${data.Mar}
					avgDataApr = avgDataApr + ${data.Apr}
					avgDataMay = avgDataMay + ${data.May}
					avgDataJun = avgDataJun + ${data.Jun}
					avgDataJul = avgDataJul + ${data.Jul}
					avgDataAug = avgDataAug + ${data.Aug}
					avgDataSep = avgDataSep + ${data.Sep}
					avgDataOct = avgDataOct + ${data.Oct}
					avgDataNov = avgDataNov +${data.Nov}
					avgDataDec = avgDataDec + ${data.Dec}
				cnt++;
		</c:forEach>
		var avgArray = [Math.round(avgDataJan/cnt), Math.round(avgDataFeb/cnt), Math.round(avgDataMar/cnt), Math.round(avgDataApr/cnt), Math.round(avgDataMay/cnt), Math.round(avgDataJun/cnt), Math.round(avgDataJul/cnt), 
			Math.round(avgDataAug/cnt), Math.round(avgDataSep/cnt), Math.round(avgDataOct/cnt), Math.round(avgDataNov/cnt), Math.round(avgDataDec/cnt) ]

		// 제품별 차트 그리기	
		<c:forEach items="${productMonthCnt}" var="data" varStatus="status">	
				var productCntData = []
				productCntData.push("${data.Jan}")
				productCntData.push("${data.Feb}")
				productCntData.push("${data.Mar}")
				productCntData.push("${data.Apr}")
				productCntData.push("${data.May}")
				productCntData.push("${data.Jun}")
				productCntData.push("${data.Jul}")
				productCntData.push("${data.Aug}")
				productCntData.push("${data.Sep}")
				productCntData.push("${data.Oct}")
				productCntData.push("${data.Nov}")
				productCntData.push("${data.Dec}")



					
		var ctx = document.getElementById('myChart${status.count}');
		var config = {
				type: 'line',
				data: {
					labels: [   "1월", "2월", "3월",
						"4월", "5월", "6월", "7월","8월","9월","10월","11월","12월"  ],
					datasets: [{
						label: '제품 데이터',
						backgroundColor: 'rgba(75, 192, 192, 1)',
						borderColor: 'rgba(75, 192, 192, 1)',
						fill: false,
						data: productCntData,
					}, {
						label: '제품 평균 데이터',
						backgroundColor: 'rgba(255, 99, 132, 1)',
						borderColor: 'rgba(255, 99, 132, 1)',
						fill: false,
						data: avgArray,
					}]
				},
				options:  {
					maintainAspectRatio: false,
					title: {
						text: 'Chart.js Time Scale'
					},
					scales: {
						yAxes: [{
							scaleLabel: {
								display: true,
								labelString: '렌트 개수'
							},
							//y 좌표 글자 크기
							ticks: {
				                fontSize: 20
				            }
						}],
						//x 좌표 글자 크기
					  xAxes: [{
				            ticks: {
				                fontSize: 20
				            }
				        }]
						
					},
					// 상단 label 크기
					legend: {
			            labels: {
			                fontSize:15
			            }
			        },
				}
			};

			//차트 그리기
			var myChart = new Chart(ctx, config);
			
		</c:forEach>


		var ctx = document.getElementById('avgChart');
		var config = {
				type: 'line',
				data: {
					labels: [   "1월", "2월", "3월",
						"4월", "5월", "6월", "7월","8월","9월","10월","11월","12월"  ],
					datasets: [{
						label: '제품 데이터',
						backgroundColor: 'rgba(255, 99, 132, 1)',
						borderColor: 'rgba(255, 99, 132, 1)',
						fill: false,
						data: avgArray,
					}],
				},
				options: {
					maintainAspectRatio: false,
					title: {
						text: 'Chart.js Time Scale'
					},
					scales: {
						yAxes: [{
							scaleLabel: {
								display: true,
								labelString: '렌트 개수'
							},
							ticks: {
				                fontSize: 20
				            }
						}],
					  xAxes: [{
				            ticks: {
				                fontSize: 20
				            }
				        }]
						
					},
					legend: {
			            labels: {
			                fontSize:15
			            }
			        }
				}
				
			};
/* 
		{
			maintainAspectRatio: true,
			responsive: false,
			scales: {
		        xAxes: [{
		            ticks: {
		                fontSize: 40
		            }
		        }]
		    },
			legend: {
	            labels: {
	                fontSize:15
	            }
	        }
		}
 */
			//차트 그리기
			var myChart = new Chart(ctx, config);
		 
	
	
})/* END */

</script>



</head>
<body  style="font-size:15pt;font-weight:600;">
	<%@include file="/WEB-INF/views/master/aside.jsp"%>


	<!-- Right Panel -->

				<div id="right-panel" class="right-panel"  style="font-size:15pt;font-weight:600;">
			
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
											<h1>렌트 물품현황 [총 : ${productRankingAllCnt}개의 제품]</h1>
										</div>
									</div>
								</div>
								<div class="col-sm-8">
									<div class="page-header float-right">
										<div class="page-title">
											<ol class="breadcrumb text-right">
												<!--    <li><a href="#">Dashboard</a></li> -->
												<li><a href="#">데이터 조회</a></li>
												<li class="active">렌트 물품현황</li>
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
		                                <h4>품목별 월별 렌트 현황</h4>
		                            </div>
		                            <div class="card-body">
		                                <%-- <p class="text-muted m-b-15">To center/justify the tabs and pills, use the <code>.nav-justified</code> class.</p> --%>
		
		
										<!-- href 와 id의 값이 같아야 연동이 된다. 중복 안됨!! -->
		                                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
		                                    <li class="nav-item">
		                                        <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">전체</a>
		                                    </li>
		                                    <c:forEach items="${rentProductLabels}" var="data" varStatus="status">				
			 									<li class="nav-item">
			                                       <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile${status.count}" role="tab" aria-controls="pills-profile" aria-selected="false">${data.rental_product}</a>
			                                   </li>
											</c:forEach>
		                                  
		                                </ul>
		                                
		                                
			                                <div class="tab-content" id="pills-tabContent">
			                                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
			                                        <h3>전체 품목 평균 개수</h3>
			           
			                                          <%--   <canvas id="allRentChart" height="60" ></canvas>  --%>
														
														   <div style="position: relative; height:300px; ">
																 <canvas id="avgChart"  ></canvas> 
															</div>
			
			                                     </div>
			                                     
			                                     <c:forEach items="${rentProductLabels}" var="data" varStatus="status">				
				 										<div class="tab-pane fade" id="pills-profile${status.count}" role="tabpanel" aria-labelledby="pills-profile-tab">
					                                        <h3>${data.rental_product}</h3>

					                                           <div style="position: relative; height:300px; ">
																 <canvas id="myChart${status.count}"></canvas>
															</div>

					                                    </div>
												</c:forEach>
									
			                                </div>

		
		                            </div>
		                        </div>
		                    </div>
						
						
					</div>
			<!-- .animated -->
			</div>
			
					<div class="row">


							<div class="col-lg-6">
								<div class="card">
									<div class="card-header">
										<strong class="card-title">[총 : ${productRankingAllCnt}개의 제품] 인기별 순위</strong> 
											
											<%--  <form name="rentListProductForm" method="post" action="/javaBang/master/rentListForm.do">
											      <div style="width:800">
											     	 [검색]: <input type="text" name="keyword1" class="keyword1"> 
											         <input type="hidden" name="selectProductPageNoProduct">
											         <table border=0 width=700 align="center">
											         <tr>
											         <td align="center">
											         <select name="rowCntProductPerPageProduct">
											            <option value="5">5
											            <option value="10">10
											            <option value="15">15
											         </select>행보기
											      </table>
											      </div>
											      
									      		</form> --%>
									</div>
									
									<div class="card-body">
										<table class="table table-striped" id="bootstrap-data-table" style="font-size: 15pt;">
											<thead>
												<th>순위</th>
												<th>상품명</th>
												<th>최근 3개월 실적</th>
											</thead>
											<tbody>
										
											  <c:forEach items="${productRankingCnt}" var="data" varStatus="status">	
	
											  					
				 										<tr>
														<td>${data.ranking}</td>
														<td>${data.product_name}</td>
														<td>렌트된 개수 : ${data.result} </td>
														</tr>	

												</c:forEach>
											</tbody>
										</table>
										     
								 <!--    <div>&nbsp;<span class="pagingNumberProduct" align="center"></span>&nbsp;</div>
								     -->
	<%-- 								      <table><tr height=10><td></table>
									   <form name="rentListProductFormHidden" method="post" action="/javaBang/master/rentListForm.do">
									      <input type="hidden" name="selectProductPageNoProduct" value="${param.selectProductPageNo}">
									      <input type="hidden" name="rowCntProductPerPageProduct" value="${param.rowCntProductPerPage }">
									   </form> 
									 --%>
										
									</div>
								</div>
							</div>
													
	
	
							<div class="col-lg-6">
								<div class="card">
									<div class="card-header">
										<strong class="card-title">[총 : ${companyCnt}개의 회사] 실적</strong>  <%-- ${masterCustomerGraph[0].rentalCnt} --%>
										
									<%-- 	<form name="rentListCompanyForm" method="post" action="/javaBang/master/rentListForm.do">
											      <div style="width:800">
											         <input type="hidden" name="selectProductPageNoCompany">
											      </div><br>
											      <table border=0 width=700 align="center">
											         <tr>
											         <td align="center">
											         <select name="rowCntProductPerPageCompany">
											            <option value="5">5
											            <option value="10">10
											            <option value="15">15
											         </select>행보기
											      </table>
									      	</form> --%>
									</div>
									<div class="card-body">
										<table class="table table-striped" id="bootstrap-data-table" style="font-size: 15pt;">
											<thead>
												<th>순위</th>
												<th>회사명</th>
												<th>최근 3개월 실적</th>
											</thead>
											<tbody>
										<%-- 	<c:set var="loop_flag" value="false" /> --%>
											  <c:forEach items="${companyRankingCnt}" var="data" varStatus="status">	
								<%-- 			 		 	<c:if test="${30 > data.ranking }">
												            <c:set var="loop_flag" value="true" />
												        </c:if>
											  		<c:if test="${not loop_flag }"> --%>
											  						
				 										<tr>
															<td>${data.ranking}</td>
															<td>${data.COMNAME}</td>
															<td>렌트된 제품 개수 : ${data.result}</td>
														</tr>														
<%-- 													</c:if> --%>
												</c:forEach>
											</tbody>
										</table>
										
										
										<%--  <div>&nbsp;<span class="pagingNumberCompany" align="center"></span>&nbsp;</div>
								    
									      <table><tr height=10><td></table>
									   <form name="rentListCompanyFormHidden" method="post" action="/javaBang/master/rentListForm.do">
									      <input type="hidden" name="selectProductPageNoCompany" value="${param.selectProductPageNo}">
									      <input type="hidden" name="rowCntProductPerPageCompany" value="${param.rowCntProductPerPage }">
									   </form>  --%>
									
									</div>
								</div>
							</div>
					
					
					</div>
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
