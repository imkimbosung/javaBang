<!-- page directive 라 한다. JSP파일 상단에 항상 들어간다 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
	<!--  JSP 페이지에서 사용할 [사용자 정의 태그]인 [JSTL의 C코어 태그] 선언 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!-- jsp페이지에서 사용할 사용자 저의 태그인 spring폼 태그 선언 -->
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>
	#loading {
		 width: 100%;
		 height: 100%;
		 top: 0px;
		 left: 0px;
		 position: fixed;
		 display: block;
		 background-color: #fff;
		 z-index: 99;
		 text-align: center; 
	}
	#loading-image {
		position: absolute;
		 top: 30%;
		 left: 40%;
		 z-index: 100; 
	}
</style>
<script>
	$(window).load(function() {
	    $('#loading').fadeOut(1500);
	  });
</script>
<div id="loading"><img id="loading-image" src="${ctRoot}/resources/images/loading.gif" alt="Loading..." /></div>