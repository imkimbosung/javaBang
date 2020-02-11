
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/seller/incloudfile/topBar.jsp" %>
<c:if test="${empty sellerInfoDTO}">
	<script>
		alert("emptyUpDelForm 공실정보가 삭제되었습니다.");
		location.replace("${ctSellerRoot}/emptyListForm.do");
	</script>
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>

	<meta charset="utf-8">
	<!-- shrink-to-fit=no는 애플의 safari(사파리) 브라우저에만 영향을 미치는 속성..? -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>공실 정보</title>
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
<!--===============================================================================================-->--%>
	<link rel="stylesheet" href="${ctRoot}/resources/radio/radio.css">
	<!-- 예쁜셀렉트박스 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="author" content="colorlib.com"> 
	<script>
	$(document).ready(function(){
   	 var checkOption = $("[name='checkboxBundle']");
   	 var checkValue = $("[name='select_option']").val();

  	 $("[name='option_code']").change(function(){
    		var value = $(this).val();
    		console.log(value);
    		
    		
    		if(value==0){
    			$("[name='select_option']").prop("checked",false);
    			$("[id='option_select_code0']").prop("checked",false);
    			$("[name='select_option']").change(function(){
    				
    				if($('input:checkbox[name="select_option"]').is(":checked") ==  true){
    					$(this).prop("checked",false);
    				}
    				
    				$(this).prop("checked",true);
    				
    				$("[name='select_option'][id='option_select_code0']").prop("checked",false);
    			});
 			}
    		
    		
    		else{
    			if(value==1){
        			$("[name='select_option']").prop("checked",false);
    				$("[name='select_option'][id='option_select_code0']").prop("checked",true);
        			$("[name='select_option']").change(function(){
        				$(this).prop("checked",false);
        				$("[name='select_option'][id='option_select_code0']").prop("checked",true);
        			});
    			}
    		}
    	 });
     
	 });
	
  		function checkEmptyUpDelForm(upDel){
  	 		
  			if(upDel=='del'){
  				if(is_empty("[name=s_pwd]")){
  					alert("암호를 입력해주세요.");
  					$("[name=s_pwd]").focus();
  					return;
  				}
  				$("[name=upDel]").val("del");
  				if(confirm("정말 삭제하시겠습니까?")==false){return;}
  			}
  			else if(upDel=='up'){
  				$("[name=upDel]").val("up");
  				if(is_empty("[name=roomtype_code]")){
  					alert("방 형태를 입력해주세요.");
  					$("[name=roomtype_code]").focus();
  					return;
  				}
  				if(is_empty("[name=option_code]")){
  					alert("옵션 형태를 입력해주세요.");
  					$("[name=option_code]").focus();
  					return;
  				}
  				if(is_empty("[name=s_pwd]")){
  					alert("비밀번호를 입력해주세요.");
  					$("[name=s_pwd]").focus();
  					return;
  				}
  				if(confirm("정말 수정하시겠습니까?")==false){return;}
  			}
  			
//  			alert($('[name=emptyUpDelForm]').serialize())
  			//return;
  			
  			$.ajax({
                url: "${ctSellerRoot}/emptyUpDelProc.do"
                , type:"post"
                , data:$('[name=emptyUpDelForm]').serialize()
                , success: function(upDelCnt){
                   if(upDel=="up"){
                      if(upDelCnt >= 1 ){
                           alert("입력하신 정보가 수정되었습니다.");
                           location.replace("${ctSellerRoot}/emptyListForm.do");
                        }else if(upDelCnt==-1){
                           alert("해당 공실이 존재하지 않습니다.");
                        }else if(upDelCnt==-2){
                           alert("비밀번호가 잘못 입력되었습니다.");
                        }else {
                           alert("서버쪽 DB연동 실패");
                        }
                   }else if(upDel=="del"){
                      if(upDelCnt==1){
                           alert("입력하신 정보가 삭제되었습니다.");
                           location.replace("${ctSellerRoot}/emptyListForm.do");
                        }else if(upDelCnt==-1){
                           alert("해당 공실이 존재하지 않습니다.");
                        }else if(upDelCnt==-2){
                           alert("비밀번호가 잘못 입력되었습니다.");
                        }else {
                           alert("서버쪽 DB연동 실패");
                        }
                   
                   }

                  }
                ,error: function(){
                   alert("서버와 통신 실패")
                }
             });
  		}
	</script>
	
	
</head>
<body>

<!-- jQuery.noConflict(); -->
  <!-- Page Content -->
  <div class="container">
    <!-- Page Heading/Breadcrumbs -->
    <div id="root" style="margin-top:150px">
	    <h1 class="mt-4 mb-3">JAVABANG
     	 <small>팔아방</small>
    	</h1>
	</div>
    <ol class="breadcrumb">
      <li class="breadcrumb-item active">공실정보 수정하기</li>
    </ol>
    <!-- UpDel Row -->
	<div class="row">
	
		<div class="col-sm-8">
	   	 	<c:if test="${!empty sellerInfoDTO}">
			 	<form:form name="emptyUpDelForm" method="post" commandName="sellerInfoDTO">
			 		<table class="table">
				 		<tr>
				 			<th style="width: 200;">소유주
				 			<td >${sellerInfoDTO.s_name}
				 		<tr>
				 			<th >공실 등록번호
				 			<td >${sellerInfoDTO.sr_no}
				 		<tr>
				 			<th style="vertical-align: middle;">방 형태
				 			<td ><!-- 2020.01.19 SOYEON'S -->
				 			
				 			<div class="col-md-4">
										<div class="form-check">
										<c:forEach items="${roomTypeCode}" var="room" varStatus="status">	
											<label>
												<input type="radio" id="roomtype_code${status.count}" name="roomtype_code" value="${room.roomtype_code}" 
													<c:if test="${sellerInfoDTO.roomtype_code eq room.roomtype_code}">
														checked = "checked"
													</c:if>
												> 
												<span class="label-text">${room.roomtype}</span>
											</label>
										</c:forEach>
										</div>
								</div>
							</td>	
				 		
				 		<tr>
		                      <th >계약 형태
		                      <td > <c:if test="${sellerInfoDTO.selltype_code==2}"> ${sellerInfoDTO.sr_selltype} ${sellerInfoDTO.price_jeonse}만원</c:if>
                                  <c:if test="${sellerInfoDTO.selltype_code==3}"> ${sellerInfoDTO.sr_selltype} ${sellerInfoDTO.monthly_rent}만원    보증금    ${sellerInfoDTO.deposit}만원</c:if>
                                  <c:if test="${sellerInfoDTO.selltype_code==1}"> ${sellerInfoDTO.sr_selltype} ${sellerInfoDTO.price_sale}만원</c:if>
				 		<tr>
				 			<th >공실 위치정보
				 			<td width=400>${sellerInfoDTO.sr_main_addr}   ${sellerInfoDTO.sr_addr_detail}
				 		<tr>
				 			<th style="vertical-align: middle;">옵션 형태
				 			<td >	
				 			<div class="col-sm-12">
				 			<c:forEach items="${optionTypeCode}" var="optionType" varStatus="status">
								<div class="form-check">
								
									<label>
									
											<input type="radio" id="option_type_code${status.count}" name="option_code"  value="${optionType.option_type_code}"
												<c:if test="${sellerInfoDTO.option_code eq optionType.option_type_code}">
													checked = "checked"
												</c:if>
											> 
											<span class="label-text">${optionType.option_type}</span>
									
									</label>
								</div>
								</c:forEach>
							</div>
								<%-- <c:forEach items="${optionTypeCode}" var="optionType" varStatus="status">		
									${optionType.option_type}
									<input id="option_type_code${status.count}" name="option_code" style="margin:10;padding:10;" class="custom-control-input" type="radio" value="${optionType.option_type_code}"
										<c:if test="${sellerInfoDTO.option_code eq optionType.option_type_code}">
											checked = "checked"
										</c:if>
									>
								</c:forEach> --%>
							<tr>						
							<th style="vertical-align: middle;">선택옵션			
							<td>					
								<div class="row" id="checkboxBundle" style="padding:20px 20px 20px 50px;">	
								<c:forEach items="${optionSelectCode}" var="optionSelect" varStatus="status">	
								<label>					
											<div class="form-check">
													<input type="checkbox" id="option_select_code${optionSelect.option_select_code}" name="select_option" value="${optionSelect.option_select_code}"> <span class="label-text">${optionSelect.option_select_type}</span>
											</div>
								</label>
								</c:forEach>
								
									<%-- <c:forEach items="${optionSelectCode}" var="optionSelect" varStatus="status">			
										${optionSelect.option_select_type}	
										<input id="option_select_code${optionSelect.option_select_code}" name="select_option" style="margin:10;padding:10;" class="custom-control-input" type="checkbox" value="${optionSelect.option_select_code}">	
									</c:forEach> --%>					
 
            					</div>
            				</td>
 				 		
						<tr>
				 			<th >비밀번호
				 			<td >	
				 				<form:password path="s_pwd" className="s_pwd"/>		
					</table>
					<br><br>
					<table><tr height=4><td></table>
					<input type="hidden" name="upDel" value="up">
					<input type="hidden" name="sr_no" value="${sellerInfoDTO.sr_no}">
					<input type="button" class="btn btn-outline-dark" value="수정" onClick="checkEmptyUpDelForm('up');">
					<input type="button" class="btn btn-outline-dark" value="삭제" onClick="checkEmptyUpDelForm('del');">
					<input type="button" class="btn btn-outline-dark" value="공실목록" onClick="document.emptyListForm.submit();">
				 </form:form>	
				 <form name="emptyListForm" method="post" action="${ctSellerRoot}/emptyListForm.do">
				 	<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
				 	<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
				 	<script>
				 		$("[name=emptyListForm]").hide();
				 	</script>
				 </form>
			 </c:if>
		</div>
    </div>
</div>
    <!-- /.row -->
<%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
<script>	
	<c:forEach items="${sellerInfoDTO.select_option}" var="select_option2">
		$("input[id=option_select_code${select_option2}]").prop("checked", true);
	</c:forEach>
</script>	
</body>
</html>




