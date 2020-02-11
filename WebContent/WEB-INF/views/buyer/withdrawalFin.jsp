<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴2</title>
<script>
	function goSearch(){
		location.replace("/javaBang/proHome.do")
	}
	
	
	

</script>
</head>
<body align=center>



<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


	<table class="tbcss2" border=1 bordercolor=gray cellspacing=0 cellpadding=10 align=center width=650>
		<tr><td align=center><br>[회원탈퇴가 완료되었습니다]<br><br>
		<form name="withdrawalFin" method="post" action="proHome.do">

			<tr><td align=center><br><input type="button" style="width:200pt; height:30pt" value="메인 화면 가기" onClick="goSearch();"><br><br>
			
	
		</form>
	</table>

</body>
</html>