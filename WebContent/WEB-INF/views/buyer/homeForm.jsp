<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/views/common.jsp" %>
 
 <%@include file="/WEB-INF/views/loading.jsp" %>
<!-- topbar -->
<%@include file="/WEB-INF/views/buyer/incloudfile/topBar.jsp"%>


<!-- 공지사항 코드 -->
<script src="${ctRoot}/resources/Socket.js" type="text/javascript"></script>




  <head>
    <title>구해방 - HOME</title>
    <script type="text/javascript">
    jQuery.noConflict();

    	$(document).ready(function(){
    		$("[name=like-Room-Toggle]").hide();
        	})
        	
		function toggle_LatelyRoom(){
    			if($("[name=lately_Room_Toggle]").css("display") == "none"){
    				$("[name=lately_Room_Toggle]").show();
    				$("[name=like-Room-Toggle]").hide();
    			}
			}

    	function toggle_LikeRoom(){
        	if(${empty buyerDTO}){
            		alert("로그인이 필요합니다.");
            		 location.replace("${ctBuyerRoot}/loginForm.do"); 
            	}
        	
			if($("[name=like-Room-Toggle]").css("display") == "none"){
				$("[name=like-Room-Toggle]").show();
				$("[name=lately_Room_Toggle]").hide();
			}
		}



    </script>
    
    
    
    <script>
	/*상세페이지로 새창이동*/
	function goSearchContantForm(sr_no)
	{
		var openNewWindow = window.open("about:blank");
	
		//document.SearchContantForm.submit();
		openNewWindow.location.href='${ctBuyerRoot}/roomConForm.do?sr_no='+sr_no
	}
	
	function goConForm(rp_no)
	{
		var openNewWindow = window.open("about:blank");
		openNewWindow.location.href='${ctBuyerRoot}/rentConForm.do?rp_no='+rp_no
	}
	</script>
	
	
	
	
	
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="${ctRoot}/resources/ownerHome/css/style.css">
<link rel="stylesheet" href="${ctRoot}/resources/card/card.css">
  </head>

  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	
    
    <div class="site-wrap" id="home-section">

      <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
          <div class="site-mobile-menu-close mt-3">
            <span class="icon-close2 js-menu-toggle"></span>
          </div>
        </div>
        <div class="site-mobile-menu-body"></div>
      </div>





    <div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay" data-stellar-background-ratio="0.5" style="background-image: url('${ctRoot}/resources/images/hero_2.jpg')">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-7">
              <span class="h4 text-primary mb-4 d-block">자바방? 잡아방!</span>
              <h3 class="mb-2 text-light">지금바로 당신이 원하는 원룸을 찾아보세요!</h3>
 
              <p><b><a href="${ctRoot}/buyer/roomListForm.do" class="btn btn-info px-5 py-3" style="margin:30px; font-size:18pt;">방 찾기</a></b></p>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script> $('.carousel').carousel({ interval: 2000 //기본 5초 }) </script>
    	
    <div class="col-lg-12" style="background-color: #d0d7ce;height: 750;margin-top: -50;">
      <form class="homeForm" name="homeForm" method="post"	id="homeForm" action="${ctBuyerRoot}/homeForm.do;">
    
    	<div id="demo" class="carousel slide " data-ride="carousel"> 
    		<div class="col-lg-8 carousel-inner"  style="margin: 0 auto;">
    		
    		
 <!-- 슬라이드 쇼 --> 
    		 
    		 <br><br><br><br><br>
    		 <h3 class="heading-29201 text-center"><a onclick="toggle_LatelyRoom();" style="cursor:pointer">BEST ROOM LIST</a>  </h3>
    		 <p class="mb-5 text-center">자바방에서 핫한 매물목록입니다.</p>
    		 
    		 
    		 
    		 	<div class="carousel-item active" style="margin-top:10px;">
    		 	
    		 		<div class="row text-center">
    		 		
    		 	<c:forEach items="${roomList}" var="roomList" varStatus="loopTagStatus" >
    		 		
				      <div class="col-lg-3 col-md-6 mb-4">
				        <div class="card h-100">
				          <img class="card-img-top" src="${ctImageRoot}/${roomList.sellroom_image}" alt="Image">
				          <div class="card-body">
				            <h4 class="card-title">${roomList.sr_addr}</h4>
				            <p class="card-text">${roomList.sr_roomsize}평  ${roomList.roomtype} ${roomList.option_type}</p>
				          </div>
				          <div class="card-footer" >
				            <a href=javascript:goSearchContantForm(${roomList.sr_no}) class="btn btn-outline-dark" style="font-size:13pt;">보러가기</a>
				            <input type="hidden" name="sr_no" value="${roomList.sr_no}">
				            
				          </div>
				        </div>
				      </div>
				      
				  </c:forEach>
				      
				  </div>
    		  </div>
    		  
    		  
    		  	<div class="carousel-item" style="margin-top:10px;">
    		  		 <div class="row text-center">
    		  		 
    		 	<c:forEach items="${roomSecondList}" var="roomSecondList" varStatus="loopTagStatus" >
    		 		
				      <div class="col-lg-3 col-md-6 mb-4">
				        <div class="card h-100">
				          <img class="card-img-top" src="${ctImageRoot}/${roomSecondList.sellroom_image}" alt="Image">
				          <div class="card-body">
				            <h4 class="card-title">${roomSecondList.sr_addr}</h4>
				            <p class="card-text">${roomSecondList.sr_roomsize}평  ${roomSecondList.roomtype} ${roomSecondList.option_type}</p>
				          </div>
				          <div class="card-footer">
				            <a href=javascript:goSearchContantForm(${roomSecondList.sr_no}) class="btn btn-outline-dark">보러가기</a>
				            <input type="hidden" name="sr_no" value="${roomSecondList.sr_no}">
				            
				          </div>
				        </div>
				      </div>
				      
				  </c:forEach>
				      
				    </div>
    		  	</div>
    		  	<div class="carousel-item" style="margin-top:10px;">
    		  		 <div class="row text-center">
    		  		 
				      
    		 	<c:forEach items="${roomThirdList}" var="roomThirdList" varStatus="loopTagStatus" >
    		 		
				      <div class="col-lg-3 col-md-6 mb-4">
				        <div class="card h-100">
				          <img class="card-img-top" src="${ctImageRoot}/${roomThirdList.sellroom_image}" alt="Image">
				          <div class="card-body">
				            <h4 class="card-title">${roomThirdList.sr_addr}</h4>
				            <p class="card-text">${roomThirdList.sr_roomsize}평  ${roomThirdList.roomtype} ${roomThirdList.option_type}</p>
				          </div>
				          <div class="card-footer">
				            <a href=javascript:goSearchContantForm(${roomThirdList.sr_no}) class="btn btn-outline-dark">보러가기</a>
				            <input type="hidden" name="sr_no" value="${roomThirdList.sr_no}">
				            
				          </div>
				        </div>
				      </div>
				      
				  </c:forEach>
				      
				      
				      
				    </div>
				    </div>
				    
				    
    		  	</div>
    		  </div>
    		
    		 </form> 
    		  	<!-- / 슬라이드 쇼 끝 -->
    		  	<!-- 왼쪽 오른쪽 화살표 버튼 -->
    		  	<a class="carousel-control-prev" href="#demo" data-slide="prev" style="left:-50;">
    		  		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    		  	<!-- <span>Previous</span> -->
    		  	</a>
    		  	<a class="carousel-control-next" href="#demo" data-slide="next" style="right:-50;">
    		  		<span class="carousel-control-next-icon" aria-hidden="true"></span>
    		  		<!-- <span>Next</span> -->
    		  	</a> <!-- / 화살표 버튼 끝 -->
    		  	
    		  	<!-- 인디케이터 -->
   		  	<ul class="carousel-indicators">
	    		  	<li data-target="#demo" data-slide-to="0" class="active"></li>  
	    		  	<li data-target="#demo" data-slide-to="1" class="active"></li> 
	    		  	<li data-target="#demo" data-slide-to="2" class="active"></li> 
    		  	</ul>
    		  	 <!-- 인디케이터 끝 -->
    	
    	</div>

    
    
	  
	  
	  
	  
	  <!-- ========================================================================================== --> 
	  <!-- ========================================================================================== --> 
	  <!-- ========================================================================================== --> 
	  
	 <div class="site-section bg-light" style="background-color: #d0d7ce;height: 750;margin-top: -50;">
      <form class="homeForm" name="homeForm" method="post"	id="homeForm" action="${ctBuyerRoot}/homeForm.do;">
    
    	<div id="demo" class="carousel slide " data-ride="carousel"> 
    		<div class="col-lg-8 carousel-inner"  style="margin: 0 auto;"><br>
    		
    		
 <!-- 슬라이드 쇼 --> 
    		
    		 <h3 class="heading-29201 text-center"><a onclick="toggle_LatelyRoom();" style="cursor:pointer">BEST RENTAL LIST</a>  </h3>
    		 <p class="mb-5 text-center">자바방 1위~5위  렌탈 제품을 만나보세요!</p>
    	
    		 <div class="carousel-item active">
    		 		<div class="row ">
							  
							    
							    
							    
			<!-- ************************************************************************************************************ -->
			<c:forEach items="${rentalList}" var="rentalList">
			
			<a class=sd href="javascript:goConForm(${rentalList.rp_no});">
				    			<div class="cardA">
							     <div class="additional">
							      <div class="user-cardA">
							        <div class="level center">
							          	판매순위
							        </div>
							        <div class="points center">
							        
							          	${rentalList.RNUM}등제품
							        
							        </div>
							        <svg width="300" height="110" viewBox="0 0 250 250"  class="center">
							          <circle cx="125" cy="125" r="120" fill="rgba(0,0,0,0.0)" />
							          
							          
							         <img src="${ctRoot}/resources/images/grade${rentalList.RNUM}.png" style="width: 80;margin-top: 60;margin-left: 15;" > 
						
					
							        </svg>
							      </div>
							      <div class="more-info" style="padding-top:20px;">
							        <div class="coords">
							          <span>제조사 : ${rentalList.rt_comname}</span></div>
							        <div class="coords">
							          <span>연락처 : ${rentalList.rt_phone}</span></div>
							        <div class="coords">
							          <span>모델명 : ${rentalList.rp_model_name}</span></div>
							          
							        <div class="stats">
							          <div>
							            <div class="title">누적렌탈횟수</div>
							            <i class="fa fa-trophy"></i>
							            <div class="value">${rentalList.ru_count}</div>
							          </div>
							        </div>
							      </div>
							    </div>
							    <div class="general">
							      <h5>${rentalList.rental_product_name}</h5>
					<c:if test="${rentalList.rp_no%13==1}">
							<li class="as" style="list-style: none;">
								<a class=sd href="javascript:goConForm(${rentalList.rp_no});">
									<img class="d-block" src="${ctRoot}/resources/images/air.JPG" style="width: 70%;height: 70%;margin: auto;" >
								</a>
							</li>
						</c:if>
						<c:if test="${rentalList.rp_no%13==2}">
							<li class="as" style="list-style: none;">
								<a class=sd href="javascript:goConForm(${rentalList.rp_no});">
									<img class="d-block" src="${ctRoot}/resources/images/water.JPG" style="width: 70%;height: 70%;margin: auto;" >
								</a>
							</li>
						</c:if>
						<c:if test="${rentalList.rp_no%13==3}">
							<li class="as" style="list-style: none;">
								<a class=sd href="javascript:goConForm(${rentalList.rp_no});">
									<img class="d-block" src="${ctRoot}/resources/images/fire.JPG" style="width: 70%;height: 70%;margin: auto;" >
								</a>
							</li>
						</c:if>
						<c:if test="${rentalList.rp_no%13==4}">
							<li class="as" style="list-style: none;">
								<a class=sd href="javascript:goConForm(${rentalList.rp_no});">
									<img class="d-block" src="${ctRoot}/resources/images/TV.JPG" style="width: 70%;height: 70%;margin: auto;" >
								</a>
							</li>
						</c:if>
						<c:if test="${rentalList.rp_no%13==5}">
							<li class="as" style="list-style: none;">
								<a class=sd href="javascript:goConForm(${rentalList.rp_no});">
									<img class="d-block" src="${ctRoot}/resources/images/wave.JPG" style="width: 70%;height: 70%;margin: auto;" >
								</a>
							</li>
						</c:if>
						<c:if test="${rentalList.rp_no%13==6}">
							<li class="as" style="list-style: none;">
								<a class=sd href="javascript:goConForm(${rentalList.rp_no});">
									<img class="d-block" src="${ctRoot}/resources/images/wash.JPG" style="width: 70%;height: 70%;margin: auto;" >
								</a>
							</li>
						</c:if>
						<c:if test="${rentalList.rp_no%13==7}">
							<li class="as" style="list-style: none;">
								<a class=sd href="javascript:goConForm(${rentalList.rp_no});">
									<img class="d-block" src="${ctRoot}/resources/images/cool.JPG" style="width: 70%;height: 70%;margin: auto;" >
							</a>
							</li>
						</c:if>
						<c:if test="${rentalList.rp_no%13==8}">
							<li class="as" style="list-style: none;">
								<a class=sd href="javascript:goConForm(${rentalList.rp_no});">
									<img class="d-block" src="${ctRoot}/resources/images/food.JPG" style="width: 70%;height: 70%;margin: auto;" >
								</a>
							</li>
						</c:if>
						<c:if test="${rentalList.rp_no%13==9}">
							<li class="as" style="list-style: none;">
								<a class=sd href="javascript:goConForm(${rentalList.rp_no});">
									<img class="d-block" src="${ctRoot}/resources/images/rice.JPG" style="width: 70%;height: 70%;margin: auto;" >
								</a>
							</li>
						</c:if>
						<c:if test="${rentalList.rp_no%13==10}">
							<li class="as" style="list-style: none;">
								<a class=sd href="javascript:goConForm(${rentalList.rp_no});">
									<img class="d-block" src="${ctRoot}/resources/images/print.JPG" style="width: 70%;height: 70%;margin: auto;" >
								</a>
							</li>
						</c:if>
						<c:if test="${rentalList.rp_no%13==11}">
							<li class="as" style="list-style: none;">
								<a class=sd href="javascript:goConForm(${rentalList.rp_no});">
									<img class="d-block" src="${ctRoot}/resources/images/sleep.JPG" style="width: 70%;height: 70%;margin: auto;" >
								</a>
							</li>
						</c:if>
						<c:if test="${rentalList.rp_no%13==12}">
							<li class="as" style="list-style: none;">
								<a class=sd href="javascript:goConForm(${rentalList.rp_no});">
									<img class="d-block" src="${ctRoot}/resources/images/toilet.JPG" style="width: 70%;height: 70%;margin: auto;" >
								</a>
							</li>
						</c:if>
						<c:if test="${rentalList.rp_no%13==0}">
							<li class="as" style="list-style: none;">
								<a class=sd href="javascript:goConForm(${rentalList.rp_no});">
									<img class="d-block" src="${ctRoot}/resources/images/styler.JPG" style="width: 70%;height: 70%;margin: auto;" >
								</a>
							</li>
						</c:if>
							      <span class="more">상세정보 보기</span>
							    </div>
							  </div>
					</a>		  
							  
				</c:forEach>
		
		
		
		
    		 	 <!-- ========================================================================================== --> 
    		 		<%-- 
    		 		
    		 		
    		 		
    		 		
					
					
					
					
					
					 --%>
					
					 <!-- ========================================================================================== --> 
				
    		  </div>
    		</div>
    		 </form> 
    		
    	</div>
    
    
	</div>    
    
 <%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
   

   

  </body>

</html>


