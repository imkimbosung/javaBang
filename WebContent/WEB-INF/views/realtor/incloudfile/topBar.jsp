<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>
<link rel="stylesheet" href="${ctRoot}/resources/nav/bootstrap.css">


<%
	String master_id = (String)session.getAttribute("m_id");
%>

<script>
	jQuery.noConflict();
	
	function startProHome(){

		
		if( ${empty realtorDTO} ){
	    		 location.replace("${ctRealtorRoot}/loginForm.do"); 
	    	}
		
		location.replace("${ctRealtorRoot}/proMyPageHome.do"); 
		
		
	}
	

</script>


<!-- Navbar   ================================================== -->
      <div class="bs-docs-section clearfix">
        <div class="row">
          <div class="col-xs-12"  style="width:100%">
            <div class="bs-component">
              <nav class="navbar navbar-expand-lg text-dark" style="background-color:#78C2AD;height: 118px;" >
  				<a class="javabang" href="/javaBang/realtor/proHome.do">JAVABANG</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarColor01" style="margin-left: 65%;">
                  <%-- <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
       					 <h5><a class="nav-link" href="${ctRealtorRoot}/proMyPageHome.do" style="font-weight: 600;">프로마이페이지</a></h5>
                    </li>
                   </ul> --%>
                  <form class="row form-inline my-2 my-lg-0">
                  <% if(master_id == null){ %>
				          <c:if test="${empty r_id}">
				        	 <div class="login" style="margin:auto;" ><h5><a class="nav-link" href="${ctRealtorRoot}/loginForm.do" style="font-weight: 600;font-size:20pt;">로그인/회원가입</a></h5></div>
						  </c:if>
						  <c:if test="${!empty r_id}">
						     <div class="login" style="font-size:20pt;"><h5><a class="nav-link" href="${ctRealtorRoot}/proMyPageHome.do" style="font-weight: 600;font-size:20pt;">${realtorMenuInfoDTO.r_name} 님</a></h5></div>
						  </c:if>
						  <c:if test="${!empty r_id}">
				      		<input type="button" name="goOutLogin" value=로그아웃 class="btn btn-warning" onClick="location.replace('${ctRoot}/logoutForm.do?logout=realtor');" style="height:50px;font-size:15pt;margin-right:15px;">
				     	  </c:if>
				  <% }else { %>
			    	 <div class="login" ><h5><a class="nav-link " style="font-size:20pt"><b>관리자 로그인</b></a></h5></div>			    	 
			      <% } %>
			    </form>
						<input type="button" name="main" value="초기화면" class="btn btn-light" onClick="location.replace('${ctRoot}/Main_javaBang.do');" style="height:4%;width:35%;font-size:15pt">
                </div>
              </nav>
            </div>
          </div>
        </div>
      </div>

<script src="${ctRoot}/resources/nav/custom.js"></script> 
<!-- 구분선 -->