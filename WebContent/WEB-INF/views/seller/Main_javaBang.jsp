<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>SELLER - HOME</title>
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

  <!-- =======================================================
    Template Name: MyPortfolio
    Template URL: https://bootstrapmade.com/myportfolio-bootstrap-portfolio-website-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com/
  ======================================================= -->
</head>

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

  <nav class="navbar navbar-light custom-navbar">
    <div class="container">
      <a class="navbar-brand" href="${ctRoot}/Main_javaBang.do">JAVABANG.</a>

   <!--    <a href="#" class="burger" data-toggle="collapse" data-target="#main-navbar"> -->
        <span></span>
      </a>

    </div>
  </nav>

  <main id="main">

    <div class="site-section site-portfolio">
      <div class="container">
        <div class="row mb-5 align-items-center">
          <div class="col-md-12 col-lg-6 mb-4 mb-lg-0" data-aos="fade-up">
            <h2>WELCOME TO JAVABANG</h2>
            <p class="mb-0">저희 자바방은 1인가구를 위한 맞춤형 솔루션을 제공합니다.</p>
          </div>
          <div class="col-md-12 col-lg-6 text-left text-lg-right" data-aos="fade-up" data-aos-delay="100">
            <div id="filters" class="filters">
              <a href="${ctBuyerRoot}/signupForm.do" data-filter=".web">회원가입</a>
              <input type="button" name="getCheck" value=공인중개사 class="btn btn-warning" onClick="location.replace('/javaBang/realtor/proHome.do');" style="height:50px;">
            </div>
          </div>
        </div>
        <div id="portfolio-grid" class="row no-gutter" data-aos="fade-up" data-aos-delay="200">
          <div class="item web col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="${ctBuyerRoot}/homeForm.do" class="item-wrap fancybox">
            	<div class="port_text">
            		<h3>구해방</h3>
               		<span>Move in</span>
            	</div>
              <div class="work-info">
                
              </div>
              <img class="img-fluid" src="${ctRoot}/resources/main_UI/img/img_1_re.jpg">
            </a>
          </div>
          <div class="item photography col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="${ctSellerRoot}/ownerHomeForm.do" class="item-wrap fancybox">
            	<div class="port_text">
            		<h3>팔아방</h3>
                	<span>Sell a house</span>
            	</div>
              <div class="work-info">
                
              </div>
              <img class="img-fluid" src="${ctRoot}/resources/main_UI/img/img_2_re.jpg">
            </a>
          </div>
          <div class="item branding col-sm-6 col-md-4 col-lg-4 mb-4">
           <%--  <a href="${ctBuyerRoot}/rentListForm.do" class="item-wrap fancybox"> --%>
            <a href="/javaBang/rental/rentalHomeForm.do" class="item-wrap fancybox">
            	<div class="port_text">
            		<h3>빌려방</h3>
                	<span>Rental service</span>
            	</div>
              <div class="work-info">
                
              </div>
              <img class="img-fluid" src="${ctRoot}/resources/main_UI/img/img_3_re.jpg">
            </a>
          </div>

        </div>
      </div>
    </div>
<!-- 
    <div class="site-section">
      <div class="container">
        <div class="row justify-content-center text-center mb-4">
          <div class="col-5">
            <h3 class="h3 heading">자바방? 잡아방!</h3>
            <p>1인가구를 위해 엄선된 원룸만을 중개하는 자바방에서 <br>당신의 방을 잡아보세요!</p>
          </div>
        </div>
        <div class="row">
          <div class="col-4 col-sm-4 col-md-2">
            <a href="#" class="client-logo"><img src="resources/main_UI/img/logo-adobe.png" alt="Image" class="img-fluid"></a>
          </div>
          <div class="col-4 col-sm-4 col-md-2">
            <a href="#" class="client-logo"><img src="resources/main_UI/img/logo-uber.png" alt="Image" class="img-fluid"></a>
          </div>
          <div class="col-4 col-sm-4 col-md-2">
            <a href="#" class="client-logo"><img src="resources/main_UI/img/logo-apple.png" alt="Image" class="img-fluid"></a>
          </div>
          <div class="col-4 col-sm-4 col-md-2">
            <a href="#" class="client-logo"><img src="resources/main_UI/img/logo-netflix.png" alt="Image" class="img-fluid"></a>
          </div>
          <div class="col-4 col-sm-4 col-md-2">
            <a href="#" class="client-logo"><img src="resources/main_UI/img/logo-nike.png" alt="Image" class="img-fluid"></a>
          </div>
          <div class="col-4 col-sm-4 col-md-2">
            <a href="#" class="client-logo"><img src="resources/main_UI/img/logo-google.png" alt="Image" class="img-fluid"></a>
          </div>

        </div>
      </div>
    </div> -->


    <div class="site-section">
      <div class="container">
        <div class="row justify-content-center text-center mb-4">
          <div class="col-5">
            <h3 class="h3 heading">All in One</h3>
            <p>자바방에서 맞춤형 원룸을 시작해보세요</p>
          </div>
        </div>
        <div class="row">

          <div class="col-12 col-sm-6 col-md-6 col-lg-3">
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
          <div class="col-12 col-sm-6 col-md-6 col-lg-3">
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
          <div class="col-12 col-sm-6 col-md-6 col-lg-3">
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
          <div class="col-12 col-sm-6 col-md-6 col-lg-3">
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
    </div>

    <div class="site-section pt-0">
      <div class="container">

        <div class="owl-carousel testimonial-carousel">

          <div class="testimonial-wrap">
            <div class="testimonial">
              <img src="${ctRoot}/resources/main_UI/img/person_1.jpg" alt="Image" class="img-fluid">
              <blockquote>
                <p>자바방에서 마음에 쏙드는 방을 발견했어요! 인테리어에 관심이 많다보니 비용이 걱정됬는데 빌려방을 이용해서 돈 굳었습니다!! 감사합니다 :-)</p>
              </blockquote>
              <p>&mdash; 제니장</p>
            </div>
          </div>

          <div class="testimonial-wrap">
            <div class="testimonial">
              <img src="${ctRoot}/resources/main_UI/img/person_3.jpg" alt="Image" class="img-fluid">
              <blockquote>
                <p>세탁기를 빌려방을 통해서 빌려쓸 수 있어서 너무 좋았습니다. 이사 갈때도 전화한통이면 알아서 수거도해주시니 너무 편했습니다 강추강추!!</p>
              </blockquote>
              <p>&mdash; 춘배씨</p>
            </div>
          </div>

        </div>

      </div>
    </div>
  </main>
  <footer class="footer" role="contentinfo">
    <div class="container">
      <div class="row">
        <div class="col-sm-6">
          <p class="mb-1">&copy; Copyright JAVABANG. IN KOSMO 2019</p>
          <div class="credits">
            <!--
              All the links in the footer should remain intact.
              You can delete the links only if you purchased the pro version.
              Licensing information: https://bootstrapmade.com/license/
              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=MyPortfolio
            -->
            Designed by <a>JAVABANG</a>
          </div>
        </div>
        <div class="col-sm-6 social text-md-right">
          <a href="#"><span class="icofont-twitter"></span></a>
          <a href="#"><span class="icofont-facebook"></span></a>
          <a href="#"><span class="icofont-dribbble"></span></a>
          <a href="#"><span class="icofont-behance"></span></a>
        </div>
      </div>
    </div>
  </footer>

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

</body>

</html>
