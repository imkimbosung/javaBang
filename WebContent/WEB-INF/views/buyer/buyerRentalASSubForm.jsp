<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
     <%@include file="/WEB-INF/views/common.jsp"%>
     <%@include file="/WEB-INF/views/loading.jsp" %>
<%@include file="/WEB-INF/views/buyer/incloudfile/topBar.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/javaBang/resources/table/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
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
</script>
<meta charset="UTF-8">
<title>JAVABANG</title>
</head>
<body>
<div ></div>


<div class="col-md-12">
	<div >
		<div>
			<table id="bootstrap-data-table" class="table table-striped ">
			<thead>
<tr>
	<th>종류
	<th>모델명
	<th>회사명
	<th>회사전화번호
	<th>렌탈시작날짜
	<th>신청개월수
	<th>제목
	<th>내용
	<th>AS신청일
	<th>접수
	</thead>
	<tbody>
<c:forEach items="${buyerrentalASList}" var="buyerrentalASList" varStatus="loopTagStatus">
<tr>
	<td>${buyerrentalASList.rental_product}
	<td>${buyerrentalASList.rp_model_name}
	<td>${buyerrentalASList.rt_comname}
	<td>${buyerrentalASList.rt_phone}
	<td>${buyerrentalASList.rental_start_date}
	<td>${buyerrentalASList.rental_term}
	<td>${buyerrentalASList.rt_board_subject}
	<td width=500px>${buyerrentalASList.rt_board_content}
	<td>${buyerrentalASList.rt_board_reg_date}
	<td>
	<c:if test="${buyerrentalASList.rt_board_readcount==0}">
		접수대기중
	</c:if>
	<c:if test="${buyerrentalASList.rt_board_readcount==1}">
		접수완료
	</c:if>
	
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
    
	<script src="${ctRoot}/resources/nav/custom.js"></script> 
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