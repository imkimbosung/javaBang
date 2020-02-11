<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="/WEB-INF/views/common.jsp"%>
     <%@include file="/WEB-INF/views/loading.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/style.css">
    <script>

		

		function jubsu(rt_board_no)
		{
			
			if(confirm("접수하시겠습니까?")==false){return;}
			$("[name=rt_board_no]").val(rt_board_no);
			$.ajax
			({
				url:"${ctRentalRoot}/rentalASCompanyProc.do"
				,type:"post"
				,data:$('[name=board_no]').serialize()
				,success : function(rentalASCompanyCnt)
				{
					if(rentalASCompanyCnt==1)
					{
						alert("접수완료");
						location.replace("${ctRentalRoot}/rentalASForm.do");
					}
					else{alert("접수실패");}
				}

				,error : function()
				{
					alert("서버통신실패");
				}
			});
		}
</script>
<title>JAVABANG</title>
</head>
<body>
<%@include file="/WEB-INF/views/rental/incloudfile/rentalLeftMenu.jsp" %>
<form name=board_no action="${ctRentalRoot}/rentalASCompanyProc.do">
	<input type=hidden name=rt_board_no value=0>
</form>
	<div class="col-lg-6" style="margin:0 auto;font-size:${rentalfont};">
		<div class="page-header">
			<h1 class="mt-4 mb-3">
            JAVABANG
         </h1>
         <ol class="breadcrumb" style="backgroundcolor:#e9ecef;">
            <li class="breadcrumb-item active"><b>AS신청을 하시면 빠른 시일내에 해결해드리겠습니다.</b></li>
         </ol>
		</div>
	<div style="padding: 10px;"></div>
	<div class="row">
	<div class="col-sm-6">
		<form name=goAS>
			<div class="form-group" style="display: -webkit-box;font-size:${rentalfont};">
				<label class="breadcrumb bg-light" for="inputName" style="margin-right:50px;">제목</label>
					<input type="text"	class="form-control" name="rt_board_subject" style="width:800;font-size:${rentalfont};" value="${rentalASContent.rt_board_subject}" disabled>
			</div>
			<div class="form-group" style="display:-webkit-inline-box;height: 70;font-size:${rentalfont};">
				<label class="breadcrumb bg-light" for="inputName" style="margin-right:35px;">AS내용</label>
				<textarea name="rt_board_content" rows=13 cols=60 maxlength=500 name="rt_board_content" style="resize:none;padding:20px;;width: 800;" disabled>${rentalASContent.rt_board_content}</textarea>
			</div>
			<div style="float: right;" >
				<c:if test="${rentalASContent.rt_board_readcount==0}">
					<input type=button class="btn btn-info btn-sm" value="접수" onClick="jubsu(${rentalASContent.rt_board_no});" style="margin-top:500px;font-size:${rentalbuttonfont}">
				</c:if>
				<c:if test="${rentalASContent.rt_board_readcount==1}">
					<input type=button class="btn btn-info" value="목록보기" onClick="location.replace('${ctRoot}/rental/rentalASForm.do')" style="margin-top:500px;font-size:${rentalbuttonfont}">
				</c:if>
			</div>
		</form>
	</div>
	</div>
	</div>
	
			
			
	
</body>
</html>