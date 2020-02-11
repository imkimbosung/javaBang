<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<!-- <script src="/z_spring/resources/jquery-1.11.0.min.js" type="text/javascript"></script> -->
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
		function goOwnerHomeForm(){
			location.replace("/javaBang/ownerHomeForm.do");
		}
	</script>
</head>
<body>
	<center>
	<br><br><br><br><br>
		<h1 class="styled__Title-sc-1gjkuuu-1 boZIoU"><span>공실 등록 완료</span></h1>
		<h2 class="styled__Notice-sc-1gjkuuu-3 dtBVCx">*삭제는 공실관리 리스트에서 가능합니다.</h2>
		<p class="styled__Text-sc-1gjkuuu-2 eeiBvl">공실 정보</p>
	<table class="styled__Table-sc-1gjkuuu-4 cAErlH" border=0 cellpadding=5 cellspacing=2>
		<tr>
			<th>매물 정보</th>
			<td>
				<p>원룸 경기도 성남시 분당구 백현동 582-7  ds호</p>
			</td>
		</tr>
		<tr>
			<th>거래 정보</th>
			<td>
				<p>매매 60억원</p>
			</td>
		</tr>
	</table>
	<br><br><br>
	<div class="styled__BtnWrap-zpdpd0-0 hhCegT">
		<input type="button" value="   확인   " style="WIDTH:60pt; HEIGHT:30pt" onClick="goOwnerHomeForm()">
	</div>
	</center>
</body>
</html>