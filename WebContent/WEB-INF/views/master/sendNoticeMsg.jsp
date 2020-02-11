<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- ########################################################## -->
<!-- 마스터 화면  -> 설정 -> 유저 접속 관리 made by kbs-->
<!-- ########################################################## -->

<script src="/javaBang/resources/jquery-1.11.0.min.js"
	type="text/javascript"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- jsp페이지에서 사용할 사용자 저의 태그인 spring폼 태그 선언 -->
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en">

<head>
<meta charset="utf-8">
<title>JAVABANG</title>
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



<!-- 달력 관련  -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
	$(document)
			.ready(
					function() {

						$("[name='selectContent']").hide(); 
						$("input:radio[name='checkCode']:radio[value='all']").attr("checked", true);
						
						openSocket()
					});



	function btn_select(){
		var otherObj = $("input:radio[name='checkCode']:radio[value='other']")
		var allObj = $("input:radio[name='checkCode']:radio[value='all']")

				
		if(otherObj.attr("checked")){ 
			$("[name='selectContent']").show();  

	    } else {  
	    	$("[name='selectContent']").hide();  
	    }  

	    
	}


//================================================================================
	 var ws;
        var messages=document.getElementById("messages");
        
        function openSocket(){
            if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
                //writeResponse("WebSocket is already opened.");
                return;
            }
            //웹소켓 객체 만드는 코드  
            //ws=new WebSocket("ws://localhost:13820/javaBang/echo.do");
            //ws=new WebSocket("ws://192.168.1.22:8080/javaBang/echo.do");
            ws=new WebSocket("ws://192.168.0.6:8088/javaBang/echo.do");
            ws.onopen=function(event){
                if(event.data===undefined) return;
                
             //   writeResponse(event.data);
            };
            ws.onmessage=function(event){
            //    writeResponse(event.data);
            };
            ws.onclose=function(event){
            //    writeResponse("Connection closed");
            }
        }

       // document.getElementById("sender").value
        function send(){
			var title = document.getElementById("title").value;
			var content = document.getElementById("content").value;
			var selectContent = document.getElementById("selectContent").value

     	   
			if(title == "" ){
					alert(" 글 제목을 입력해 주세요");
					return;
			}

			if(content == "" ){
				alert(" 공지 내용을 입력해 주세요");
				return;
			}
/* 
			if(selectContent == ""){
				alert("메시지 모낼 사용자를 선택하세요");
				return;
			} */
            
            var text;
			if(selectContent == ""){
				 text= title +" , " + content ;
			}else{
				 text= title +" , " + content + " , " + selectContent;
			}
            
            ws.send(text);
            text="";

            location.reload(); // 새로고침
        }
        
        function closeSocket(){
            ws.close();
        }
        function writeResponse(text){
            messages.innerHTML+="<br/>"+text;
        }
	








	
</script>
</head>

<body style="font-size:15pt;">
	<%@include file="/WEB-INF/views/master/aside.jsp"%>

	<div id="right-panel" class="right-panel">

		<!-- Header-->
		<header id="header" class="header">
			<div class="top-left">
				<div class="navbar-header">
					<a class="navbar-brand" href="/javaBang/master/homeForm.do">JAVABANG</a>

				</div>
			</div>
		</header>
		<!-- /header -->
		<!-- Header-->

		<div class="breadcrumb"  style="background-color: hsla(230, 17%, 93%, 0);">
			<div class="breadcrumb"  style="width: 1605;height: 80;margin-left: 12;">
					<div class="col-sm-4">
						<div class="page-header float-left">
							<div class="page-title">
								<h1>공지사항</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<!--    <li><a href="#">Dashboard</a></li> -->
									<li>설정</li>
									<li class="active">공지사항</li>
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
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body" style="background-color: #eaeade;height: 70;">
								<h4 class="box-title" style="font-size:15pt;">공지사항 보내기</h4>
							</div>

							<form name="checkingToggle" method="post">
								<div class="card-body"></div>
								<div class="row">



									<div class="col-lg-4" style="margin: 80 auto;">
										<div class="card-body">
											<h3 class="breadcrumb" style="background-color: lightslategrey;color: aliceblue;width: max-content;">
												메시지를 보낼 사용자를 선택하세요</h3>
											<br>
											<div style="margin-left: 45;">
											<div class="custom-control custom-radio">
												<input type="radio" class="custom-control-input" name="checkCode" value="all" onClick="btn_select()">
													<label class="custom-control-label">전체 보내기</label>
											</div>
											&nbsp;&nbsp;&nbsp;
											<!-- <input type="radio" name="checkCode" value="other" onClick="btn_select()" style="margin-left: 30;"> 선택 보내기 -->
											
											<select id="selectContent" name="selectContent" >
												<option value="buy">구해방</option>
												<option value="sell">팔아방</option>		
												<option value="rent">빌려방</option>	
												<option value="realEstale">공인중개사</option>		
												<!-- <option value="etc">직접입력</option>		 -->				
											</select>
											</div>
				
										</div>
									</div>

									<div class="col-lg-4" style="margin-right: 300;">
										<div class="card-body">
											<h3 class="breadcrumb" style="background-color: lightslategrey;color: aliceblue;width: fit-content;">
												공지사항 입력</h3>
											<br>
											<table	class="table" style="font-size:15pt;">
												<tr>
													<th>글제목
														<td width=200 colspan=3><input type="text" id="title"  name="title" style="width: -webkit-fill-available;">
												<tr>
													<th>내 용
														<td width=200 colspan=6>
												<textarea name="content"  id="content" rows="10"  style="border:1;resize:none;width:-webkit-fill-available;"></textarea>	
											</table>

										</div>
									</div>
									


								</div>
												
							</form>
							<div class="card-body"></div>

						</div>
						<div>
							<input type="button" class="btn btn-info btn-lg" value=" 전송 " onClick="send()" style="margin-left: 40%;">
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





</body>

</html>
