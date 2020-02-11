<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/buyer/incloudfile/topBar.jsp" %>
<%@include file="/WEB-INF/views/loading.jsp" %>
<!DOCTYPE html>
<html>

<head>

<link rel="stylesheet" href="${ctRoot}/resources/nav/bootstrap.css">

<meta charset="UTF-8">
</head>
<body>

 <!-- Navbar   ================================================== -->


	<p>
	<center>
		<table>
			
			<tr>
				<td><%@include file="/WEB-INF/views/buyer/roomSerachForm.jsp"%>
		</table>
	</center>
	<p>
	<div name="roomlistform"><%@include file="/WEB-INF/views/buyer/serachListForm.jsp"%></div>
	
	

</body>
</html>