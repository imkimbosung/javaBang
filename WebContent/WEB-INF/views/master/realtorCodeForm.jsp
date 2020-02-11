<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!-- ########################################################## -->
	<!-- 마스터 화면 -> 목록 수정 -> 공인중개사 code 테이블 목록 입력/수정/삭제 기능 화면 made by kbs-->
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
<title>목록수정 - 공인중개사Code</title>
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
			var realtorTypeObj = $("[name='selectColumn']")
			
			if(checkboxObj.css("display") == "none"){ 
				$("[name='insertAuthority']").hide();  
				hideforEach();
				hideInsert();
				
				checkboxObj.show();			
				
		        check = "del"; 
		    } else {  
		    	realtorTypeObj.hide(); 
		        check = "none"
		    }  

		    
		}

	function btn_insert(){  
		var authObj =  $("[name='insertAuthority']:text");
		var routeObj =  $("[name='insertSignupRoute']:text");
		//var checkObj =  $("[name='insertDataCheck']:text");
		
		if(authObj.css("display") == "none"){ 
				$("[name='selectColumn']").hide();  
				hideforEach();
				
				authObj.show(); 
				routeObj.show(); 
			//	checkObj.show(); 
				
		        check = "in"; 
		    } else {  
		    	hideInsert();
		        
		        check = "none"
		    }  
		}

	function btn_update(){
		 
		if($("[name='${authCode[0].authority}']").css("display") == "none"){  
			
			hideInsert();
			$("[name='insertAuthority']").hide();
			$("[name='selectColumn']").hide(); 
			
			<c:forEach items="${authCode}" var="data">				
			$("[name='${data.authority}']").show();  			
			</c:forEach>
			<c:forEach items="${signupRouteCode}" var="data">				
			$("[name='${data.route}']").show();  			
			</c:forEach>
/* 			<c:forEach items="${dataCheckCode}" var="data">				
			$("[name='${data.check_type}']").show();  			
			</c:forEach> */

	        
	        check = "up"; 
	    } else {  
		    
			hideforEach();
	        check = "none"
	    }  
			 
		}

	// 추가 부분 안보이게 하기
	function hideInsert(){
		var authObj =  $("[name='insertAuthority']:text");
		var routeObj =  $("[name='insertSignupRoute']:text");
	//	var checkObj =  $("[name='insertDataCheck']:text");

    	authObj.hide(); 
    	routeObj.hide(); 
    //	checkObj.hide(); 
	}

	// 수정부분 안보이게 하기
	function hideforEach(){
			<c:forEach items="${authCode}" var="data">				
			$("[name='${data.authority}']").hide();  			
			</c:forEach>		
			<c:forEach items="${signupRouteCode}" var="data">				
			$("[name='${data.route}']").hide();  			
			</c:forEach>
		/* 	<c:forEach items="${dataCheckCode}" var="data">				
			$("[name='${data.check_type}']").hide();  			
			</c:forEach>	 */
		}
	
	function changeCodeTable(){
		// 추가할 목록들 ------------------
		var authObj =  $("[name='insertAuthority']:text");
		var routeObj =  $("[name='insertSignupRoute']:text");
	//	var checkObj =  $("[name='insertDataCheck']:text");
		// -------------------------------
		
		// 테이블 명 ----------------------		
		var authTableObj = $('input:checkbox[id="CODE_REALTOR_AUTHORITY"]')
		var routeTableObj = $('input:checkbox[id="CODE_SIGNUP_ROUTE"]')
	//	var checkTableObj = $('input:checkbox[id="CODE_REALTOR_DATA_CHECK"]')
		// -------------------------------
		
		// 선택한 칼럼 개수 ----------------------	
		var change_auth_cnt = $('input:checkbox[id="auth"]').filter(":checked").length;
		var change_route_cnt = $('input:checkbox[id="route"]').filter(":checked").length;
	//	var change_check_cnt = $('input:checkbox[id="check"]').filter(":checked").length;
		// -------------------------------
		
		// 칼람 명 ----------------------   
		var columnAuth = $('input:checkbox[id="columnAuth"]');
		var columnRoute = $('input:checkbox[id="columnRoute"]');
	//	var columnCheck = $('input:checkbox[id="columnCheck"]');
		// -------------------------------
		
		
		// ----------------------------------------------------
		// 삭제 
		// ----------------------------------------------------
		if(check == "del"){
			

			if(change_auth_cnt==0 && change_route_cnt== 0 && change_check_cnt==0){
				alert("삭제하려는 목록을 선택해주세요.");
				return;
				}

			// realtorType중 하나라도 체크되면 테이블 이름 체크
			if(change_auth_cnt >0){
				authTableObj.attr("checked", true)
				$('input:checkbox[id="checkAuth"]').val(change_auth_cnt).attr("checked", true);  // 선택된 개수 추가 
				columnAuth.attr("checked", true);
				$('input:checkbox[id="columnCodeAuth"]').attr("checked", true);
			}
			if(change_route_cnt >0){
				routeTableObj.attr("checked", true)
				$('input:checkbox[id="checkRoute"]').val(change_route_cnt).attr("checked", true);
				columnRoute.attr("checked", true)
				$('input:checkbox[id="columnCodeRoute"]').attr("checked", true)
			}

/* 			if(change_check_cnt >0){
				checkTableObj.attr("checked", true);
				$('input:checkbox[id="checkCheck"]').val(change_check_cnt).attr("checked", true);
				columnCheck.attr("checked", true);
				$('input:checkbox[id="columnCodeCheck"]').attr("checked", true);
			}
 */

	/* 		
			alert($('input:checkbox[name="tableName"]').filter(":checked").length)
			return; */

			if(confirm("정말 삭제하시겠습니까?") ==false){return;}
				/* alert($('[name=authCode]').serialize()); */
			/*return; */

				$.ajax({
					url : "/javaBang/master/allCodeProc.do"
					,type : "post"
					,data : $('[name=realtorTypeCode]').serialize() + "&check=" + check
					,success : function(checkRealtorCnt){
						if(checkRealtorCnt>=1){
							alert("삭제 성공");
							location.replace("/javaBang/master/realtorCodeForm.do");
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


			<c:forEach items="${authCode}" var="data">				
				if($("[name='${data.authority}']").val() !=  "${data.authority}"){
						changeCode.push("${data.authority}");
						changeCode.push($("[name='${data.authority}']").val());
						tableInfo.push(authTableObj.val());
						tableInfo.push(columnAuth.val());
					} 			
			</c:forEach>
			
			<c:forEach items="${signupRouteCode}" var="data">				
				if($("[name='${data.route}']").val() !=  "${data.route}"){
					changeCode.push("${data.route}");
					changeCode.push($("[name='${data.route}']").val());
					tableInfo.push(routeTableObj.val());
					tableInfo.push(columnRoute.val());
				} 	  			
			</c:forEach>

/* 
			<c:forEach items="${dataCheckCode}" var="data">				 	
				if($("[name='${data.check_type}']").val() !=  "${data.check_type}"){
					changeCode.push("${data.check_type}");
					changeCode.push($("[name='${data.check_type}']").val());
					tableInfo.push(checkTableObj.val());
					tableInfo.push(columnCheck.val());
				} 			
			</c:forEach>
			 */
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
				,success : function(checkRealtorCnt){
					if(checkRealtorCnt>=1){
						alert("변경 성공");
						location.replace("/javaBang/master/realtorCodeForm.do");
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

			if(authObj.val()=="" && routeObj.val() =="" && checkObj.val() == ""){
				alert("추가하려는 컬럼값을 입력하세요");
				return;
			}
			 
			if(authObj.val()!=""){
				authTableObj.attr("checked", true)
				$('input:checkbox[id="checkAuth"]').val(change_auth_cnt).attr("checked", true);  // 선택된 개수 추가 
				$('input:checkbox[id="columnAuth"]').attr("checked", true);
				$('input:checkbox[id="columnCodeAuth"]').attr("checked", true);
				 $('input:checkbox[id="insertAuthority"]').attr("checked", true).val(authObj.val());
			}
			if(routeObj.val() !=""){
				routeTableObj.attr("checked", true)
				$('input:checkbox[id="checkRoute"]').val(change_route_cnt).attr("checked", true);
				$('input:checkbox[id="columnRoute"]').attr("checked", true)
				$('input:checkbox[id="columnCodeRoute"]').attr("checked", true)
				$('input:checkbox[id="insertSignupRoute"]').attr("checked", true).val(routeObj.val());
			}
/* 
			if(checkObj.val() != ""){
				checkTableObj.attr("checked", true);
				$('input:checkbox[id="checkCheck"]').val(change_check_cnt).attr("checked", true);
				$('input:checkbox[id="columnCheck"]').attr("checked", true);
				$('input:checkbox[id="columnCodeCheck"]').attr("checked", true);
			} */

			if(authObj.val()==""){authObj.attr("checked", false)}
			if(routeObj.val()==""){routeObj.attr("checked", false)}
/* 			if(checkObj.val()==""){checkObj.attr("checked", false)} */
			
			if(confirm("정말 추가하시겠습니까?") ==false){return;}
			/* 	 alert($('[name=realtorTypeCode]').serialize()); 
			return;  */

				$.ajax({
					url : "/javaBang/master/allCodeProc.do"
					,type : "post"
					,data : $('[name=realtorTypeCode]').serialize()  + "&check=" + check 
					,success : function(checkRoomCnt){

						if(checkRoomCnt>=1){
							alert("추가 성공");
							location.replace("/javaBang/master/realtorCodeForm.do");
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
                                    <li class="active">공인중개사Code</li>
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
						<form name="realtorTypeCode" method="post"> 
							<div class="card-body"style="background-color: #eaeade;height: 70;">
								<h4 class="box-title">MENU LIST</h4>
							</div>
							<div class="card-body"style="height: 70;">
								<div style="float:right">
									<input type="button" class="btn btn-success" value=" 추가 " onClick="btn_insert()" style="font-size:15pt;">
			                        <input type="button" class="btn btn-warning" value=" 수정 " onClick="btn_update()" style="font-size:15pt;">
			                        <input type="button" class="btn btn-danger" value=" 삭제 " onClick="btn_delete()" style="font-size:15pt;">
		                        </div> 
							</div>
							<div class="row">
							

									<div class="col-lg-4">
					                    <div class="card">
					                        <div class="card-header">
					                            <strong class="card-title">CODE_REALTOR_AUTHORITY &nbsp;<input type="checkbox" name="tableName" id="CODE_REALTOR_AUTHORITY" value="CODE_REALTOR_AUTHORITY" style="display:none"></strong>
					                        </div>
					                        <div class="card-body">
					                            <table class="table table-striped" style="text-align: center;font-size:15pt;">
					                            
					                                <thead>
					                                      <tr>
				                                            <th>AUTHORITY_CODE</th>
				                                            <th>AUTHORITY</th>                                         
				                                        </tr>
					                                </thead>
					                                <tbody>
					                                  <c:forEach items="${authCode}" var="auth" varStatus="loopTagStatus">
					                                        <tr>
					                                            <td><center>${auth.authority_code}</td>
					                                            <td><center>${auth.authority} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="selectColumn" id="auth" value="${auth.authority}" style="display:none" >
					                                             <input type="text" size="10" name="${auth.authority}" value="${auth.authority}" style="display:none" ></td> 
					                                        </tr>
					                                     </c:forEach>	
					                                </tbody>
					                            </table>
					                          &nbsp;&nbsp;<input type="text" size="25" name="insertAuthority"  style="display:none" placeholder=" 추가 할 컬럼명을 입력하세요." >
			                                	<input type="checkbox" name="insertValue" id="insertAuthority" value="" style="display:none">
			                                	<br><br>
					                        </div>
					                    </div>
					                </div>
									<!-- 컬럼명 -->
									<input type="checkbox" name="columnName" id="columnAuth" value="AUTHORITY" style="display:none" >
									<!-- 코드 컬럼명 -->
									<input type="checkbox" name="columnCodeName" id="columnCodeAuth" value="AUTHORITY_CODE" style="display:none" >
									<!-- 테이블 선택 개수 -->
									<input type="checkbox" name="checkNum" id="checkAuth" value="" style="display:none">
																			
											
									<div class="col-lg-4">
					                    <div class="card">
					                        <div class="card-header">
					                            <strong class="card-title">CODE_SIGNUP_ROUTE&nbsp;<input type="checkbox" name="tableName" id="CODE_SIGNUP_ROUTE" value="CODE_SIGNUP_ROUTE" style="display:none"></strong>
					                        </div>
					                        <div class="card-body">
					                            <table class="table table-striped" style="text-align: center;font-size:15pt;">
					                            
					                                <thead>
					                                     <tr>
				                                            <th>ROUTE_CODE</th>
				                                            <th>ROUTE</th>                                      
				                                        </tr>
					                                </thead>
					                                <tbody>
					                                   <c:forEach items="${signupRouteCode}" var="route" varStatus="loopTagStatus">
						                                        <tr>
						                                            <td><center>${route.route_code}</td>
						                                            <td><center>${route.route} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="selectColumn" id="route" value="${route.route}" style="display:none" >
						                                             <input type="text" size="10" name="${route.route}" value="${route.route}" style="display:none" ></td>
						                                        </tr>
						                                     </c:forEach>
					                                </tbody>
					                            </table>
					                          &nbsp;&nbsp;<input type="text" size="25" name="insertSignupRoute"  style="display:none"  placeholder=" 추가 할 컬럼명을 입력하세요." >
				                                	<input type="checkbox" name="insertValue" id="insertSignupRoute" value="" style="display:none">
			                                	<br><br>
					                        </div>
					                    </div>
					                </div>
										<!-- 컬럼명 -->
									<input type="checkbox" name="columnName" id="columnRoute" value="ROUTE" style="display:none" >
									<!-- 코드 컬럼명 -->
									<input type="checkbox" name="columnCodeName" id="columnCodeRoute" value="ROUTE_CODE" style="display:none" >
									<!-- 테이블 선택 개수 -->
									<input type="checkbox" name="checkNum"  id="checkRoute" value="" style="display:none">
									
										<%-- <div class="col-lg-4">
											<div class="card-body">
											<h4>CODE_REALTOR_DATA_CHECK &nbsp;<input type="checkbox" name="tableName" id="CODE_REALTOR_DATA_CHECK" value="CODE_REALTOR_DATA_CHECK" style="display:none"></h4><br>
													<table border="!">
					                                    <thead>
					                                        <tr>
					                                            <th>CHECK_CODE</th>
					                                            <th>CHECK_TYPE</th>                                         
					                                        </tr>
					                                    </thead>
					                                    <tbody>
						                                    <c:forEach items="${dataCheckCode}" var="check" varStatus="loopTagStatus">
						                                        <tr>
						                                            <td><center>${check.check_code}</td>
						                                            <td><center>${check.check_type} <input type="checkbox" name="selectColumn" id="check" value="${check.check_type}" style="display:none" >
						                                             <input type="text" size="10" name="${check.check_type}" value="${check.check_type}" style="display:none" ></td>
						                                        </tr>
						                                     </c:forEach>
					                                    </tbody>
				                                	</table>
				                                	&nbsp;&nbsp;<input type="text" size="20" name="insertDataCheck"  style="display:none" >
											</div>
										</div>
											<!-- 컬럼명 -->
									<input type="checkbox" name="columnName" id="columnCheck" value="CHECK_TYPE" style="display:none" >
									<!-- 코드 컬럼명 -->
									<input type="checkbox" name="columnCodeName" id="columnCodeCheck" value="CHECK_CODE" style="display:none" >
									<!-- 테이블 선택 개수 -->
									<input type="checkbox" name="checkNum"  id="checkCheck" value="" style="display:none"> --%>
							
							</div>
							<!-- /.row -->
							<div class="card-body"></div>
							</form>
							
						</div>
						<div >
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