<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@include file="/WEB-INF/views/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공실정보 상세보기</title>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
    <link rel="stylesheet" href="${ctRoot}/resources/loginPage/css/title_ui.css">
<!--===============================================================================================-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<!-- 예쁜셀렉트박스 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="author" content="colorlib.com">
    <link href="${ctRoot}/resources/selectbox/css/main.css" rel="stylesheet" />
	<script>
  		function goCheckOwner(checkOwner){
  			if(checkOwner=='check'){
  				$('[name=checkOwner]').val("check");
  				if(confirm("해당 공실의 소유자 확인을 진행하시겠습니까?")==false){return;}
  			}else if(checkOwner=='register'){
  				$('[name=checkOwner]').val("register");
  				if(confirm("해당 공실을 내 관리공실 목록에 추가하시겠습니까?")==false){return;}
  			}
  			$.ajax({
                url: "${ctRealtorRoot}/productContentProc.do"
                , type:"post"
                , data:$('[name=productContent]').serialize()
                , success: function(CheckCnt){
                   if(checkOwner=="check"){
                      if(CheckCnt == 1 ){
                           alert("공실의 소유자가 확인되었습니다.");
                           location.replace("${ctRealtorRoot}/managementHouse.do");
                        }else if(CheckCnt==-1){
                           alert("공실의 소유자 확인되지 않습니다.");
                        }else {
                           alert("서버쪽 DB연동 실패");
                        }
                   }else if(checkOwner=="register"){
                      if(CheckCnt == 1 ){
                           alert("공실이 목록에 추가되었습니다.");
                           location.replace("${ctRealtorRoot}/managementProduct.do");
                        }else if(CheckCnt==-1){
                           alert("공실의 목록에 추가되지 않았습니다.");
                        }else {
                           alert("서버쪽 DB연동 실패");
                        }
                   }
                   
                   /* else if(checkOwner=="contract"){
                       if(CheckCnt == 1 ){
                            alert("공실 계약이 완료 되었습니다.");
                            location.replace("${ctRealtorRoot}/managementProduct.do");
                         }else if(CheckCnt==-1){
                            alert("계약할 공실이 존재하지 않습니다.");
                         }else {
                            alert("서버쪽 DB연동 실패");
                         }
                    } */
                   
                   
                 }
                 ,error: function(){
                    alert("서버와 통신 실패")
                 }
              });
   		}
 	</script>

</head>
 <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
    <!-- Header -->
		<div class="site-section-cover overlay" style="background-image: url('/javaBang/resources/images/boodong.png')">
			<div class="container">
				<div class="row align-items-center justify-content-center text-center" style="height:200px;margin-left:70;">
					<div class="col-md-10" style="margin-left: 300;">
						<h3 class="mb-1" style="padding: 15px;font-weight: bold;text-align: center;background-color: #ffffff;opacity: 0.9;width: 400;">매칭 대기중인 매물 상세정보</h3>
					</div>
				</div>
			</div>
		</div>
	<%@include file="/WEB-INF/views/realtor/incloudfile/proLeftMenu.jsp" %>
		<div class="container" style="margin-left: 650;">
		<div class="row">
			<div class="col-lg-8 mb-4">
	    	<ol class="breadcrumb" style="margin-top:50px;">
	      		<li class="breadcrumb-item active">공실정보 상세보기</li>
	    	</ol>
    		<!-- Content Detail Row -->
    		<form class="productContent" name="productContent" method="post" action="${ctSellerRoot}/productContentProc.do">
    			<input type="hidden" name="sr_no" value="${realtorProductDTO.sr_no}" >
    			<input type="hidden" name="checkOwner" var="check" >
	      		<div class="container">
			 <div class="row">
			 	<!-- panel preview -->
			 	<br><br><br>
			 	<div class="col-sm-12">
            		<div class="panel panel-default">
                		<div class="panel-body form-horizontal payment-form">
                    		<div class="form-group">
                        		<label for="concept" class="col-sm-3 control-label">등록번호</label>
                  				<div class="col-sm-9">
                            		<input type="text" class="form-control" id="concept" name="concept" value="${realtorProductDTO.sr_no }" disabled>
                        		</div>
                  			</div>
                  			<div class="form-group">
		                        <label for="description" class="col-sm-3 control-label">소유주</label>
		                        <div class="col-sm-9">
		                            <input type="text" class="form-control" id="description" name="description" value="${realtorProductDTO.s_name }" disabled>
                        		</div>
                    		</div>
		                    <div class="form-group">
		                        <label for="amount" class="col-sm-3 control-label">방형태</label>
		                        <div class="col-sm-9">
		                            <input type="text" class="form-control" id="amount" name="amount" value="${realtorProductDTO.sr_roomtype }" disabled>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="amount" class="col-sm-3 control-label">계약형태</label>
		                        <div class="col-sm-9">
		                            <input type="text" class="form-control" id="amount" name="amount" value="${realtorProductDTO.sr_selltype } 로 계약되었습니다.     금액 :  <c:if test="${realtorProductDTO.selltype_code==3 }"> ${realtorProductDTO.sr_selltype }  ${realtorProductDTO.monthly_rent }   보증금  ${realtorProductDTO.deposit }만원 </c:if>
<c:if test="${realtorProductDTO.selltype_code==2 }"> ${realtorProductDTO.sr_selltype }  ${realtorProductDTO.price_jeonse }만원</c:if>
<c:if test="${realtorProductDTO.selltype_code==1 }"> ${realtorProductDTO.sr_selltype }  ${realtorProductDTO.price_sale }만원 </c:if>" disabled>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="amount" class="col-sm-3 control-label">공실위치</label>
		                        <div class="col-sm-9">
		                            <input type="text" class="form-control" id="amount" name="amount" value="${realtorProductDTO.sr_main_addr }   ${realtorProductDTO.sr_addr_detail }" disabled>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="amount" class="col-sm-3 control-label">옵션형태</label>
		                        <div class="col-sm-9">
		                            <input type="text" class="form-control" id="amount" name="amount" value="${realtorProductDTO.sr_optiontype }" disabled>
		                        </div>
		                    </div>
		        </div>
		    </div>
		</div>
				<div style="margin:10"></div>

							<c:if test="${realtorProductDTO.check_owner_code==1}">
					 			<input class="btn btn-success" type="button" value="등록하기 " onClick="goCheckOwner('register')" style="height:50;">
					 			<input  class="btn btn-warning" type="button" value="공실목록 " onClick="location.replace('${ctRealtorRoot}/managementProduct.do');" style="height:50;">
					 		</c:if>	
							<c:if test="${realtorProductDTO.check_owner_code==2}">
					 			<input class="btn btn-outline-dark" type="button" id="amount" name="amount" value="소유자 확인" onClick="goCheckOwner('check')" style="height:50;">
					 			<input  class="btn btn-outline-dark" type="button" value="공실목록 " onClick="location.replace('${ctRealtorRoot}/managementHouse.do');" style="height:50;">
					 		</c:if>
					 		<c:if test="${realtorProductDTO.check_owner_code==3}">
					 		
					 			<input  class="btn btn-outline-dark" type="button" value="공실목록 " onClick="location.replace('${ctRealtorRoot}/managementHouse.do');" style="height:50;">
					 		</c:if>	
					 		<c:if test="${realtorProductDTO.check_owner_code==4}">
					 			<input  class="btn btn-outline-dark" type="button" value="공실목록 " onClick="location.replace('${ctRealtorRoot}/managementHouse.do');" style="height:50;">
					 		</c:if>
					 		<c:if test="${realtorProductDTO.check_owner_code==5}">
					 			<input  class="btn btn-outline-dark" type="button" value="공실목록 " onClick="location.replace('${ctRealtorRoot}/managementHouse.do');" style="height:50;">
					 		</c:if> 
			</form>
		 	<form name="managementProduct" method="post" action="${ctRealtorRoot}/managementProduct.do">
		 		<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
		 		<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
		 		<script>
		 			$("[name=managementProduct]").hide();
		 		</script>
		 	</form>
		 	<form name="managementHouse" method="post" action="${ctRealtorRoot}/managementHouse.do">
		 		<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
		 		<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
		 		<script>
		 			$("[name=managementProduct]").hide();
		 		</script>
		 	</form>
		</div>
	</div>
</body>
  <%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
</html>