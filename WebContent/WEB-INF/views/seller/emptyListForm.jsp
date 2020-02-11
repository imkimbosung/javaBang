<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="/WEB-INF/views/common.jsp" %>
     <%@include file="/WEB-INF/views/loading.jsp" %>
<%@include file="/WEB-INF/views/seller/incloudfile/topBar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <!-- shrink-to-fit=no는 애플의 safari(사파리) 브라우저에만 영향을 미치는 속성..? -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>공실 관리</title>
  
  <style>
  	.table td {vertical-align: top;}
  </style>
<%-- <!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/perfect-scrollbar/perfect-scrollbar.css"> --%>
<!--===============================================================================================-->
    <link rel="stylesheet" href="${ctRoot}/resources/loginPage/css/title_ui.css">
<!--===============================================================================================-->
	
	<link rel="stylesheet" href="/javaBang/resources/table/css/main.css">
​
  <script>
  	$(document).ready(function(){
  		$('[name=rowCntPerPage]').change(function(){
  			goSearch();
  		});
  		$(".pagingNumber").html(
  	  			getPagingNumber(
  	  				"${emptyRoomAllCnt}"
  	  				, "${sellerRoomSearchDTO.selectPageNo}"
  	  				, "${sellerRoomSearchDTO.rowCntPerPage}"
  	  				,"5"
  	  				,"goSearch();"
  	  				,"selectPageNo"
  	  			)
  	  		);
  		$('[name=selectPageNo]').val("${sellerRoomSearchDTO.selectPageNo}");
  		$('[name=rowCntPerPage]').val("${sellerRoomSearchDTO.rowCntPerPage}");
  		/* inputData("[name=selectPageNo]","${sellerDTO.selectPageNo}");
  		inputData("[name=rowCntPerPage]","${sellerDTO.rowCntPerPage}"); */
  	});
  	function goSearch(){
  		document.emptyListForm.submit();
  	}
  	function goCheckRoom(){
  		location.replace("checkRoomForm.do");
  	}
  	function goRoomContentForm(sr_no){
  		var str = "sr_no="+sr_no+"&"+$("[name=emptyListForm]").serialize();
//  		alert("str=>"+ "sr_no=" + sr_no +"&"+$("[name=emptyListForm]").serialize());
  		location.replace("${ctSellerRoot}/roomContentForm.do?"+str);
  	}
  </script>
</head>
<body style="font-size:x-large">
  <!-- Page Content -->
   <div class="container">
    <!-- Page Heading/Breadcrumbs -->
   <div id="root">
      <h1 class="mt-4 mb-3">JAVABANG
       </h1>
       <ol class="breadcrumb">
         <li class="breadcrumb-item active"><b>공실관리알아보기   </b><button type="button" id="modal_opne_btn">?</button></li>
       </ol>   
   </div>
   <!-- 공실이용 팝업창 -->
   <div id="modal">
       <div class="modal_content" width="60%">
           <center><h4>공실관리 이용안내</h4></center>
           <hr size="0">
		        <p>∙등록한 공실은 잡아방 공실센터에 공개됩니다.</p>
		        <p>∙공실에 공인중개사가 매칭이 되는 날부터 광고가 시작됩니다.</p>
		        <p>∙중개사무소는 공실을 잡아방에 30일동안 광고할 수 있습니다.</p>
		        <p>∙공인중개사의 확인 후 판매자 확인이 완료가 완료되어야 공실 판매가 완료됩니다.</p>
		        <p>∙공실 판매가 완료된 경우, '계약 확인' 버튼을 눌러 판매 완료 확인을 진행해주세요.</p>
		        <p>∙공실 삭제는 광고 중인 중개사무소가 없을 경우 가능합니다.<br>
		        	(광고종료 후 삭제해 주세요.)</p>
           <button class="btn btn-outline-dark" type="button" id="modal_close_btn" style="margin: 20 20 20 500;">
              <b  style="font-size:x-large">접어두기</b>
           </button>
       </div>
       <div class="modal_layer"></div>
   </div>
   <script>
       document.getElementById("modal_opne_btn").onclick = function() {
           document.getElementById("modal").style.display="block";
       }
       document.getElementById("modal_close_btn").onclick = function() {
           document.getElementById("modal").style.display="none";
       }
   </script>
    <ol class="breadcrumb">
      <li class="breadcrumb-item active">공실관리  >>        <b> ${emptyRoomAllCnt} </b>개의 공실이 있습니다.</li>
    </ol>
    <!-- Content Row -->
    <br>
    <!-- emptyRoomList Form -->
  <!-- /.container -->
		<br>
	<c:if test="${emptyRoomAllCnt==0}">
		<div align="center">
			<font size="6" ><b>등록된 공실이 없습니다.</b></font>
			<br>
			<font size="5"  color="gray">
			 	공실을 등록하면 중개사무소가 <b>javaBang</b>에 광고를 합니다.
			</font>		
			<br><br>
			<input type="button" style="width:130pt; height:35pt" value="공실 등록하기" onClick="goCheckRoom();">
		</div>
	</c:if>
	<c:if test="${emptyRoomAllCnt!=0}">		
	<center>
	<table class="table" style="font-size:15pt">
		<tr bgcolor="lightblue" align="center">
			<th style="width:12%";>공실번호<th style="width: 38%";>공실정보<th style="width: 25%;">공실센터 공개기간<th style="width: 25%;">공실현황<th>공실관리
		<c:forEach items="${emptyRoomList}" var="seller" varStatus="loopTagStatus">
			<tr style="cursor:pointer;" onClick="goRoomContentForm(${seller.sr_no});">
				<td style="vertical-align: middle;padding-left: 4%;padding-right: 4%;;">${seller.sr_no}
				<td><p> <!-- 탭과 공실정보(룸타입) 사이간격 -->
					<font size="6" color="blue" ><b>${seller.sr_roomtype}</b></font>
					<c:if test="${seller.selltype_code==3}">
						<br><font size="5" color="black"><b>월세${seller.monthly_rent}만원/보증금${seller.deposit}만원</b></font>
					</c:if>
<%-- 					<c:if test="${seller.selltype_code==3}">
						<font size="3" color="black" ><b>반전세   월세${seller.deposit}/보증금${seller.monthly_rent}</b></font>
					</c:if> --%>
					<c:if test="${seller.selltype_code==2}">
						<br><font size="5" color="black"><b>전세${seller.price_jeonse}만원</b></font>
					</c:if>
					<c:if test="${seller.selltype_code==1}">
						<br><font size="5" color="black"><b>매매${seller.price_sale}만원</b></font>
					</c:if>
				</p>
				<p><font size="4" color="gray" >${seller.sr_main_addr}<br> ${seller.sr_addr_detail}</font></p>
				<p style="line-height:0;"><font size="5" color="darkgray" >${seller.reg_date}</font></p>
			</td>	
			
			<!-- 공실 공개일 -->
			<c:choose>
			<c:when test="${seller.check_owner_code==3}">
				<td style="vertical-align: middle;"> <font size="4"  >${seller.open_date_start } ~ ${seller.open_date_end }</font> </td>
			</c:when>
			<c:when test="${seller.check_owner_code==4}">
				<td style="vertical-align: middle;"> <b>${seller.check_owner }</b> </td>
			</c:when>
			<c:otherwise>
				<td style="vertical-align: middle;"> ${seller.check_owner } </td>
			</c:otherwise>
			</c:choose>
			
			<!-- 공실 현황 -->
 			<c:if test="${seller.check_owner_code!=4}">
 				<td align="center" style="vertical-align: middle;"> ${seller.check_owner }</td>
 			</c:if>

 			<c:if test="${seller.check_owner_code==4}">
 			<td align="center" style="vertical-align: middle;"> 
 				<font size="3" color="red">계약이 완료되었습니다.<br>계약확인을 눌러주세요.</font>
 			</td>
 			</c:if>
 	
 			<!-- 공실 관리 -->
			<td align="center" style="vertical-align: middle;">
				<c:if test="${seller.check_owner_code==4}">
					<p><input type="button" class="confirmCodeUpdate btn btn-info " value="계약 확인" onClick=""></p>
				</c:if>		
				<c:if test="${seller.check_owner_code!=4}">
					<p><input type="button" class="emptyUpDel btn btn-outline-dark " value="정보수정" onClick=""></p>
				</c:if>
			</td>
			
		</c:forEach>
	</table>
	</c:if>
	
		<form name="emptyListForm" method="post" action="${ctSellerRoot}/emptyListForm.do">
	      <div style="width:800">
	         <input type="hidden" name="selectPageNo">
	      </div><br>
	      
	         <select name="rowCntPerPage" style="font-size:15pt">
	            <option value="1">1
	            <option value="5">5
	            <option value="10">10
	         </select>행보기
      </form>
      
      
      <div>&nbsp;<span class="pagingNumber" align="center"></span>&nbsp;</div>
   <form name="emptyUpDelForm" method="post" action="${ctSellerRoot}/emptyUpDelForm.do">
      <input type="hidden" name="sr_no" value="${param.sr_no}">
      <input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
      <input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage }">
   </form>
  </div>
<%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
</body>
</html>