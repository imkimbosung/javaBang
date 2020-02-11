<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>JAVABANG</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons 
  <link href="${ctRoot}/resources/main_UI/img/favicon_ma.png" rel="icon">
  <link href="${ctRoot}/resources/main_UI/img/apple-touch-icon.png" rel="apple-touch-icon">-->

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700|Raleway:400,700&display=swap" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="${ctRoot}/resources/main_UI/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${ctRoot}/resources/main_UI/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="${ctRoot}/resources/main_UI/vendor/line-awesome/css/line-awesome.min.css" rel="stylesheet">
  <link href="${ctRoot}/resources/main_UI/vendor/aos/aos.css" rel="stylesheet">
  <link href="${ctRoot}/resources/main_UI/vendor/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${ctRoot}/resources/main_UI/css/style.css" rel="stylesheet">

	<link href="${ctRoot}/resources/card/card_profile.css" rel="stylesheet">
<!-- 공지사항 코드 -->
 <script src="${ctRoot}/resources/Socket.js" type="text/javascript"></script> 
</head>

<script>

</script>

<body>

 <!--  <div class="collapse navbar-collapse custom-navmenu" id="main-navbar">
    <div class="container py-2 py-md-5">
      <div class="row align-items-start">
        <div class="col-md-2">
          <ul class="custom-menu">
            <li class="active"><a href="index.html">Home</a></li>
            <li><a href="about.html">About Me</a></li>
            <li><a href="services.html">Services</a></li>
            <li><a href="works.html">Works</a></li>
            <li><a href="contact.html">Contact</a></li>
          </ul>
        </div>
        <div class="col-md-6 d-none d-md-block  mr-auto">
          <div class="tweet d-flex">
            <span class="icofont-twitter text-white mt-2 mr-3"></span>
            <div>
              <p><em>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam necessitatibus incidunt ut
                  officiis explicabo inventore. <br> <a href="#">t.co/v82jsk</a></em></p>
            </div>
          </div>
        </div>
        <div class="col-md-4 d-none d-md-block">
          <h3>Hire Me</h3>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam necessitatibus incidunt ut officiis
            explicabo inventore. <br> <a href="#">myemail@gmail.com</a></p>
        </div>
      </div>

    </div>
  </div> -->

    <div class="container">
      <a class="navbar-brand" href="${ctRoot}/Main_javaBang.do">
      	<img src="resources/images/logo.jpg" alt="JAVABANG" style="width: 300;">
      </a>

   <!--    <a href="#" class="burger" data-toggle="collapse" data-target="#main-navbar"> -->

    </div>

<%-- 		<input type="text" id="sender" value="${sessionScope.member.m_id}"  style="display: none;" >
        
        <div id="messages"></div> --%>



  <main id="main">
    <div class="site-section site-portfolio" style="padding:20px;">
      <div class="container">
        <div class="row mb-5 align-items-center">
          <div class="col-md-12 col-lg-6 mb-4 mb-lg-0" data-aos="fade-up">
            <h2>WELCOME TO JAVABANG</h2>
            <p class="mb-0">자바방에서는 부동산과 렌탈서비스를 한 번에 이용할 수 있습니다.</p>
          </div>
          <div class="col-md-12 col-lg-6 text-left text-lg-right" data-aos="fade-up" data-aos-delay="100">
            <div id="filters" class="filters">
              <%-- <a href="${ctBuyerRoot}/signupForm.do" data-filter=".web">회원가입</a> --%>
              <input type="button" name="getCheck" value=공인중개사 class="btn btn-warning" onClick="location.replace('/javaBang/realtor/proHome.do');" style="height:50px; font-size:18pt;">
              <input type="button" name="getCheck" value=렌탈업체등록 class="btn btn-info" onClick="location.replace('/javaBang/rental/rentalLogin.do');" style="height:50px; font-size:18pt;">
            </div>
          </div>
        </div>
        <div id="portfolio-grid" class="row no-gutter" data-aos="fade-up" data-aos-delay="200">
          <div class="item web col-sm-6 col-md-4 col-lg-4 mb-4" style="text-align: center;">
            <a href="${ctBuyerRoot}/homeForm.do" class="item-wrap fancybox">
            	<div class="port_text">
            		<h3>구해방</h3>
               		<span>Move in</span>
            	</div>
              <div class="work-info">
                
              </div>
              <img class="img-fluid" src="${ctRoot}/resources/main_UI/img/house.png">
            </a>
            <font color="gray">방을 찾으시나요?</font>
          </div>
          <div class="item photography col-sm-6 col-md-4 col-lg-4 mb-4" style="text-align: center;">
            <a href="${ctSellerRoot}/ownerHomeForm.do" class="item-wrap fancybox">
            	<div class="port_text" >
            		<h3>팔아방</h3>
                	<span>Sell a house</span>
            	</div>
              <div class="work-info">
                
              </div>
              <img class="img-fluid" src="${ctRoot}/resources/main_UI/img/img_2_re.jpg">
            </a>
            <font color="gray">방을 내놓으실 건가요?</font>
          </div>
          <div class="item branding col-sm-6 col-md-4 col-lg-4 mb-4" style="text-align: center;">
           <%--  <a href="${ctBuyerRoot}/rentListForm.do" class="item-wrap fancybox"> --%>
            <a href="${ctBuyerRoot}/rentListForm.do" class="item-wrap fancybox">
            	<div class="port_text">
            		<h3>빌려방</h3>
                	<span>Rental service</span>
            	</div>
              <div class="work-info">
                
              </div>
              <img class="img-fluid" src="${ctRoot}/resources/main_UI/img/gagoo.jpg">
            </a>
            <font color="gray">렌탈서비스를 이용하실건가요?</font>
          </div>

        </div>
      </div>
    </div>

<br><br><br>

      <div class="container">
        <div class="row justify-content-center text-center mb-4">
          <div class="col-5">
            <h3 class="h3 heading"  style="font-size: xx-large;font-weight:800;">All in One</h3>
            <p style="font-size:15pt">자바방에서 맞춤형 원룸을 시작해보세요</p>
          </div>
        </div>
        <div class="row" style="font-size:17pt;">

          <div class="col-12  col-md-6 col-lg-3">
            <span class="la la-building la-3x mb-4"></span>
            <h4 class="h4 mb-2">구매자</h4>
            <p>자바방에서 구매자에게 제공하는 서비스!</p>
            <ul class="list-unstyled list-line">
              <li>매물</li>
              <li>정보</li>
              <li>가전제품 & 가구</li>
              <li>중개인</li>
              <li>빠른피드백</li>
            </ul>
          </div>
          <div class="col-12  col-md-6 col-lg-3">
            <span class="la la-krw la-3x mb-4"></span>
            <h4 class="h4 mb-2">판매자</h4>
            <p>자바방에서 판매자에게 제공하는 서비스!</p>
            <ul class="list-unstyled list-line">
              <li>신뢰높은 중개인 매칭</li>
              <li>광고무료</li>
              <li>임대관리솔루션</li>
              <li>공실기간단축</li>
            </ul>
          </div>
          <div class="col-12 col-md-6 col-lg-3">
            <span class="la la-magic la-3x mb-4"></span>
            <h4 class="h4 mb-2">빌리자</h4>
            <p>가구와 전자제품에 들어가는 비용을 낮춰드립니다!</p>
            <ul class="list-unstyled list-line">
              <li>원하는 제품</li>
              <li>원하는 기간</li>
              <li>배송시스템</li>
              <li>수거시스템</li>
              <li>확실한 AS까지 보장</li>
            </ul>
          </div>
          <div class="col-12  col-md-6 col-lg-3">
            <span class="la la-laptop la-3x mb-4"></span>
            <h4 class="h4 mb-2">중개인</h4>
            <p>자바방에서 중개인에게 제공하는 서비스!</p>
            <ul class="list-unstyled list-line">
              <li>중개인 관리 페이지</li>
              <li>공실관리페이지</li>
              <li>다양한 그래프로 보기쉽게</li>
            </ul>
          </div>
        </div>
      </div>


<br><br><br><br><br>



      <div class="container" style="background-color: #F3F3F3;min-width: -webkit-fill-available;">
        <div class="row justify-content-center mb-5">
          <div class="col-md-6 text-center">
            <h2 class="heading-29201 text-center">자바방과 함께하는 공인중개사</h2>
            <p class="mb-5" style="font-size:15pt">자바방 현재 1위~5위 공인중개사를 만나보세요!</p>
          </div>
        </div>
        <div class="row">
        <div class="conatiner"style="margin: -2% 0% 3% 17%;width: 55%;">
			<div class="wrap">
				<c:forEach items="${topRealtorList}" var="topRealtorList" varStatus="loopTagStatus" >
					<div class="box" >
						<div class="date">
							<h5>BEST REALTOR</h5>
						</div>
						<img src="${ctRealtorImageRoot}/${topRealtorList.image_name}" style="width: 50%;height: auto;border-radius: 20%;margin-top:20px;"/>
						<h1>${topRealtorList.ri_officename}</h1>
						<h2>공인중개사 이름 : ${topRealtorList.r_name}</h2>
						<h2>공인중개사 번호 : ${topRealtorList.r_no}</h2>
						<h2>평균 평점 : ${topRealtorList.br_score} / 5</h2>
						<div class="poster p1">
							<img src="${ctRoot}/resources/images/grade${topRealtorList.RNUM}.png" style="max-width: inherit;">
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
        <%-- 
        	<c:forEach items="${topRealtorList}" var="topRealtorList" varStatus="loopTagStatus" >
        	<div class="card">
			  <div class="content">
			    <div class="post main">
			     	 <img src="${ctRealtorImageRoot}/${topRealtorList.image_name}" style="width: 50%;height: auto;border-radius: 20%;margin-top:20px;"/>
			   			<p class="text-dark"></p>
			    </div>
			  </div>
			  <div class="fabs">
			    <img src="${ctRoot}/resources/images/grade${topRealtorList.RNUM}.png" class="avatar" >
			  </div>
			  <div class="user">
			    <div class="profiles">
			     <div class="card_title title-white">
					    
				            <p class="card_title">평균 평점 : ${topRealtorList.br_score}</p>
				            <p class="card_title">공인중개사 번호 : ${topRealtorList.r_no}</p>
					   </div>
					          <div class="card_title">
					            <p class="card-text">공인중개사 성함 : ${topRealtorList.r_name}</p>
					  </div>
			    </div>
			  </div>
			</div>
			</c:forEach> --%>
			        	
        	<%-- 
        	<div class="cards-list">
        		<c:forEach items="${topRealtorList}" var="topRealtorList" varStatus="loopTagStatus" >
        			<div class="cards2"><img src="${ctRoot}/resources/images/grade${topRealtorList.RNUM}.png" style="width: 80;margin-top: 60;margin-left: 15;" ></div>
					<div class="cards 1">
					  <div class="card_image" >
					  							          
					  
					  	 <h4 class="card-title">순위 : ${topRealtorList.RNUM}</h4>
					  	 	<img src="${ctRealtorImageRoot}/${topRealtorList.image_name}" /> 
					  </div>
					  <div class="card_title title-dark">
					    
				            <p class="card-footer">평균 평점 : ${topRealtorList.br_score}</p>
				            <p class="card-footer">공인중개사 번호 : ${topRealtorList.r_no}</p>
				            <p class="card-footer">${topRealtorList.ri_officename}</p>
					   </div>
					          <div class="card-footer">
					            <p class="card-text">공인중개사 성함 : ${topRealtorList.r_name}</p>
					  </div>
					</div>
				 </c:forEach>
			</div> --%>
        <%-- 
         		 	<div class="carousel-item active" style="margin-top:10px;">
    		 	
    		 		<div class="row text-center">
    		 		
    		 	<c:forEach items="${topRealtorList}" var="topRealtorList" varStatus="loopTagStatus" >
    		 		
				      <div class="col-lg-3 col-md-6 mb-4">
				        <div class="card h-60">
				          <img class="card-img-top" src="${ctRealtorImageRoot}/${topRealtorList.image_name}" alt="Image">
				          <div class="card-body">
				            <h4 class="card-title">순위 : ${topRealtorList.RNUM}</h4>
				            <p class="card-text">평균 평점 : ${topRealtorList.br_score}</p>
				            <p class="card-text">공인중개사 번호 : ${topRealtorList.r_no}</p>
				            <p class="card-text">${topRealtorList.ri_officename}</p>
				          </div>
				          <div class="card-footer">
				            <p class="card-text">공인중개사 성함 : ${topRealtorList.r_name}</p>
				            
				          </div>
				        </div>
				      </div>
				      
				 </c:forEach>
				      
				  </div>
    		 		 <!-- =======================가로======================= --> 
    		  </div> --%>
          
          
          
        </div>
      </div>






  </main>
  <div style="margin-top:300px;">
  

  <footer class="footer" role="contentinfo">
    <div class="container">
      <div class="row">
        <div class="col-sm-6">
          <p class="mb-1">&copy; Copyright JAVABANG. IN KOSMO 2020</p>
          <div class="credits">
            <!--
              All the links in the footer should remain intact.
              You can delete the links only if you purchased the pro version.
              Licensing information: https://bootstrapmade.com/license/
              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=MyPortfolio
            -->
            Designed by <a>SY</a>
          </div>
        </div>
        <div class="col-sm-6 social text-md-right">
          <a href="/javaBang/master/homeForm.do"><span class="icofont-dribbble"></span></a>
         
        </div>
      </div>
    </div>
  </footer>
  </div>

  <!-- Vendor JS Files -->
  <script src="${ctRoot}/resources/main_UI/vendor/jquery/jquery.min.js"></script>
  <script src="${ctRoot}/resources/main_UI/vendor/bootstrap/js/bootstrap.min.js"></script>
  <script src="${ctRoot}/resources/main_UI/vendor/easing/easing.min.js"></script>
  <script src="${ctRoot}/resources/main_UI/vendor/php-email-form/validate.js"></script>
  <script src="${ctRoot}/resources/main_UI/vendor/isotope/isotope.pkgd.min.js"></script>
  <script src="${ctRoot}/resources/main_UI/vendor/aos/aos.js"></script>
  <script src="${ctRoot}/resources/main_UI/vendor/owlcarousel/owl.carousel.min.js"></script>

  <!-- Template Main JS File -->
  <script src="${ctRoot}/resources/main_UI/js/main.js"></script>
  
  <script src="${ctRoot}/resources/card/card.js"></script>

</body>

</html>
