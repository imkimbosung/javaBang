<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/buyer/incloudfile/topBar.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVABANG</title>
<script>
$(document).ready(function(){
	$("#top-bottom").click(function(){
		var topEle = $('#top-bottom');
	    var delay = 1000;
	    $('html, body').stop().animate({scrollTop: 0}, delay);
	    
	});
});


/*상세페이지로 새창이동*/
function goSearchContantForm(sr_no)
{
	var openNewWindow = window.open("about:blank");

	//document.SearchContantForm.submit();
	openNewWindow.location.href='${ctBuyerRoot}/roomConForm.do?sr_no='+sr_no
}


</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay"  style="background-image: url('${ctRoot}/resources/images/boodong.jpg');height: 200px;">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center" style="height: 200px;">
            <div class="col-md-7">
				<h3 class="mb-1" style="padding: 20px;font-size: 40px;font-weight: bold;text-align: center;background-color: #FFFFFF;opacity: 0.9;">관심목록</h3>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%@include file="/WEB-INF/views/buyer/incloudfile/myPageFormUpMenu.jsp"%>
    <br><br><br>
<div id="root">
		<div class="col-md-12" style="margin:2.1% 20% -4.85% 24%;width:1180;">
			<div id="root">
			    <ol class="breadcrumb">
			      <li class="breadcrumb-item active"><b>고객님이 찜해놓은 공실리스트입니다.  </b></li>
			    </ol>	
			</div>
		</div>
	</div>
	
	
<div class="col-lg-10 bg-light" style="margin:4.85% 0 0 25%;width: 60%;">	
	<form class="likeRoomList" name="likeRoomList" method="post"	id="likeRoomList" action="${ctBuyerRoot}/likeRoomList.do;">
		<div class=" bg-light">
			<div class="container" style="padding:30px;">
		      <div class="row">
		      
		      
				<c:forEach items="${likeRoomList}" var="roomList" varStatus="loopTagStatus" >
				
			              <div class="col-lg-3 col-md-6 mb-4">
					        <div class="card h-100">
					        <a href=javascript:goSearchContantForm(${roomList.sr_no})>
					          <img src="${ctImageRoot}/${roomList.image_name}" alt="Image"  class="img-fluid">
					         </a>
					          <div class="card-body">
					            <h5><a href=javascript:goSearchContantForm(${roomList.sr_no})>${roomList.sr_no}번 방 매물</a></h5>
					            <span class="meta d-inline-block mb-3">${roomList.sr_mainaddr}	매물 
					            	<span class="mx-2">by</span>${roomList.s_name}
									<a href=javascript:goSearchContantForm(${roomList.sr_no})></a>
								</span>
					            <p class="card-text">${roomList.sr_addr}</p>
					          </div>
					          <div class="card-footer">
					            <a href=javascript:goSearchContantForm(${roomList.sr_no}) class="btn btn-primary">상세보기</a>
					            <input type="hidden" name="sr_no" value="${roomList.sr_no}">
					          </div>
					        </div>
					      </div>
					      
			       </c:forEach>
			       
			      </div>
			    </div>    
		</div>
	</form>
</div>


</body>
<%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp"%>
</html>