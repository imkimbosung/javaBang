<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/views/common.jsp"%>
<%@include file="/WEB-INF/views/realtor/incloudfile/topBar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인중개사 마이페이지</title>

<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ctRoot}/resources/rentList/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="author" content="colorlib.com">
	
    <link href="${ctRoot}/resources/selectbox/css/main.css" rel="stylesheet" />
    
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://code.jquery.com/jquery.min.js"></script>


<script>

	$(document).ready(function(){
	
			$('[name=rowCntPerPage]').change(function(){
				goSearch();
			});
			
			
			 $(".pagingNumber").html(
						getPagingNumber(
							"${roomListAllCnt}"
							,"${sellroomSearchDTO.selectPageNo}"
							,"${sellroomSearchDTO.rowCntPerPage}"
							,"15"
							,"goSearch();"
						)
				); 
			


				inputData( "[name=selectPageNo]","${sellroomSearchDTO.selectPageNo}");
				inputData( "[name=rowCntPerPage]","${sellroomSearchDTO.rowCntPerPage}");
				inputData( "[name=keyword]","${sellroomSearchDTO.keyword}");

				<c:forEach items="${sellroomSearchDTO.date}" var="date">
					inputData( "[name=date]","${date}");
				</c:forEach>
				<c:forEach items="${sellroomSearchDTO.readcnt}" var="readcnt">
					inputData( "[name=readcnt]","${readcnt}");
				</c:forEach>
			
		
		});
	
	
	

	function goSearch(){
			
			/* alert($("[name=sr_addr]").val()); */
			/* alert($("[name=keyword]").val()); */
			
			
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
	
	
	function goBoardContentForm(sr_no){
		
		/* var str = "sr_no="+sr_no+"&"+$("[name=managementHouse]").serialize();
		location.replace("${ctRoot}/likeRoomContent.do?"+str); 
		
		 */
		//우선 테스트
		//location.replace("${ctBuyerRoot}/likeRoomContent.do"); 
		
	}
	
	
	function goCheck(sr_no){

		$("[name=sr_no]").val(sr_no);
		//alert($("[name=sr_no]").val())
		//alert($('[name=managementHouseProc]').serialize())
		 if(confirm("이 매물을 확인 하시겠습니까?")==false){return;}
		
		
		$.ajax({
			url:"${ctRealtorRoot}/managementHouseProc.do"
			,type:"post"
			,data:$('[name=managementHouseProc]').serialize()
			,success:function(checkCnt){
				alert(checkCnt);
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
    
    
    
     <div class="ftco-blocks-cover-1">
      <div class="site-section-cover overlay" data-stellar-background-ratio="0.5" style="background-image: url('${ctRoot}/resources/images/boodong.png')">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-10">
              <h1 class="mb-2">공인중개사 마이페이지</h1>
              <p class="text-white">잡아방은 여러분들의 최고의 파트너입니다!</p>
            </div>
          </div>
        </div>
      </div>
    </div>
	<%@include file="/WEB-INF/views/realtor/incloudfile/proLeftMenu.jsp" %>



	 <div class="site-wrap" id="home-section">

	    <div class="site-section">
	      <div class="container">
	      	<div id="root">
		<h1 class="mt-4 mb-3">JAVABANG
     	 <small>공인중개사</small>
    	</h1>


	    <ol class="breadcrumb">
	      <li class="breadcrumb-item active"><b>내가올린 부동산 검색</b></li>
	    </ol>	
					</div>
	            </div>
	          </div>
	          <div class="col-md-4 sidebar">
	          </div>
	        </div>



			<form class="managementHouse" name="managementHouse" action="${ctRealtorRoot}/managementHouse.do">
	            <center><div style = "width:800">
						 <center> 
						 [매물 지역] : 
						 <select name ="sr_addr">
							<option value="">--시/도선택--</option>
							<option value="서울">서울<option value="부산">부산<option value="대구">대<option value="인천">인천<option value="광주">광주<option value="대전">대전<option value="울산">울산<option value="세종">세종
							<option value="경기">경기<option value="강원">강원<option value="충북">충북<option value="충남">충남<option value="전북">전북<option value="전남">전남<option value="경북">경북<option value="경남">경남
							<option value="제주">제주
						</select>	
							
							
						[키워드] : <input type="text" name="keyword" class="keyword" >   &nbsp;&nbsp;&nbsp;
							
						<input type="button" style="width:50pt; height:20pt" value="검색" class="contactSearch" onClick="goSearch();">
						<input type="button" style="width:80pt; height:20pt" value="모두검색" onClick="goSearchAll();"> &nbsp;&nbsp;
						
						<input type = "hidden" name="selectPageNo" >
						<input type="hidden" name="r_no" class="r_no" value="${realtorDTO.r_no}">
				</div>

			<table border=0 width=930>
	        	<tr>
	        		<td align=right>
	        		[총 개수] : ${roomListAllCnt}&nbsp; 개
		        		
		        		<select name = "rowCntPerPage">
							<option value="1">1
							<option value="15">15
							<option value="20">20
							<option value="25">25
							<option value="30">30
						</select>행보기
				</table>
		
			</form>
			
   			<!-- -------------------------------------------------------------------------------------------------------------------------- -->
   			<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div> 
			<table><tr height=10><td></table>
			<!-- -------------------------------------------------------------------------------------------------------------------------- -->
			<!-- -------------------------------------------------------------------------------------------------------------------------- -->
			
			
			<form class="managementHouseProc" name="managementHouseProc" method="post" action="${ctRealtorRoot}/managementHouseProc.do">
			
	        <table class="boardTabletbcss2" border=1 bordercolor=gray cellspacing=0 cellpadding=10  align=center width=1100>
	        	<input type="hidden" name="sr_no" class="sr_no">
	        	<tr bgcolor="gray" align=center width=200><th>번호<th>판매자<th>층<th>방크기<th>지역<th>상세지역<th>등록일<th>판매버튼
	        	
	        	
	        	<c:forEach items="${roomList}" var="room" varStatus="loopTagStatus">
	        		<tr style="cursor:pointer" onClick="goBoardContentForm(${room.sr_no});">	
	        			
		        		<td align=center>
							${roomListAllCnt
							-
							(sellroomSearchDTO.selectPageNo*sellroomSearchDTO.rowCntPerPage-sellroomSearchDTO.rowCntPerPage+1+loopTagStatus.index)
							+1}
					
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
		        			${room.as_date}
		        			
		        			
		        		<td align=center>
		        		
							<c:if test="${room.check_code == 4}">
 				 				 <input type=button value="판매자 확인중" class="btn btn-outline-danger" onClick="";> 
 				 				 
  							</c:if>
							<c:if test="${room.check_code < 4}">
 				 				<input type=button value="확인" class="btn btn-outline-danger" onClick="goCheck(${room.sr_no});"> 
  							</c:if>
  							
  							<c:if test="${room.check_code == 5}">
 				 				<input type=button value="확인 완료" class="btn btn-outline-danger" onClick="";> 
  							</c:if>
				</form>
			
			</c:forEach>







						<!-- =====================================그래프===================================== -->

	        			 <script type="text/javascript">
						        google.charts.load('current', {'packages':['corechart']}); 
						        google.charts.setOnLoadCallback(drawChart);
						        
						        function drawChart() {
						        	
						        	
						            var data = new google.visualization.DataTable();
						            data.addColumn('string','방 크기');
						            data.addColumn('number','비중');
						 
						            data.addRows([ 
						                ['13 이하',${smallRoomCnt}3],			/* ${masterBuyerListDTO.adFalseCnt} */
						                ['20 이하',${roomListAllCnt}],
						                ['20 초과',10]
						           
						            ]);
						            var opt = {
						                    'title':'방크기별',
						                    'width':500,
						                    'height':500,
						                    pieSliceText:'label',
						                    legend:'none' 
						            };
						            var chart = new google.visualization.PieChart(document.getElementById('myChart'));
						            chart.draw(data,opt);
						        }
					 
					       </script>
					       
					       
					       
					       
					       
						       <script>
								  var chartDrowFun = {
								    chartDrow : function(){
								        var chartData = '';
								        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
								        var chartDateformat     = 'yyyy년MM월dd일';
								        //라인차트의 라인 수
								        var chartLineCount    = 5;
								        //컨트롤러 바 차트의 라인 수
								        var controlLineCount    = 5;
								 
								        function drawDashboard() {
								 
								          var data = new google.visualization.DataTable();
								          //그래프에 표시할 컬럼 추가
								          data.addColumn('datetime' , '날짜');
								         /*  data.addColumn('number'   , '남성');
								          data.addColumn('number'   , '여성'); */
								          data.addColumn('number'   , '전체');
								
								          //그래프에 표시할 데이터
								          var dataRow = [];
							
								          for(var i = 0; i <= 29; i++){ //랜덤 데이터 생성
								            var total   = Math.floor(Math.random() * 300) + 1;
								           /*  var man     = Math.floor(Math.random() * total) + 1;
								            var woman   = total - man; */
								 
								            dataRow = [new Date('2017', '09', i , '10'),/*  man, woman , */ total];
								            data.addRow(dataRow);
								          }
								            var chart = new google.visualization.ChartWrapper({
								              chartType   : 'LineChart',
								              containerId : 'lineChartArea', //라인 차트 생성할 영역
								              options     : {
								                              isStacked   : 'percent',
								                              focusTarget : 'category',
								                              height          : 500,
								                              width              : '100%',
								                              legend          : { position: "top", textStyle: {fontSize: 13}},
								                              pointSize        : 5,
								                              tooltip          : {textStyle : {fontSize:12}, showColorCode : true,trigger: 'both'},
								                              hAxis              : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
								                                                                  years : {format: ['yyyy년']},
								                                                                  months: {format: ['MM월']},
								                                                                  days  : {format: ['dd일']},
								                                                                  hours : {format: ['HH시']}}
								                                                                },textStyle: {fontSize:12}},
								                vAxis              : {minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}},
								                animation        : {startup: true,duration: 1000,easing: 'in' },
								                annotations    : {pattern: chartDateformat,
								                                textStyle: {
								                                fontSize: 15,
								                                bold: true,
								                                italic: true,
								                                color: '#871b47',
								                                auraColor: '#d799ae',
								                                opacity: 0.8,
								                                pattern: chartDateformat
								                              }
								                            }
								              }
								            });
								 
								            var control = new google.visualization.ControlWrapper({
								              controlType: 'ChartRangeFilter',
								              containerId: 'controlsArea',  //control bar를 생성할 영역
								              options: {
								                  ui:{
								                        chartType: 'LineChart',
								                        chartOptions: {
								                        chartArea: {'width': '60%','height' : 80},
								                          hAxis: {'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize:12},
								                            gridlines:{count:controlLineCount,units: {
								                                  years : {format: ['yyyy년']},
								                                  months: {format: ['MM월']},
								                                  days  : {format: ['dd일']},
								                                  hours : {format: ['HH시']}}
								                            }}
								                        }
								                  },
								                    filterColumnIndex: 0
								                }
								            });
								 
								            var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
								            date_formatter.format(data, 0);
								 
								            var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
								            window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
								            dashboard.bind([control], [chart]);
								            dashboard.draw(data);
								 
								        }
								          google.charts.setOnLoadCallback(drawDashboard);
								 
								      }
								    }
								 
								$(document).ready(function(){
								  google.charts.load('current', {'packages':['line','controls']});
								  chartDrowFun.chartDrow(); //chartDrow() 실행
								});
								  </script>

        
	        		
			
				
				
				
	        
	        </table> <br><br><br><br><br>
			<c:if test="${empty roomList}">
				검색결과가 없음.
			</c:if>
	        
	       	<div id="myChart"></div>
	       	
	       	
	      <div id="Line_Controls_Chart">
	          <div id="lineChartArea" style="padding:0px 20px 0px 0px;"></div>
	          <div id="controlsArea" style="padding:0px 20px 0px 0px;"></div>
         </div>
 
	         <br><br> <br><br> <br><br> <br><br> <br><br><br><br>




</body>
  <%@include file="/WEB-INF/views/realtor/incloudfile/bottomBar.jsp" %>
</html>






