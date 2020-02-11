<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>JAVABANG</title>




	<!-- 예쁜셀렉트박스 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="author" content="colorlib.com">
	
    
<script>
	function goSearch(){
		
	}
	

	$(document).ready(function(){
		var obj = $('.product');
		obj.css("cursor","pointer");
		
		
		obj.click(function(){
			document.myPageForm.submit();

		});
		
	});

	
	
</script>
</head>
<body>
		<aside class="side-menu" style="float:left;">
			<nav class="left-nav hidden-xs hidden-sm hidden-md" style="width: 300;">
			   <ul class="nolist">
			  	<li>
			     <a style="background-color:#d0d7ce;font-size:15pt;"><b>마이페이지</b></a>
			    </li>
			    <li>
			      <a href="${ctBuyerRoot}/likeRoomList.do">찜한방</a>
			    </li>
			    <li>
			      <a href="${ctBuyerRoot}/modifyPwdCheck.do">정보수정</a>
			    </li>
			  </ul>
			</nav>
		</aside>
</body>
</html>













