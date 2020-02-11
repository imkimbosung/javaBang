<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- ------------------------------------------------------------------------------------ -->
<%@include file="/WEB-INF/views/common.jsp" %>
<style>
/* * {padding:0;margin:0;} 
.center {position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);} */
label input[type="checkbox"] {display:none;}
label input[type="checkbox"] + em {display:inline-block;width:50px;height:51px;margin-right:5px;background:url(${ctRoot}/resources/images/bg_nomalbox.png) 0 0 no-repeat;vertical-align:middle;}
label input[type="checkbox"]:checked + em {background:url(${ctRoot}/resources/images/bg_likebox.png);}
.roomSim{display:inline-block;vertical-align:top;width:30%;}
.goRoomSim{display:block;width:auto;text-decoration:none;margin:0px;}
ul > li > a .roomscreen {position:relative;overflow:hidden;}
ul > li > a .roomscreen .middle{position:absolute;bottom:150%;left:30px;z-index:2;color:#fff;font-size:15px;font-weight:600;transition:all .35s;}
ul > li > a .roomscreen .like{position:absolute;top:150%;left:30px;z-index:2;color:#fff;transition:all .35s;opacity:0.6;}
ul > li > a .roomscreen img{width:100%;}
ul > li > a:hover .middle{bottom:52%;}
ul > li > a:hover .like{top:52%;}

	
</style>

<script>
	$(document).ready
	(
		function()
		{
			
			
			/*찜하기기능*/
			<c:forEach items="${likeroomList}" var="like">
			$('[name=sr_no]').filter("[value=${like.sr_no}]").prop("checked",true);
			</c:forEach>
			$('[name=sr_no]').click
			(
				function()
				{
					var sr_no=$(this).val();
					$(".likeDel").val(sr_no);
					if($('.sr_no').is(":checked"))
					{
						var sr_no=$(this).val();
						$(".like").val(sr_no);
					$.ajax
					({
						url:"${ctBuyerRoot}/buyer_likeProc.do"
						,type:"post"
						,data:$('[name=buyer_like]').serialize()
						,success : function(likecnt)
						{
							if(likecnt==1)
							{
								
							}
							else if(likecnt==-2)
							{
								$.ajax
								({
									url:"${ctBuyerRoot}/buyer_likeDelProc.do"
									,type:"post"
									,data:$('[name=buyer_likeDel]').serialize()
									,success : function(likedelcnt)
									{
										if(likedelcnt==1)
										{
											
										}
										else{alert("삭제실패");}
									}

									,error : function()
									{
										alert("서버통신삭제실패");
									}
								});
							}
							else
							{
								if(confirm("로그인 하셔야 이용가능합니다 로그인하시겠습니까?")==false){$('[name=sr_no]').prop("checked",false);}
								else{location.replace("${ctBuyerRoot}/loginForm.do");} 
							}
						}

						,error : function()
						{
							if(confirm("로그인 하셔야 이용가능합니다 로그인하시겠습니까?")==false){$('[name=sr_no]').prop("checked",false);}
							else{location.replace("${ctBuyerRoot}/loginForm.do");}
						}
					});}
					else
					{
						var sr_no=$(this).val();
						$(".likeDel").val(sr_no);
					$.ajax
					({
						url:"${ctBuyerRoot}/buyer_likeDelProc.do"
						,type:"post"
						,data:$('[name=buyer_likeDel]').serialize()
						,success : function(likedelcnt)
						{
							if(likedelcnt==1)
							{
								
							}
							else{alert("삭제실패");}
						}

						,error : function()
						{
							alert("서버통신삭제2실패");
						}
					});}
				}
			);
		}
	);
	
	/*상세페이지로 새창이동*/
	function goSearchContantForm(sr_no)
	{
		var openNewWindow = window.open("about:blank");

		//document.SearchContantForm.submit();
		openNewWindow.location.href='${ctBuyerRoot}/roomConForm.do?sr_no='+sr_no
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<form name=buyer_likeDel action=${ctBuyerRoot}/buyer_likeDelProc.do>
	<input type=hidden name=b_no value="${b_no}">
	<input type=hidden name=sr_no class="likeDel">
	</form>
	<div style="overflow:auto;width:48%;height:500px;float:left;padding-left:2%;">
	<form name=buyer_like action=${ctBuyerRoot}/buyer_likeProc.do>
	<input type=hidden name=b_no value="${b_no}">
	<input type=hidden name=sr_no class="like">
	</form>
		<!-- ------------------------------------------------------------------------------------ -->
		
		<ul>
		<c:if test="${roomList.size()==0}">
		<center>
					<h3>검색결과없음</h3>
		<center>
					</c:if>
		
		<c:forEach items="${roomList}" var="room" varStatus="loopTagStatus">
					
					<li class=roomSim>
						<a href=javascript:goSearchContantForm(${room.sr_no}) class=goRoomSim>
							<div class=roomscreen>
														
							<div class="like">
								<label>
									<input type="checkbox" class="sr_no" name=sr_no value="${room.sr_no}">
									<em></em>
								</label>
							</div>
							<img src='${ctImageRoot}/${room.sellroom_image}' width='100%' border='1'height='200'>
					
							</div>
							<div>
								<table>
									<tr>
										<td style="font-size:${roomtypefont}">${room.roomtype}(${room.sr_roomsize}평) ${room.floor}층
									
									<tr>
										<td style="font-size:${roompricefont}">
											<c:if test="${room.sell_type=='월세'}">
											${room.sell_type}&nbsp;${room.deposit}/${room.monthly_rent}
											</c:if>
											<c:if test="${room.sell_type=='전세'}">
											${room.sell_type}&nbsp;${room.jeonse_price}
											</c:if>
											<c:if test="${room.sell_type=='매매'}">
											${room.sell_type}&nbsp;${room.sale_price}
											</c:if>
											
								</table>
					 			
								
							</div>
						</a>
					</li>
				
		</c:forEach>
		</ul>
		<!-- ------------------------------------------------------------------------------------ -->
	</div>
		
	<div id="map" style="width:48%;height:500px;float:left;padding-right:2%;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=070c6cc88e915ecf5709587531f200a4&libraries=services,clusterer"></script>
	<script>
		/* var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
		center: new kakao.maps.LatLng(37.478690, 126.87869), // 지도의 중심좌표
		level: 8 // 지도의 확대 레벨
		}; */  
		
		var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
	        center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
	        level : 8 // 지도의 확대 레벨 
	    });
		 var clusterer = new kakao.maps.MarkerClusterer({
		        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
		        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
		        minLevel: 2 // 클러스터 할 최소 지도 레벨 
		    });
		// 지도를 생성합니다    
		//var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var markers=[];
		// 주소로 좌표를 검색합니다
		<c:forEach items="${roomList}" var="room2" varStatus="loopTagStatus">
		geocoder.addressSearch('${room2.sr_addr}', function(result, status) {

		// 정상적으로 검색이 완료됐으면 
		if (status == kakao.maps.services.Status.OK) {

		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
			
		// 결과값으로 받은 위치를 마커로 표시합니다
		var marker = new kakao.maps.Marker({
		position: coords
		});
		
		// marker.setMap(map);
		markers.push(marker);
		clusterer.addMarkers(markers);
		<c:if test="${loopTagStatus.count==1}">
		map.setCenter(coords);
		</c:if>
		} 
		});
	
		</c:forEach>
		
		
</script>
<div style=float:left;width:100%><%@include file="/WEB-INF/views/buyer/incloudfile/bottomBar.jsp"%></div>
	

</body>
</html>