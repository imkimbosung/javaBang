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
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>Master - 중개인현황</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

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

<!-- 테이블 -->
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
        <link rel="stylesheet" href="/javaBang/resources/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/style.css">




	
	



<script>

$(document).ready(function(){

	
	
	/*$ ('[name=rowCntPerPage]').change(function(){
			goSearch();
		});
	
	$(".pagingNumber").html(
	  			getPagingNumber(
	  				"${realtorListAllCnt}"
	  				, "${masterRealtorInfoDTO.selectPageNo}"
	  				, "${masterRealtorInfoDTO.rowCntPerPage}"
	  				,"5"
	  				,"goSearch();"
	  				,"selectPageNo"
	  			)
	  		);
		$('[name=selectPageNo]').val("${masterRealtorInfoDTO.selectPageNo}");
  		$('[name=rowCntPerPage]').val("${masterRealtorInfoDTO.rowCntPerPage}"); */

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
  	        title: 'realtorList'
 	        }]
 		}) 
  		 
  		 
	
	
})/* END */


/* function goSearch(){
		document.realtorInfoForm.submit();
	} */

</script>



</head>
<body style="font-size:15pt;">
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
								<h1>중개인 현황</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<!--    <li><a href="#">Dashboard</a></li> -->
									<li><a href="#">데이터 조회</a></li>
									<li class="active">중개인 현황</li>
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
										<strong class="card-title">총 중개인 수</strong> 총 ${realtorListAllCnt} 명
									</div>
									<div class="card-body">
					<%-- 				<form name="realtorInfoForm" method="post" > --%>
											<table id="bootstrap-data-table" class="table table-striped table-bordered" style="font-size:15pt;">
												<thead>
													<th>중개사 명</th>
													<th>휴대폰 번호</th>
													<th>관리중인 매물 수</th>
													<th>거래완료된 매물 수</th>
													<th>거래 완료 비율</th>
													<th>평 점</th>
												</thead>
												<tbody>
									
												  <c:forEach items="${getRealtorInfo}" var="data" varStatus="status">	
	
												  					
					 									<tr>
															<td>${data.r_name}</td>
															<td>${data.r_phone}</td>
															<td>${data.management} </td>
															<td>${data.finish} </td>
															<c:if test="${data.management==0}">
																<td>0 %</td> 
															</c:if>
															<c:if test="${data.management!=0}">
																<fmt:formatNumber var="value1" value="${data.management}" pattern="#.#"/>
																<fmt:formatNumber var="value2" value="${data.finish}" pattern="#.#"/>
																<td><fmt:formatNumber  value="${value2/value1*100}"  pattern="#.#"/>% </td> 
															</c:if>
															<c:if test="${data.grade==0}">
																<td> 평가 이전 </td>
															</c:if>
															<c:if test="${data.grade!=0}">
																<%-- <td><fmt:formatNumber var="value3" value="${data.grade}" pattern="#.#"/></td> --%>
																<td>${data.grade} 점</td>
															</c:if>
															
															
														</tr>	
	
													</c:forEach> 
												</tbody>
											</table>
										
										<%--  <div>&nbsp;<span class="pagingNumber" align="center"></span>&nbsp;</div>
										 
										 <form name="realtorInfoForm" method="post" action="/javaBang/master/realtorListForm.do">
										      <div style="width:800">
										         <input type="hidden" name="selectPageNo">
										      </div><br>
										      <table border=0 width=700 align="center">
										         <tr>
										         <td align="center">
										         <select name="rowCntPerPage">
										            <option value="5">5
										            <option value="10">10
										            <option value="15">15
										         </select>행보기
										      </table>
									      </form>
										 
										      <input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
   											  <input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage }"> --%>
   										
   										
   										
   		
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
