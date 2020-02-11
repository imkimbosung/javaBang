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

  <!-- Favicons -->
  <link href="${ctRoot}/resources/main_UI/img/favicon_ma.png" rel="icon">
  <link href="${ctRoot}/resources/main_UI/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700|Raleway:400,700&display=swap"
    rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="${ctRoot}/resources/main_UI/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${ctRoot}/resources/main_UI/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="${ctRoot}/resources/main_UI/vendor/line-awesome/css/line-awesome.min.css" rel="stylesheet">
  <link href="${ctRoot}/resources/main_UI/vendor/aos/aos.css" rel="stylesheet">
  <link href="${ctRoot}/resources/main_UI/vendor/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${ctRoot}/resources/main_UI/css/style.css" rel="stylesheet">

</head>

<body>


  <nav class="navbar navbar-light custom-navbar">
    <div class="container">
      <a class="navbar-brand"	href="/javaBang/Main_javaBang.do">JAVABANG <font size="2"> 홈으로 가기</font></a>

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
            <h2>현재 서비스 점검 중 입니다.</h2>
             일시: ${getCheckInfo[0].startdate} ~ ${getCheckInfo[0].enddate} 까지  
            <p class="mb-0">${getCheckInfo[0].inputmsg}</p>
          </div>
    
        </div>

    
      </div>
    </div>


  </main>
  <!-- Template Main JS File -->
  <script src="${ctRoot}/resources/main_UI/js/main.js"></script>

</body>

</html>
