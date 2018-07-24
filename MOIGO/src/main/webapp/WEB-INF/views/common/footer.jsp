<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
/* 풋터 */
#footerBar {
	background-color: #303233;
	height: 200px;
}

.footerMenu { 
	color: white;
	display: inline-block;
	margin-top: 15px;
}
  
.footerMenu:hover {
	cursor: pointer;
}

.footerInfo{
	color: white;
	margin-top: 10px;
}

.ani:hover{
	cursor: pointer;
	transform: translateY(-10px);
	box-shadow: 5px 5px 5px black;
}
</style>
</head>
<body>
<!-- // 풋터부분 // -->

	<div class="container-fluid" id="footerBar">
		<div class="cotainer d-flex justify-content-center">
			<div class="col-sm-2 col-md-2 col-lg-2"></div>
			<div class="d-flex justify-content-center align-items-center footerMenu
						col-sm-2 col-md-2 col-lg-2" id="serviceInfo">서비스소개
						<input type="hidden" value="ser"/></div> &nbsp;&nbsp;
			<div class="d-flex justify-content-center align-items-center footerMenu
						col-sm-2 col-md-2 col-lg-2" id="personalInfo">개인정보 취급방침
						<input type="hidden" value="per"/></div> &nbsp;&nbsp;
			<div class="d-flex justify-content-center align-items-center footerMenu
						col-sm-2 col-md-2 col-lg-2" id="useGuide">이용안내
						<input type="hidden" value="guid"/></div> &nbsp;&nbsp;
			<div class="d-flex justify-content-center align-items-center footerMenu
						col-sm-2 col-md-2 col-lg-2" id="maps">연락처 및 지도
						<input type="hidden" value="ma"/></div> &nbsp;&nbsp;
			<div class="col-sm-2 col-md-2 col-lg-2"></div>
		</div>
		<hr>
		<div class="cotainer d-flex justify-content-center">
			<div class="footerInfo">
				<div class="col-sm-12 col-md-12 col-lg-12">
					<p class="col-lg-12">법인명 : 모이고  | 대표이사 :  박태영  | 사업장 소재지 :  서울시 강남구 역삼동 KH정보교육원  | 사업자등록번호 : 132-78-56215 | 사업자정보확인 </p>
		
					<p class="col-lg-12">통신판매업신고 : 제2013-서울강남-0521호  | 개인정보보호책임자 :  이원제 | 고객센터 :  02-2222-2222
											| 팩스 : 02-2222-2222| E-mail : moigo@moigo.com</p>
					<p class="col-lg-12">Hosting by (주)코리아센터닷컴</p>
				</div>
				<div class="col-sm-3 col-md-3 col-lg-2"></div>
			</div>
		</div>
	</div>


	<!-- // 풋터부분 // -->
	<br><br><br>
</body>
<script>
	$('.footerMenu').on('click',function(){
		var select = $(this).find('input').val();
		location.href="${pageContext.request.contextPath}/common/footpage.ft?selected="+select; 
		
		 /* if(select == 'ma'){
			alert("바보");
			$('#map').css("height","400px");
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
		} */
	});
	
	
</script>
</html>