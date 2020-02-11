<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/realtor/incloudfile/proLeftMenu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인중개사 마이페이지</title>


	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	 <link rel="stylesheet" href="${ctRoot}/resources/nav/bootstrap.css">


<script>

	function goSearch(){
			location.replace("${ctRealtorRoot}/proRegisterJoin2.do")
		}
	
	function goSearch2(){
		location.replace("${ctRealtorRoot}/proHome.do")
	}
	
</script>
</head>



 <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
 
 
	<div class="col-md-4" style="margin:auto">
		<h1 class="mt-4 mb-3">JAVABANG
     	 <label style="font-size:15pt;">문의게시판</label>
    	</h1>

	    <ol class="breadcrumb">
	      <li class="breadcrumb-item active"><b>문의사항은 빠른시일내에 답변을 보내드리도록 하겠습니다.  </b></li>
	    </ol>	
	
    
	 <div class="site-wrap" id="home-section">

	      <div class="container">
	        <div class="row">
	          <div class="col-md-10 blog-content">
	            <div class="pt-5">
	                <form action="#" class="">
	                  <div class="form-group">
	                    <label for="name">이름</label>
	                    <input type="text" class="form-control" id="name">
	                  </div>
	                  <div class="form-group">
	                    <label for="email">아이디</label>
	                    <input type="email" class="form-control" id="email">
	                  </div>
	                  <div class="form-group">
	                    <label for="message">내용</label>
	                    <textarea name="" id="message" cols="30" rows="10" class="form-control" style="resize: none;padding-top:30px;"></textarea>
	                  </div>
	                  <div class="form-group">
	                    <label for="website">비밀번호</label>
	                    <input type="password" maxlength="4" class="form-control" id="website" size="15">
	                  </div>
	                  <div class="form-group">
	                    <input type="submit" value="전송" class="btn btn-info btn-md">
	                  </div>
	                </form>
	              </div>
	            </div>
	
	          </div>
	          <div class="col-md-4 sidebar">
	          </div>
	        </div>
	      </div>
	    </div>
</body>

  
  <%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
</html>













