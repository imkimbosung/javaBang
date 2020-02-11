<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/realtor/incloudfile/topBar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인중개사 마이페이지</title>


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
	<!-- 예쁜셀렉트박스 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="author" content="colorlib.com">
	
    <link href="${ctRoot}/resources/selectbox/css/main.css" rel="stylesheet" />

<script>

	
</script>
</head>



 <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
 
 

    <div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay" data-stellar-background-ratio="0.5" style="background-image: url('${ctRoot}/resources/images/boodong.png')">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-7">
              <h1 class="mb-2">공인중개사 마이페이지</h1>
              <p class="text-white">잡아방은 여러분들의 최고의 파트너입니다!</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    
<%@include file="/WEB-INF/views/realtor/incloudfile/proLeftMenu.jsp" %>
	
	<br><br><br>
	
	
	
	
	
	
    <div class="site-wrap" id="home-section">

    <form action="">
      <div class="realestate-filter">
        <div class="container">
          <div class="realestate-filter-wrap nav">
            <a href="#for-rent" class="active" data-toggle="tab" id="rent-tab" aria-controls="rent" aria-selected="true">For Rent</a>
            <a href="#for-sale" class="" data-toggle="tab" id="sale-tab" aria-controls="sale" aria-selected="false">For Sale</a>
          </div>
        </div>
      </div>
      
      <div >
        <div class="container tab-content">
           <div class="tab-pane active" id="for-rent" role="tabpanel" aria-labelledby="rent-tab">

             <div class="row">
               <div class="col-md-4 form-group">
                 <select name="" id="" class="form-control w-100">
                   <option value="">All Types</option>
                   <option value="">Townhouses</option>
                   <option value="">Duplexes</option>
                   <option value="">Quadplexes</option>
                   <option value="">Condominiums</option>
                 </select>
               </div>
               <div class="col-md-4 form-group">
                 <input type="text" class="form-control" placeholder="Title">
               </div>
               <div class="col-md-4 form-group">
                 <input type="text" class="form-control" placeholder="Address">
               </div>
             </div>

             <div class="row">
               <div class="col-md-4 form-group">
                 <select name="" id="" class="form-control w-100">
                   <option value="">Any Bedrooms</option>
                   <option value="">0</option>
                   <option value="">1</option>
                   <option value="">2</option>
                   <option value="">3+</option>
                 </select>
               </div>
               <div class="col-md-4 form-group">
                 <select name="" id="" class="form-control w-100">
                   <option value="">Any Bathrooms</option>
                   <option value="">0</option>
                   <option value="">1</option>
                   <option value="">2</option>
                   <option value="">3+</option>
                 </select>
               </div>
               <div class="col-md-4 form-group">
                 <div class="row">
                   <div class="col-md-6 form-group">
                     <select name="" id="" class="form-control w-100">
                       <option value="">Min Price</option>
                       <option value="">$100</option>
                       <option value="">$200</option>
                       <option value="">$300</option>
                       <option value="">$400</option>
                     </select>
                   </div>
                   <div class="col-md-6">
                     <select name="" id="" class="form-control w-100">
                       <option value="">Max Price</option>
                       <option value="">$25,000</option>
                       <option value="">$50,000</option>
                       <option value="">$75,000</option>
                       <option value="">$100,000</option>
                       <option value="">$100,000,000</option>
                     </select>
                   </div>
                 </div>
               </div>
             </div>
             <div class="row">
               <div class="col-md-4">
                 <input type="submit" class="btn btn-black py-3 btn-block" value="Submit">
               </div>
             </div>

           </div>
           <div class="tab-pane" id="for-sale" role="tabpanel" aria-labelledby="sale-tab">
             <div class="row">
               <div class="col-md-4 form-group">
                 <select name="" id="" class="form-control w-100">
                   <option value="">All Types</option>
                   <option value="">Townhouses</option>
                   <option value="">Duplexes</option>
                   <option value="">Quadplexes</option>
                   <option value="">Condominiums</option>
                 </select>
               </div>
               <div class="col-md-4 form-group">
                 <input type="text" class="form-control" placeholder="Title">
               </div>
               <div class="col-md-4 form-group">
                 <input type="text" class="form-control" placeholder="Address">
               </div>
             </div>

             <div class="row">
               <div class="col-md-4 form-group">
                 <select name="" id="" class="form-control w-100">
                   <option value="">Any Bedrooms</option>
                   <option value="">0</option>
                   <option value="">1</option>
                   <option value="">2</option>
                   <option value="">3+</option>
                 </select>
               </div>
               <div class="col-md-4 form-group">
                 <select name="" id="" class="form-control w-100">
                   <option value="">Any Bathrooms</option>
                   <option value="">0</option>
                   <option value="">1</option>
                   <option value="">2</option>
                   <option value="">3+</option>
                 </select>
               </div>
               <div class="col-md-4 form-group">
                 <div class="row">
                   <div class="col-md-6 form-group">
                     <select name="" id="" class="form-control w-100">
                       <option value="">Min Price</option>
                       <option value="">$100</option>
                       <option value="">$200</option>
                       <option value="">$300</option>
                       <option value="">$400</option>
                     </select>
                   </div>
                   <div class="col-md-6">
                     <select name="" id="" class="form-control w-100">
                       <option value="">Max Price</option>
                       <option value="">$25,000</option>
                       <option value="">$50,000</option>
                       <option value="">$75,000</option>
                       <option value="">$100,000</option>
                       <option value="">$100,000,000</option>
                     </select>
                   </div>
                 </div>
               </div>
             </div>
             <div class="row">
               <div class="col-md-4">
                 <input type="submit" class="btn btn-black py-3 btn-block" value="Submit">
               </div>
             </div>

           </div>
        </div>
      </div>
    </form>


    </div>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	
	
	

</body>

  
  <%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
</html>













