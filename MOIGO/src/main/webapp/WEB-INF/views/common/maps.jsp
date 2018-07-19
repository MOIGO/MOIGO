<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=957e8ab378d0238256ca0d11fe001e7a"></script>	
<title>연락처 및 지도</title>
<style>
/* 지도 페이지 */

#footerCategory{
    font-size: 18px;
}

#serviceInfo{
    background-color: lightgray;
    height: 200px;
}

.disb{
	display:inline-block;
	border: 1px solid gray;
	border-bottom: none;
	border-top: none;
}

.wit{
	width: 100%;
}

.infocate{
	width: 100%;
	height: 65px;
	text-align: center;
	margin-left: 5px;
}

.infocontent{
	position:absolute; 
	text-align: center;
}

.textc{
    text-align: center;
}

.mapHeight{
    height: 400px;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<!-- // 바디부분 // -->
	<hr>
    <div class="container" id="footerCategory">
        <div class="row">
            <div class="col-md-3 col-lg-3 d-flex justify-content-center align-items-center"><b>서비스소개</b></div>
            <div class="col-md-3 col-lg-3 d-flex justify-content-center align-items-center"><b>개인정보 취급방침</b></div>
            <div class="col-md-3 col-lg-3 d-flex justify-content-center align-items-center"><b>이용안내</b></div>
            <div class="col-md-3 col-lg-3 d-flex justify-content-center align-items-center"><b>연락처 및 지도</b></div>
        </div>
    </div>
    <hr>
    <br>
    <div class="container">
        <div class=" justify-content-center textc">
            <br>
            <h3><i class="fas fa-phone-volume" style="font-size: 3ex;"></i>고객센터</h3><br>
            <h4>02-2222-2222</h4>
		</div>
		<br><hr><br>
        <div class="textc"><h3>Location</h3></div><br>
        <div class="textc"><i class="fas fa-map-signs" style="font-size: 7ex;"></i></div><br>
        <div class="textc"><h4>서울특별시 강남구 테헤란로 14길 6 남도빌딩 3F</h4></div>
    </div>
    <br>
    <div class="container mapHeight" id="map"></div>

    

	<!-- // 바디부분 // -->
    <br><br><br>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                center: new daum.maps.LatLng(37.498960, 127.032940), // 지도의 중심좌표
                level: 1 // 지도의 확대 레벨
            };
        
        var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        
        // 마커가 표시될 위치입니다 
        var markerPosition  = new daum.maps.LatLng(37.498960, 127.032940); 
        
        // 마커를 생성합니다
        var marker = new daum.maps.Marker({
            position: markerPosition
        });
        
        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);
        
        // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
        // marker.setMap(null);    
        console.log('지도의 중심 좌표는 ' + map.getCenter().toString() +' 입니다.');
</script>
</html>