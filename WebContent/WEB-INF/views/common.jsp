<!-- page directive 라 한다. JSP파일 상단에 항상 들어간다 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!--  JSP 페이지에서 사용할 [사용자 정의 태그]인 [JSTL의 C코어 태그] 선언 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!-- jsp페이지에서 사용할 사용자 저의 태그인 spring폼 태그 선언 -->
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctRoot" value="/javaBang" />
<c:set var="ctBuyerRoot" value="/javaBang/buyer" />
<c:set var="ctSellerRoot" value="/javaBang/seller" />
<c:set var="ctMasterRoot" value="/javaBang/master" />
<c:set var="ctRealtorRoot" value="/javaBang/realtor" />
<c:set var="ctRentalRoot" value="/javaBang/rental" />
<c:set var="ctImageRoot" value="${ctRoot}/resources/roomImage" />
<c:set var="ctRealtorImageRoot" value="${ctRoot}/resources/images/profileImage" />



<link href="${ctRoot}/resources/common.css" rel="stylesheet" type="text/css">
<script src="${ctRoot}/resources/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="${ctRoot}/resources/common.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=DM+Sans:300,400,700&display=swap" >
 <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
 
 <c:set var="ctRealtorImageRoot" value="${ctRoot}/resources/images/profileImage" />
	
	 <!-- Bootstrap Core CSS -->
  <!-- Custom Fonts -->
  <!-- Custom CSS -->
 <!-- MAIN CSS -->
<link rel="stylesheet" href="${ctRoot}/resources/ownerHome/css/style.css">
 <!-- <script src="${ctRoot}/resources/ownerHome/js/jquery-3.3.1.min.js"></script>
    <script src="${ctRoot}/resources/ownerHome/js/jquery-migrate-3.0.0.js"></script>-->
	<script src="${ctRoot}/resources/ownerHome/js/bootstrap.min.js"></script> 
    <script src="${ctRoot}/resources/ownerHome/js/owl.carousel.min.js"></script>
    <script src="${ctRoot}/resources/ownerHome/js/jquery.sticky.js"></script>
    <script src="${ctRoot}/resources/ownerHome/js/jquery.waypoints.min.js"></script>
    <script src="${ctRoot}/resources/ownerHome/js/jquery.animateNumber.min.js"></script>
    <script src="${ctRoot}/resources/ownerHome/js/jquery.stellar.min.js"></script>
    <script src="${ctRoot}/resources/ownerHome/js/jquery.easing.1.3.js"></script>
    <script src="${ctRoot}/resources/ownerHome/js/bootstrap-datepicker.min.js"></script>
    <script src="${ctRoot}/resources/ownerHome/js/aos.js"></script>
     <script src="${ctRoot}/resources/ownerHome/js/popper.min.js"></script>
     <!-- 구매자 폰트크기 설정 -->
	<c:set var="roomtypefont" value="20pt"/>
	<c:set var="roompricefont" value="15pt"/>
	<c:set var="roomsearchfont1" value="5pt"/>
	<c:set var="roomsearchfont2" value="15pt"/>
	<c:set var="roommodalfont" value="5pt"/>
	<c:set var="rentallistfont" value="20pt"/>
	<c:set var="rentallistfont2" value="5pt"/>
	<c:set var="rentalconfont" value="17pt"/>
	<c:set var="rentalsubfont" value="20pt"/>
     
     <!-- ------------------------------------- -->
     <!-- 렌탈업체 폰트크기 설정 -->
	<c:set var="rentalfont" value="20pt"/>
	<c:set var="rentalmodelfont" value="15pt"/>
	<c:set var="rentalbuttonfont" value="15pt"/>
	<c:set var="rentalbarfont" value="15pt"/>
	<!-- ------------------------------------- -->
	 <!-- 공인중개사 그래프수치 설정 -->
	<c:set var="per" value="10"/>
   <!-- <script src="${ctRoot}/resources/ownerHome/js/main.js"></script> -->
<!-- JSTL의 C코아 태그를 사용해 테이블의 색 관련 변수들 선언 -->
<%-- <c:set var="thColor1" value="#eaeaea"/>
<c:set var="headerColer" value="#cecece"/>
<c:set var="oddTrColor" value="white"/>
<c:set var="evenTrColor" value="#E8F0F4"/>
<c:set var="mouseOverColor" value="#CCE1FF"/>
<c:set var="bodyBgColor1" value="lightblue" />
<c:set var="bodyBgColor1" value="#FFFFFF" /> --%>