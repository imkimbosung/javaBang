<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%> 
<%@include file="/WEB-INF/views/realtor/incloudfile/proLeftMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인중개사 관리중인 매물</title>
<style>
div.dt-buttons {
	font-size:20pt;
}
</style>
<!--===============================================================================================-->
<!--===============================================================================================-->
<%-- 	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
    <link rel="stylesheet" href="${ctRoot}/resources/loginPage/css/title_ui.css"> --%>
  <link rel="stylesheet" href="/javaBang/resources/table/css/main.css">

<!--===============================================================================================-->
     <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="author" content="colorlib.com">
	
    <meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <meta http-equiv="X-UA-Compatible" content="ie=edge"> 
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <!-- 차트 링크 -->
   

    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script><!-- 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.slim.min.js"></script> -->
   <!--  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/js/bootstrap.min.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handsontable/5.0.0/handsontable.full.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/web-animations/2.3.1/web-animations.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/muuri/0.5.4/muuri.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>    
	<!-- <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> -->
	<!-- <script src="https://code.jquery.com/jquery.min.js"></script> -->
	
	<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> --> 
	<script src="/javaBang/resources/jquery-1.11.0.min.js"	type="text/javascript"></script>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<!-- buyerListForm-sample 참고 -->

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="/javaBang/resources/assets/css/style.css">
    <!-- <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'> -->
	<!-- <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> -->
	<script>
		
	</script>
	
	<!-- <script>
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

    </script> -->
    <!--  -->

	<script>
	
	$(document).ready(function(){
		
	     
		//$("#bootstrap-data-table").dataTable([{"paging":false,"searching":false,"info":false}]);
	  /*
		$('.boardTable tbody tr:odd').css("background", "lightgray");
        $('.boardTable tbody tr:even').css("background", "white");
            var cnt = 0;
            var trsObj = $('.boardTable tbody tr');
            trsObj.hide();
            trsObj.each( function() {

                var flag = false;
                var thisTrObj = $(this);
                var td1Text = thisTrObj.find("td:eq(0)").text().toUpperCase();
                var td2Text = thisTrObj.find("td:eq(1)").text().toUpperCase();
                var td3Text = thisTrObj.find("td:eq(2)").text().toUpperCase();
               
                if (flag) {
                    if(cnt%2==0){
                        thisTrObj.css("background", "lightgray");
                    }
                    else {
                        thisTrObj.css("background", "white");
                }
                }
            });
           
        } ); */
			
			 
			
				/* inputData( "[name=selectPageNo]","${sellroomSearchDTO.selectPageNo}");
				inputData( "[name=rowCntPerPage]","${sellroomSearchDTO.rowCntPerPage}");
				inputData( "[name=keyword]","${sellroomSearchDTO.keyword}");

				<c:forEach items="${sellroomSearchDTO.date}" var="date">
					inputData( "[name=date]","${date}");
				</c:forEach>
				<c:forEach items="${sellroomSearchDTO.readcnt}" var="readcnt">
					inputData( "[name=readcnt]","${readcnt}");
				</c:forEach> */
				
				
				 $("#middle-bottom").click(function(){
			        	var topEle = $('#middle-bottom');
				        var delay = 1000;
				        $('html, body').stop().animate({scrollTop: 500}, delay);
			        });
				 
				 $("#end-bottom").click(function(){
			        	var topEle = $('#end-bottom');
				        var delay = 1000;
				        $('html, body').stop().animate({scrollTop: 1630}, delay);
			        });
			        
				 
			        $("#top-bottom").click(function(){
			        	var topEle = $('#top-bottom');
				        var delay = 1000;
				        $('html, body').stop().animate({scrollTop: 0}, delay);
				        
			        });

				
		});
	
	/* function goCheckOwner(sr_no){
		
		$("[name=sr_no]").val(sr_no);
		if(confirm("해당 공실의 소유자 확인을 진행하시겠습니까?")==false){return;}
		
		$.ajax({
            url : "${ctRealtorRoot}/managementHouseProc_code2.do"
            , type : "post"
            , data : $('[name=managementHouseProc]').serialize()
            , success : function(CheckOwnerCodeCnt){
               if(CheckOwnerCodeCnt == 1){
            	    alert("소유자 확인 완료.");
					location.replace("${ctRealtorRoot}/managementHouse.do");
				}
               else if(CheckOwnerCodeCnt == 0){
						alert("확인 실패.");
				}

               else {
						alert("서버쪽 DB 연동 실패");
					
				}
            }
            , error : function(){
                alert("서버와 통신 실패");
             }
          });
	} */
	

	function goSearch(){
			
			if(is_empty("[name=managementHouse] [name=keyword]")){
				$("[name=managementHouse] [name=keyword]").val("");
			}
			
			var keyword = $("[name=managementHouse] [name=keyword]").val();
			keyword = $.trim(keyword);
			$("[name=managementHouse] [name=keyword]").val(keyword);
			
			document.managementHouse.submit();
			
	}
	
	function goSearchAll(){
		
			document.managementHouse.reset();
				$("[name=managementHouse] [name=selectPageNo]").val("1");
				$("[name=managementHouse] [name=rowCntPerPage]").val("15");
				goSearch(); 
				
	}
	
	

	function goproductContent(sr_no){
		 var str = "sr_no="+sr_no+"&"+$("[name=managementHouse]").serialize();
		 //alert("str=>"+ "sr_no=" + sr_no +"&"+$("[name=managementHouse]").serialize());
		 //return;
		 location.replace("${ctRealtorRoot}/productContent.do?"+str);
		 
		/* document.productContent.submit(); */
	}
	
	
	function goCheck(sr_no){

		$("[name=sr_no]").val(sr_no);
		//alert($("[name=sr_no]").val())
		//alert($('[name=managementHouseProc]').serialize())
		 if(confirm("이 매물의 계약을 확인 하시겠습니까?")==false){return;}
		
		//공실광고중인 매물을 판매자 확인중으로 변경하는 부분. "CHECK_CODE = 3  >>>>>  CHECK_CODE=4 로 변경"
		$.ajax({
			url:"${ctRealtorRoot}/managementHouseProc.do"
			,type:"post"
			,data:$("[name='managementHouseProc']").serialize()
			,success:function(checkCnt){
				//alert(checkCnt);
					if(checkCnt==1){
						alert("확인 완료.");
						location.replace("${ctRealtorRoot}/managementHouse.do");
					}else if(checkCnt == 0){
						alert("확인 실패.");
					}
					else {
						alert("서버쪽 DB 연동 실패");
					}
			}
			,error:function(){
				alert("서버와 통신 실패");
			}
		}); 
		
			
		}
	
	
</script>
</head>


 <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
    
     <!-- Header -->
		<div class="site-section-cover overlay" style="background-image: url('/javaBang/resources/images/boodong.png')">
			<div class="container">
				<div class="row align-items-center justify-content-center text-center" style="height:200px;margin-left:70;">
					<div class="col-md-10" style="margin-left: 300;">
						<h3 class="mb-1" style="padding: 15px;font-weight: bold;text-align: center;background-color: #ffffff;opacity: 0.9;width: 400;">관리중인 매물</h3>
					</div>
				</div>
			</div>
		</div>
	



	 <div class="site-wrap" id="home-section">

	    <div class="">
	      <div class="container">
	      	<div id="root">
			
			</div>
           </div>
         </div>
         <div class="col-md-4 sidebar">
         </div>
       </div>


					<!-- =============================================== buyerListForm-sample 참고===================================================== --> 

				 	<div id="right-panel" class="right-panel"  style="font-size:20px;">
				        <div class="content">
				            <div class="animated fadeIn">
				                <div class="row">
				                
				                
								<!-- =================게시판==================== --> 
				                 <div class="col-md-12" style=" float:left;" >
					                 <div id="middle-bottom" style=" float:left; margin-left:'5%';">
					                 	<a href="#boardList" class="btn btn-secondary" style="font-size:15pt;margin-right: 20;">관리중인 부동산 게시판보기</a></div>
					                 <div id="end-bottom" style=" float:left; margin-left:'15%';" >
					                 	<a href="#graph" class="btn btn-secondary"  style="font-size:15pt">그래프 보기</a></div>
				                 </div>
				                 
				                 <br><br><br>
				                 <div class="col-md-12">
				                       <div class="card">
				                       
				                           <div class="card-header">
				                           	
				                               <strong class="card-title">관리중인 부동산</strong>
				                               
				                           </div>
				                           <div class="card-body" id="boardList">
				                                
				                                    <%-- <form class="managementHouse" name="managementHouse" action="${ctRealtorRoot}/managementHouse.do">
										            <center><div style = "width:800">
															 <center> 
															 [매물 지역] : 
															 <select name ="sr_addr">
																<option value="">--시/도선택--</option>
																<option value="서울">서울<!-- <option value="부산">부산<option value="대구">대구<option value="인천">인천<option value="광주">광주<option value="대전">대전<option value="울산">울산<option value="세종">세종
																<option value="경기">경기<option value="강원">강원<option value="충북">충북<option value="충남">충남<option value="전북">전북<option value="전남">전남<option value="경북">경북<option value="경남">경남
																<option value="제주">제주 -->
															</select>	&nbsp;&nbsp;
																
																
															[키워드] : <input type="text" name="keyword" class="keyword" >   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																
															<input type="button" style="width:50pt; height:20pt" value="검색" class="contactSearch" onClick="goSearch();">
															<input type="button" style="width:80pt; height:20pt" value="모두검색" onClick="goSearchAll();"> &nbsp;&nbsp;
															
															<input type = "hidden" name="selectPageNo" >
															<input type="hidden" name="r_no" class="r_no" value="${realtorDTO.r_no}">
													</div>
									
										        		[총 개수] : ${roomListAllCnt}&nbsp; 개&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											        		
											        		<select name = "rowCntPerPage" >
																<option value="1">1
																<option value="15">15
																<option value="20">20
																<option value="25">25
																<option value="30">30
															</select>행보기
											
												</form> --%>
												
									   			<!-- -------------------------------------------------------------------------------------------------------------------------- -->
									   			<!-- <div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>  -->
												<!-- -------------------------------------------------------------------------------------------------------------------------- -->
												
				                                    <form class="managementHouseProc" name="managementHouseProc" method="post" action="${ctRealtorRoot}/managementHouseProc.do">
				                                    <table class="table dataTable table-striped" id="bootstrap-data-table" style="font-size:15pt">
				                                    
				                                    <input type="hidden" name="sr_no" class="sr_no">
				                                    <thead>
				                                        <tr >  
				                                            <th>번호
				                                            <th>방 번호
				                                            <th>판매자
				                                            <th>층
				                                            <th>방크기
				                                            <th>주소
				                                            <th>상세주소
				                                            <th>등록일
				                                            <th>판매버튼                                       
				                                        </tr>
				                                    
				                                    </thead>
				                                    <tbody>
				                                    <c:forEach items="${roomList}" var="room" varStatus="loopTagStatus">
				                                    	<tr style="cursor:pointer" onClick="goproductContent(${room.sr_no});">
				                                       <!-- <tr style="cursor:pointer" onClick="goBoardContentForm(${room.sr_no});">	  -->
	        			
											        		<td align=center>
																 <%-- ${roomListAllCnt
																-
																(sellroomSearchDTO.selectPageNo*sellroomSearchDTO.rowCntPerPage-sellroomSearchDTO.rowCntPerPage+1+loopTagStatus.index)
																+1} --%> 
																${sellroomSearchDTO.selectPageNo*sellroomSearchDTO.rowCntPerPage-sellroomSearchDTO.rowCntPerPage+1+loopTagStatus.index}
															<td align=center>
											        			${room.sr_no}
											        		<td align=center>
											        			${room.s_name}
											        		<td align=center>
											        			${room.sr_room_floor}
											        		<td align=center>
											        			${room.sr_roomsize}
											        		<td align=center>
											        			${room.sr_addr}
											        		<td align=center>
											        			${room.sr_detail_addr}
											        		<td align=center>
											        			${room.sr_date}
											        			
											        			
											        		<td align=center>
											        			<c:if test="${room.check_code == 1}">
									 				 				<input type=button value="Check_code=1" class="btn btn-success btn-sm" onClick="뜨면안됨" style="font-size:15pt"> 
									  							</c:if>
											        			<c:if test="${room.check_code == 2}">
									 				 				<input type=button value="소유자 확인" class="btn btn-success btn-sm" onClick="goCheckOwner();" style="font-size:15pt"> 
									  							</c:if>
									  							<c:if test="${room.check_code == 3}">
									 				 				<input type=button value="계약 확인" class="btn btn-success btn-sm" onClick="goCheck(${room.sr_no});" style="font-size:15pt"> 
									  							</c:if>
																<c:if test="${room.check_code == 4}">
																	 <p style="margin:0 auto;font-size:15pt;" class="btn btn-white btn-sm active">판매자 확인 중</p>					 				 				  						 				 				 
									  							</c:if>											  		
									  							<c:if test="${room.check_code == 5}">
									 				 				<p style="margin:0 auto;font-size:15pt;" class="btn btn-white btn-sm active" >확인 완료</p>
									  							</c:if>
													
											
				                                     </c:forEach>
				                                    </tbody>
												</table>
												<c:if test="${empty roomList}">
													검색결과가 없음.
												 </c:if>
				                                
				                                </form>
				                                
				                            </div>
				                        </div>
				                    </div>
				                    
				                <c:if test="${empty roomList}">
									검색결과가 없음.
								</c:if>
				   
				                
				                	
				                <br><br><br><br>
				                
				                

				                	<!-- 집크기별 그래프 -->
				 					<div class="col-md-12">
				 						
				                        <div class="card">
				                            <div class="card-header" id="graph">
				                                <strong class="card-title" name="graph">방 크기별 매물 수</strong>
				                            </div>
				                            
				        					
											
											    <canvas id="myChart" style="height:300px"></canvas>
											
											<script>
										 
											var ctx = document.getElementById("myChart").getContext('2d');
											
											var myChart = new Chart(ctx, {
											    type: 'bar',
											    data: {
											        labels: ["0 - 8평", "9 - 13평", "14 - 20평", "20평 이상"],
											        datasets: [{
											            label: '매물 수',
											            data: [${smallRoomCnt}, ${smallMiddleRoomCnt}, ${middleRoomCnt}, ${bigRoomCnt}],
											            backgroundColor: [
											                'rgba(255, 99, 132, 20)',
											                'rgba(54, 162, 235, 20)',
											                'rgba(255, 206, 86, 20)',
											                'rgba(71, 200, 62, 20)'
											            ],
											            borderColor: [
											                'rgba(255,99,132,1)',
											                'rgba(54, 162, 235, 1)',
											                'rgba(255, 206, 86, 1)',
											                'rgba(71,200,62,1)'
											            ],
											            borderWidth: 1
											        }]
											    },
												options: 
												{
													maintainAspectRatio: true,
													responsive: false,
													scales: {
												        xAxes: [{
												            ticks: {
												                fontSize: 25,
												                fontStyle:'normal'
												            }
												        }], 
												        yAxes: [{
												            ticks: {
												                fontSize: 25,
												                fontStyle:'normal'
												            }
												        }]
												    },
													legend: {
											            labels: {
											                fontSize:20,
											                fontStyle:'normal'
											            }
											        }
												}
											    
											});
											</script>
								
						                            
				                            
				                         
				                        </div>
				                    </div>
				                    
				                    
				                    
				                 <!-- =================지역별 그래프==================== --> 
				                 <div class="col-md-12">
				                 	
				                       <div class="card">
				                           <div class="card-header">
				                               <strong class="card-title">지역별 매물 수</strong>
				                           </div>
				                           <div class="card-body">
				                                
				                                 
				                                    <form class="managementHouseProc" name="managementHouseProc" method="post" action="${ctRealtorRoot}/managementHouseProc.do">
				                                    <table id="bootstrap-data-table" class="dataTable table table-striped" style="font-size:21pt">
				                                    <thead>
				                                    
				                                    <input type="hidden" name="sr_no" class="sr_no">
				                                        <tr>   
				                                            <th>지역
				                                            <th>매물 수
				                                            <th>그래프                            
				                                        </tr>
				                                    </thead>
				                                    <tbody>
				                                    
				                                    
				                                    
				                           
				                               		<c:if test="${addrList[0].Junggu != 0}">
				                                       <tr>	
											        		<td align=center width=300>
											        			서울 중구
											        		<td align=center width = 200>
											        			${addrList[0].Junggu}
											        		<td align=center>
											        			<div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Junggu*per}%;font-size:20pt;" aria-valuenow="${addrList[0].Junggu}" aria-valuemin="0" aria-valuemax="50">
											        			
											        					</div></div>
											        </c:if>	
											        
											        <c:if test="${addrList[0].Dongjakgu != 0}">
											        	<tr>	
											        		<td align=center width=300>
											        			서울 동작구
											        		<td align=center width = 200>
											        			 ${addrList[0].Dongjakgu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Dongjakgu*per}%" aria-valuenow="${addrList[0].Dongjakgu}" aria-valuemin="0" aria-valuemax="50"></div></div>
											          </c:if>	
											           
											        <c:if test="${addrList[0].Yeongdeungpogu != 0}"> 			
											        	<tr>	
											        		<td align=center width=300>
											        			서울 영등포구
											        		<td align=center width = 200>
											        			 ${addrList[0].Yeongdeungpogu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Yeongdeungpogu*per}%" aria-valuenow="${addrList[0].Yeongdeungpogu}" aria-valuemin="0" aria-valuemax="50"></div></div>
     												</c:if>	
     												
     												
     												<c:if test="${addrList[0].Songpagu != 0}"> 
											        	<tr>	
											        		<td align=center width=300>
											        			서울 송파구
											        		<td align=center width = 200>
											        			 ${addrList[0].Songpagu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Songpagu*per}%" aria-valuenow="${addrList[0].Songpagu}" aria-valuemin="0" aria-valuemax="50"></div></div>
 													</c:if>	
 													
 													
 													
 													<c:if test="${addrList[0].Gangnamgu != 0}"> 
 														<tr>	
											        		<td align=center width=300>
											        			서울 강남구
											        		<td align=center width = 200>
											        			 ${addrList[0].Gangnamgu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Gangnamgu*per}%" aria-valuenow="${addrList[0].Gangnamgu}" aria-valuemin="0" aria-valuemax="50"></div></div>
													</c:if>	
													
													
													<c:if test="${addrList[0].Gangdonggu != 0}"> 
     													<tr>	
											        		<td align=center width=300>
											        			서울 강동구
											        		<td align=center width = 200>
											        			 ${addrList[0].Gangdonggu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Gangdonggu*per}%" aria-valuenow="${addrList[0].Gangdonggu}" aria-valuemin="0" aria-valuemax="50"></div></div>
     												</c:if>	
     												
     												<c:if test="${addrList[0].Seochogu != 0}"> 	
												     	<tr>	
											        		<td align=center width=300>
											        			서울 서초구
											        		<td align=center width = 200>
											        			 ${addrList[0].Seochogu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Seochogu*per}%" aria-valuenow="${addrList[0].Seochogu}" aria-valuemin="0" aria-valuemax="50"></div></div>
     												</c:if>	
     												
     												<c:if test="${addrList[0].Gwanakgu != 0}"> 		
													     <tr>	
											        		<td align=center width=300>
											        			서울 관악구
											        		<td align=center width = 200>
											        			 ${addrList[0].Gwanakgu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Gwanakgu*per}%" aria-valuenow="${addrList[0].Gwanakgu}" aria-valuemin="0" aria-valuemax="50"></div></div>
     												</c:if>	
     												
     												
     												<c:if test="${addrList[0].Geumcheongu != 0}"> 		
													     <tr>	
											        		<td align=center width=300>
											        			서울 금천구
											        		<td align=center width = 200>
											        			 ${addrList[0].Geumcheongu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Geumcheongu*per}%" aria-valuenow="${addrList[0].Geumcheongu}" aria-valuemin="0" aria-valuemax="50"></div></div>
     												</c:if>	
     												
     												<c:if test="${addrList[0].Gurogu != 0}">	
													     <tr>	
											        		<td align=center width=300>
											        			서울 구로구
											        		<td align=center width = 200>
											        			 ${addrList[0].Gurogu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Gurogu*per}%" aria-valuenow="${addrList[0].Gurogu}" aria-valuemin="0" aria-valuemax="50"></div></div>
     												</c:if>	
     												
     												<c:if test="${addrList[0].Gangseogu != 0}">	
													     <tr>	
											        		<td align=center width=300>
											        			서울 강서구
											        		<td align=center width = 200>
											        			 ${addrList[0].Gangseogu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Gangseogu*per}%" aria-valuenow="${addrList[0].Gangseogu}" aria-valuemin="0" aria-valuemax="50"></div></div>
     												</c:if>
     												
     												<c:if test="${addrList[0].Yangcheongu != 0}">		
													     <tr>	
											        		<td align=center width=300>
											        			서울 양천구
											        		<td align=center width = 200>
											        			 ${addrList[0].Yangcheongu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Yangcheongu*per}%" aria-valuenow="${addrList[0].Yangcheongu}" aria-valuemin="0" aria-valuemax="50"></div></div>
     												</c:if>
     												
     												<c:if test="${addrList[0].Mapogu != 0}">	
													    <tr>	
											        		<td align=center width=300>
											        			서울 마포구
											        		<td align=center width = 200>
											        			 ${addrList[0].Mapogu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Mapogu*per}%" aria-valuenow="${addrList[0].Mapogu}" aria-valuemin="0" aria-valuemax="50"></div></div>
     												</c:if>
     												
     												<c:if test="${addrList[0].Seodaemungu != 0}">	  
													    <tr>	
											        		<td align=center width=300>
											        			서울 서대문구
											        		<td align=center width = 200>
											        			 ${addrList[0].Seodaemungu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Seodaemungu*per}%" aria-valuenow="${addrList[0].Seodaemungu}" aria-valuemin="0" aria-valuemax="50"></div></div>
     												</c:if>
     												
     												<c:if test="${addrList[0].Eunpyeonggu != 0}">	 
													     <tr>	
											        		<td align=center width=300>
											        			서울 은평구
											        		<td align=center width = 200>
											        			 ${addrList[0].Eunpyeonggu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Eunpyeonggu*per}%" aria-valuenow="${addrList[0].Eunpyeonggu}" aria-valuemin="0" aria-valuemax="50"></div></div>
     												</c:if>
     												
     												<c:if test="${addrList[0].Nowongu != 0}">	 
													     <tr>	
											        		<td align=center width=300>
											        			서울 노원구
											        		<td align=center width = 200>
											        			 ${addrList[0].Nowongu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Nowongu*per}%" aria-valuenow="${addrList[0].Nowongu}" aria-valuemin="0" aria-valuemax="50"></div></div>
     												</c:if>
     												
     												<c:if test="${addrList[0].Dobonggu != 0}">	 
													     <tr>	
											        		<td align=center width=300>
											        			서울 도봉구
											        		<td align=center width = 200>
											        			 ${addrList[0].Dobonggu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Dobonggu*per}%" aria-valuenow="${addrList[0].Dobonggu}" aria-valuemin="0" aria-valuemax="50"></div></div>
     												</c:if>	
     												
     												
     												<c:if test="${addrList[0].Gangbukgu != 0}">	 
													     <tr>	
											        		<td align=center width=300>
											        			서울 강북구
											        		<td align=center width = 200>
											        			 ${addrList[0].Gangbukgu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Gangbukgu*per}%" aria-valuenow="${addrList[0].Gangbukgu}" aria-valuemin="0" aria-valuemax="50"></div></div>
     												</c:if>	
     												
     												<c:if test="${addrList[0].Seongbukgu != 0}">		 
													     <tr>	
											        		<td align=center width=300>
											        			서울 성북구
											        		<td align=center width = 200>
											        			 ${addrList[0].Seongbukgu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Seongbukgu*per}%" aria-valuenow="${addrList[0].Seongbukgu}" aria-valuemin="0" aria-valuemax="50"></div></div>
     												</c:if>	
     												
     												<c:if test="${addrList[0].Jungnanggu != 0}">	  
													     <tr>	
											        		<td align=center width=300>
											        			서울 중랑구
											        		<td align=center width = 200>
											        			 ${addrList[0].Jungnanggu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Jungnanggu*per}%" aria-valuenow="${addrList[0].Jungnanggu}" aria-valuemin="0" aria-valuemax="50"></div></div>
     												</c:if>	
     												
     												<c:if test="${addrList[0].Dongdaemungu != 0}">	 
													     <tr>	
											        		<td align=center width=300>
											        			서울 동대문구
											        		<td align=center width = 200>
											        			 ${addrList[0].Dongdaemungu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Dongdaemungu*per}%" aria-valuenow="${addrList[0].Dongdaemungu}" aria-valuemin="0" aria-valuemax="50"></div></div>
     												</c:if>	
     												
     												<c:if test="${addrList[0].Gwangjingu != 0}">	 	 
												     	<tr>	
											        		<td align=center width=300>
											        			서울 광진구
											        		<td align=center width = 200>
											        			 ${addrList[0].Gwangjingu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Gwangjingu*per}%" aria-valuenow="${addrList[0].Gwangjingu}" aria-valuemin="0" aria-valuemax="50"></div></div>
     												</c:if>	
     												
     												<c:if test="${addrList[0].Seongdonggu != 0}">	 
												     	<tr>	
											        		<td align=center width=300>
											        			서울 성동구
											        		<td align=center width = 200>
											        			 ${addrList[0].Seongdonggu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Seongdonggu*per}%" aria-valuenow="${addrList[0].Seongdonggu}" aria-valuemin="0" aria-valuemax="50"></div></div>
     												</c:if>	
     												
     												<c:if test="${addrList[0].Yongsangu != 0}">	 
												     	<tr>	
											        		<td align=center width=100>
											        			서울 용산구
											        		<td align=center width = 50>
											        			 ${addrList[0].Yongsangu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Yongsangu*per}%" aria-valuenow="${addrList[0].Yongsangu}" aria-valuemin="0" aria-valuemax="50"></div></div>
     												</c:if>	
     												
     												<c:if test="${addrList[0].Jongnogu != 0}">	 	 
												     	<tr>	
											        		<td align=center width=300>
											        			서울 종로구
											        		<td align=center width = 200>
											        			 ${addrList[0].Jongnogu}
											        		<td align=center>
											        			 <div class="progress" style="background-color:#fbfdfd;height:40px"><div title="tooltip" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${addrList[0].Jongnogu*per}%" aria-valuenow="${addrList[0].Jongnogu}" aria-valuemin="0" aria-valuemax="50"></div></div>
     												
     												</c:if>	
     												
     												
													

				                                    </tbody>
				                                </table>
				                                </form>
				                            </div>
				                        </div><br><br><br><br>
				                     	 <div id="top-bottom" style=" float:left; margin-left:'5%';"><a href="#" class="btn btn-secondary" style="font-size:15pt;">처음으로</a></div>
				                    </div>
				                </div>
				            </div><!-- .animated -->
				        </div><!-- .content -->
		
				        <div class="clearfix"></div>
				    </div><!-- /#right-panel -->
				
				    <!-- Right Panel -->
				
				    <!-- Scripts -->
					    <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
					    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
					    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
					    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
					    <script src="/javaBang/resources/assets/js/main.js"></script>

					    <script src="/javaBang/resources/assets/js/lib/data-table/datatables.min.js"></script>
					    <script src="/javaBang/resources/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
					    <script src="/javaBang/resources/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
					    <script src="/javaBang/resources/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
					    <script src="/javaBang/resources/assets/js/lib/data-table/jszip.min.js"></script>
					    <script src="/javaBang/resources/assets/js/lib/data-table/vfs_fonts.js"></script>
					    <script src="/javaBang/resources/assets/js/lib/data-table/buttons.html5.min.js"></script>
					    <script src="/javaBang/resources/assets/js/lib/data-table/buttons.print.min.js"></script>
					    <script src="/javaBang/resources/assets/js/lib/data-table/buttons.colVis.min.js"></script> -->
	    				
	    				
				  



     


</body>
  <%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
  <!-- 테이블정렬 -->
	    				 <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
						    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
						    <script src="/javaBang/resources/assets/js/main.js"></script>
						    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
						    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
						    <script src="/javaBang/resources/assets/js/lib/data-table/datatables.min.js"></script>
						    <script src="/javaBang/resources/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
						    <script src="/javaBang/resources/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
						    <script src="/javaBang/resources/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
						    <script src="/javaBang/resources/assets/js/lib/data-table/jszip.min.js"></script>
						    <script src="/javaBang/resources/assets/js/lib/data-table/vfs_fonts.js"></script>
						    <script src="/javaBang/resources/assets/js/lib/data-table/buttons.html5.min.js"></script>
						    <script src="/javaBang/resources/assets/js/lib/data-table/buttons.print.min.js"></script>
						    <script src="/javaBang/resources/assets/js/lib/data-table/buttons.colVis.min.js"></script>
						    <script src="/javaBang/resources/assets/js/init/datatables-init.js"></script>
  <script>
  $(document).ready(function(){
		$("#bootstrap-data-table").dataTable().fnDestroy();
		$("#bootstrap-data-table").dataTable({"language": {
			"emptyTable": "데이터없음",
			"lengthMenu": "페이지당 _MENU_ 개씩 보기",
			"info": "현재 _START_ - _END_ / _TOTAL_건",
			"infoEmpty": "데이터 없음",
			"infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
			"search": "검색: ",
			"zeroRecords": "일치하는 데이터가 없어요.",
			"loadingRecords": "로딩중...",
			"processing":     "잠시만 기다려 주세요...",
			"paginate": {
			"next": "다음",
			"previous": "이전"
			}},
			dom: 'Blfrtip',
	        buttons: [{
	            extend: 'excelHtml5',
	            text: 'excel 파일 다운',
	            footer: true,
	            className: 'exportBtn',
    	        title: '렌탈신청현황'
	        }]
	        
		})
		})
		</script>
</html>






