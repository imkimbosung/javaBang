<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인중개사 마이페이지</title>

<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/animate/animate.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/select2/select2.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
    <link rel="stylesheet" href="${ctRoot}/resources/loginPage/css/title_ui.css">
<!--===============================================================================================-->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
   <!-- 예쁜셀렉트박스 -->
      <link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
   
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <meta name="author" content="colorlib.com">
   
    <link href="${ctRoot}/resources/selectbox/css/main.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    
    
    <script type="text/javascript">
    
    $(document).ready(function(){
    	function getRandomRgb() {
	  		  var num = Math.round(0xffffff * Math.random());
	  		  var r = num >> 16;
	  		  var g = num >> 8 & 255;
	  		  var b = num & 255;
	  		  return 'rgb(' + r + ', ' + g + ', ' + b;
  		}
		var ctx1 = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(ctx1, {
		    type: 'bar',
		    data: {
		        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        datasets: [{
		        	label: ' "${rateOfSalesList[0].SR_DATE}" 년  ${realtorMenuInfoDTO.r_name}님의 월별 매물 판매량 ',
		            data: [	  ${rateOfSalesList[0].Jan}
		            		  , ${rateOfSalesList[0].Feb}
		            		  , ${rateOfSalesList[0].Mar}
		            		  , ${rateOfSalesList[0].Apr}
		            		  , ${rateOfSalesList[0].May}
		            		  , ${rateOfSalesList[0].Jun}
		            		  , ${rateOfSalesList[0].Jul}
		            		  , ${rateOfSalesList[0].Aug}
		            		  , ${rateOfSalesList[0].Sep}
		            		  , ${rateOfSalesList[0].Oct}
		            		  , ${rateOfSalesList[0].Nov}
		            		  , ${rateOfSalesList[0].Dec}
		            	  ],
		            backgroundColor: [
		                '#FF6767',
		                '#C68D80',
		                '#FF8847',
		                '#FFABAB',
		                '#FFC380',
		                '#FFCD1E',
		                '#92C53E',
		                '#21A4F3',
		                '#4281A7',
		                '#8890D7',
		                '#85CED6',
		                '#C85B5B'
		            ],
		            borderColor: [
		            	'#FF6767',
		                '#C68D80',
		                '#FF8847',
		                '#FFABAB',
		                '#FFC380',
		                '#FFCD1E',
		                '#92C53E',
		                '#21A4F3',
		                '#4281A7',
		                '#8890D7',
		                '#85CED6',
		                '#C85B5B'
		            ],
		            borderWidth: 1
		        }]
		    },
		    options: {
			    /*
		    	maintainAspectRatio: true,
                responsive: false,
                */
		        scales: {
	     			 //y 좌표 글자 크기
		            yAxes: [{
		                ticks: {
		                	fontSize: 20
		                }
		            }],
		          //x 좌표 글자 크기
					  xAxes: [{
				            ticks: {
				                fontSize: 20
				            }
				        }]
				       
		        },
		        legend: {
		            labels: {
		                fontSize:20,
		                fontStyle:'bold'
		            }
		        }
		    }
		});

		// And for a doughnut chart
		var regionOfRealtorManage = []
		var regionOfRealtorManageCnt = []
		var regionOfRealtorBarColor = ['#C68D80','#8890D7','#FFC380','#FF6767','#FFABAB','#4281A7','#92C53E','#FFCD1E']
		//var regionOfRealtorBorderColor = []
	
		<c:forEach items="${salesByRegionList}" var="data">				
			regionOfRealtorManage.push("${data.sr_addr}");
			regionOfRealtorManageCnt.push("${data.sale_mount}");
			
			/* 
			var getRandom = getRandomRgb();
			regionOfRealtorBarColor.push(getRandom + ',' + 0.2 + ')');
			//regionOfRealtorBorderColor.push(getRandom + ',' + 1 + ')') 
			*/
		</c:forEach>
		
	    var ctx2 = document.getElementById('myDoughnutChart').getContext('2d');
	    var myDoughnutChart = new Chart( ctx2, {
	        type: 'doughnut',
	        data: {
				labels: regionOfRealtorManage ,
			    datasets: [{
				    label: "",
				    backgroundColor: regionOfRealtorBarColor ,
			        data: regionOfRealtorManageCnt	        
			    }]
			},
	        options: {
	        	/* 
	        	maintainAspectRatio: true,
                responsive: false, 
                */
	        	title: {
					display:true,
					text: '${realtorMenuInfoDTO.r_name} 공인중개사님 관할 지역구 내 "동" 별 판매량',
					fontSize:20,
	                fontStyle:'bold'
		        	},
	        	 legend: {
			            labels: {
			                fontSize:20,
			                fontStyle:'bold'
			            }
			       }
		    }
	    });
		
	});


	function goProductContent(sr_no){
		if(confirm(" \"매물 상세 페이지로 이동합니다.\"\n 상세페이지에서 공실목록 버튼을 누르시면 더 많은 매칭대기중인 매물을 확인 할 수 있습니다.")==false){return;}
  		location.replace("${ctRealtorRoot}/productContent.do?sr_no="+sr_no);
  	}
   
</script>
	<script>
		
	   
	   
	</script>
</head>



 <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
    <!-- Header -->
		<div class="site-section-cover overlay" style="background-image: url('/javaBang/resources/images/boodong.png')">
			<div class="container">
				<div class="row align-items-center justify-content-center text-center" style="height:200px;margin-left:70;">
					<div class="col-md-10" style="margin-left: 300;">
						<h3 class="mb-1" style="padding: 15px;font-weight: bold;text-align: center;background-color: #ffffff;opacity: 0.9;width: 400;">자바방프로공인중개사</h3>
					</div>
				</div>
			</div>
		</div>
   <%@include file="/WEB-INF/views/realtor/incloudfile/proLeftMenu.jsp" %>
   <div style="border: 1px solid white; float: left; width: 15%;">
      첫번째 영역
   </div>
   <div style="border: 1px solid white; float: left; width: 80%;"><center>
   <br>
      <div class="col-md-12">
		<div class="card">
		    <div class="card-header">
		        <strong class="card-title" style="font-size:20pt;"> 새로 등록된  매물<font color="boldskyblue" > ${realtorSaleRoomAllCnt}</font> 개 중 <font color="boldskyblue">최신 매물</font> 5개 </strong>
		    </div>
		    <div class="card-body">
						<table id="bootstrap-data-table" class="table table-striped " style="font-size: x-large;" >
							<thead>
								<tr style="text-align: center;">
									<th>번호</th><th >매물번호</th><th >매물정보</th><th >등록일</th><th>진행상황</th><th>자세히보기</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${realtorSaleRoomList}" var="saleRoom" varStatus="loopTagStatus">
									<tr style="text-align: center;">
										<td  style="padding-top: 25;">${saleRoom.RNUM}</td>
										<td  style="padding-top: 25;">${saleRoom.sr_no}</td>
										<td style="text-align:left;"><p style="line-height:10%";> <!-- 탭과 공실정보(룸타입) 사이간격 -->
										<br>	
												<c:if test="${saleRoom.roomtype_code == 1}">
													<font size="5" color="boldskyblue" ><b>원룸</b></font>
												</c:if>
												<c:if test="${saleRoom.roomtype_code == 2}">
													<font size="5" color="boldskyblue" ><b>투룸</b></font>
												</c:if>
												<c:if test="${saleRoom.roomtype_code ==3}">
													<font size="5" color="boldskyblue" ><b>오피스텔</b></font>
												</c:if>
												<c:if test="${saleRoom.sell_type_code==3}">
													<font size="4" color="black"><b>월세${saleRoom.monthly_rent}만원/보증금${saleRoom.deposit}만원</b></font>
												</c:if>
												<c:if test="${saleRoom.sell_type_code==2}">
													<font size="4" color="black"><b>전세${saleRoom.price_jeonse}만원</b></font>
												</c:if>
												<c:if test="${saleRoom.sell_type_code==1}">
													<font size="4" color="black"><b>매매${saleRoom.price_sale}만원</b></font>
												</c:if><br>
											</p>
											<p style="line-height:60%"><font size="5" color="gray" >${saleRoom.sr_addr} <br> <br> ${saleRoom.sr_detail_addr}</font></p>
										</td>
										
										<td style="padding-top: 25;font-size:16pt">${saleRoom.sr_date}</td>
										<td>
										<div class="progress" style="height:80;">
											  <%-- <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="20"
											  aria-valuemin="0" aria-valuemax="5" style="height: 50;;width:${saleRoom.check_code};color:currentColor;background-color:#b1d2ab;">
											   &nbsp;&nbsp; ${saleRoom.check_code}
											  </div> --%>
											  <c:if test="${saleRoom.check_code == 1}" >
											  <div  style="font-size:11pt">
													<font color="darkred" style="line-height:2; margin-left: 20; font-size:17pt;" ><b>공인중개사 매칭대기 중</b></font>
													<br>
													 &nbsp;&nbsp;&nbsp;&nbsp;> 소유자 확인중 > 공실광고중 > 계약완료 > 판매완료
													</div>									  
											  </c:if>
										   
										</div>
										</td>
										<td>
											<div>
											  	<%-- <a class="btn btn-primary" onClick="goProductContent(${saleRoom.sr_no});">매물보러가기</a> --%>
											  	<input type=button value="매물보러가기" class="btn btn-success btn-sm" onClick="goProductContent( ${saleRoom.sr_no} );" style="font-size:15pt;">
											  	<%-- <input type=button value="매물보러가기" class="btn btn-success btn-sm" onClick="goProductContent(${saleRoom.sr_no})"> --%>
											</div>
										</td>
										
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
      <!-- <table class="boardTable tbcss2" border=0 cellspacing=0 cellpadding=5 width=700>
         <tr bgcolor="lightgray"><th>번호<th>매물타입(원룸,투룸,오피스텔)<th>주소(ex.서울 논현동)<th>등록일<th>조회수
      </table> -->
      <!-- </center> -->
   </div>
   <div style="border: 1px solid white; float: left; width: 5%;">

   </div>
   <div style="border: 1px solid white; float: left; width: 15.5%;">
      첫번째 영역
   </div>
   <div style="border: 1px solid white; float: left; width: 40%;margin-top:5%;"><center>
	   <c:if test="${!empty rateOfSalesList}">
	   	<div style="margin-left:5%;">
	     <canvas id="myChart" width="300" height="200"></canvas>
	     </div>
	   </c:if>
	   <c:if test="${empty rateOfSalesList}">
         <table style="margin-top:30%;" ></table>
           <div style="margin-left:25%;">
           <b> 현재까지 판매하신 매물이 존재 하지 않습니다. </b>
           </div>
      </c:if>
   </div></center>
   <div style="border: 1px solid white; float: left; width: 40%;margin-top:5%;">
         <c:if test="${!empty salesByRegionList}">
         	<div style="margin-left:5%;">
         		<canvas id="myDoughnutChart" width="300" height="200"></canvas>
         	</div>
      	 </c:if>
      <c:if test="${empty salesByRegionList}">
          <!-- <canvas id="myDoughnutChart" width="300" height="200"></canvas> -->
         <table style="margin-top:30%;" ></table>
           <div style="margin-left:25%;">
           <b>공인중개사 관할 지역에 해당하는 판매된 매물이 존재 하지 않습니다.</b>
           </div>
      </c:if>
      </div>
    <!-- 
    <div class="site-wrap" id="home-section">
       <div class="site-section">
         <div class="container">
           <div class="row">
               <div style="margin:100px;">
               실적 그래프 올릴 장소
            </div>
            
            
         
               </div>
             </div>
             <div>
             </div>
           </div>
         </div> 
        -->



  
  
  <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
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
    <script src="/javaBang/resources/assets/js/lib/data-table/buttons.colVis.min.js"></script>
<!--     <script src="/javaBang/resources/assets/js/init/datatables-init.js"></script> -->


    <script type="text/javascript">
        $(document).ready(function() {
          $('#bootstrap-data-table-export').DataTable();
      } );
  </script>
  

  <div style="margin-top:100%;">
  <%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp" %>
  </div>
</html>











