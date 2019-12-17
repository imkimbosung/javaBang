<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>
<link href="${ctRoot}/resources/homeForm.css" rel="stylesheet" type="text/css">

<!-- 모든페이지에서 보여야 하는 topbar부분 -->

<div class="head">
	<div class="leftTop">
		<a href="${ctBuyerRoot}/homeForm.do"><font size="5">javaBang</font></a>
	</div>
	
	<!-- 로그인 함 or 안함 -->
	<c:if test="${empty buyerDTO}"> 
		<div class="login" ><a href="${ctRoot}/loginForm.do">로그인/회원가입</a></div>
	</c:if>
	<c:if test="${!empty buyerDTO}"> 
		<div class="login" ><a href="${ctBuyerRoot}/test.do">${buyerDTO.b_name}</a></div>
	</c:if>
	
	
	<%-- <div class="login" ><a href="${ctRoot}/test.do">로그인/회원가입</a></div> --%>
	<div class="rightTop">
		<span><a href="${ctBuyerRoot}/roomListForm.do">방찾기</a></span> &nbsp; <span><a
			href="${ctBuyerRoot}/test.do">관심목록</a></span> &nbsp; <span><a
			href="${ctBuyerRoot}/test.do">방내놓기</a></span> &nbsp;<span><a
			href="${ctBuyerRoot}/test.do">알림</a></span>
	</div>
</div>

<!-- 구분선 -->
<hr size="1px" noshade color="#EAEAEA">