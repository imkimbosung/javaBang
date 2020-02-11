<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>
<link rel="stylesheet" href="${ctRoot}/resources/nav/bootstrap.css">

<!-- ########### 사이드 바  ################ -->
 <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
          <div class="site-mobile-menu-close mt-3">
            <span class="icon-close2 js-menu-toggle"></span>
          </div>
        </div>
        <div class="site-mobile-menu-body"></div>
      </div>
      
<!-- ################################## -->
	 
	  <!-- Navbar   ================================================== -->
      <div class="bs-docs-section clearfix">
        <div class="row">
          <div class="col-xs-12"  style="width:100%">
            <div class="bs-component">
              <nav class="navbar navbar-expand-lg text-dark" style="background-color:#78C2AD;" >
  				<a class="javabang" href="/javaBang/seller/ownerHomeForm.do" style="margin-right:160pt;">JAVABANG</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarColor01" >
                  <ul class="navbar-nav mr-auto">
                  	
                    <li class="nav-item">
       					 <h2><a class="nav-link" href="${ctSellerRoot}/checkRoomForm.do" style="font-weight: 600;">방내놓기</a></h2>
                    </li>
                    <li class="nav-item">
      				  	<h2><a class="nav-link" href="${ctSellerRoot}/emptyListForm.do" style="font-weight: 600;">나의 매물</a></h2>
                    </li>
                    <li class="nav-item">
     				  	<h2><a class="nav-link " href="${ctSellerRoot}/modifyCheckPwd.do" style="font-weight: 600;">마이페이지</a></h2>
                    </li>
                  </ul>
                  <form class="form-inline my-2 my-lg-0">
			          <c:if test="${empty s_id}"> 
						<div class="login"  style="margin:auto"><h2><a class="nav-link" href="${ctSellerRoot}/loginForm.do" style="font-weight: 600;">로그인/회원가입</a></h2></div>
					</c:if>
					<c:if test="${!empty s_id}"> 
						<div class="login" ><h2><a class="nav-link" href="${ctSellerRoot}/modifyCheckPwd.do" style="font-weight: 600;">${s_name}</a></h2></div>
					</c:if>
					<c:if test="${!empty s_id}">  
						<input type="button" name="goOutLogin" value=로그아웃 class="btn btn-warning" onClick="location.replace('${ctRoot}/logoutForm.do?logout=seller');" style="font-size:15pt">
			   	     </c:if> 
			    </form>
						<input type="button" name="main" value="초기화면" class="btn btn-light" onClick="location.replace('${ctRoot}/Main_javaBang.do');" style="height:4%;width:10%;font-size:15pt">
                </div>
              </nav>
            </div>
          </div>
        </div>
      </div>
	 

    <script src="${ctRoot}/resources/ownerHome/js/popper.min.js"></script>
    <script src="${ctRoot}/resources/ownerHome/js/bootstrap.min.js"></script>
    <script src="${ctRoot}/resources/ownerHome/js/owl.carousel.min.js"></script>
    <script src="${ctRoot}/resources/ownerHome/js/jquery.sticky.js"></script>
    <script src="${ctRoot}/resources/ownerHome/js/jquery.waypoints.min.js"></script>
    <script src="${ctRoot}/resources/ownerHome/js/jquery.animateNumber.min.js"></script>
    <script src="${ctRoot}/resources/ownerHome/js/jquery.fancybox.min.js"></script>
    <script src="${ctRoot}/resources/ownerHome/js/jquery.stellar.min.js"></script>
    <script src="${ctRoot}/resources/ownerHome/js/jquery.easing.1.3.js"></script>
    <script src="${ctRoot}/resources/ownerHome/js/bootstrap-datepicker.min.js"></script>
    <script src="${ctRoot}/resources/ownerHome/js/aos.js"></script>

    <script src="${ctRoot}/resources/ownerHome/js/main.js"></script>
   
<!-- 상단바 네비 애니 --> 
	<script src="${ctRoot}/resources/nav/custom.js"></script> 
