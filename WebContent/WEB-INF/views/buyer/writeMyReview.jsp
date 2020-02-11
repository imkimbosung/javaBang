<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/buyer/incloudfile/topBar.jsp" %>

<%-- <c:if test="${empty buyerDTO}">
	<script>
	alert("내가 쓴 리뷰가 없습니다.");
	location.replacement("${ctBuyerRoot}/homeForm.do");
	</script>
</c:if>
 --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 리뷰</title>


</head>
 <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">



    <div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay" data-stellar-background-ratio="0.5" style="background-image: url('${ctRoot}/resources/images/hero_1.jpg')">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-7">
              <h1 class="mb-2">마이 페이지</h1>
              <p class="text-white">잡아방은 여러분에게 최상의 컨디션 방 만을 제공합니다.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <%@include file="/WEB-INF/views/buyer/incloudfile//myPageFormUpMenu.jsp"%>


	
	    
	    
	    
	    

    <div class="site-section">

   
 
 
 
 
 
 
 
 
 <div class="col-md-4" style="margin:auto">
		<h1 class="mt-4 mb-3">JAVABANG
     	 <label style="font-size:15pt;">리뷰게시판</label>
    	</h1>

	    <ol class="breadcrumb">
	      <li class="breadcrumb-item active"><b>여러분들의 리뷰는 저희 잡아방에 큰 힘이 됩니다.</b></li>
	    </ol>	
	
    
	 <div class="site-wrap" id="home-section">

	      <div class="container">
	        <div class="row">
	          <div class="col-md-10 blog-content">
	            <div class="pt-5">
	                <form action="#" class="">

	                  <div class="form-group">
	                    <label for="email">아이디</label>
	                    <input type="email" class="form-control" id="email" value="${buyerDTO.b_id}" readOnly>
	                  </div>
	                  <div class="form-group">
	                    <label for="email">제목</label>
	                    <input type="email" class="form-control" id="email" value="${buyerDTO.write_title}">
	                  </div>
	                  <div class="form-group">
	                    <label for="message">내용</label>
	                    <textarea name="" id="message" cols="30" rows="10" class="form-control" style="resize: none;padding-top:30px;"></textarea>
	                  </div>
	                  <div class="form-group">
	                    <label for="website">비밀번호</label>
	                    <input type="password" maxlength="4" class="form-control" id="website" size="15" value="${buyerDTO.b_pwd}" readOnly>
	                  </div>
	                  <div class="form-group">
	                    <input type="submit" value="전송" class="btn btn-info btn-md">
	                  </div>
	                  <p><a href="${ctBuyerRoot}/myReview.do" class="btn btn-primary btn-md text-white">리뷰 목록으로 돌아가기</a></p>
	                </form>
	              </div>
	            </div>
	
	          </div>
	          <div class="col-md-4 sidebar">
	          </div>
	        </div>
	      </div>
	    </div>
 
          
          <form class="myReviewContent" name="myReviewContent" method="post" id="buyerDTO" action="${ctBuyerRoot}/myReviewContent.do">
	 <input type="hidden" name="review_no" value="1">
	    <div class="site-wrap" id="home-section">
	

	     <input type="hidden" name="review_no" value="1">
	
	  
	
	    </div>
	</form>
	
	
	
	
	
	
	
 
    </div>

   
   
   
   
   
	
	



  </body>
  
  
  <%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
</html>




