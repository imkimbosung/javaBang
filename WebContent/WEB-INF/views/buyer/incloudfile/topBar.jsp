<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<link rel="stylesheet" href="${ctRoot}/resources/nav/bootstrap.css">

<%
	String master_id = (String)session.getAttribute("m_id");
%>

 

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
              <nav class="navbar navbar-expand-sm text-dark" style="background-color:#78C2AD;" >
  				<a class="javabang" href="/javaBang/buyer/homeForm.do">JAVABANG</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarColor01" style="margin-left: 16%;">
                  <ul class="navbar-nav mr-auto">
                  
                  
   					<li class="nav-item">
       					 <h2><a class="nav-link" href="${ctBuyerRoot}/roomListForm.do" style="font-weight: 600;">방찾기</a></h2>
                    </li>
                    <li class="nav-item">
      				  	<h2><a class="nav-link" href="${ctBuyerRoot}/rentListForm.do" style="font-weight: 600;">옵션렌탈서비스</a></h2>
                    </li>
                    <li class="nav-item">
      				  	<h2><a class="nav-link " href="${ctBuyerRoot}/buyerRentalSubForm.do" style="font-weight: 600;">렌탈현황</a></h2>
                    </li>
                     <li class="nav-item">
         				<h2><a class="nav-link " href="${ctBuyerRoot}/likeRoomList.do" style="font-weight:600;">마이페이지</a></h2>
                    </li>
                    
                    
                  </ul>
                  <form class="form-inline my-2 my-lg-0">
                  <% if(master_id == null){ %>
			          <c:if test="${empty buyerDTO}"> 
			            <div class="login" style="margin:auto"><h2><a class="nav-link " href="${ctBuyerRoot}/loginForm.do" style="font-weight: 600;" >로그인/회원가입</a></h2></div>
			         </c:if>
			         <c:if test="${!empty buyerDTO}"> 
			             <div class="login" ><h2><a class="nav-link " href="${ctBuyerRoot}/likeRoomList.do"><b>${buyerDTO.b_name}님</b></a></h2></div>
			         </c:if> 
			       <c:if test="${!empty buyerDTO}">
						<input type="button" name="goOutLogin" value=로그아웃 class="btn btn-warning" onClick="location.replace('${ctRoot}/logoutForm.do?logout=buyer');" style="height:50px;font-size:15pt">
			       </c:if>
			     <% }else { %>
			    	 <div class="login" ><h2><a class="nav-link "><b>관리자 로그인</b></a></h2></div>			    	 
			     <% } %>
			
			    </form>
						<input type="button" name="main" value="초기화면" class="btn btn-light" onClick="location.replace('${ctRoot}/Main_javaBang.do');" style="height:4%;width:10%;font-size:15pt">
                </div>
              </nav>
            </div>
          </div>
        </div>
      </div>
	 
	 
    
<!-- 상단바 네비 애니메이션3총사 -->  
<%--<script src="${ctRoot}/resources/checkRoom/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${ctRoot}/resources/checkRoom/js/jqBootstrapValidation.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> --%>
	
<!-- 상단바 네비 애니 --> 
	<script src="${ctRoot}/resources/nav/custom.js"></script> 
