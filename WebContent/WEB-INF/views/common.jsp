<!-- page directive 라 한다. JSP파일 상단에 항상 들어간다 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<!--  JSP 페이지에서 사용할 [사용자 정의 태그]인 [JSTL의 C코어 태그] 선언 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	
<!-- jsp페이지에서 사용할 사용자 저의 태그인 spring폼 태그 선언 -->
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="ctRoot" value="/javaBang" />
<c:set var="ctBuyerRoot" value="/javaBang/buyer" />
<c:set var="ctSellerRoot" value="/javaBang/seller" />



<link href="${ctRoot}/resources/common.css" rel="stylesheet" type="text/css">
<script src="${ctRoot}/resources/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="${ctRoot}/resources/common.js" type="text/javascript"></script>
	

<!-- JSTL의 C코아 태그를 사용해 테이블의 색 관련 변수들 선언 -->
<c:set var="thColor1" value="#eaeaea"/>

<c:set var="headerColer" value="#cecece"/>



<c:set var="oddTrColor" value="white"/>

<c:set var="evenTrColor" value="#E8F0F4"/>

<c:set var="mouseOverColor" value="#CCE1FF"/>



<c:set var="bodyBgColor1" value="lightblue" />
<c:set var="bodyBgColor1" value="#FFFFFF" />





<script>
/* 	$(document).ready(function(){
		
		if(location.href.indexOf("loginForm.do")<0){
			$("body").prepend("<center><input type=button onClick=\"location.replace('${ctRoot}/logout.do')\" value='로그아웃'></center>")
		}
		
		
		$("body").attr("bgcolor", "${bodyBgColor1}")
	}) */
</script>