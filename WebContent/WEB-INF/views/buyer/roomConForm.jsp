<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>
     <%@include file="/WEB-INF/views/loading.jsp" %>
     <%@include file="/WEB-INF/views/buyer/incloudfile/topBar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="/javaBang/resources/star/fontawesome-stars.css">
<script type="text/javascript" src="/javaBang/resources/star/jquery.barrating.min.js"></script>
  
<script>
$(window).load(function() {
	$("#roomoption").hide();
  });
$(document).ready
(
	function()
	{
		$("[name=realtorinfo]").hide();
		$("#roomoption").hide();
		$("#tip").hover(
				function()
				{
					
					
					$("#roomoption").slideDown(500)

					//마우스의 x,y자표구하여 div태그의 위치로 하기
					var X=event.clientX+ document.body.scrollLeft+15
					var Y=event.clientY+ document.body.scrollTop+15
					$("#roomoption").css({"top":Y,"left":X})

				},
				function()
				{
					//setTimeout(function(){$(".tip").hide(500)},3000)
					//$(".tip").slideUp(500)
					$("#roomoption").hide(500)
					//$(".tip").fadeOut(500)
					
				
				}
			);
	}
);

	{
		$("[name=realtorinfo]").show();
	}
	function closerealtoriinfo()
	{
		$("[name=realtorinfo]").hide();
	}
	
	function goConForm(rp_no)
	{
		var openNewWindow = window.open("about:blank");
		openNewWindow.location.href='${ctBuyerRoot}/rentConForm.do?rp_no='+rp_no
	}
</script>







<script>
	$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').focus()
	})
</script>
<style>
.as{display:inline-block;vertical-align:top;width:100px;}
.sd{display:block;width:auto;text-decoration:none;margin:5px;}

.as2{display:inline-block;vertical-align:top;width:200px;}
.sd2{display:block;width:auto;text-decoration:none;mrgin:5px;}
.rentalimage {
width: 200px;
height: 200px;
}
.roomoption
				{
					background-color:#000000;
					color:white;
					position:absolute;
					padding:10px 10px 10px 10px;
					font-size:20;
					z-index:50;
				}
</style>
<%-- 
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
<!--===============================================================================================--> --%>

	<!-- 예쁜셀렉트박스 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="author" content="colorlib.com">
	
    <link href="${ctRoot}/resources/selectbox/css/main.css" rel="stylesheet" />
	<link href="${ctRoot}/resources/card_roomconform/card.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>JAVABANG</title>
</head>
<body>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="background-color: darkseagreen;color: white;">
        <h4 class="modal-title" id="myModalLabel"  style="margin:auto;">매물담당 공인중개사</h4>
      </div>
      <div class="modal-body" style="padding: 30;">
       <div class="row">
            <div class="well well-sm">
                <div class="row">
                    <div class="col-sm-6 col-md-4">
                        <img src="${ctRealtorImageRoot}/${roomContent.image_name}" style="width:inherit">
                    </div>
                    <div class="col-sm-6 col-md-8">
                        <p>
                            <i class="glyphicon glyphicon-envelope"></i><font size=roommodalfont>중개소명 : <b>${roomContent.ri_officename}</b>
                            <br />
                            <i class="glyphicon glyphicon-globe"></i>주소 : <b>${roomContent.ri_addr}${roomContent.ri_detail_addr}</b>
                            <br />
                            <i class="glyphicon glyphicon-gift"></i>대표 : <b>${roomContent.ri_name}</b>
                            <br />
                            <i class="glyphicon glyphicon-gift"></i>대표전화 : <b>${roomContent.ri_main_phone}</b>
                        </p>
                        <div>
							<center>
							
							<h5 class="breadcrumb">평점 &nbsp; &nbsp;
							<b>
							<c:if test="${getBuyerAvgScore.br_score!= null}">
								${getBuyerAvgScore.br_score} / 5
							</c:if>
							<c:if test="${getBuyerAvgScore.br_score== null}">
								0 / 5
							</c:if>
							</b>		
							</h5>
								<h4>
									<b>${roomContent.r_name}<br>${roomContent.r_phone}</b>
								</h4></font>
								</center>
								
								
								
	<script type="text/javascript"> 
	</script>	

						</div>
                        <!-- Split button -->
                    </div>
                </div>
            </div>
    </div>
      </div>
      <div class="modal-footer" >
      <div align=center>
      <form name=realtor>
      <input type="hidden" name=b_no value="${b_no}">
      <input type="hidden" name=r_no value="${roomContent.r_no}">
      <input type="hidden" name=br_score>
      </form>
      <select id="realtorstar" > 
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select> 
							<script type="text/javascript"> 
							
							<c:if test="${getBuyerRealtorScore.br_score!= null}">
								$("#realtorstar").val(${getBuyerRealtorScore.br_score});
							</c:if>
							
							
							<c:if test="${getBuyerRealtorScore.br_score== null}">
								$("#realtorstar").val("0");
							</c:if>
							
							
			$('#realtorstar').barrating({
				theme : 'fontawesome-stars'
					, onSelect: function(value, text, event){ 
							$('[name=br_score]').val(value);
							<c:if test="${getBuyerRealtorScore.br_score== null}">
							$.ajax
							({
								url:"${ctBuyerRoot}/roomConFormProc.do"
								,type:"post"
								,data:$('[name=realtor]').serialize()
								,success : function(getBuyerReviewcnt)
								{
									if(getBuyerReviewcnt==1)
									{
										alert("등록성공");
										location.replace("${ctBuyerRoot}/roomConForm.do?sr_no="+${param.sr_no});
										
									}
									else if(getBuyerReviewcnt==-1)
									{
										alert("실패");
									}
									else{
										if(confirm("로그인 하셔야 이용가능합니다 로그인하시겠습니까?")==false){}
									else{location.replace("${ctBuyerRoot}/loginForm.do");} }
								}

								,error : function()
								{
									if(confirm("로그인 하셔야 이용가능합니다 로그인하시겠습니까?")==false){}
									else{location.replace("${ctBuyerRoot}/loginForm.do");} 
								}
							});
							</c:if>
							<c:if test="${getBuyerRealtorScore.br_score!= null}">
								$.ajax
								({
									url:"${ctBuyerRoot}/reroomConFormProc.do"
									,type:"post"
									,data:$('[name=realtor]').serialize()
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
								</c:if>

						}
		});
	</script>
	</div>
        <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>


<div name=realtorinfo style="position:absolute;left:500px;top:20%;background:gray; z-index:99;">
<div style="position:absolute;right:5px;top:0px">
	
</div>
	</div>
<center> 
<div class="container">
	
		<div class="row">
			<div class="row">
				<h1 class="breadcrumb" style="width: fit-content;">방타입   :     ${roomContent.roomtype}</h1><br><br><br>
			</div>
			<div class="row" style="margin-left:50px;">
				<c:if test="${roomContent.sell_type=='월세'}">
				<h1 class="breadcrumb" style="width: fit-content;">${roomContent.sell_type}   :      ${roomContent.deposit}/${roomContent.monthly_rent}</h1>
				</c:if>
				<c:if test="${roomContent.sell_type=='전세'}">
				<h1 class="breadcrumb" style="width: fit-content;">${roomContent.sell_type}   :      ${roomContent.jeonse_price}<h1>
				</c:if>
				<c:if test="${roomContent.sell_type=='매매'}">
				<h1 class="breadcrumb" style="width: fit-content;">${roomContent.sell_type}   :     ${roomContent.sale_price}<h1>
				</c:if>
			</div>
		</div>
				<div style="float:right;">
					<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal" onClick="openrealtorinfo()" style="font-size: x-large;">담당공인중개사 보기</button>
				</div>
	<table class="table">	
		<tr>
			 <!-- 원룸및투룸쓰리룸--> 
			<th width="18%"style="font-size:${roomsearchfont2}">
			º 해당층/건물층 : 
			<td width="12%" style="font-size:${roomsearchfont2}">
			${roomContent.sr_room_floor}층
			<th width="18%"style="font-size:${roomsearchfont2}">
			º 전용/공급면적 : 
			<td width="12%"style="font-size:${roomsearchfont2}">
			${roomContent.sr_roomsize}평
			<th width="13%"style="font-size:${roomsearchfont2}">
			º 난방종류 : 
			<td width="8%"style="font-size:${roomsearchfont2}">
			${roomContent.hc_type}
			<td colspan=2>
		<tr>
			<!-- 원룸및투룸쓰리룸 -->
			<th width="12%"style="font-size:${roomsearchfont2}">
			º 엘리베이터 : 
			<td width="8%"style="font-size:${roomsearchfont2}">
			${roomContent.elv}
			<th width="12%"style="font-size:${roomsearchfont2}">
			º 반려동물 : 
			<td width="8%"style="font-size:${roomsearchfont2}">
			${roomContent.pet}
			<th width="13%"style="font-size:${roomsearchfont2}">
			º 관리비 : 
			<td width="8%"style="font-size:${roomsearchfont2}">
			${roomContent.manage_fee}
			<th width="9%"style="font-size:${roomsearchfont2}">
			º 주차 : 
			<td width="12%"style="font-size:${roomsearchfont2}">
			${roomContent.parking}
		<tr>
			<th width="12%"style="font-size:${roomsearchfont2}">
			<!-- 원룸및투룸쓰리룸 -->
			º 입주가능일 : 
			<td width="12%"style="font-size:${roomsearchfont2}">
			${roomContent.live_type}
			<th width="12%"style="font-size:${roomsearchfont2}">
			º 옵션타입 : 
			<td width="12%"style="font-size:${roomsearchfont2}">
			${roomContent.option_type}
			<th width="5%"style="font-size:${roomsearchfont2}">
			º 준공일 : 
			<td width="10%"style="font-size:15">
			${roomContent.sr_builddate}
			<td colspan=2>
			
			<!-- --------------------------------------- -->
	</table><p></p>
</div>
	<div data-spy="scroll" data-target="#list-example" data-offset="0" class="scrollspy-example" style="width:100%;;margin-right:10px;">
		
	<h2>방 사진</h2>
		<p>
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			
				<div class="carousel-inner" >
				
					<div class="carousel-item active">
						<img class="d-block w-50 h-100" src="${ctImageRoot}/${imageList[0].image}" height=10% >
					</div>
					<c:forEach items="${imageList}" var="imageList" varStatus="loopTagStatus">
						
					<c:if test="${loopTagStatus.count!=1}">
							
						<div class="carousel-item">
							<img class="d-block w-50 h-100" src="${ctImageRoot}/${imageList.image}" height=10% >
						</div>
					</c:if>
				</c:forEach>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				 <span class="carousel-control-prev-icon" aria-hidden="true" style="background-color:black;"></span>
				</a>
				<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true" style="background-color:black;"></span>
				</a>
			</div>
		</p>
		<br>
		<hr>
		<br>
		<h2>방 옵션<a id=tip><sup>?</sup></a></h2>
		<div class=roomoption id=roomoption >
				-JavaBang 방 옵션 종류<br>
			<c:forEach items="${roomoptionList}" var="roomoptionList" varStatus="loopTagStatus">
			${roomoptionList.option_select_type}
			</c:forEach>
			등이 있습니다
			</div>
		
		<p>
			<c:forEach items="${optionList}" var="option" varStatus="loopTagStatus">
				<c:if test="${option.option_type!='풀옵션'}">
					<li class="as">
						<a class=sd>
							
							<c:if test="${option.option_type=='정수기'}">
							<img src='${ctRoot}/resources/images/water.png' width='100px' border='1'height='100px'>
							${option.option_type}
							</c:if>
							<c:if test="${option.option_type=='신발장'}">
							<img src='${ctRoot}/resources/images/shoe-rack.png' width='100px' border='1'height='100px'>
							${option.option_type}
							</c:if>
							<c:if test="${option.option_type=='인터넷'}">
							<img src='${ctRoot}/resources/images/router.png' width='100px' border='1'height='100px'>
							${option.option_type}
							</c:if>
							<c:if test="${option.option_type=='TV'}">
							<img src='${ctRoot}/resources/images/tv.png' width='100px' border='1'height='100px'>
							${option.option_type}
							</c:if>
							<c:if test="${option.option_type=='전자레인지'}">
							<img src='${ctRoot}/resources/images/bowl-in-a-microwave.png' width='100px' border='1'height='100px'>
							${option.option_type}
							</c:if>
							<c:if test="${option.option_type=='세탁기'}">
							<img src='${ctRoot}/resources/images/laundry.png' width='100px' border='1'height='100px'>
							${option.option_type}
							</c:if>
							<c:if test="${option.option_type=='책상'}">
							<img src='${ctRoot}/resources/images/office-desk.png' width='100px' border='1'height='100px'>
							${option.option_type}
							</c:if>
							<c:if test="${option.option_type=='에어컨'}">
							<img src='${ctRoot}/resources/images/air-conditioner.png' width='100px' border='1'height='100px'>
							${option.option_type}
							</c:if>
							<c:if test="${option.option_type=='옷장'}">
							<img src='${ctRoot}/resources/images/wardrobe.png' width='100px' border='1'height='100px'>
							${option.option_type}
							</c:if>
							<c:if test="${option.option_type=='냉장고'}">
							<img src='${ctRoot}/resources/images/fridge.png' width='100px' border='1'height='100px'>
							${option.option_type}
							</c:if>
						</a>
						</li>
						</c:if>
						</c:forEach>
						<c:forEach items="${optionList}" var="option">
							<c:if test="${option.option_type=='풀옵션'}">
								<li class="as">
									<a class=sd >
										<img src='${ctRoot}/resources/images/water.png' width='100px' border='1'height='100px'>
										정수기
									</a>
								</li>
								<li class="as">
									<a class=sd>
										<img src='${ctRoot}/resources/images/shoe-rack.png' width='100px' border='1'height='100px'>
										신발장
									</a>
								</li>
								<li class="as">
									<a class=sd>
										<img src='${ctRoot}/resources/images/router.png' width='100px' border='1'height='100px'>
										인터넷
									</a>
								</li>
								<li class="as">
									<a class=sd>
										<img src='${ctRoot}/resources/images/tv.png' width='100px' border='1'height='100px'>
										TV
									</a>
								</li>
								<li class="as">
									<a class=sd>
										<img src='${ctRoot}/resources/images/bowl-in-a-microwave.png' width='100px' border='1'height='100px'>
										전자레인지
									</a>
								</li>
								<li class="as">
									<a class=sd>
										<img src='${ctRoot}/resources/images/laundry.png' width='100px' border='1'height='100px'>
										세탁기
									</a>
								</li>
								<li class="as">
									<a class=sd>
										<img src='${ctRoot}/resources/images/office-desk.png' width='100px' border='1'height='100px'>
										책상
									</a>
								</li>
								<li class="as">
									<a class=sd>
										<img src='${ctRoot}/resources/images/air-conditioner.png' width='100px' border='1'height='100px'>
										에어컨
									</a>
								</li>
								<li class="as">
									<a class=sd>
										<img src='${ctRoot}/resources/images/wardrobe.png' width='100px' border='1'height='100px'>
										옷장
									</a>
								</li>
								<li class="as">
									<a class=sd>
										<img src='${ctRoot}/resources/images/fridge.png' width='100px' border='1'height='100px'>
										냉장고
									</a>
								</li>
							</c:if>
						</c:forEach>
		</p>
	<br>
		<hr>
		<br>
	<c:if test="${optionList[0].option_type!='풀옵션' and optionList[1].option_type!='풀옵션' and optionList[2].option_type!='풀옵션'
				and optionList[3].option_type!='풀옵션' and optionList[4].option_type!='풀옵션' and optionList[5].option_type!='풀옵션'
				and optionList[6].option_type!='풀옵션' and optionList[7].option_type!='풀옵션' and optionList[8].option_type!='풀옵션'
			and optionList[9].option_type!='풀옵션'}">
		<h2 style="margin-bottom:50px">추천렌탈제품</h2>
		<p style="font-size:${roomtypefont}">현재 이 방에 없는 제품을 추천해드립니다!</p><br><br>
		<div class="row" style="margin-left: 16%;">
			<c:if test="${optionList[0].option_type!='공기청정기' and optionList[1].option_type!='공기청정기' and optionList[2].option_type!='공기청정기'
			and optionList[3].option_type!='공기청정기' and optionList[4].option_type!='공기청정기' and optionList[5].option_type!='공기청정기'
			and optionList[6].option_type!='공기청정기' and optionList[7].option_type!='공기청정기' and optionList[8].option_type!='공기청정기'
			and optionList[9].option_type!='공기청정기'}">
				<div class="cards">
					<article class="card card--1">
					  <div class="card__info-hover">
					    <svg class="card__like"  viewBox="0 0 24 24">
					    <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
					</svg>
					  </div>
					  <div class="card__img"></div>
					  <a href="javascript:goConForm(${firstAir.rp_no});" class="card_link">
					     <div class="card__img--hover" style="background-image: url('${ctRoot}/resources/images/air.JPG');"></div>
					   </a>
					  <div class="card__info">
					    <span class="card__category"> </span>
					    <h5 class="card__title">${firstAir.rt_comname}</h5>
					       
					  </div>
					</article>
				</div>
			</c:if>
			
			
			<c:if test="${optionList[0].option_type!='정수기' and optionList[1].option_type!='정수기' and optionList[2].option_type!='정수기'
			and optionList[3].option_type!='정수기' and optionList[4].option_type!='정수기' and optionList[5].option_type!='정수기'
			and optionList[6].option_type!='정수기' and optionList[7].option_type!='정수기' and optionList[8].option_type!='정수기'
			and optionList[9].option_type!='정수기'}">
				<div class="cards">
					<article class="card card--1">
					  <div class="card__info-hover">
					    <svg class="card__like"  viewBox="0 0 24 24">
					    <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
					</svg>
					  </div>
					  <div class="card__img"></div>
					  <a href="javascript:goConForm(${firstWater.rp_no});" class="card_link">
					     <div class="card__img--hover" style="background-image: url('${ctRoot}/resources/images/water.JPG');"></div>
					   </a>
					  <div class="card__info">
					    <span class="card__category"> </span>
					    <h5 class="card__title">${firstWater.rt_comname}</h5>
					       
					  </div>
					</article>
				</div>
			</c:if>
			
			
			<c:if test="${optionList[0].option_type!='가스레인지' and optionList[1].option_type!='가스레인지' and optionList[2].option_type!='가스레인지'
			and optionList[3].option_type!='가스레인지' and optionList[4].option_type!='가스레인지' and optionList[5].option_type!='가스레인지'
			and optionList[6].option_type!='가스레인지' and optionList[7].option_type!='가스레인지' and optionList[8].option_type!='가스레인지'
			and optionList[9].option_type!='가스레인지'}">
				<div class="cards">
					<article class="card card--1">
					  <div class="card__info-hover">
					    <svg class="card__like"  viewBox="0 0 24 24">
					    <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
					</svg>
					  </div>
					  <div class="card__img"></div>
					  <a href="javascript:goConForm(${firstGas.rp_no});" class="card_link">
					     <div class="card__img--hover" style="background-image: url('${ctRoot}/resources/images/fire.JPG');"></div>
					   </a>
					  <div class="card__info">
					    <span class="card__category"> </span>
					    <h5 class="card__title">${firstGas.rt_comname}</h5>
					       
					  </div>
					</article>
				</div>
			</c:if>
			
			
			<c:if test="${optionList[0].option_type!='TV' and optionList[1].option_type!='TV' and optionList[2].option_type!='TV'
			and optionList[3].option_type!='TV' and optionList[4].option_type!='TV' and optionList[5].option_type!='TV'
			and optionList[6].option_type!='TV' and optionList[7].option_type!='TV' and optionList[8].option_type!='TV'
			and optionList[9].option_type!='TV'}">
				<div class="cards">
					<article class="card card--1">
					  <div class="card__info-hover">
					    <svg class="card__like"  viewBox="0 0 24 24">
					    <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
					</svg>
					  </div>
					  <div class="card__img"></div>
					  <a href="javascript:goConForm(${firstTv.rp_no});" class="card_link">
					     <div class="card__img--hover" style="background-image: url('${ctRoot}/resources/images/TV.JPG');"></div>
					   </a>
					  <div class="card__info">
					    <span class="card__category"> </span>
					    <h5 class="card__title">${firstTv.rt_comname}</h5>
					       
					  </div>
					</article>
				</div>
			</c:if>
			
			
			<c:if test="${optionList[0].option_type!='전자레인지' and optionList[1].option_type!='전자레인지' and optionList[2].option_type!='전자레인지'
			and optionList[3].option_type!='전자레인지' and optionList[4].option_type!='전자레인지' and optionList[5].option_type!='전자레인지'
			and optionList[6].option_type!='전자레인지' and optionList[7].option_type!='전자레인지' and optionList[8].option_type!='전자레인지'
			and optionList[9].option_type!='전자레인지'}">
				<div class="cards">
					<article class="card card--1">
					  <div class="card__info-hover">
					    <svg class="card__like"  viewBox="0 0 24 24">
					    <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
					</svg>
					  </div>
					  <div class="card__img"></div>
					  <a href="javascript:goConForm(${firstMicro.rp_no});" class="card_link">
					     <div class="card__img--hover" style="background-image: url('${ctRoot}/resources/images/wave.JPG');"></div>
					   </a>
					  <div class="card__info">
					    <span class="card__category"> </span>
					    <h5 class="card__title">${firstMicro.rt_comname}</h5>
					       
					  </div>
					</article>
				</div>
			</c:if>
			
			
			<c:if test="${optionList[0].option_type!='세탁기' and optionList[1].option_type!='세탁기' and optionList[2].option_type!='세탁기'
			and optionList[3].option_type!='세탁기' and optionList[4].option_type!='세탁기' and optionList[5].option_type!='세탁기'
			and optionList[6].option_type!='세탁기' and optionList[7].option_type!='세탁기' and optionList[8].option_type!='세탁기'
			and optionList[9].option_type!='세탁기'}">
				<div class="cards">
					<article class="card card--1">
					  <div class="card__info-hover">
					    <svg class="card__like"  viewBox="0 0 24 24">
					    <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
					</svg>
					  </div>
					  <div class="card__img"></div>
					  <a href="javascript:goConForm(${firstWasher.rp_no});" class="card_link">
					     <div class="card__img--hover" style="background-image: url('${ctRoot}/resources/images/wash.JPG');"></div>
					   </a>
					  <div class="card__info">
					    <span class="card__category"> </span>
					    <h5 class="card__title">${firstWasher.rt_comname}</h5>
					       
					  </div>
					</article>
				</div>
			</c:if>
			
			
			<c:if test="${optionList[0].option_type!='에어컨' and optionList[1].option_type!='에어컨' and optionList[2].option_type!='에어컨'
			and optionList[3].option_type!='에어컨' and optionList[4].option_type!='에어컨' and optionList[5].option_type!='에어컨'
			and optionList[6].option_type!='에어컨' and optionList[7].option_type!='에어컨' and optionList[8].option_type!='에어컨'
			and optionList[9].option_type!='에어컨'}">
				<div class="cards">
					<article class="card card--1">
					  <div class="card__info-hover">
					    <svg class="card__like"  viewBox="0 0 24 24">
					    <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
					</svg>
					  </div>
					  <div class="card__img"></div>
					  <a href="javascript:goConForm(${firstAircon.rp_no});" class="card_link">
					     <div class="card__img--hover" style="background-image: url('${ctRoot}/resources/images/cool.JPG');"></div>
					   </a>
					  <div class="card__info">
					    <span class="card__category"> </span>
					    <h5 class="card__title">${firstAircon.rt_comname}</h5>
					       
					  </div>
					</article>
				</div>
			</c:if>
			
			
			<c:if test="${optionList[0].option_type!='냉장고' and optionList[1].option_type!='냉장고' and optionList[2].option_type!='냉장고'
			and optionList[3].option_type!='냉장고' and optionList[4].option_type!='냉장고' and optionList[5].option_type!='냉장고'
			and optionList[6].option_type!='냉장고' and optionList[7].option_type!='냉장고' and optionList[8].option_type!='냉장고'
			and optionList[9].option_type!='냉장고'}">
				<div class="cards">
					<article class="card card--1">
					  <div class="card__info-hover">
					    <svg class="card__like"  viewBox="0 0 24 24">
					    <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
					</svg>
					  </div>
					  <div class="card__img"></div>
					  <a href="javascript:goConForm(${firstFrig.rp_no});" class="card_link">
					     <div class="card__img--hover" style="background-image: url('${ctRoot}/resources/images/food.JPG');"></div>
					   </a>
					  <div class="card__info">
					    <span class="card__category"> </span>
					    <h5 class="card__title">${firstFrig.rt_comname}</h5>
					       
					  </div>
					</article>
				</div>
			</c:if>
			
			
			<c:if test="${optionList[0].option_type!='전기밥솥' and optionList[1].option_type!='전기밥솥' and optionList[2].option_type!='전기밥솥'
			and optionList[3].option_type!='전기밥솥' and optionList[4].option_type!='전기밥솥' and optionList[5].option_type!='전기밥솥'
			and optionList[6].option_type!='전기밥솥' and optionList[7].option_type!='전기밥솥' and optionList[8].option_type!='전기밥솥'
			and optionList[9].option_type!='전기밥솥'}">
				<div class="cards">
					<article class="card card--1">
					  <div class="card__info-hover">
					    <svg class="card__like"  viewBox="0 0 24 24">
					    <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
					</svg>
					  </div>
					  <div class="card__img"></div>
					  <a href="javascript:goConForm(${firstCucu.rp_no});" class="card_link">
					     <div class="card__img--hover" style="background-image: url('${ctRoot}/resources/images/rice.JPG');"></div>
					   </a>
					  <div class="card__info">
					    <span class="card__category"> </span>
					    <h5 class="card__title">${firstCucu.rt_comname}</h5>
					       
					  </div>
					</article>
				</div>
			</c:if>
			
			
			<c:if test="${optionList[0].option_type!='프린트' and optionList[1].option_type!='프린트' and optionList[2].option_type!='프린트'
			and optionList[3].option_type!='프린트' and optionList[4].option_type!='프린트' and optionList[5].option_type!='프린트'
			and optionList[6].option_type!='프린트' and optionList[7].option_type!='프린트' and optionList[8].option_type!='프린트'
			and optionList[9].option_type!='프린트'}">
				<div class="cards">
					<article class="card card--1">
					  <div class="card__info-hover">
					    <svg class="card__like"  viewBox="0 0 24 24">
					    <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
					</svg>
					  </div>
					  <div class="card__img"></div>
					  <a href="javascript:goConForm(${firstPrint.rp_no});" class="card_link">
					     <div class="card__img--hover" style="background-image: url('${ctRoot}/resources/images/print.JPG');"></div>
					   </a>
					  <div class="card__info">
					    <span class="card__category"> </span>
					    <h5 class="card__title">${firstPrint.rt_comname}</h5>
					       
					  </div>
					</article>
				</div>
			</c:if>
			
			
			<c:if test="${optionList[0].option_type!='침대' and optionList[1].option_type!='침대' and optionList[2].option_type!='침대'
			and optionList[3].option_type!='침대' and optionList[4].option_type!='침대' and optionList[5].option_type!='침대'
			and optionList[6].option_type!='침대' and optionList[7].option_type!='침대' and optionList[8].option_type!='침대'
			and optionList[9].option_type!='침대'}">
				<div class="cards">
					<article class="card card--1">
					  <div class="card__info-hover">
					    <svg class="card__like"  viewBox="0 0 24 24">
					    <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
					</svg>
					  </div>
					  <div class="card__img"></div>
					  <a href="javascript:goConForm(${firstBed.rp_no});" class="card_link">
					     <div class="card__img--hover" style="background-image: url('${ctRoot}/resources/images/sleep.JPG');"></div>
					   </a>
					  <div class="card__info">
					    <span class="card__category"> </span>
					    <h5 class="card__title">${firstBed.rt_comname}</h5>
					       
					  </div>
					</article>
				</div>
			</c:if>
			
			
			<c:if test="${optionList[0].option_type!='비데' and optionList[1].option_type!='비데' and optionList[2].option_type!='비데'
			and optionList[3].option_type!='비데' and optionList[4].option_type!='비데' and optionList[5].option_type!='비데'
			and optionList[6].option_type!='비데' and optionList[7].option_type!='비데' and optionList[8].option_type!='비데'
			and optionList[9].option_type!='비데'}">
				<div class="cards">
					<article class="card card--1">
					  <div class="card__info-hover">
					    <svg class="card__like"  viewBox="0 0 24 24">
					    <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
					</svg>
					  </div>
					  <div class="card__img"></div>
					  <a href="javascript:goConForm(${firstVide.rp_no});" class="card_link">
					     <div class="card__img--hover" style="background-image: url('${ctRoot}/resources/images/toilet.JPG');"></div>
					   </a>
					  <div class="card__info">
					    <span class="card__category"> </span>
					    <h5 class="card__title">${firstVide.rt_comname}</h5>
					       
					  </div>
					</article>
				</div>
			</c:if>
			
			
			<c:if test="${optionList[0].option_type!='스타일러' and optionList[1].option_type!='스타일러' and optionList[2].option_type!='스타일러'
			and optionList[3].option_type!='스타일러' and optionList[4].option_type!='스타일러' and optionList[5].option_type!='스타일러'
			and optionList[6].option_type!='스타일러' and optionList[7].option_type!='스타일러' and optionList[8].option_type!='스타일러'
			and optionList[9].option_type!='스타일러'}">
				<div class="cards">
					<article class="card card--1">
					  <div class="card__info-hover">
					    <svg class="card__like"  viewBox="0 0 24 24">
					    <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
					</svg>
					  </div>
					  <div class="card__img"></div>
					  <a href="javascript:goConForm(${firstStyler.rp_no});" class="card_link">
					     <div class="card__img--hover" style="background-image: url('${ctRoot}/resources/images/styler.JPG');"></div>
					   </a>
					  <div class="card__info">
					    <span class="card__category"> </span>
					    <h5 class="card__title">${firstStyler.rt_comname}</h5>
					       
					  </div>
					</article>
				</div>
			</c:if>
	</c:if>
	
	<c:if test="${optionList[0].option_type=='풀옵션' or optionList[1].option_type=='풀옵션' or optionList[2].option_type=='풀옵션'
				or optionList[3].option_type=='풀옵션' or optionList[4].option_type=='풀옵션' or optionList[5].option_type=='풀옵션'
				or optionList[6].option_type=='풀옵션' or optionList[7].option_type=='풀옵션' or optionList[8].option_type=='풀옵션'
			or optionList[9].option_type=='풀옵션'}">
		<h4 style="margin-bottom:50px">추천렌탈제품</h4>
		<p>현재 이 방에 없는 제품을 추천해드립니다!</p><br><br>
		<div class="row" style="margin-left: 16%;">
			
				<div class="cards">
					<article class="card card--1">
					  <div class="card__info-hover">
					    <svg class="card__like"  viewBox="0 0 24 24">
					    <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
					</svg>
					  </div>
					  <div class="card__img"></div>
					  <a href="javascript:goConForm(${firstAir.rp_no});" class="card_link">
					     <div class="card__img--hover" style="background-image: url('${ctRoot}/resources/images/air.JPG');"></div>
					   </a>
					  <div class="card__info">
					    <span class="card__category"> </span>
					    <h5 class="card__title">${firstAir.rt_comname}</h5>
					       
					  </div>
					</article>
				</div>
			
				<div class="cards">
					<article class="card card--1">
					  <div class="card__info-hover">
					    <svg class="card__like"  viewBox="0 0 24 24">
					    <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
					</svg>
					  </div>
					  <div class="card__img"></div>
					  <a href="javascript:goConForm(${firstGas.rp_no});" class="card_link">
					     <div class="card__img--hover" style="background-image: url('${ctRoot}/resources/images/fire.JPG');"></div>
					   </a>
					  <div class="card__info">
					    <span class="card__category"> </span>
					    <h5 class="card__title">${firstGas.rt_comname}</h5>
					       
					  </div>
					</article>
				</div>
			
				<div class="cards">
					<article class="card card--1">
					  <div class="card__info-hover">
					    <svg class="card__like"  viewBox="0 0 24 24">
					    <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
					</svg>
					  </div>
					  <div class="card__img"></div>
					  <a href="javascript:goConForm(${firstCucu.rp_no});" class="card_link">
					     <div class="card__img--hover" style="background-image: url('${ctRoot}/resources/images/rice.JPG');"></div>
					   </a>
					  <div class="card__info">
					    <span class="card__category"> </span>
					    <h5 class="card__title">${firstCucu.rt_comname}</h5>
					       
					  </div>
					</article>
				</div>
				<div class="cards">
					<article class="card card--1">
					  <div class="card__info-hover">
					    <svg class="card__like"  viewBox="0 0 24 24">
					    <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
					</svg>
					  </div>
					  <div class="card__img"></div>
					  <a href="javascript:goConForm(${firstPrint.rp_no});" class="card_link">
					     <div class="card__img--hover" style="background-image: url('${ctRoot}/resources/images/print.JPG');"></div>
					   </a>
					  <div class="card__info">
					    <span class="card__category"> </span>
					    <h5 class="card__title">${firstPrint.rt_comname}</h5>
					       
					  </div>
					</article>
				</div>
			
				<div class="cards">
					<article class="card card--1">
					  <div class="card__info-hover">
					    <svg class="card__like"  viewBox="0 0 24 24">
					    <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
					</svg>
					  </div>
					  <div class="card__img"></div>
					  <a href="javascript:goConForm(${firstBed.rp_no});" class="card_link">
					     <div class="card__img--hover" style="background-image: url('${ctRoot}/resources/images/sleep.JPG');"></div>
					   </a>
					  <div class="card__info">
					    <span class="card__category"> </span>
					    <h5 class="card__title">${firstBed.rt_comname}</h5>
					       
					  </div>
					</article>
				</div>
			
				<div class="cards">
					<article class="card card--1">
					  <div class="card__info-hover">
					    <svg class="card__like"  viewBox="0 0 24 24">
					    <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
					</svg>
					  </div>
					  <div class="card__img"></div>
					  <a href="javascript:goConForm(${firstVide.rp_no});" class="card_link">
					     <div class="card__img--hover" style="background-image: url('${ctRoot}/resources/images/toilet.JPG');"></div>
					   </a>
					  <div class="card__info">
					    <span class="card__category"> </span>
					    <h5 class="card__title">${firstVide.rt_comname}</h5>
					       
					  </div>
					</article>
				</div>
			
			
				<div class="cards">
					<article class="card card--1">
					  <div class="card__info-hover">
					    <svg class="card__like"  viewBox="0 0 24 24">
					    <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
					</svg>
					  </div>
					  <div class="card__img"></div>
					  <a href="javascript:goConForm(${firstStyler.rp_no});" class="card_link">
					     <div class="card__img--hover" style="background-image: url('${ctRoot}/resources/images/styler.JPG');"></div>
					   </a>
					  <div class="card__info">
					    <span class="card__category"> </span>
					    <h5 class="card__title">${firstStyler.rt_comname}</h5>
					       
					  </div>
					</article>
				</div>
	</c:if>
</div>	
	
	
	<br>
	<hr>
	<br>
	
		<h2>주소</h2>
		<p>
			<font size=${roommodalfont}>${roomContent.sr_addr} ${roomContent.sr_detail_addr}</font>
			<div id="map" style="width:1200;height:600;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=070c6cc88e915ecf5709587531f200a4&libraries=services"></script>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=070c6cc88e915ecf5709587531f200a4"></script>
	
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
				center: new kakao.maps.LatLng(37.478690, 126.87869), // 지도의 중심좌표
				level: 3 // 지도의 확대 레벨
				};  

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();

				// 주소로 좌표를 검색합니다
				geocoder.addressSearch('${roomContent.sr_addr}', function(result, status) {

				// 정상적으로 검색이 완료됐으면 
				
				if (status == kakao.maps.services.Status.OK) {

				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new kakao.maps.Marker({
				map: map,
				position: coords
				});

				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
				} 
				});    
			</script>
		</p>
	</div>
<!-- </center> -->
<%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp"%>
</body>
</html>