<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="/WEB-INF/views/common.jsp"%>
     <%@include file="/WEB-INF/views/loading.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <!-- <link rel="stylesheet" href="/javaBang/resources/assets/css/cs-skin-elastic.css"> -->
   <!--  <link rel="stylesheet" href="/javaBang/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css"> -->
    <!-- <link rel="stylesheet" href="/javaBang/resources/assets/css/style.css"> -->
   <!--  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <!-- 예쁜셀렉트박스 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="author" content="colorlib.com">
	
    <link href="${ctRoot}/resources/selectbox/css/main.css" rel="stylesheet" />
	<link href="${ctRoot}/resources/card_roomconform/card.css" rel="stylesheet" />
<!-- <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> -->
  <script type="text/javascript">
  var randomcolor=new Array("#C68D80","#1B5025","#8890D7","#FFC380","#FF6767","#DADEF6","#FF8847","#FFABAB","#21A4F3","#4281A7","#2F6276","#92C53E","#FFCD1E","#C14644","#C17D70","#AE5D5D","#66CC9B","#C85B5B","#85CED6","#CE71D0")
  <c:forEach items="${product}" var="productList2" varStatus="loopTagStatus">
	var color${loopTagStatus.count}=randomcolor[${loopTagStatus.count}]
	 </c:forEach>
	 
  $(document).ready
  (
  	function()
	{
		$("[name=year]").change(function()
				{
			$.ajax({
				url : "/javaBang/rental/rentalPieChartProc.do"
				,
				type : "post"
				,
				data :$("[name=goyear]").serialize()
				,
				success : function(data) {

					
					$("#piechart").remove();   //  태그 삭제
					
					$("#two_chart").html($("<canvas id='piechart' style='width: 80%;height: 400px;display: block;MARGIN-LEFT: 300;' width='1750' height='400'></canvas>"));  // 태그 다시 생성
					//for(var i=0;i<=data.air.length;i++){test.push(data.air[i].rental_product)}
					charts2(data);
				}
				,
				error : function(request,status,error) {
					 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					alert("서버 접속 실패");
				}
	
			})
			$.ajax({
				url : "/javaBang/rental/rentalChartProc.do"			
				,
				type : "post"
				,
				data :$("[name=goyear]").serialize()
				,
				success : function(data) {

					<c:forEach items="${product}" var="productList2" varStatus="loopTagStatus">
					$("#chart${loopTagStatus.count}").remove();   //  태그 삭제
					<c:if test="${loopTagStatus.count==1}">
					$("#one_chart").after($("<canvas id='chart${loopTagStatus.count}' style='width: 80%;height: 400px;display: block;MARGIN-LEFT: 300;' width='1728' height='400'></canvas>")); 
					</c:if>
					
					<c:if test="${loopTagStatus.count!=1}">
					$("#chart${loopTagStatus.index}").after($("<canvas id='chart${loopTagStatus.count}' style='width: 80%;height: 400px;display: block;MARGIN-LEFT: 300;' width='1728' height='400'></canvas>"));  // 태그 다시 생성
					</c:if>
					</c:forEach >
					charts(data.productList);
				}
				,
				error : function(request,status,error) {
					 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					alert("서버 접속 실패");
				}
	
			})}
		);
		$('[name=year]').val("${rentalChartsDTO.year}");
		
		charts3(${jsonObject});
		charts4(${jsonObjectcnt});
	})
	
	function charts3(air){
	  <c:forEach items="${product}" var="productList3" varStatus="loopTagStatus">
		var ctx = document.getElementById("chart${loopTagStatus.count}");
		var myChart = new Chart(ctx,
				{
					type : 'line',
					data : 
					{
						labels : [ "1월", "2월", "3월","4월", "5월","6월", "7월", "8월","9월","10월","11월","12월" ],
						datasets : [
							
							{
								label : "${productList3.rental_product}",
								//borderColor : "rgba(245, 23, 66, 0.9)",
								borderWidth : "3",
								backgroundColor :
								[
									color${loopTagStatus.count},color${loopTagStatus.count},color${loopTagStatus.count},
									color${loopTagStatus.count},color${loopTagStatus.count},color${loopTagStatus.count},
									color${loopTagStatus.count},color${loopTagStatus.count},color${loopTagStatus.count},
									color${loopTagStatus.count},color${loopTagStatus.count},color${loopTagStatus.count}
								],
								borderColor:
									[
										color${loopTagStatus.count}
									], 
								pointHighlightStroke : "rgba(245, 23, 66,.5)",
								fill: false,
								data : [
								air.productList[${loopTagStatus.index}].jan,
								air.productList[${loopTagStatus.index}].feb,
								air.productList[${loopTagStatus.index}].mar,
								air.productList[${loopTagStatus.index}].apr,
								air.productList[${loopTagStatus.index}].may,
								air.productList[${loopTagStatus.index}].jun,
								air.productList[${loopTagStatus.index}].jul,
								air.productList[${loopTagStatus.index}].aug,
								air.productList[${loopTagStatus.index}].sep,
								air.productList[${loopTagStatus.index}].oct,
								air.productList[${loopTagStatus.index}].nov,
								air.productList[${loopTagStatus.index}].dec]
							},
							 
						]
					},
					options: 
					{
						maintainAspectRatio: true,
						responsive: false,
						scales: {
					        xAxes: [{
					            ticks: {
					                fontSize: 25,
					                fontStyle:'bold'
					            }
					        }],
					        yAxes: [{
					            ticks: {
					                fontSize: 25,
					                fontStyle:'bold'
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
				}); </c:forEach>
  }
  
 
	function charts(air){
		 <c:forEach items="${product}" var="productList3" varStatus="loopTagStatus">
		var ctx = document.getElementById("chart${loopTagStatus.count}");
		var myChart = new Chart(ctx,
				{
					type : 'line',
					data : 
					{
						labels : [ "1월", "2월", "3월","4월", "5월","6월", "7월", "8월","9월","10월","11월","12월" ],
						datasets : [
							 
							{
								label : "${productList3.rental_product}",
								//borderColor : "rgba(245, 23, 66, 0.9)",
								borderWidth : "3",
								 backgroundColor :
								[
									 color${loopTagStatus.count},color${loopTagStatus.count},color${loopTagStatus.count},
									color${loopTagStatus.count},color${loopTagStatus.count},color${loopTagStatus.count},
									color${loopTagStatus.count},color${loopTagStatus.count},color${loopTagStatus.count},
									color${loopTagStatus.count},color${loopTagStatus.count},color${loopTagStatus.count} 
								], 
								borderColor:
									[
										 color${loopTagStatus.count}
									], 
								pointHighlightStroke : "rgba(245, 23, 66,.5)",
								fill: false,
								data : [
								air[${loopTagStatus.index}].jan,
								air[${loopTagStatus.index}].feb,
								air[${loopTagStatus.index}].mar,
								air[${loopTagStatus.index}].apr,
								air[${loopTagStatus.index}].may,
								air[${loopTagStatus.index}].jun,
								air[${loopTagStatus.index}].jul,
								air[${loopTagStatus.index}].aug,
								air[${loopTagStatus.index}].sep,
								air[${loopTagStatus.index}].oct,
								air[${loopTagStatus.index}].nov,
								air[${loopTagStatus.index}].dec]
							},
							
						]
					},
					options: 
					{
						maintainAspectRatio: true,
					 	responsive: false,
						scales: {
					        xAxes: [{
					            ticks: {
					                fontSize: 25,
					                fontStyle:'bold'
					            }
					        }],
					        yAxes: [{
					            ticks: {
					                fontSize: 25,
					                fontStyle:'bold'
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
				}); </c:forEach>
  }
	
  function charts2(bardata){
	var data=[
		<c:forEach items="${product}" var="productList2" varStatus="loopTagStatus">
		bardata.air[${loopTagStatus.index}].rental_product,
		</c:forEach>
		]
		var ctx = document.getElementById("piechart");
		var myChart = new Chart(ctx,
				{
					type : 'bar',
					data : 
					{
						labels : [ 
							 <c:forEach items="${product}" var="productList2" varStatus="loopTagStatus">
							 "${productList2.rental_product}",
							 </c:forEach>
							 ],
						datasets : [
							
							{
								
								label : "통합",
								//borderColor : "rgba(245, 23, 66, 0.9)",
								borderWidth : "1",
								backgroundColor : 
									[
										<c:forEach items="${product}" var="productList2" varStatus="loopTagStatus">
										color${loopTagStatus.count},
										</c:forEach>
									],
								pointHighlightStroke : "rgba(245, 23, 66,.5)",
								data : data
							}
						]
					},
					options: 
					{
						maintainAspectRatio: true,
						responsive: false,
						scales: {
					        xAxes: [{
					            ticks: {
					                fontSize: 20,
					                fontStyle:'bold'
					            }
					        }],
					        yAxes: [{
					            ticks: {
					                fontSize: 25,
					                fontStyle:'bold'
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
  }
  
  function charts4(bardata){
		var data=[
			<c:forEach items="${product}" var="productList2" varStatus="loopTagStatus">
			bardata.air[${loopTagStatus.index}].rental_product,
			</c:forEach>
			]
			var ctx = document.getElementById("piechart");
			var myChart = new Chart(ctx,
					{
						type : 'bar',
						data : 
						{
							labels : [ 
								 <c:forEach items="${product}" var="productList2" varStatus="loopTagStatus">
								 "${productList2.rental_product}",
								 </c:forEach>
								 ],
							datasets : [
								
								{
									
									label : "통합",
									//borderColor : "rgba(245, 23, 66, 0.9)",
									borderWidth : "1",
									backgroundColor : 
										[
											<c:forEach items="${product}" var="productList2" varStatus="loopTagStatus">
											color${loopTagStatus.count},
											</c:forEach>
										],
									pointHighlightStroke : "rgba(245, 23, 66,.5)",
									data : data
								}
							]
						},
						options: 
						{
							maintainAspectRatio: true,
							responsive: false,
							scales: {
						        xAxes: [{
						            ticks: {
						                fontSize: 20,
						                fontStyle:'bold'
						            }
						        }],
						        yAxes: [{
						            ticks: {
						                fontSize: 25,
						                fontStyle:'bold'
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
	  }
    </script>

<meta charset="UTF-8">
<title>JAVABANG</title>
</head>
<body>
<%@include file="/WEB-INF/views/rental/incloudfile/rentalLeftMenu.jsp" %>
<center>



<div class="container" >
<div style="margin:0 auto;position:fixed;background-color:white;"width=50px>
	 <form name=goyear action="${ctRentalRoot}/rentalcharts.do">
	<select name=year>
		<option value=2019>2019
		<option value=2020>2020
	</select>
	</form>
	</div>
</div>
 <div id=one_chart>
  <c:forEach items="${product}" var="productList2" varStatus="loopTagStatus">
	 <canvas id="chart${loopTagStatus.count}" style="width: 80%;height: 400px;display: block;MARGIN-LEFT: 300;" width="1728" height="400"></canvas>
	 </c:forEach>
</div>
<div id=two_chart>
  <canvas id="piechart" style="width: 80%;height: 400px;display: block;MARGIN-LEFT: 300;" width="1728" height="400"></canvas>
</div>
	</center>
</body>
</html>