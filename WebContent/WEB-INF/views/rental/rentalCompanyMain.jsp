<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/common.jsp"%>
     <%@include file="/WEB-INF/views/loading.jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/style.css">
    
<!-- 공지사항 코드 -->
<script src="${ctRoot}/resources/Socket.js" type="text/javascript"></script>

<script>
/*물품들록페이지로이동*/
function goupdateRentalProduct(rp_no)
{
	location.replace('${ctRentalRoot}/rentalProductInsert.do?rp_no='+rp_no);
}
</script>
<title>RENTAL - HOME</title>
</head>
<body>
<%@include file="/WEB-INF/views/rental/incloudfile/rentalLeftMenu.jsp" %>

<div class="col-lg-10" style="margin-left: auto;font-size:20pt;">
<div class="col-lg-4" id="root"  style="margin: 10 0 10 -15;">
		<h1 class="mt-4 mb-3">JAVABANG</h1>
	    	<ol class="breadcrumb" style="margin-bottom: auto;">
	     		 <li class="breadcrumb-item active" style="color:#212529"><b>빌려방 렌탈제품관리</b></li>
	   		 </ol>	
	</div>
	<div class="card">
		<div class="card-body">
			<table id="bootstrap-data-table" class="table table-striped table-bordered">
			<thead>
				<tr>
					<th style="font-size:${rentalfont}">물품명
					<th style="font-size:${rentalfont}">모델명
					<th style="font-size:${rentalfont}">렌탈가격
					<th style="font-size:${rentalfont}">재고
					<th style="font-size:${rentalfont}">평가점수
					<th style="font-size:${rentalfont}">수정
			</thead>
			<tbody>
				<c:forEach items="${insertProductList}" var="insertProductList" varStatus="loopTagStatus">
				<tr>
					<td style="font-size:${rentalfont}">${insertProductList.rental_product}
					<td style="font-size:${rentalmodelfont}">${insertProductList.rp_model_name}
					<td style="font-size:${rentalfont}">${insertProductList.rp_price}
					<td style="font-size:${rentalfont}">${insertProductList.rp_count}
					<td style="font-size:${rentalfont}"><fmt:formatNumber  value="${insertProductList.rp_score}"  pattern="#.#"/>/5.0
					<td style="font-size:${rentalfont}"><a class="btn btn-info btn-sm" href="javascript:goupdateRentalProduct(${insertProductList.rp_no});"style="font-size:${rentalbuttonfont}">수정</a>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>


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
 <script type="text/javascript">
        $(document).ready(function() {
        	$("#bootstrap-data-table").dataTable().fnDestroy();
    		$("#bootstrap-data-table").dataTable({"language": {
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
    			}}})
      } );
  </script>
</body>
</html>