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
      <a class="navbar-brand" >JAVABANG  공지사항</a>

    </div>
  </nav>

<br>

<br>

	<center>
	<table class="table">
		<tr><th>제목
			 <th>	${title }
		<tr><th> 내용
				<th> ${content }
	</table>
	</center>

  <!-- Template Main JS File -->
  <script src="${ctRoot}/resources/main_UI/js/main.js"></script>

</body>

</html>
