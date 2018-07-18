<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="list" value="${requestScope.list}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색 - moigo</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/search/searchList.css?ver=2">

</head>
<c:import url="/WEB-INF/views/common/header.jsp" />
<body>
	<form action="${pageContext.request.contextPath}/search/selectList.do">
		<div id="left-wrap">
			<div class="filter default-filter">
				<div class="filter-section default-section">
					<div class="row" style="border-bottom: 13px;">
						<div class="col-lg-2 col-md-12 pt-sm pb-sm">모임</div>
						<div class="col-lg-10">
							<div class="row">
								<div class="col-sm-6">
									<div class="inner-search">
										<input type="text" placeholder="모임검색" autocomplete="off"
											onkeyup="if(event.keyCode==13) submit();" name="keyword"
											id="keyword" class="form-control" value="${keyword }" /> <span
											class="search-btn"> <img alt="searchIcon"
											src="${pageContext.request.contextPath }/resources/images/search/searchIcon.png"
											onclick="submit();">
										</span>
									</div>
								</div>
								<div class="map-btn">
									<img alt="mapButton"
										src="${pageContext.request.contextPath }/resources/images/search/mapBtn.png">
								</div>
							</div>
						</div>
					</div>
					<div class="row place">
						<div class="col-lg-2 col-md-12 pt-sm pb-sm">장소</div>
						<div class="col-lg-10">
							<div class="row">
								<div class="col-sm-6">
									<div class="inner-search">
										<input type="text" placeholder="장소검색" autocomplete="off"
											onkeyup="if(event.keyCode==13) submit();" name="place"
											id="place" class="form-control" value="${place }" /> <span
											class="search-btn"> <img alt="searchIcon"
											src="${pageContext.request.contextPath }/resources/images/search/searchIcon.png"
											onclick="submit();">
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row category-wrap">
						<div class="col-lg-2 col-md-12 pt-sm pb-sm">카테고리</div>
						<div class="col-lg-10">
							<div class="row">
								<div class="col-sm-4 gap">
									<select name="bigCategory" id="bigCategory">
										<option>대분류</option>
									</select>
								</div>
								<div class="col-sm-4">
									<select name="smallCategory" id="smallCategory">
										<option>소분류</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="content-meeting">
				<div class="row" style="width: 100%; height: 50px;">
					<div class="col-sm-4 count-sort" id="listCount">검색결과
						${listCount }개</div>
					<div class="col-sm-4 count-sort" id="sort-inner">
						<select class="sort" name="sort" id="sort">
							<option>최신순</option>
							<option value="hits">조회순</option>
							<option value="member">멤버순</option>
						</select>
					</div>
				</div>
				<div class="moigo-item-container">
					<c:forEach items="${list}" var="group">
						<div
							class="float-left col-lg-4 col-md-6 col-sm-12 col-xs-12 moigo-item-wrap">
							<div class="content-context">
								<div class="moigo-item list-item align-left" data-lat=""
									data-lng="" data-index="">
									<div class="moigo-item-overlay"></div>
									<div class="header-bg"></div>
									<div class="header-text-container">
										<div class="isPayment"></div>
										<div class="header-text">
											<div class="title-wrap">
												<div class="title">${group.groupName}</div>
											</div>
											<div class="tag-wrap">
												<div class="tag">#tag1</div>
												<div class="tag">#tag2</div>
												<div class="tag">#tag3</div>
												<div class="tag">#tag4</div>
												<div class="tag">#tag5</div>
											</div>
										</div>
									</div>
									<div class="item-contents align-left">
										<div class="location">${group.groupAddress }</div>
										<span class="icon-container float-right"> <span
											class="memberIcon"> 0<img alt="memberIcon"
												src="${pageContext.request.contextPath }/resources/images/search/memberCountIcon.png">
										</span> <span class="commentIcon"> 0<img alt="commentIcon"
												src="${pageContext.request.contextPath }/resources/images/search/commentIcon.png">
										</span>
										</span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</form>
	<div id="map"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d862551bbf9771ee59207808ec1876ca&libraries=services,clusterer,drawing"></script>
	<script>
		var keyword = $('#keyword').val();
		var place = $('#place').val();
		var bigCategory = $('#bigCategory').val();
		var smallCategory = $('#smallCategory').val();
		var sort = $('#sort').val();

		$('.map-btn').click(function() {
			$('#map').toggle();
			$('#left-wrap').toggleClass('widthHandler');
		});
		$('option').click(function() {
			submit();
		});
		var map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
			center : new daum.maps.LatLng(35.180624570993196,
					128.15614133888792), // 지도의 중심좌표
			level : 13
		// 지도의 확대 레벨
		});

		/* console.log('지도의 중심 좌표는 ' + map.getCenter().toString() +' 입니다.'); */

		var geocoder = new daum.maps.services.Geocoder();

		// 마커 클러스터러를 생성합니다
		// 마커 클러스터러를 생성할 때 disableClickZoom 값을 true로 지정하지 않은 경우
		// 클러스터 마커를 클릭했을 때 클러스터 객체가 포함하는 마커들이 모두 잘 보이도록 지도의 레벨과 영역을 변경합니다
		// 이 예제에서는 disableClickZoom 값을 true로 설정하여 기본 클릭 동작을 막고
		// 클러스터 마커를 클릭했을 때 클릭된 클러스터 마커의 위치를 기준으로 지도를 1레벨씩 확대합니다
		var clusterer = new daum.maps.MarkerClusterer({
			map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
			averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
			minLevel : 8, // 클러스터 할 최소 지도 레벨
			disableClickZoom : true
		// 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
		});

		var data = new Object();
		var positions = new Array();
		$.ajax({
			url : "${pageContext.request.contextPath}/search/getAddress.do",
			data : {
				keyword : keyword,
				place : place,
				bigCategory : bigCategory,
				smallCategory : smallCategory
			},
			success : function(listData) {
				var geocoder = new daum.maps.services.Geocoder();
				// 주소로 좌표를 검색합니다
				for (var i = 0; i < listData.length; i++) {
					geocoder.addressSearch(listData[i].groupAddress, function(result, status) {
						// 정상적으로 검색이 완료됐으면 
						if (status === daum.maps.services.Status.OK) {
							positions.push({
								"lat" : result[0].y,
								"lng" : result[0].x
							});

							//positions.push(data);
							/* var markers = data.positions.map(function(position) {
								    return new daum.maps.Marker({
								        position : new daum.maps.LatLng(position.lat, position.lng)
								    });
							 });
							clusterer.addMarkers(markers); */
						}
					});
				}
				console.log("1");
				console.log(positions);

				data.positions = positions;
				
				console.log(data);
				var markers = data.positions.map(function(position) {
					return new daum.maps.Marker({
						position : new daum.maps.LatLng(position.lat,
								position.lng)
					});
				});
				
				clusterer.addMarkers(markers);

				// 마커 클러스터러에 클릭이벤트를 등록합니다
				// 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
				// 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
				daum.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
					// 현재 지도 레벨에서 1레벨 확대한 레벨
					var level = map.getLevel() - 1;

					// 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
					map.setLevel(level, {
						anchor : cluster.getCenter()
					});
				});
			}
		});
		//console.log(positions);
		/* data.positions = positions; */
	</script>
</body>
</html>