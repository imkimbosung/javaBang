<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/buyer/incloudfile/topBar.jsp" %>


<%-- <c:if test="${empty likeRoomList}">
	<script>
	alert("찜한 방이 없습니다.");
	location.replacement("${ctBuyerRoot}/homeForm.do");
	</script>
</c:if> --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜한 방 내용</title>

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

	/* 	$(document).ready(function(){
	$("[name=b_name]").val("김자바");
	$("[name=b_id]").val("register@aaa.com");
	$("[name=pwd]").val("123");
	})	;
	*/
	

	function goSearch2(){
		location.replace("${ctBuyerRoot}/likeRoomList.do");
	}	
	
	
	
</script>

</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
    <%@include file="/WEB-INF/views/buyer/incloudfile/myPageFormUpMenu.jsp"%>
    <%-- 
     	 <div class="container" style="margin-left: 40 300 100 350;">
       		 <div class="row">
           		 <div class="img-years" style="margin-bottom:-500;">
              		<img src="${ctRoot}/resources/images/oneroom2.jpg" alt="Image" class="img-fluid" style="width:500px">
            	</div>
         	 </div>  --%> <div style="font-size:50pt;">없어지고 /javaBang/buyer/roomConForm.do로 이동할 예정임니다~</div>
         	 
<%-- 
   

		<div class="col-md-6" style="float:right;">
			<form class="likeRoomContent" name="likeRoomContent" method="post" id="roomDTO" action="${ctBuyerRoot}/likeRoomContent.do">
				<table class="table" >
					<input type="hidden" name="sr_no" value="1">
						<tr>
							<td bgcolor="#EAEAEA" align=center width=200>방 주소
							<td align=center>${roomDTO.sr_mainaddr}<br>
						<tr>
							<td bgcolor="#EAEAEA" align=center width=200>층수
							<td align=right>${roomDTO.sr_addrflow}층<br>
						<tr>
							<td bgcolor="#EAEAEA" align=center width=200>방 크기
							<td align=right>${roomDTO.sr_roomsize}(제곱미터)<br>
						<tr>
							<td bgcolor="#EAEAEA" align=center width=200>준공년월
							<td align=center>${roomDTO.sr_builddate}<br>
						<tr>
							<td bgcolor="#EAEAEA" align=center width=200>판매자
							<td align=center>${roomDTO.s_name}<br>
							
						<input type="hidden" name="sr_no" value="1">
						
						<tr><td colspan=2 align=center>
					<input type="button" class="btn btn-outline-dark" style="width:250pt; height:50pt" value="찜목록으로 이동하기" onClick="goSearch2();"><br><br><br>
				</table>
			</form>
		</div> --%>
      </div>
	</div>
	

<div style="margin:800"></div>
  <%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>

  </body>
</html>











































