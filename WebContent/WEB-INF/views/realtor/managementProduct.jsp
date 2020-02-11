d<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@include file="/WEB-INF/views/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="${ctRoot}/resources/nav/bootstrap.css">
<meta charset="UTF-8">
<title>공인중개사 상품관리</title>

	<!-- 예쁜셀렉트박스 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="author" content="colorlib.com">
	<script>
		$(document).ready(function(){
			$('[name=rowCntPerPage]').change(function(){
	  			goSearch();
	  		});

			$('[name=selectPageNo]').val("${realtorProductDTO.selectPageNo}");
	  		$('[name=rowCntPerPage]').val("${realtorProductDTO.rowCntPerPage}");
	  		/* $('[name=sr_no]').val("${realtorProductDTO.sr_no}"); */
	  		
	  		$(".pagingNumber").html(
	  			getPagingNumber(
	  				"${emptyRoomAllCnt}"
	  				,"${realtorProductDTO.selectPageNo}"
	  				,"${realtorProductDTO.rowCntPerPage}"
	  				,"9"
	  				,"goSearch();"
	  				,'selectPageNo'
	  			)
	  		);
	  		
	  	});
	  	function goSearch(){
	  		document.managementProduct.submit();
	  	}
	   	function goproductContent(sr_no){
	  		 var str = "sr_no="+sr_no+"&"+$("[name=managementProduct]").serialize();
	  		 //alert("str=>"+ "sr_no=" + sr_no +"&"+$("[name=managementProduct]").serialize());
	  		 location.replace("${ctRealtorRoot}/productContent.do?"+str);
	  		/* document.productContent.submit(); */
	  	}
	</script>
</head>
 <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300"  style="margin-top: -1%;">
   <!-- Header -->
		<div class="site-section-cover overlay" style="background-image: url('/javaBang/resources/images/boodong.png')">
			<div class="container">
				<div class="row align-items-center justify-content-center text-center" style="height:200px;margin-left:70;">
					<div class="col-md-10" style="margin-left: 300;">
						<h3 class="mb-1" style="padding: 15px;font-weight: bold;text-align: center;background-color: #ffffff;opacity: 0.9;width: 400;">매칭대기중인  매물</h3>
					</div>
				</div>
			</div>
		</div>
<%@include file="/WEB-INF/views/realtor/incloudfile/proLeftMenu.jsp" %>
	<div class="site-wrap" id="home-section">
    <div>
      <div class="container" style="margin-top: 50;">  
	</div><br><br>
        
        
<div class="col-lg-8 bg-light" style=";width: 100%;margin-left: 450;font-size:15pt;">	
		
        <div id="root">
		<div class="col-md-10" style="float: left;margin: 10 auto;width: fit-content;">
			<div id="root">
			    <ol class="breadcrumb">
			      <li class="breadcrumb-item active"><b>${emptyRoomAllCnt} 건의 등록된 공실이 있습니다.  </b></li>
			    </ol>	
				</div>
			</div>
		</div>
			<div class="container" style="padding:50px;">
		      <div class="row" style="margin-top: 100;">
		       <c:if test="${emptyRoomAllCnt!=0}">
				<c:forEach items="${emptyRoomList}" var="realtorProduct" varStatus="loopTagStatus">
			        <div class="col-4" style="margin-bottom: 30;">
			          <div class="card">
			          	<a href="javascript:goproductContent(${realtorProduct.sr_no});">
			           	 <img src="${ctImageRoot}/${realtorProduct.sellroom_image}" alt="Image"  style="max-width: 100%; height:250; " class="img-fluid" >
			            </a>
			            <div class="card-body" style="height:350px;">
			              <h5><a href="#" class="d-block" onClick="goproductContent(${realtorProduct.sr_no}); return false;">공실번호 :${realtorProduct.sr_no}</a></h5>
			              <div class="text">
									<div class="justify-content-between mb-3">
										<div class="bath d-flex align-items-center"> <span>판매자 : ${realtorProduct.s_name}</span></div>
										<div class="bed d-flex align-items-center"> <span>매물타입 : ${realtorProduct.sr_roomtype}</span></div>
										<div class="sq d-flex align-items-center"> <span>크기 : ${realtorProduct.sr_roomsize}m²</span></div>
									</div>
									<h5 class="mb-3"><a href="#">
										<c:if test ="${realtorProduct.selltype_code==1}"> ${realtorProduct.sr_selltype}:${realtorProduct.price_sale}만원</c:if><c:if test ="${realtorProduct.selltype_code==2}"> ${realtorProduct.sr_selltype}:${realtorProduct.price_jeonse}만원</c:if><c:if test ="${realtorProduct.selltype_code==3}"> ${realtorProduct.sr_selltype}:${realtorProduct.monthly_rent}만원 보증금:${realtorProduct.deposit}만원</c:if>
									</a></h5>
									<span class="d-block small address d-flex align-items-center"> <span class="icon-room mr-3 text-primary"></span> <span  style="font-size:15pt;">${realtorProduct.sr_main_addr}<br>${realtorProduct.sr_addr_detail}</span></span>
								</div>
			                   <br><a href="#" class="btn btn-primary" onClick="goproductContent(${realtorProduct.sr_no}); return false;"  style="font-size:15pt;">상세보기</a>
			            </div>
			          </div>
			        </div>
			        </c:forEach>
            <form name="managementProduct" method="post" action="${ctRealtorRoot}/managementProduct.do">
               <div style="width:800">
                  <input type="hidden" name="selectPageNo">
                  <!-- <input type="text" name="sr_no" value="">    -->      
               </div><br>
               <div class="col-md-5">
                        <select name="rowCntPerPage">
                     <option value="3">3
                     <option value="6">6
                     <option value="9">9
                  </select>행보기
				</div>
		</form>
          <center>
            <div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
            </center>
         </c:if>
      </div>
        
        
		
		
		</div>
	</div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
  <%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
 </html>