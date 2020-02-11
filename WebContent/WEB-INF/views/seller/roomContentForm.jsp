<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>
<%@include file="/WEB-INF/views/seller/incloudfile/topBar.jsp" %>
    
<!DOCTYPE html>
<c:if test="${empty sellerInfoDTO}">
	<script>
		alert("공실 정보가 삭제되었습니다.");
		location.replacement("/javaBang/emptyListForm.do");
	</script>
</c:if>
<html lang="en">
<head>

  <meta charset="utf-8">
  <!-- shrink-to-fit=no는 애플의 safari(사파리) 브라우저에만 영향을 미치는 속성..? -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>정보 상세보기</title>

<%-- <!--===============================================================================================-->
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
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> --%>
	<!-- 예쁜셀렉트박스 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="author" content="colorlib.com">
	
    <link href="${ctRoot}/resources/selectbox/css/main.css" rel="stylesheet" />
  <script>
  	function goemptyUpDelForm(){
  		document.emptyUpDelForm.submit();
  	}
  	
  	function goemptyListForm(){
  		document.emptyListForm.submit();
  	}

	function goconfirmCodeUpdate(confirmCode){
  		if(confirmCode=='confirm'){
  			$('[name=confirmCode]').val("confirm");
			if(confirm("계약 완료를 진행하시겠습니까?")==false){return;}
  		}
  		$.ajax({
  			url: "${ctSellerRoot}/emptyListProc.do"
  			, type : "post"
  			, data : $("[name='roomContentForm']").serialize()
  			, success: function(UpdateCnt){
  				console.log(UpdateCnt);
                if(confirmCode=="confirm"){
                	if(UpdateCnt==1 ){
                        alert("공실 계약이 완료되었습니다.");
                        location.replace("${ctSellerRoot}/emptyListForm.do");
                     }else if(UpdateCnt==-1){
                        alert("공실 계약이 완료되지 않았습니다. 해당 공인중개사에게 문의 바랍니다.");
                     }else {
                        alert("서버쪽 DB연동 실패");
                     }
                }
  			}
  			, error : function(){
                alert("서버와 통신 실패")
            }
  		});
  	}
  	
  </script>
</head>
<body style="font-size:18pt">


  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
   
    <div id="root" style="margin-top:150px;">
	    <h1 class="mt-4 mb-3">JAVABANG
     	 <small>팔아방</small>
    	</h1>
	</div>
	
    <ol class="breadcrumb" style="margin-bottom:80px;">
      <li class="breadcrumb-item active">공실정보 상세보기</li>
    </ol>
    
    

    <!-- UpDel Row -->
	<form class="roomContentForm" name="roomContentForm" method="post" action="${ctSellerRoot}/roomContentForm.do">
		<input type="hidden" name="sr_no" value="${sellerInfoDTO.sr_no}">
		<input type="hidden" name="confirmCode" value="no">
		<div class="container">
    <div class="row">
        <!-- panel preview -->
        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-body form-horizontal payment-form">
                    <div class="form-group">
                        <label for="concept" class="col-sm-3 control-label" style="font-weight: bold; font-size:25pt;">등록번호</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="concept" name="concept" style="font-size:23pt;" value="${sellerInfoDTO.sr_no} " disabled>                           
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-sm-3 control-label" style="font-weight: bold; font-size:25pt;">소유주</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="description" name="description" style="font-size:23pt;" value="${sellerInfoDTO.s_name}" disabled>
                        </div>
                    </div> 
                    <div class="form-group">
                        <label for="amount" class="col-sm-3 control-label" style="font-weight: bold; font-size:25pt;">방형태</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="amount" name="amount" style="font-size:23pt;" value="${sellerInfoDTO.sr_roomtype }" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="amount" class="col-sm-3 control-label" style="font-weight: bold; font-size:25pt;">계약형태</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="amount" name="amount" style="font-size:23pt;" value="${sellerInfoDTO.sr_selltype } 로 계약되었습니다.    금액 :  <c:if test="${sellerInfoDTO.selltype_code==3}"> ${sellerInfoDTO.sr_selltype}  ${sellerInfoDTO.monthly_rent}   보증금  ${sellerInfoDTO.deposit} </c:if>
<c:if test="${sellerInfoDTO.selltype_code==2}"> ${sellerInfoDTO.sr_selltype}  ${sellerInfoDTO.price_jeonse} </c:if>
<c:if test="${sellerInfoDTO.selltype_code==1}"> ${sellerInfoDTO.sr_selltype}  ${sellerInfoDTO.price_sale} </c:if>" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="amount" class="col-sm-3 control-label" style="font-weight: bold; font-size:25pt;">공실위치</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="amount" name="amount" style="font-size:23pt;" value="${sellerInfoDTO.sr_main_addr}   ${sellerInfoDTO.sr_addr_detail}" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="amount" class="col-sm-3 control-label" style="font-weight: bold; font-size:25pt;">옵션형태</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="amount" name="amount" style="font-size:23pt;"value="${sellerInfoDTO.sr_optiontype}" disabled>
                        </div>
                    </div>  
        </div>
    </div>
</div>
<br><br><br>
		<c:if test="${sellerInfoDTO.check_owner_code!=4}">
 		<div style="margin:200 " ></div>
	 		<input class="btn btn-outline-dark" type="button" value="정보 수정/삭제" onClick="goemptyUpDelForm();" style="height:50; font-size:20pt; font-weight: bold;">
	 		<input  class="btn btn-outline-dark" type="button" value="공실 목록보기" onClick="goemptyListForm();" style="height:50; font-size:20pt; font-weight: bold;">
			</c:if>
		<c:if test="${sellerInfoDTO.check_owner_code==4}">
		<div style="margin:200"></div>
			<input class="btn btn-info" type="button" value="계약 완료" onClick="goconfirmCodeUpdate('confirm')" style="height:50;font-size:x-large;">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input  class="btn btn-warning" type="button" value="공실 목록보기" onClick="goemptyListForm();" style="height:50;font-size:x-large;">
		</c:if>	 
	</form>
		 	<form name="emptyListForm" method="post" action="${ctSellerRoot}/emptyListForm.do">
		 		<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
		 		<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
		 		<script>
		 			$("[name=emptyListForm]").hide();
		 		</script>
		 	</form>
		 	<form name="emptyUpDelForm" method="post" action="${ctSellerRoot}/emptyUpDelForm.do">
		 		<input type="hidden" name="sr_no" value="${param.sr_no}">
		 		<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
		 		<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
		 	</form>
<%-- 		 	<form name="checkRoomForm" method="post" action="/javaBang/checkRoomForm.do">
		 		pk번호-> <input type="text" name="sr_no" value="${param.sr_no}">
		 	</form>
 --%>		</div>
    <!-- /.row -->


	


  <!-- Bootstrap core JavaScript -->
  <script src="${ctRoot}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${ctRoot}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Contact form JavaScript -->
  <!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
  <script src="${ctRoot}/resources/js/jqBootstrapValidation.js"></script>
  <script src="${ctRoot}/resources/js/contact_me.js"></script>

<%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>



</body>
</html>