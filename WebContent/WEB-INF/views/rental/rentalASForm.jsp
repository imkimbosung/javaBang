<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/common.jsp"%>
    <%@include file="/WEB-INF/views/loading.jsp" %>
<!DOCTYPE html>
<html>
<head>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
	<link rel="stylesheet" href="/javaBang/resources/assets/css/cs-skin-elastic.css">
	<link rel="stylesheet" href="/javaBang/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css">
	<link rel="stylesheet" href="/javaBang/resources/assets/css/style.css">
	
	<script>

		function openContentForm(ru_no)
		{
		   location.href='${ctRentalRoot}/rentASConForm.do?ru_no='+ru_no
		}

		function jubsu(rt_board_no)
		{
			if(confirm("접수하시겠습니까?")==false){return;}
			$("[name=rt_board_no]").val(rt_board_no);
			$.ajax
			({
				url:"${ctRentalRoot}/rentalASCompanyProc.do"
				,type:"post"
				,data:$('[name=board_no]').serialize()
				,success : function(rentalASCompanyCnt)
				{
					if(rentalASCompanyCnt==1)
					{
						alert("접수완료");
						location.replace("${ctRentalRoot}/rentalASForm.do");
					}
					else{alert("접수실패");}
				}

				,error : function()
				{
					alert("서버통신실패");
				}
			});
		}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/views/rental/incloudfile/rentalLeftMenu.jsp" %>

<form name=board_no action="${ctRentalRoot}/rentalASCompanyProc.do">
	<input type=hidden name=rt_board_no value=0>
</form>
<div class="col-md-10" style="margin-left: auto;font-size:${rentalfont};">
	<div class="col-lg-4" id="root"  style="margin: 10 0 10 -15;"">
		<h1 class="mt-4 mb-3">JAVABANG</h1>
	    	<ol class="breadcrumb" style="margin-bottom: auto;">
	     		 <li class="breadcrumb-item active" style="color:#212529"><b>빌려방 AS신청현황</b></li>
	   		 </ol>	
	</div>
	<div class="card">
		
		<div class="card-body">
			<table id="bootstrap-data-table" class="table table-striped table-bordered">
			<thead>
<tr>
	<th width=70px style="font-size:${rentalfont}">종류
	<th style="font-size:${rentalfont}">모델명
	<th width=150px style="font-size:${rentalfont}">신청자 이메일
	<th width=150px style="font-size:${rentalfont}" >신청자명
	<th style="font-size:${rentalfont}">전화번호
	<th style="font-size:${rentalfont}">작성날짜
	<th style="font-size:${rentalfont}">접수상태
	<th style="font-size:${rentalfont}">
</thead>

<tbody >
<c:forEach items="${rentalASList}" var="rentalASList" varStatus="loopTagStatus">
<tr style="cursor:pointer"onClick="openContentForm(${rentalASList.ru_no});">
	<td style="font-size:${rentalfont}">${rentalASList.rental_product}
	<td style="font-size:${rentalmodelfont}">${rentalASList.rp_model_name}
	<td style="font-size:${rentalmodelfont}">${rentalASList.b_id}
	<td align="center"  style="font-size:${rentalfont}">${rentalASList.b_name}
	<td style="font-size:${rentalfont}">${rentalASList.b_phone}
	<td style="font-size:${rentalfont}">${rentalASList.rt_board_reg_date}
	<td style="font-size:${rentalfont}">
		<c:if test="${rentalASList.rt_board_readcount==0}">
			접수대기중
		</c:if>
		<c:if test="${rentalASList.rt_board_readcount==1}">
			접수완료
		</c:if>
			<td>
			<c:if test="${rentalASList.rt_board_readcount==0}">
			<input type=button class="btn btn-info btn-sm" value="접수" onClick="jubsu(${rentalASList.rt_board_no});"style="font-size:${rentalbuttonfont}"">
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
    			}},
    			dom: 'Blfrtip',
    	        buttons: [{
    	            extend: 'excelHtml5',
    	            text: 'excel 파일 다운',
    	            footer: true,
    	            className: 'exportBtn',
    	            title: 'AS신청현황'
    	        }]
    		})
      } );
  </script>
</body>
</html>