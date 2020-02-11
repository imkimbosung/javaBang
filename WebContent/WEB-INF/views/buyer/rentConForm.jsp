<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<%@include file="/WEB-INF/views/common.jsp" %>
<%@include file="/WEB-INF/views/buyer/incloudfile/topBar.jsp"%>
     <%@include file="/WEB-INF/views/loading.jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<title>JAVABANG</title>


    


<script>
/*렌탈신청페이지로이동*/
	function gosubscription()
	{
		if(${rentalContent.rp_count<=0}){alert("재고부족으로 인해 신청불가합니다");return;}
		document.goSubscription.submit();
	}
</script>
<style>

</style>
<meta charset="UTF-8">
<title>JAVABANG</title>
</head>
<body>
	<div class="col-lg-7" id="root"  style="margin:auto;">
		<h1 class="mt-4 mb-3">JAVABANG</h1>
	    	<ol class="breadcrumb" style="margin-bottom: auto;">
	     		 <li class="breadcrumb-item active" style="color:#212529;font-size:${rentalconfont}"><b>빌려방 렌탈물품상세정보</b></li>
	   		 </ol>	
	</div>
	<div class="col-lg-10">
	<form name=goSubscription action="${ctBuyerRoot}/rentSubscriptionForm.do">
		<input type=hidden name=rp_no value="${rentalContent.rp_no}">
	</form>
	<div style="margin-left: 456;margin-right:10px;">	
		<div class="breadcrumb bg-light" style="margin: 20 0 40 0;width: max-content;font-size:${rentalconfont}">제품 사진</div>
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			
				<div class="carousel-inner" >
					<center>
					<div class="carousel-item active">
						<img class="d-block h-100" src="${ctRoot}/resources/rentalProductImg/${rentalImg[0].image_name}" height="90%" >
					</div>
					<c:forEach items="${rentalImg}" var="rentalImg" varStatus="loopTagStatus">
						
					<c:if test="${loopTagStatus.count!=1}">
							
						<div class="carousel-item">
							<img class="d-block h-100" src="${ctRoot}/resources/rentalProductImg/${rentalImg.image_name}" height="90%" >
						</div>
					</c:if>
				</c:forEach>
				</center>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				 <span class="carousel-control-prev-icon" aria-hidden="true" style="background-color:black;"></span>
				</a>
				<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true" style="background-color:black;"></span>
				</a>
			</div>
		
				<div style="margin:30px;"></div>
				<div class="col-lg-8">
			<div class="breadcrumb bg-light"  style="margin: 20 0 40 0;width: max-content;font-size:${rentalconfont}">제품 상세정보</div>
				<div style="width:100%;">

				  <div class="form-group row">
				    <label for="inputPassword" class="col-sm-2 col-form-label"style="font-size:${rentalconfont}">제품명</label>
				    <div class="col-sm-10">
				      <input class="form-control"  type="text" value="${rentalContent.rp_model_name}" style="font-size:${rentalconfont}"disabled>
				    </div>
				  </div>
				<div class="form-group row">
                   <label for="inputPassword" class="col-sm-2 col-form-label"style="font-size:${rentalconfont}">제품가격</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text" placeholder="" value="${rentalContent.rp_price}/월" style="font-size:${rentalconfont}"disabled>
                    </div>
                  </div>
                  <div class="form-group row">
                   <label for="inputPassword" class="col-sm-2 col-form-label"style="font-size:${rentalconfont}">남은수량</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text" placeholder="" value="${rentalContent.rp_count}" style="font-size:${rentalconfont}"disabled>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label"style="font-size:${rentalconfont}">제품설명</label>
                    <div class="col-sm-10">
                      <textarea class="form-control" name="rp_content" rows=13 cols=60 maxlength=500 name="rp_content" style="resize:none;padding:20px;font-size:${rentalconfont}"readonly>${rentalContent.rp_content}</textarea>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label"style="font-size:${rentalconfont}">제품평점</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text" placeholder=""  style="font-size:${rentalconfont}" value="<fmt:formatNumber  value="${rentalContent.rp_score}"  pattern="#.#"/>/5.0" disabled>
                    </div>
                  </div>
                 </div>
			</div>

		
			
		
			<%-- ${rentalContent.rt_comaddr}<br>${rentalContent.rt_comname} --%>
			
			<center>
				<input type=button class="btn btn-info" value=렌탈신청 onClick="gosubscription();" style="margin: 100 400 0 400;font-size: x-large;">
			</center>
	</div>
</div>	
</div>


<%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp"%>
</body>
</html>