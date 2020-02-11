<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/realtor/incloudfile/topBar.jsp" %>

<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>REALTOR - HOME</title>

  <!-- Bootstrap Core CSS -->
  <!-- Custom Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Custom CSS -->
  <link href="${ctRoot}/resources/ownerHome/css/stylish-portfolio.min.css" rel="stylesheet">
  
  <!-- 공지사항 코드 -->
<script src="${ctRoot}/resources/Socket.js" type="text/javascript"></script>

</head>
<script>
	jQuery.noConflict();
	
	function startProHome(){

		
		if(${empty realtorDTO}){
	    		 location.replace("${ctRealtorRoot}/loginForm.do"); 
	    	}
		
		location.replace("${ctRealtorRoot}/proMyPageHome.do"); 
		
		
	}
	

</script>

<body id="page-top">


	
  <!-- Header -->
		<div class="site-section-cover overlay" style="background-image: url('/javaBang/resources/images/boodong.png')">
			<div class="container">
				<div class="row align-items-center justify-content-center text-center" style="height:200px;margin-left:70;">
					<div class="col-md-10" style="margin-left: 300;">
						<h3 class="mb-1" style="padding: 15px;font-weight: bold;text-align: center;background-color: #ffffff;opacity: 0.9;width: 400;">공인중개사 홈</h3>
						<a class="btn btn-light btn-xl js-scroll-trigger" style="margin-right: 450;margin-top: 20;font-weight: 600;font-size:15pt;" onClick="startProHome();">지금시작하기</a>
					</div>
				</div>
			</div>
		</div>
    



<br><br><br><br>

    
  <!-- Portfolio -->
  <section class="content-section" id="portfolio"  style="width: 50%;height: 50%;margin: 0 auto;padding-top: 50;">
    <div class="container">
      <div class="content-section-heading text-center">
        <h3 class="text-secondary mb-0">JAVABANG</h3>
        <h2 class="mb-3">자바방에서 제공하는 공인중개사를 위한 서비스</h2>
      </div>
      <div class="row no-gutters">
        <div class="col-lg-6">
          <a class="portfolio-item">
            <span class="caption">
              <span class="caption-content">
                <h2>제한없이</h2>
                <p class="mb-0">모든 서비스 무료! 공실이 나올때 자바방에 광고하는 것도 무료로 진행하세요.</p>
              </span>
            </span>
            <img class="img-fluid" src="${ctRoot}/resources/images/marketing.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-6">
          <a class="portfolio-item" >
            <span class="caption">
              <span class="caption-content">
                <h2>전문적인</h2>
                <p class="mb-0">자바방의 전문 기획자들이 만든 임대관리솔루션</p>
              </span>
            </span>
            <img class="img-fluid" src="${ctRoot}/resources/images/professional.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-6">
          <a class="portfolio-item" >
            <span class="caption">
              <span class="caption-content">
                <h2>믿음가는</h2>
                <p class="mb-0">믿을 수 있는 자바방의 파트너 공인중개사</p>
              </span>
            </span>
            <img class="img-fluid" src="${ctRoot}/resources/images/trust.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-6">
          <a class="portfolio-item">
            <span class="caption">
              <span class="caption-content">
                <h2>비지않게</h2>
                <p class="mb-0">자바방에 신뢰도 높은 매물로 노출, 계약성사를 UP! 공실걱정 제로!</p>
              </span>
            </span>
            <img class="img-fluid" src="${ctRoot}/resources/images/move.jpg" alt="">
          </a>
        </div>
      </div>
    </div>
  </section>
    
    
    
    
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

  <!-- Callout -->
  <section class="callout"  style="background-image: url('${ctRoot}/resources/images/treehome.jpg')">
    <div class="container text-center">
      <h4 class="mx-auto mb-5">자바방 공인중개사 모드를 시작해보세요!</h4>
      <a class="btn btn-outline-dark btn-xl" onClick="startProHome();">지금 시작하기</a>
    </div>
  </section>

  
  
  

  <!-- Call to Action
  <section class="content-section bg-primary text-white">
    <div class="container text-center">
      <h2 class="mb-4">The buttons below are impossible to resist...</h2>
      <a href="#" class="btn btn-xl btn-light mr-4">Click Me!</a>
      <a href="#" class="btn btn-xl btn-dark">Look at Me!</a>
    </div>
  </section> -->

<!--   <!-- Map 
  <section id="contact" class="map">
    <iframe width="100%" height="100%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A&amp;output=embed"></iframe>
    <br />
    <small>
      <a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A"></a>
    </small>
  </section> -->

 

	<script src="${ctRoot}/resources/checkRoom/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${ctRoot}/resources/checkRoom/js/jqBootstrapValidation.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="${ctRoot}/resources/checkRoom/js/jqBootstrapValidation.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="${ctRoot}/resources/checkRoom/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${ctRoot}/resources/checkRoom/js/jqBootstrapValidation.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	
	
<div style="margin-top:100px;">
  <%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
</div>


</body>
</html>