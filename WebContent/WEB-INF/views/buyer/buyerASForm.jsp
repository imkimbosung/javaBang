<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@include file="/WEB-INF/views/common.jsp"%>
            <%@include file="/WEB-INF/views/buyer/incloudfile/topBar.jsp" %>
     <%@include file="/WEB-INF/views/loading.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script>
function goASSub()
{
/*AS신청*/
$.ajax
({
	url:"${ctRentalRoot}/buyerRentalASProc.do"
	,type:"post"
	,data:$('[name=goAS]').serialize()
	,success : function(getBuyerAScnt)
	{
		if(getBuyerAScnt==1)
		{
			alert("등록성공");
			location.replace("${ctBuyerRoot}/buyerRentalSubForm.do");
		}
		else if(getBuyerAScnt==-1)
		{
			alert("이미중복");
		}
		else{alert("등록실패");}
	}

	,error : function()
	{
		alert("서버통신실패");
	}
});
}
</script>
<meta charset="UTF-8">
<title>JAVABANG</title>
</head>
<body>

<div class="col-lg-6" style="margin:0 auto;">
		<div class="page-header">
			<h1 class="mt-4 mb-3">
            JAVABANG <small>구해방</small>
         </h1>

         <ol class="breadcrumb" style="backgroundcolor:#e9ecef;">
            <li class="breadcrumb-item active"><b>AS신청을 하시면 빠른 시일내에 해결해드리겠습니다.</b></li>
         </ol>
		</div>
	<div style="padding: 10px;"></div>
	<div class="row">
	<div class="col-sm-6">
	
		<form name=goAS>
			<input type=hidden name=ru_no value="${param.ru_no}">
			<input type=hidden name=b_no value="${b_no}">
			<div class="form-group" style="display: -webkit-box;">
				<label class="breadcrumb bg-light" for="inputName" style="margin-right:50px;">제목</label> 
					<input type="text"	class="form-control" name="rt_board_subject" style="width:800;">
			</div>
			<div class="form-group" style="display:-webkit-inline-box;height: 70;">
				<label class="breadcrumb bg-light" for="inputName" style="margin-right:35px;">AS내용</label> 
			<textarea name="rt_board_content" rows=13 cols=60 maxlength=500 name="rt_board_content" style="resize:none;padding:20px;width: 800;">${upProductList.rp_content}</textarea>
			</div>
		<input type=button  class="btn btn-info btn-lg"value="AS신청하기" onClick="goASSub();" style="margin-top: 400;margin-left: 500;">
		</form>
		</div>
	</div>
</div>


</body>
</html>