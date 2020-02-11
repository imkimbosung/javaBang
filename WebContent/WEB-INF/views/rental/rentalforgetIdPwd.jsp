<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	$(document).ready(function() {
		$("#id").hide();
		$("#pwd").hide();
	
	});
	function showId()
	{
		$("#pwd").hide();
		$("#id").show();
	}
	
	function showPwd()
	{
		$("#id").hide();
		$("#pwd").show();
	}
	
	function findIda()
	{
		alert('asd')
		/* $.ajax
		({
			url:"${ctRentalRoot}/rentalForgetIdProc.do"
			,type:"post"
			,data:$('[name=findId]').serialize()
			,success : function(id)
			{
				if(id!=null){alert("아이디성공")}
				else if(id==null){alert('없음');}
				else{alert('실패')}
			}

			,error : function()
			{
				alert("서버통신실패");
			}
		}); */
	}
	
	function findPwd()
	{
		$.ajax
		({
			url:"${ctRentalRoot}/rentalForgetPwdProc.do"
			,type:"post"
			,data:$('[name=findPwd]').serialize()
			,success : function()
			{
				alert("비번성공")
			}
			,error : function()
			{
				alert("서버통신실패");
			}
		});
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td><input type=button value="아이디찾기" onClick="showId();">
		<tr>
			<td><input type=button value="비밀번호찾기" onClick="showPwd();">
	</table>
	<form name=findId>
		<table id=id>
			<tr>
				<td>이름
				<td><input type=text name=rt_comname>
			<tr>
				<td>사업자번호
				<td><input type=text placeholder="'-'빼고입력" name=rt_bnum>
			
		</table>
	</form>
	<input type=button value="찾기1" onClick="findIda();">
	
	<form name=findPwd>
		<table id=pwd>
			<tr>
				<td>아이디
				<td><input type=text name=rt_id>
			<tr>
				<td>사업자번호
				<td><input type=text placeholder="'-'빼고입력" name=rt_bnum>
			<tr>
				<td><input type=button value="찾기" onClick="findPwd();">
		</table>
	</form>
</body>
</html>