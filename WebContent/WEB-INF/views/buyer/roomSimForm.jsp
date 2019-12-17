<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script>

	function goSearchContantForm(sr_no)
	{
		//document.SearchContantForm.submit();
		location.replace("/javaBang/roomConForm.do?sr_no="+sr_no);
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="overflow:auto;width:100%;height:800px;">
		<form method="post" name="SearchContantForm" action="roomConForm.do">
			<input type="hidden" value="1" name="">
		</form>
		<!-- ------------------------------------------------------------------------------------ -->
		<script>
			for(var i=1;i<10;i++)
			{
				document.write("<a href=javascript:goSearchContantForm("+i+");>");
				document.write("<img src='resources/img/a.jpg' width='30%' border='1'width='200'height='200'>");
				document.write("</a>");
				document.write("<br>");
				document.write("정보정보정보정보정보정보");
				document.write("<br>");
			}
		</script>
		<!-- ------------------------------------------------------------------------------------ -->
	</div>
</body>
</html>