<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/common.jsp"%>
     <%@include file="/WEB-INF/views/loading.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/style.css">
<script>
/*매개변수로 들어온값이용해서 렌탈물건 배달완료및 기간시작하기
 * 이미 시작한경우 이미 했다고 뜸
 */

function gorentalSubjubsu(ru_no,rental_start_date)
{
	
	if(confirm("렌탈을 시작하시겠습니까?")==false){return;}
	$("[name=ru_no]").val(ru_no);
	$("[name=rental_start_date]").val(rental_start_date);
	
	$.ajax
	({
		url:"${ctRentalRoot}/rentalSubCompanyProc.do"
		,type:"post"
		,data:$('[name=goSubjubsu]').serialize()
		,success : function(subJubsucnt)
		{
			if(subJubsucnt==1)
			{
				alert("접수가 완료되었습니다.");
				location.replace("${ctRentalRoot}/rentalSubForm.do");
			}
			else if(subJubsucnt==-1){alert("이미접수되었습니다.");}
		}

		,error : function()
		{
			alert("서버통신에 실패했습니다.");
		}
	});
}
</script>
<meta charset="UTF-8">
<title>JAVABANG</title>
</head>
<body>
<%@include file="/WEB-INF/views/rental/incloudfile/rentalLeftMenu.jsp" %>

<form name=goSubjubsu >
<input type=hidden name=ru_no >
<input type=hidden name=rental_start_date value=null>
</form>
<div class="col-lg-10" style="margin-left: auto;font-size:${rentalfont};">
	<div class="col-lg-4" id="root"  style="margin: 10 0 10 -15;">
		<h1 class="mt-4 mb-3">JAVABANG</h1>
	    	<ol class="breadcrumb" style="margin-bottom: auto;">
	     		 <li class="breadcrumb-item active" style="color:#212529"><b>빌려방 렌탈신청현황</b></li>
	   		 </ol>	
	</div>
	<div class="card">
		
		<div class="card-body">
			<table id="bootstrap-data-table" class="table table-striped table-bordered">
			<thead>
				<tr>
					<th style="font-size:${rentalfont}">종류
					<th style="font-size:${rentalfont}">신청자 이메일
					<th style="font-size:${rentalfont}">신청자명
					<th style="font-size:${rentalfont}">전화번호
					<th style="font-size:${rentalfont}">신청일
					<th style="font-size:${rentalfont}">기간
					<th style="font-size:${rentalfont}">시작
					<th style="font-size:${rentalfont}">종료
					<th style="font-size:${rentalfont}">접수
			</thead>
			<tbody>
				<c:forEach items="${rentalSubList}" var="rentalSubList" varStatus="loopTagStatus">
					<tr>
						<td style="font-size:${rentalmodelfont}">${rentalSubList.rental_product}
						<td style="font-size:${rentalmodelfont}">${rentalSubList.b_id}
						<td style="font-size:${rentalmodelfont}">${rentalSubList.b_name}
						<td style="font-size:${rentalmodelfont}">${rentalSubList.b_phone}
						<td style="font-size:${rentalmodelfont}">${rentalSubList.rental_date}
						<td style="font-size:${rentalmodelfont}">${rentalSubList.rental_term}
						<td style="font-size:${rentalmodelfont}">
							<c:if test="${rentalSubList.rental_start_date==null}">
							배달대기중
							</c:if>
							<c:if test="${rentalSubList.rental_start_date!=null}">
								${rentalSubList.rental_start_date}
							</c:if>
						<td style="font-size:${rentalmodelfont}">${rentalSubList.rental_end_date}<c:if test="${rentalSubList.date<=0}"><font color="red"> (계약만료)</font></c:if>
						<td>
							<c:if test="${rentalSubList.rental_start_date==null}">
							<input type=button value="접수" onClick="gorentalSubjubsu(${rentalSubList.ru_no},'${rentalSubList.rental_start_date}')"style="font-size:${rentalbuttonfont}">
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
        	        title: '렌탈신청현황'
    	        }]
    		})
      } );
  </script>
</body>
</html>