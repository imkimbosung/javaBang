<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!-- ########################################################## -->
	<!-- 마스터 화면 -> 목록 수정 -> 물품 렌트 code 테이블 목록 입력/수정/삭제 기능 화면 made by kbs-->
	<!-- ########################################################## -->
	
<script src="/javaBang/resources/jquery-1.11.0.min.js"	type="text/javascript"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- jsp페이지에서 사용할 사용자 저의 태그인 spring폼 태그 선언 -->
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet"
	href="/javaBang/resources/assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="/javaBang/resources/assets/css/style.css">
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<link
	href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css"
	rel="stylesheet" />

<script
	src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="/javaBang/resources/assets/js/main.js"></script>

<html>
<head>
<meta charset="UTF-8">
<title>목록수정 - 판매자Code</title>
<style>
.tdl-holder input[type="checkbox"] {
    cursor: pointer;
    opacity: 0;
    position: absolute; }
    .tdl-holder input[type="checkbox"] + i {
      border: 1px solid rgba(153, 171, 180, 0.3);
      display: block;
      height: 18px;
      position: absolute;
      top: 15px;
      width: 18px;
      z-index: 1; }
    .tdl-holder input[type="checkbox"]:checked + i::after {
      content: "\e64c";
      font-family: 'themify';
      display: block;
      color: rgba(153, 171, 180, 0.5);
      left: 0;
      position: absolute;
      top: -16px;
      z-index: 2; }
    .tdl-holder input[type="checkbox"]:checked ~ span {
      text-decoration: line-through; }
  .tdl-holder input[type="text"] {
    height: 60px;
    margin-top: 20px;
    font-size: 14px; }


.login-form .checkbox {
  color: #878787; }

.login-form .checkbox label {
  text-transform: none; }
	
[type="checkbox"] {
  position: relative;
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  cursor: pointer;
}

[type="checkbox"]:before {
  content: "";
  position: absolute;
  left: -1.2em;
  top: -0.9em;
  display: inline-block;
  width: 25px;
  height: 25px;
  border: 2px solid #464444;
  border-radius: 2px 8px 2px 4px / 5px 3px 5px 3px;
}

[type="checkbox"]:checked:after {
  content: "x";
  position: absolute;
  left: -0.64em;
  top: -0.48em;
  font-size: 1.5rem;
  line-height: 0.5;
  color: #464444;
}

[type="checkbox"]:disabled:before {
  border: 2px solid #aaa;
}

[type="radio"] {
  position: relative;
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  cursor: pointer;
}

[type="radio"]:before {
  content: "";
  position: absolute;
  left: -1.2em;
  top: -0.9em;
  display: inline-block;
  width: 16px;
  height: 16px;
  border: 2px solid #464444;
  border-radius: 50% 45% 40% 50% / 40% 50% 50% 45%;
}

[type="radio"]:checked:before {
  background-color: #464444;
}

[type="radio"]:disabled:before {
  border: 2px solid #aaa;
}
</style>
<script>
$(document).ready(function(){

});
var check = "none" ;
	function btn_delete(){
			var checkboxObj = $("[name='selectColumn']:checkbox")
			var rentaltypeObj = $("[name='selectColumn']")
			
			if(checkboxObj.css("display") == "none"){ 
				$("[name='insertRentaltype']").hide();  
				hideforEach();
				hideInsert();
				
				checkboxObj.show();			
				
		        check = "del"; 
		    } else {  
		    	rentaltypeObj.hide(); 
		        check = "none"
		    }  

		    
		}

	function btn_insert(){  
		var rentalObj =  $("[name='insertRentaltype']:text");
		var rentalProductObj =  $("[name='insertRentalProduct']:text"); 

		
		if(rentalObj.css("display") == "none"){ 
				$("[name='selectColumn']").hide();  
				hideforEach();
				
				rentalObj.show(); 
				rentalProductObj.show(); 

				
		        check = "in"; 
		    } else {  
		    	hideInsert();
		        
		        check = "none"
		    }  
		}

	function btn_update(){
		 
			if($("[name=${rentalCode[0].rental_term}]").css("display") == "none"){  
	
				hideInsert();
				$("[name='insertRentaltype']").hide();
				$("[name='selectColumn']").hide(); 
				
				<c:forEach items="${rentalCode}" var="data">				
				$("[name=${data.rental_term}]").show();  			
				</c:forEach>
				<c:forEach items="${rentalProductCode}" var="data">				
				$("[name=${data.rental_product}]").show();  			
				</c:forEach>

				
		        
		        check = "up"; 
		    } else {  
			    
				hideforEach();
		        check = "none"
		    }  
			 
		}

	// 추가 부분 안보이게 하기
	function hideInsert(){
		var rentalObj =  $("[name='insertRentaltype']:text");
		var rentalProductObj =  $("[name='insertRentalProduct']:text");


		rentalObj.hide(); 
		rentalProductObj.hide(); 

	}
	
	function hideforEach(){
		<c:forEach items="${rentalCode}" var="data">				
		$("[name=${data.rental_term}]").hide();  			
		</c:forEach>
		<c:forEach items="${rentalProductCode}" var="data">				
		$("[name=${data.rental_product}]").hide();  			
		</c:forEach>
		}
	
	function changeCodeTable(){
		// 추가할 목록들 ------------------
		var rentalObj =  $("[name='insertRentaltype']:text");
		var rentalProductObj =  $("[name='insertRentalProduct']:text");
		// -------------------------------
		
		// 테이블 명 ----------------------		
		var rentalTableObj = $('input:checkbox[id="CODE_RENTAL_TERM"]')
		var rentalProductTableObj = $('input:checkbox[id="CODE_RENTAL_PRODUCT"]')
		// -------------------------------
		
		// 선택한 칼럼 개수 ----------------------	
		var change_rental_cnt = $('input:checkbox[id="rental"]').filter(":checked").length;
		var change_product_cnt = $('input:checkbox[id="product"]').filter(":checked").length;
		// -------------------------------
		
		// 칼람 명 ----------------------
		var columnRental = $('input:checkbox[id="columnRental"]');
		var columnProduct = $('input:checkbox[id="columnProduct"]');
		// -------------------------------
		
		
		// ----------------------------------------------------
		// 삭제 
		// ----------------------------------------------------
		if(check == "del"){
			

			if(change_rental_cnt==0 && change_product_cnt== 0 ){
				alert("삭제하려는 목록을 선택해주세요.");
				return;
				}

			// roomtype중 하나라도 체크되면 테이블 이름 체크
			if(change_rental_cnt >0){
				rentalTableObj.attr("checked", true)
				$('input:checkbox[id="checkRental"]').val(change_rental_cnt).attr("checked", true);  // 선택된 개수 추가 
				columnRental.attr("checked", true);
				$('input:checkbox[id="columnCodeRental"]').attr("checked", true);
			}
			if(change_product_cnt >0){
				rentalProductTableObj.attr("checked", true)
				$('input:checkbox[id="checkProduct"]').val(change_product_cnt).attr("checked", true);
				columnProduct.attr("checked", true)
				$('input:checkbox[id="columnCodeProduct"]').attr("checked", true)
			}



	/* 		
			alert($('input:checkbox[name="tableName"]').filter(":checked").length)
			return; */

			if(confirm("정말 삭제하시겠습니까?") ==false){return;}
				/* alert($('[name=rentalTypeCode]').serialize()); */
			/*return; */

				$.ajax({
					url : "/javaBang/master/allCodeProc.do"
					,type : "post"
					,data : $('[name=rentalTypeCode]').serialize() + "&check=" + check
					,success : function(checkRoomCnt){
						if(checkRoomCnt>=1){
							alert("삭제 성공");
							location.replace("/javaBang/master/rentalCodeForm.do");
						}
						else{
							alert("삭제 실패 - 관리자에게 문의 바람");
						}
					}
					, error : function(){
						alert("서버 접속 실패");
					}
				});
				
			// -----------------------------------------------
			// 수정
			// -----------------------------------------------	
		}else if(check == "up"){
			//alert($('[name=roomTypeCode]').serialize());
			var changeCode = [];
			var tableInfo = [];

			<c:forEach items="${rentalCode}" var="data">				
				if($("[name=${data.rental_term}]").val() !=  "${data.rental_term}"){
						changeCode.push("${data.rental_term}");
						changeCode.push($("[name=${data.rental_term}]").val());
						tableInfo.push(rentalTableObj.val());
						tableInfo.push(columnRental.val());
					} 			
			</c:forEach>
			
			<c:forEach items="${rentalProductCode}" var="data">				
				if($("[name=${data.rental_product}]").val() !=  "${data.rental_product}"){
					changeCode.push("${data.rental_product}");
					changeCode.push($("[name=${data.rental_product}]").val());
					tableInfo.push(rentalProductTableObj.val());
					tableInfo.push(columnProduct.val());
				} 	  			
			</c:forEach>


			
			/* alert(objCode['테스트']); return; */
			 var objParams = {
							"changeCode" : changeCode,
							"tableInfo" : tableInfo,
							"check" : check
					};

			//alert(tableInfo); return
			
			if(changeCode == ""){
				alert("변경된 항목이 없습니다.")
				return;
				}
		
			
			
			if(confirm("정말 변경하시겠습니까?") ==false){return;} 

			
			$.ajax({
				url : "/javaBang/master/allCodeProc.do"
				,type : "post"
				,data : objParams
				,success : function(checkRoomCnt){
					if(checkRoomCnt>=1){
						alert("변경 성공");
						location.replace("/javaBang/master/rentalCodeForm.do");
					}
					else{
						alert("변경 실패 - 관리자에게 문의 바람");
					}
				}
				, error : function(){
					alert("서버 접속 실패");
				}
			});


		// -----------------------------------------------
		// 추가
		// -----------------------------------------------	
		}else if(check == "in"){
			
			if(rentalObj.val()=="" && rentalProductObj.val() =="" && hcObj.val() == ""){
				alert("추가하려는 컬럼값을 입력하세요");
				return;
			}

			if(rentalObj.val()!=""){
				rentalTableObj.attr("checked", true)
				$('input:checkbox[id="checkRoom"]').val(change_rental_cnt).attr("checked", true);  // 선택된 개수 추가 
				$('input:checkbox[id="columnRental"]').attr("checked", true);
				$('input:checkbox[id="columnCodeRental"]').attr("checked", true);
				 $('input:checkbox[id="insertRentaltype"]').attr("checked", true).val(rentalObj.val());
			}
			if(rentalProductObj.val() !=""){
				rentalProductTableObj.attr("checked", true)
				$('input:checkbox[id="checkElv"]').val(change_product_cnt).attr("checked", true);
				$('input:checkbox[id="columnProduct"]').attr("checked", true)
				$('input:checkbox[id="columnCodeProduct"]').attr("checked", true)
				$('input:checkbox[id="insertRentalProduct"]').attr("checked", true).val(rentalProductObj.val());
			}

			if(rentalObj.val()==""){rentalObj.attr("checked", false)}
			if(rentalProductObj.val()==""){rentalProductObj.attr("checked", false)}
			
			if(confirm("정말 추가하시겠습니까?") ==false){return;}
			/* 	 alert($('[name=rentalTypeCode]').serialize()); 
			return;  */

				$.ajax({
					url : "/javaBang/master/allCodeProc.do"
					,type : "post"
					,data : $('[name=rentalTypeCode]').serialize() + "&check=" + check
					,success : function(checkRoomCnt){
						
						if(checkRoomCnt>=1){
							alert("추가 성공");
							location.replace("/javaBang/master/rentalCodeForm.do");
						}else if(checkRoomCnt == -2){
							alert("동일한 이름이 존재합니다. 동일한이름으로는 추가할 수 없습니다.");
						}
						else{
							alert("추가 실패 - 관리자에게 문의 바람");
						}
					}
					, error : function(){
						alert("서버 접속 실패");
					}
				});
		}else{
			alert("추가, 수정, 삭제 중에서 한가지를 선택 해 주세요.");
		}
		
			
	}

	
</script>
</head>
<body style="font-size:15pt;">
	<%@include file="/WEB-INF/views/master/aside.jsp"%>
	<div id="right-panel" class="right-panel">
		<header id="header" class="header">
			<div class="top-left">
				<div class="navbar-header">
					<a class="navbar-brand" href="/javaBang/master/homeForm.do">JAVABANG</a>
				</div>
			</div>
		</header>
		
		<div class="breadcrumb"  style="background-color: hsla(230, 17%, 93%, 0);">
			<div class="breadcrumb"  style="width: 1605;height: 80;margin-left: 12;">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>목록 수정</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">목록 수정</a></li>
                                    <li class="active">판매자Code</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	
			<!-- Content -->
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				
				<!--  Traffic  -->
				<div class="row" style="text-align: -webkit-center;">
					<div class="col-lg-12">
						<div class="card">
						<form name="rentalTypeCode" method="post"> 
							<div class="card-body" style="background-color: #eaeade;height: 70;">
								<h4 class="box-title">MENU LIST</h4>
							</div>
							<div class="card-body"style="height: 70;">
								<div style="float:right">
									<input type="button" class="btn btn-success" value=" 추가 " onClick="btn_insert()"style="font-size:15pt;">
			                        <input type="button" class="btn btn-warning" value=" 수정 " onClick="btn_update()"style="font-size:15pt;">
			                        <input type="button" class="btn btn-danger" value=" 삭제 " onClick="btn_delete()"style="font-size:15pt;">
		                        </div> 
							</div>
							<div class="row">
			
									<div class="col-lg-4">
					                    <div class="card">
					                        <div class="card-header">
					                            <strong class="card-title">CODE_RENTAL_TERM&nbsp;<input type="checkbox" name="tableName" id="CODE_RENTAL_TERM" value="CODE_RENTAL_TERM" style="display:none"></strong>
					                        </div>
					                        <div class="card-body">
					                            <table class="table table-striped" style="text-align: center;font-size:15pt;">
					                            
					                                <thead>
					                                    <tr>
					                                         <th>RENTAL_TERM_CODE</th>
				                                            <th>RENTAL_TERM</th> 
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                 <c:forEach items="${rentalCode}" var="rental" varStatus="loopTagStatus">
					                                        <tr>
					                                            <td>${rental.rental_term_code}</td>
					                                            <td>${rental.rental_term} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="selectColumn" id="rental" value="${rental.rental_term}" style="display:none" >
					                                             <input type="text" size="10" name="${rental.rental_term}" value="${rental.rental_term}" style="display:none" ></td> 
					                                        </tr>
					                                     </c:forEach>	  
					                                </tbody>
					                            </table>
					                            &nbsp;&nbsp;<input type="text" size="25" name="insertRentaltype"  style="display:none" placeholder=" 추가 할 컬럼명을 입력하세요." >
			                                	<input type="checkbox" name="insertValue" id="insertRentaltype" value="" style="display:none">
			                                	<br><br>
					                        </div>
					                    </div>
					                </div>
									<!-- 컬럼명 -->
									<input type="checkbox" name="columnName" id="columnRental" value="RENTAL_TERM" style="display:none" >
									<!-- 코드 컬럼명 -->
									<input type="checkbox" name="columnCodeName" id="columnCodeRental" value="RENTAL_TERM_CODE" style="display:none" >
									<!-- 테이블 선택 개수 -->
									<input type="checkbox" name="checkNum" id="checkRental" value="" style="display:none">
									
										
											
											<div class="col-lg-4">
							                    <div class="card">
							                        <div class="card-header">
							                            <strong class="card-title">CODE_RENTAL_PRODUCT&nbsp;<input type="checkbox" name="tableName" id="CODE_RENTAL_PRODUCT" value="CODE_RENTAL_PRODUCT" style="display:none"></strong>
							                        </div>
							                        <div class="card-body">
							                            <table class="table table-striped"style="text-align: center;font-size:15pt;">
							                                <thead>
							                                    <tr>
							                                         <th>RENTAL_PRODUCT_CODE</th>
							                                            <th>RENTAL_PRODUCT</th> 
							                                    </tr>
							                                </thead>
							                                <tbody>
							                                  <c:forEach items="${rentalProductCode}" var="product" varStatus="loopTagStatus">
								                                        <tr>
								                                            <td>${product.rental_product_code}</td>
								                                            <td>${product.rental_product} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="selectColumn" id="product" value="${product.rental_product}" style="display:none" >
								                                             <input type="text" size="10" name="${product.rental_product}" value="${product.rental_product}" style="display:none" ></td>
								                                        </tr>
								                                     </c:forEach>	  
							                                </tbody>
							                            </table>
							                          	&nbsp;&nbsp;<input type="text" size="25" name="insertRentalProduct"  style="display:none" placeholder=" 추가 할 컬럼명을 입력하세요."  >
						                                	<input type="checkbox" name="insertValue" id="insertRentalProduct" value="" style="display:none">
					                                	<br><br>
							                        </div>
							                    </div>
						                </div>
										<!-- 컬럼명 -->
									<input type="checkbox" name="columnName" id="columnProduct" value="RENTAL_PRODUCT" style="display:none" >
									<!-- 코드 컬럼명 -->
									<input type="checkbox" name="columnCodeName" id="columnCodeProduct" value="RENTAL_PRODUCT_CODE" style="display:none" >
									<!-- 테이블 선택 개수 -->
									<input type="checkbox" name="checkNum"  id="checkProduct" value="" style="display:none">
									
											
							</div>
							<!-- /.row -->
							<div class="card-body"></div>
							</form>
							
						</div>
						<div>
									<input type="button" class="btn btn-info btn-lg" value=" 적용 " onClick="changeCodeTable()">
		                    </div> 
					</div>
					<!-- /# column -->
				</div>
				<!--  /Traffic -->
				<div class="clearfix"></div>

			</div>


			<!-- /#add-category -->
		</div>
		<!-- .animated -->
	</div>
	<!-- /.content -->
</div>
</body>
</html>