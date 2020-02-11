<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/buyer/incloudfile/topBar.jsp" %>
     <%@include file="/WEB-INF/views/loading.jsp" %>

<html>
<head>
<style>
td{
font-size:${rentallistfont};
}
</style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
  <!--   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/style.css">
    
    <link rel="stylesheet" href="${ctRoot}/resources/nav/bootstrap.css">
    <link rel="stylesheet" href="/javaBang/resources/table/css/main.css">
<script>

/*클릭이벤트 클릭시 목록갱신*/
$(document).ready
(
	function()
	{
		$("#bootstrap-data-table").dataTable().fnDestroy();
		$("#bootstrap-data-table").dataTable({"language": {
			"emptyTable": "체크박스눌러주삼",
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
			}}})
	
		$(".as").click
		(
			function()
			{
				
				
				
				var code=[];
				 for(var i=1;i<=$(".as").length;i++){
					 
					if($(".as").filter("[value="+i+"]").is(":checked")){code.push($(".as").filter("[value="+i+"]").val());}
					
				} 
				
				
				
				
				var data={'rental_product_code':code}
				
				$("#bootstrap-data-table").dataTable().fnDestroy();
				var tableset=$('#bootstrap-data-table').DataTable(
				{
					ajax:
					{
						'url':'/javaBang/buyer/rentListFormProc.do'
						,'type':'post'
						,'data':data
						,'dataSrc':'data'
					},
					columns:
					[
						{"data": "rental_product",
							"render": function(data, type, row)
							{
								if(type=='display')
								{
									data = '<a href="javascript:goConForm('+row['rp_no']+')">'+data+'</a>'
								}
								return data;
							}
						},
						
						{"data": "rp_model_name",
							"render": function(data, type, row)
							{
								if(type=='display')
								{
									data=data+"..."
									data = '<a href="javascript:goConForm('+row['rp_no']+')">'+data+'</a>'
								}
								return data;
							}
						}, 
						
						{"data": "rt_comname",
							"render": function(data, type, row)
							{
								if(type=='display')
								{
									data = '<a href="javascript:goConForm('+row['rp_no']+')">'+data+'</a>'
								}
								return data;
							}
						},
						
						{"data": "rp_price",
							"render": function(data, type, row)
							{
								if(type=='display')
								{
									data = '<a href="javascript:goConForm('+row['rp_no']+')">'+ data + '</a>';
								}
								return data;
							}
						},
						
						{"data": "rp_count",
							"render": function(data, type, row)
							{
								if(type=='display')
								{
									data = '<a href="javascript:goConForm('+row['rp_no']+')">'+data+'</a>'
								}
								return data;
							}
						}
					],
					"language": {
				"emptyTable": "데이터가 없어요.",
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
				}}
				});
			}
		);
	}
);
function goConForm(rp_no)
{
	var openNewWindow = window.open("about:blank");
	openNewWindow.location.href='${ctBuyerRoot}/rentConForm.do?rp_no='+rp_no
}
</script>

	<title>JAVABANG</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="/javaBang/resources/assets/css/cs-skin-elastic.css">-->
    <link rel="stylesheet" href="/javaBang/resources/table/css/main.css">
	<!--  <link rel="stylesheet" href="/javaBang/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/style.css"> -->
<!--===============================================================================================-->	
<!--===============================================================================================-->
<!--===============================================================================================-->
<!--===============================================================================================-->
<!--===============================================================================================-->
<!--===============================================================================================-->
<!--===============================================================================================-->
	<%-- <link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/css/util.css">
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/css/main.css"> --%>
<!--===============================================================================================-->
</head>
<body><center>

<div class="container" style="margin-top:30px;">
	<div class="breadcrumb"><b>옵션선택</b></div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel-body" style="margin: auto;">
                <form name=goserachproductlist action="${ctBuyerRoot}/rentListForm.do">
				<c:forEach items="${ProductList}" var="ProductList" varStatus="loopTagStatus" >
					<div class="btn btn-outline-dark col-lg-2 custom-control custom-checkbox" style="float:left;margin: 1% 0.8% 1% 0.1%;">
							<input type="checkbox" class="custom-control-input as"  name="rental_product_code${loopTagStatus.count}" id="rent${loopTagStatus.count}" autocomplete="off" value="${ProductList.rental_product_code}">
						<label class="custom-control-label" for="rent${loopTagStatus.count}">
						<font size=${rentallistfont2}>${ProductList.rental_product}</font></label>
					</div>
				</c:forEach>
				</form>
			</div>
		</div>
	</div>
         <div style="padding:30px;"> </div>
       <div class="col-md-12" style="margin: 0% 40% 0% -10%;font-size:${rentallistfont}">
			<table  class="table table-striped" id="bootstrap-data-table" style="width: 1300;">
				<thead>
					<tr>
						<th style="width:auto">제품</th>
						<!-- <th style="width:auto">지역</th> -->
						<th style="width:auto">모델명</th>
						<th style="width:auto">회사이름</th>
						<th style="width:auto">가격(￦/월)</th>
						<th style="width:auto">수량</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rentalProductList}" var="rentalProductList" varStatus="loopTagStatus">
						<tr style="cursor:pointer" onClick="goConForm(${rentalProductList.rp_no})">
							<td>${rentalProductList.rental_product}</td>
							<%-- <td>${rentalProductList.rt_comaddr}</td> --%>
							<td>${rentalProductList.rp_model_name}...</td>
							<td>${rentalProductList.rt_comname}</td>
							<td>${rentalProductList.rp_price}</td>
							<td>${rentalProductList.rp_count}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</div>
</div>
</center>
<%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
  <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
    <script src="/javaBang/resources/assets/js/main.js"></script>
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
<!--===============================================================================================-->
	<script src="${ctRoot}/resources/rentList/js/main.js"></script>
<!--===============================================================================================-->
	<script src="${ctRoot}/resources/checkRoom/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${ctRoot}/resources/checkRoom/js/jqBootstrapValidation.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
</body>
</html>