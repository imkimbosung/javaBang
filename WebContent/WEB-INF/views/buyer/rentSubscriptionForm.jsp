<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp" %>
<%@include file="/WEB-INF/views/buyer/incloudfile/topBar.jsp"%>
     <%@include file="/WEB-INF/views/loading.jsp" %>

<!DOCTYPE html>
<html>
<head>
<script>

	function test()
	{
		
		$.ajax
		({
			url:"${ctBuyerRoot}/rentSubscriptionFormProc.do"
			,type:"post"
			,data:$('[name=gorentSubscriptionForm]').serialize()
			,success : function(subscriptioncnt)
			{
				if(subscriptioncnt==1)
				{
					alert("신청완료!");
					location.replace("${ctBuyerRoot}/homeForm.do");
				}
				else if(subscriptioncnt==-2)
				{
					alert("rental_term실패");
				}
				else
				{
					
					alert("실패");
				}
			}

			,error : function()
			{
				alert("서버통신실패");
			}
		});
	}
</script>
<style>
.div{display:inline-block;vertical-align:top;width:25%;}
.aa{display:block;width:auto;text-decoration:none;margin:5px;}
</style>
<meta charset="UTF-8">
<title>JAVABANG</title>
<meta name="viewport" content="width=device-width, initial-scale=1">


</head>
<body>
		
		<div class="col-lg-6" id="root"  style="margin:auto;">
		<h1 class="mt-4 mb-3">JAVABANG</h1>
	    	<ol class="breadcrumb" style="margin-bottom: auto;">
	     		 <li class="breadcrumb-item active" style="color:#212529;font-size:${rentalsubfont}"><b>빌려방 렌탈물품신청하기</b></li>
	   		 </ol>	
	</div>
		
		
	<div class="col-md-10" style="margin: 50 0 50 500;">
		
	
		<div class="breadcrumb bg-light" style="margin: 20 0 40 0;width: max-content;font-size:${rentalconfont}">제품정보확인</div>
		
		<div class="form-group row">
				    <label for="inputPassword" class="col-sm-2" style="margin-right:-100;font-size:${rentalconfont}">제품명</label>
				    <div class="col-sm-10">
				      <input class="form-control"  type="text" style="width: 400;font-size:${rentalconfont}" value="${rentalContent.rp_model_name}" disabled>
				    </div>
				  </div>
				<div class="form-group row">
                   <label for="inputPassword" class="col-sm-2" style="margin-right:-100;font-size:${rentalconfont}">제품가격</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text" style="width: 400;font-size:${rentalconfont}" value="${rentalContent.rp_price}/월" disabled>
                    </div>
                  </div>
                  <div class="form-group row">
                   <label for="inputPassword" class="col-sm-2 col-form-label" style="margin-right:-100;font-size:${rentalconfont}">남은수량</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text" style="width: 400;font-size:${rentalconfont}" value="${rentalContent.rp_count}" disabled>
                    </div>
                  </div>
                  <div class="form-group row">
                   <label for="inputPassword" class="col-sm-2 col-form-label" style="margin-right:-100;font-size:${rentalconfont}">주소</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text" style="width: 800;font-size:${rentalconfont}" value="${rentalContent.rt_comaddr}&nbsp;${rentalContent.rt_comname}" disabled>
                    </div>
                  </div>
                  
		
		
		
			
		<div class="breadcrumb bg-light" style="margin: 20 0 40 0;width: max-content;font-size:${rentalconfont}">옵션선택</div>
				<div class="row">
					<div class="col-lg-12" >
						<div class="panel-body">
							<form name=gorentSubscriptionForm>
								<input type=hidden name=rp_no value="${rentalContent.rp_no}">
								<input type=hidden name=b_no value="${buyerDTO.b_no}">
								<c:forEach items="${rentalTerm}" var="rentalTerm" varStatus="loopTagStatus">
								<label for="chk${loopTagStatus.count}">
									<a class="btn btn-outline-light"style="font-size:${rentalconfont}">${rentalTerm.rental_term}
								<input type=radio name="rental_term_code" value="${rentalTerm.rental_term_code}" id="chk${loopTagStatus.count}"  style="margin-left: 20;margin-top: 35;">
									</a>
								</label>
								</c:forEach>
								<br>
								<span id=total_money></span>
								<script>
							$(document).ready(function()
								{
								$("[name=rental_term_code]").click(
										function()
										{
											<c:forEach items="${rentalTerm}" var="rentalTerm" varStatus="loopTagStatus">
											if($("[name=rental_term_code]").filter("[value=${rentalTerm.rental_term_code}]").is(":checked"))
											{
												var text="${rentalTerm.rental_term}";
												text=text.replace("개월","")
												var money=text*"${rentalContent.rp_price}"
												money=money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
												$("#total_money").html("<span style='font-size:${rentalconfont}'>선택하신 렌탈개월수의 총금액 : "+money+"원 입니다</span>")
											}
											</c:forEach>
										
										})
								
								})
</script>
							</form> 
						</div>
					</div>
				</div>
					<input type=button class="btn btn-info btn-lg" value=신청완료 onClick="test();" style="margin-top:50;">
				
			</div>
				</center>
	
	
<%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp"%>
</body>
</html>