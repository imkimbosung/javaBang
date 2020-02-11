<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <title>공인중개사 마이페이지 왼쪽 메뉴</title>
   <meta charset="UTF-8">
   
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
<!--===============================================================================================-->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctRoot}/resources/sidebar/main.css">
    <link rel="stylesheet" href="${ctRoot}/resources/sidebar/main.js">
   
   <!-- 예쁜셀렉트박스 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <meta name="author" content="colorlib.com">
   
    <link href="${ctRoot}/resources/selectbox/css/main.css" rel="stylesheet" />
    
  </head>
  
  
   <body>

    
   <div class="page-wrapper chiller-theme toggled" style="float:left;">
  <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
    <i class="fas fa-bars"></i>
  </a>
   <nav id="sidebar" class="sidebar-wrapper">
    <div class="sidebar-content">
      <div class="sidebar-header">
        <div class="user-info">
          <span class="user-name"><font size=inherit><b>${rt_comname}</b>님</font></span>
          <span class="user-role">법인사업장회원</span>
          <span class="user-status">
            <i class="fa fa-circle"></i>
            <span>Online</span>
          </span>
        </div>
      </div>

      <!-- sidebar-search  -->
      <div class="sidebar-menu">
        <ul>
          <li class="header-menu">
            <span >사업주님</span>
          </li>
          <li class="sidebar-dropdown">
            <a href="${ctRoot}/rental/rentalCompanyMain.do?rp_no=0">
              <i class="fa fa-tasks"></i>
              <span style="font-size:${rentalbarfont}">렌탈제품관리</span>
            </a>
          </li>
          <li class="sidebar-dropdown">
            <a href="${ctRoot}/rental/rentalProductInsert.do?rp_no=0">
              <i class="fa fa-search-plus"></i>
              <span style="font-size:${rentalbarfont}">물품등록</span>
            </a>
          </li>
          <li class="sidebar-dropdown">
            <a href="${ctRoot}/rental/rentalcharts.do">
              <i class="fa fa-signal"></i>
              <span style="font-size:${rentalbarfont}">통계</span>
            </a>
          </li>
          
          <li style="margin-top:50px;">
          <li class="header-menu">
            <span>고객</span>
          </li>
          <li class="sidebar-dropdown">
            <a href="${ctRoot}/rental/rentalSubForm.do">
              <i class="fa fa-gratipay"></i>
              <span style="font-size:${rentalbarfont}">렌탈신청현황</span>
            </a>
          </li>
          <li>
            <a href="${ctRoot}/rental/rentalASForm.do">
              <i class="fa fa-comments"></i>
              <span style="font-size:${rentalbarfont}">AS신청현황</span>
              <span class="badge badge-pill badge-primary">Beta</span>
            </a>
          </li>
          
          <li style="margin-top:50px;">
         
          </li>
           <li>
           <form class="form-inline my-2 my-lg-0">
		      <!-- <input type="button" name="getCheck" value=공인중개사 class="btn btn-warning" onClick="location.replace('/javaBang/realtor/proHome.do');" style="height:50px;">&nbsp; -->
		      <c:if test="${!empty rt_id}"> 
			      	<a name="goOutLogin"  href="javascript:location.replace('${ctRoot}/rental/rentalLogOut.do');">
	              	<i class="fa fa-refresh fa-spin fa-fw"></i>
              	<span style="font-size:${rentalbarfont}">로그아웃</span>
              	</a>
		      </c:if>
	 		</form>
        	</li>
        	<li>
            <a href="${ctRoot}/Main_javaBang.do;">
              <i class="fa fa-building"></i>
              <span style="font-size:${rentalbarfont}">자바방초기화면</span>
            </a>
          </li>
        </ul>
      </div>
      <!-- sidebar-menu  -->
    </div>
  </nav>
   
       </div>
   </body>

 
</html>








