<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- ------------------------------------------------------------------------------------ -->
<%@include file="/WEB-INF/views/common.jsp" %>

<title>Insert title here</title>
</head>
<body>
	
	
	<!-- ==================================================================================================== -->

	<div id="map" style="width:700px;height:800px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=070c6cc88e915ecf5709587531f200a4&libraries=services"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=070c6cc88e915ecf5709587531f200a4"></script>
	
	<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.478690, 126.87869), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('가산동', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status == kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

   

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
	
</table>

	

</body>
</html>