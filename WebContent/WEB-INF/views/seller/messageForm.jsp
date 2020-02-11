<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title> [ 판매자한마디페이지 ] </title>
	<script>
	$(document).ready(function(){
		
	});

	/* function goThreepage(){
		location.replace("/javaBang/sellTypeForm.do");
	} */
	
	function goConfirmForm(){
		location.replace("${ctSellerRoot}/confirmForm.do");
	}
	</script>
</head>
<body>
	
	<center><br><br><br><br><br>
		<h1 class="styled__Title-sc-1k0kj8i-1 kMjtVh">회원님 공실에 관심이 있는 <br>중개사무소에게 <span>하실 말</span>을 적어주세요.</h1>

	<textarea name="review" form="inform" cols="55" rows="20" 
	placeholder="  예시 1.&#10;  컴퓨터를 잘 다루지 못해 매물 정보를 등록하는게 어렵습니다. &#10;  자세히 설명해주세요.&#10;  &#10;  예시 2.&#10;  전세 3억~4억 사이에 내놓고 싶습니다.&#10;  &#10;  예시 3.&#10;  전화통화는 오후 6시 이후에 가능합니다." 
	autoComplete="off">하고싶은 말을 적어주세요.</textarea><br><br>

	<div class="styled__BtnWrap-zpdpd0-0 hhCegT">
		<input type="button" class="gobacktest" value="  이전  " onClick="history.go(-1)">
		<input type="button" class="gobacktest" value="  다음  " onClick="goConfirmForm()">
	</div>

</body>
</html>