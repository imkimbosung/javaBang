<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="/WEB-INF/views/common.jsp"%> 
     <%@include file="/WEB-INF/views/loading.jsp" %>
<%@include file="/WEB-INF/views/buyer/incloudfile/topBar.jsp"%>
<!DOCTYPE html>
<html>
<head>
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
    
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="/javaBang/resources/star/fontawesome-stars.css">
<script type="text/javascript" src="/javaBang/resources/star/jquery.barrating.min.js"></script>
    
<script>

/*AS신청페이지이동*/
function goASSub(ru_no,date)
{
	if(date<=0){alert("계약만료로 인해 신청불가");return;}
	if(confirm("AS신청하실?")==false){return;}
	var ru_no=ru_no
	$("[name=ru_no]").val(ru_no);
	document.goAS.submit();
};


function goreviewform(rp_no)
{
	$("[name=rp_no]").val(rp_no);
	document.goreview.submit();
}


</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form name=goreview action=${ctBuyerRoot}/buyerreviewForm.do >
<input type=hidden name=rp_no>
</form>


<form name=goAS action=${ctBuyerRoot}/buyerASForm.do>
<input type=hidden name=ru_no>
</form>
<div class="col-md-12">
	<div >
		<div >
			<table id="bootstrap-data-table" class="table table-striped ">
			<thead>
<tr>
	<th>종류
	<th>모델명
	<th>회사명
	<th>회사전화번호
	<th>회사주소
	<th>신청일
	<th>신청개월수
	<th>렌탈시작날짜
	<th>렌탈종료날짜
	<th>AS신청
	<th>별점
	</thead>
	<tbody>
<c:forEach items="${buyerRentalSubList}" var="buyerRentalSubList" varStatus="loopTagStatus">
<tr>

	<td>${buyerRentalSubList.rental_product}
	<td>${buyerRentalSubList.rp_model_name}
	<td>${buyerRentalSubList.rt_comname}
	<td>${buyerRentalSubList.rt_phone}
	<td>${buyerRentalSubList.rt_comaddr}
	<td>${buyerRentalSubList.rental_date}
	<td>${buyerRentalSubList.rental_term}
	
	<td>
	<c:if test="${buyerRentalSubList.rental_start_date==null}">
		접수대기중
	</c:if>
	<c:if test="${buyerRentalSubList.rental_start_date!=null}">
		${buyerRentalSubList.rental_start_date}
	</c:if>
	<td>${buyerRentalSubList.rental_end_date}<c:if test="${buyerRentalSubList.date<=0}"><font color="red"> (계약만료)</font></c:if>
	<td>
		<c:if test="${buyerRentalSubList.rental_start_date!=null}">
			<input type=button value=AS신청 onClick="goASSub(${buyerRentalSubList.ru_no},${buyerRentalSubList.date});">
		</c:if>
	<td><select id="rentalstar${loopTagStatus.count}" > 
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
	</select> 
	<script type="text/javascript"> 
	$("#rentalstar${loopTagStatus.count}").val(${buyerRentalSubList.rp_score});

			$('#rentalstar${loopTagStatus.count}').barrating({
				theme : 'fontawesome-stars'
					, onSelect: function(value, text, event){ 
						if(${buyerRentalSubList.rp_score}==0){
						$.ajax
						({
							url:"${ctBuyerRoot}/rentalInsertReviewProc.do"
							,type:"post"
							,data:{b_no:${buyerRentalSubList.b_no},rp_no:${buyerRentalSubList.rp_no},rp_score:value,ru_no:${buyerRentalSubList.ru_no},rpr_no:${buyerRentalSubList.rpr_no}}
							,success : function(getBuyerReviewcnt)
							{
								if(getBuyerReviewcnt==1)
								{
									alert("등록성공");
									
								}
								else if(getBuyerReviewcnt==-1)
								{
									//alert("실패");
									$.ajax
									({
										url:"${ctBuyerRoot}/rentalInsertReReviewProc.do"
										,type:"post"
										,data:{b_no:${buyerRentalSubList.b_no},rp_no:${buyerRentalSubList.rp_no},rp_score:value,ru_no:${buyerRentalSubList.ru_no},rpr_no:${buyerRentalSubList.rpr_no}}
										,success : function(getBuyerReviewcnt)
										{
											if(getBuyerReviewcnt==1)
											{
												alert("수정성공");
												
											}
											else if(getBuyerReviewcnt==-1)
											{
												alert("실패");
											}
											else{alert("수정실패");}
										}

										,error : function()
										{
											alert("서버통신실패");
										}
									});
								}
								else{alert("등록실패");}
							}

							,error : function()
							{
								alert("서버통신실패");
							}
						});}
						
						if(${buyerRentalSubList.rp_score}>0){
							$.ajax
							({
								url:"${ctBuyerRoot}/rentalInsertReReviewProc.do"
								,type:"post"
								,data:{b_no:${buyerRentalSubList.b_no},rp_no:${buyerRentalSubList.rp_no},rp_score:value,ru_no:${buyerRentalSubList.ru_no},rpr_no:${buyerRentalSubList.rpr_no}}
								,success : function(getBuyerReviewcnt)
								{
									if(getBuyerReviewcnt==1)
									{
										alert("수정성공");
										
									}
									else if(getBuyerReviewcnt==-1)
									{
										alert("실패");
									}
									else{alert("수정실패");}
								}

								,error : function()
								{
									alert("서버통신실패");
								}
							});}
						
						}
		});
	</script>
</c:forEach>
</tbody>
</table>
</div>
</div>
</div><center>
<div>
	 <input type=button value=AS신청확인 onClick="location.replace('${ctBuyerRoot}/buyerRentalASSubForm.do');"> 
</div></center>

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