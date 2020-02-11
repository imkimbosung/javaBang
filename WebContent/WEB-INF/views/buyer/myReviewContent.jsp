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
<title>JAVABANG</title>


<script>

</script>

</head>
 <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">



     <div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay"  style="background-image: url('${ctRoot}/resources/images/boodong.jpg');height: 200px;">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center" style="height: 200px;">
            <div class="col-md-7">
				<h3 class="mb-1" style="padding: 20px;font-size: 40px;font-weight: bold;text-align: center;background-color: #ffffff;opacity: 0.9;">마이페이지</h3> 
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <%@include file="/WEB-INF/views/buyer/incloudfile//myPageFormUpMenu.jsp"%>


	<div id="root" style="margin: 50 0 0 476;width: 100%;">
	    <ol class="breadcrumb" style="margin-bottom: auto;width:40%;">
	      <li class="breadcrumb-item active" style="color:#212529"><b>나의 리뷰 상세보기</b>
	      </li>
	    </ol>	
	</div>

		<div class="container"  style="margin: 1% 0% 0% 30%;">
	        <div class="row">
	          <div class="col-md-6 blog-content">
	          
				<form class="myReviewContent" name="myReviewContent" method="post" id="buyerDTO" action="${ctBuyerRoot}/myReviewContent.do">
					 <input type="hidden" name="review_no" value="1">
				
	                  <div class="form-group">
	                    <label for="email">아이디</label>
	                    <input type="email" class="form-control" id="email" value="${buyerDTO.b_id}" readOnly>
	                  </div>
	                  <div class="form-group">
	                    <label for="email">작성 날짜</label>
	                    <input type="email" class="form-control" id="email" value="${buyerDTO.write_date}" readOnly>
	                  </div>

	                   <div class="form-group">
	                    <label for="email">조회수</label>
	                    <input type="email" class="form-control" id="email" value="${buyerDTO.readcount}" readOnly>
	                  </div>
	                  <div class="form-group">
	                    <label for="email">제목</label>
	                    <input type="email" class="form-control" id="email" value="${buyerDTO.write_title}" readOnly>
	                  </div>
	                  <div class="form-group">
	                    <label for="message">내용</label>
	                    <textarea name="" id="message" cols="30" rows="10" class="form-control" 
	                    style="resize: none;padding-top:30px;" value="${buyerDTO.write_content}" readOnly></textarea>
	                  </div>
	                  <div class="form-group">
	                    <input type="submit" value="전송" class="btn btn-info btn-md">
	                  </div>
	                  <p><a href="${ctBuyerRoot}/myReview.do" class="btn btn-primary btn-md text-white">리뷰 목록으로 돌아가기</a></p>
				<input type="hidden" name="review_no" value="1">					  
	
					</form>
	            </div>
	          </div>
	        </div>
	  
			<div style="padding: 40px;"></div>
  </body>
  <%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
</html>





















