<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/common.jsp"%>
     <%@include file="/WEB-INF/views/loading.jsp" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>JAVABANG</title>


<!--===============================================================================================-->
<!--===============================================================================================-->
<!--===============================================================================================-->
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<!--===============================================================================================-->
<!--===============================================================================================-->
	<!-- 예쁜셀렉트박스 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="author" content="colorlib.com">
	   <link rel="stylesheet" href="/javaBang/resources/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/style.css">
	
<script>
$(document).ready
(
		/*수정시 물품종류 선택되어있게함*/
	function()
	{
		$("[name=rental_product_code]").filter("[value=5]").prop("checked",true);
		$("[name=rp_model_name]").val("ADOV1JHG8-KJG");
		$("[name=rp_price]").val("2500");
		$("[name=rp_count]").val("258");
		$("[name=rp_content]").val("전자파가 걱정이신분 이 제품을 이용하세요 전자파를 99.9% 차단하여 안전한 전자레인지를 사용하세요");
		$('[name=rental_product_code]').filter("[value=${upProductList.rental_product_code}]").prop("checked",true);
	});
	
	function insert()
	{
		
		if(is_empty("[name=rp_model_name]"))
		{
			alert("모델명입력바람");
			$("[name=rp_model_name]").focus();
			return;
		}
		if(is_empty("[name=rp_price]"))
		{
			alert("가격입력바람");
			$("[name=rp_price]").focus();
			return;
		}
		if(is_empty("[name=rp_count]"))
		{
			alert("수량입력바람");
			$("[name=rp_count]").focus();
			return;
		}
		if(is_empty("[name=rp_content]"))
		{
			alert("상세정보입력바람");
			$("[name=rp_content]").focus();
			return;
		}
		
		
		if(confirm("등록하시겠습니까?")==false){return;}
		// image upload 먼저
		var form = $("[name=imagesUpload]")[0];
    	 var imageData = new FormData(form)

		if(${param.rp_no==0}){
    	 $.ajax({
             url : "/javaBang/rental/productImageSession.do"
             , type : "post"
             , enctype: 'multipart/form-data'
           	, processData: false
             , contentType: false
             , data : imageData
             , success : function(result){
                if(result == 0){
                	
                		goinsert();
                		
                }else {
					alert("이미지가 입력되지 않았습니다.");
					return;
                }
             }
             , error : function(request, status, error){
                alert("서버접속실패");
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
             }
          });
		}
 		if(${param.rp_no>0}){fixfix();}
		
	}
	
	function goinsert()
	{
		$.ajax
		({
			url:"${ctRentalRoot}/rentalInsertProductProc.do"
			,type:"post"
			,data:$('[name=insertProduct]').serialize()
			,success : function(insertrentalProductcnt)
			{
				if(insertrentalProductcnt==1)
				{
					alert("등록성공");
					if(confirm("추가등록하시겠습니까?")==false){location.replace("${ctRentalRoot}/rentalCompanyMain.do");}
					else{location.replace("${ctRentalRoot}/rentalProductInsert.do?rp_no=0");}
					
				}
				else if(insertrentalProductcnt==-1)
				{
					alert("아이디중복");
				}
				else{alert("등록실패");}
			}

			,error : function()
			{
				alert("서버통신실패");
			}
		});
	};
	
	function fixfix()
	{
		$.ajax
		({
			url:"${ctRentalRoot}/rentalUpProductProc.do"
			,type:"post"
			,data:$('[name=insertProduct]').serialize()
			,success : function(insertrentalProductcnt)
			{
				if(insertrentalProductcnt==1)
				{
					alert("수정성공");
					location.replace("${ctRentalRoot}/rentalCompanyMain.do");
				}
				else if(insertrentalProductcnt==-1)
				{
					alert("아이디중복");
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
</head>
<body>
<%@include file="/WEB-INF/views/rental/incloudfile/rentalLeftMenu.jsp" %>

	<div class="col-lg-6" id="root"  style="margin:auto;font-size:${rentalfont};">
		<h1 class="mt-4 mb-3">JAVABANG</h1>
	    	<ol class="breadcrumb" style="margin-bottom: auto;">
	     		 <li class="breadcrumb-item active" style="color:#212529"><b>빌려방 렌탈물품등록</b></li>
	   		 </ol>	
	</div>
	<div class="col-lg-6" style="margin:auto;font-size:${rentalbuttonfont};">
		<form method=post name=insertProduct>
			<table class="table">
				<tr>
					<td style="font-size:${rentalfont}">종류
					<td style="font-size:${rentalbuttonfont}"><input type=hidden name=rt_no value="${rt_no}"><input type=hidden name=rp_no value="${param.rp_no}">
					<c:forEach items="${ProductList}" var="ProductList" varStatus="loopTagStatus">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="custom-control custom-radio" style="float:left;">
							<input type=radio class="custom-control-input" id="${ProductList.rental_product_code}" name=rental_product_code value="${ProductList.rental_product_code}">
								<label class="custom-control-label" for="${ProductList.rental_product_code}" >${ProductList.rental_product}</label>
							<c:if test="${loopTagStatus.count%5==0}">
								<br>
							</c:if>
						</div>
					</c:forEach>
				
				<tr>
					<td style="font-size:${rentalfont};width:20%">모델명
					<td><input type=text name=rp_model_name value="${upProductList.rp_model_name}"style="font-size:${rentalfont}">
				<tr>
					<td style="font-size:${rentalfont}">렌탈비용
					<td><input type=text name=rp_price value="${upProductList.rp_price}"style="font-size:${rentalfont}">
				<tr>
					<td style="font-size:${rentalfont}">보유수량
					<td><input type=text name=rp_count value="${upProductList.rp_count}"style="font-size:${rentalfont}">
				<tr>
					<td style="font-size:${rentalfont}">상세사양
					<td><textarea name="rp_content" rows=13 cols=50 maxlength=500 name="rp_content" style="resize:none;padding:20px;font-size:${rentalfont}">${upProductList.rp_content}</textarea>
				
			</table>
		</form>
		 <form name="imagesUpload" action="/javaBang/rental/productImageSession.do" method="post" enctype="multipart/form-data">
   	 <div style="padding:40px;"> </div>
          <div class="breadcrumb"style="font-size:${rentalfont}"><b>사진을 등록해 주세요. </b>  &nbsp;&nbsp;   최대 4장까지 가능합니다.</div>
 	  <div style="padding:30px;"> </div>
         <center>
     	<div class="col-sm-12">
        		<input type="file" name="imageFile" id="imgfile" multiple style="font-size:${rentalfont}">
  		<div id="preview"></div>
		</div>
	</form>
	<br>
	<br>
	<input type=button class="btn btn-info" value=등록 onClick="insert()" style="font-size:${rentalbuttonfont}">
	</div>
</body>
<script type="text/javascript">
  $(document).ready(function (e){
    $("input[type='file']").change(function(e){

      //div 내용 비워주기
      $('#preview').empty();

      var files = e.target.files;
      var arr =Array.prototype.slice.call(files);
      
      //업로드 가능 파일인지 체크
      for(var i=0;i<files.length;i++){
        if(!checkExtension(files[i].name,files[i].size)){
          return false;
        }
      }
      
      preview(arr);
      
      
    });//file change
    
    function checkExtension(fileName,fileSize){

      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 20971520;  //20MB
      
      if(fileSize >= maxSize){
        alert('파일 사이즈 초과');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      
      if(regex.test(fileName)){
        alert('업로드 불가능한 파일이 있습니다.');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      return true;
    }
    
    function preview(arr){
      arr.forEach(function(f){
        
        //파일명이 길면 파일명...으로 처리
        var fileName = f.name;
        if(fileName.length > 10){
          fileName = fileName.substring(0,7)+"...";
        }
        
        //div에 이미지 추가
        var str = '<div style="display: inline-flex; padding: 10px;"><li>';
        str += '<span>'+fileName+'</span><br>';
        
        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
            str += '</li></div>';
            $(str).appendTo('#preview');
          } 
          reader.readAsDataURL(f);
        }else{
          str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
          $(str).appendTo('#preview');
        }
      });//arr.forEach
    }
  });
</script>
</html>