<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <title>공인중개사 마이페이지 왼쪽 메뉴</title>
   <meta charset="UTF-8">
   <link rel="stylesheet" href="${ctRoot}/resources/nav/bootstrap.css">
      <link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
  <%--  <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->

<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/animate/animate.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/select2/select2.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
    <link rel="stylesheet" href="${ctRoot}/resources/loginPage/css/title_ui.css">
<!--===============================================================================================-->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> --%>
    <link rel="stylesheet" href="${ctRoot}/resources/sidebar/main.css">
    <link rel="stylesheet" href="${ctRoot}/resources/sidebar/main.js">
   
   <!-- 예쁜셀렉트박스 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <meta name="author" content="colorlib.com">
   
    <link href="${ctRoot}/resources/selectbox/css/main.css" rel="stylesheet" />
    
  </head>
  
  
   <body style="font-size:13pt;">

    
   <div class="page-wrapper chiller-theme toggled">
  <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
    <i class="fas fa-bars"></i>
  </a>
   <nav id="sidebar" class="sidebar-wrapper">
    <div class="sidebar-content">
      <div class="sidebar-header">
        <div class="user-pic">
          <!-- <img class="img-responsive img-rounded" src="/javaBang/WEB-INF/resources/profileImage/realtor2.jpg" alt="User picture"> -->
          <img class="img-responsive img-rounded" src="${ctRoot}/resources/images/profileImage/${realtorMenuInfoDTO.image_name}" alt="User picture">
        </div>
        <div class="user-info">
          <span class="user-name" style="font-size:12pt;"><b>${realtorMenuInfoDTO.r_name}</b>님 반갑습니다.</span>
          <span class="user-role">개인공인중개사</span>
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
            <span>카테고리</span>
          </li>
          <li class="sidebar-dropdown">
            <a href="${ctRealtorRoot}/proMyPageHome.do">
            <i class="fa fa-home"></i>  
               <span>마이페이지 홈</span>
            </a>
          </li>
          <li class="sidebar-dropdown">
            <a href="${ctRealtorRoot}/managementHouse.do">
              <i class="fa fa-list"></i>
              <span>관리중인 매물</span>
            </a>
          </li>
          <li class="sidebar-dropdown">
            <a href="${ctRealtorRoot}/managementProduct.do">
              <i class="fa fa-gratipay"></i>
              <span>매칭대기중인 매물</span>
            </a>
          </li>
          <li>
            <a href="${ctRealtorRoot}/realtorModifyPwdCheck.do">
              <i class="fa fa-edit"></i>
              <span>정보수정</span>
            </a>
          </li>
          <li style="margin-top:100px;">
          </li>
           <li>
           <form class="form-inline my-2 my-lg-0">
		      <!-- <input type="button" name="getCheck" value=공인중개사 class="btn btn-warning" onClick="location.replace('/javaBang/realtor/proHome.do');" style="height:50px;">&nbsp; -->
		      
			      	<a name="goOutLogin"  href="/javaBang/logoutForm.do?logout=realtor">
	              	<i class="fa fa-refresh fa-spin fa-fw"></i>
              	<span>로그아웃</span>
              	</a>
		     
	 		</form>
        	</li>
        	<li>
            <a href="${ctRoot}/Main_javaBang.do;">
              <i class="fa fa-building"></i>
              <span>초기화면으로 이동</span>
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








