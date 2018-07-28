<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d862551bbf9771ee59207808ec1876ca&libraries=services,clusterer,drawing"></script>

<style>
#map img {

	max-width: none;

	height: auto;

	border: 0

}

.marker_font{
	font-size: 2em;
	color:#00bfff;
}

.map_btn_wrapper{
	position:absolute;
	top:20px;
	right:20px;
	visibility:hidden;
	z-index: 2;
}

.map_address{
	overflow: hidden;
    text-overflow: ellipsis; 
}


</style>

<div id="insertMapModalWrapper"> 

<div class="modal" id="insertMap" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">장소 선택</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<form onsubmit="searchPlaces(); return false;">
					<div class="d-flex">
						<div class="input-group input-group-lg">
							<label for="searchPlace" class="sr-only">Email address</label>
							<input type="text"  class="form-control" id="placeKeyword" placeholder="장소를 입력하세요"/>
							<div class="input-group-append">
								<button class="btn btn-primary" id="btn_searchMap" type="submit">검색</button>
							</div>
						</div>
					</div>
				</form>
					<div class="d-flex justify-content-center mt-4">
						<div id="map" style="width:500px;height:500px;"></div>
					</div>
					<div class="d-flex-row justify-content-center" id="placeListDiv" style="overflow-y:scroll; height:300px; display:none;">
						<ul id="placesList" class="list-group">
							
						</ul>
					</div>
					
					
				</div>
			</div>
		</div>
</div>

</div>

<script>

$(function(){
	$('#insertMap').on('hide.bs.modal',function(){
		resizeMap(500,500);
		removeAllChildNods($('#placesList'));
		$('#placeListDiv').css("display","none");
		$('#placeKeyword').val("");
		toEditTarget=undefined;
		
	});
});

var insertMap_markers=[];

var infowindow_for_Modal = new daum.maps.InfoWindow({zIndex:1}); //인포 윈도우

var ps_for_Modal = new daum.maps.services.Places();  //장소 검색 객체

var toEditTarget;
var toEditContent;

function makeMap(){
	
	map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
	    center : new daum.maps.LatLng(37.499053, 127.032920), // 지도의 중심좌표
	    level : 6 // 지도의 확대 레벨
	});
     
	$('#searchPlace').focus();
}

function searchPlaces() {

 	var keyword = $('#placeKeyword').val();
	 if (!keyword.replace(/^\s+|\s+$/g, '')) {
	     alert('키워드를 입력해주세요!');
	     return false;
	 }

	if(typeof(toEditTarget)=='undefined')
	{
    	ps_for_Modal.keywordSearch(keyword, placesSearchCB);
	}
	else{
		ps_for_Modal.keywordSearch(keyword, placesSearchCB,{"size":1});
	}
   
}


//장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        
        resizeMap(500,250);
        displayPlaces(data);
        $('#placeListDiv').css("display","block");
        
        // 페이지 번호를 표출합니다
        /* displayPagination(pagination); */

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

function resizeMap(x,y){
	 var mapContainer = document.getElementById('map');
	    mapContainer.style.width = x+'px';
	    mapContainer.style.height = y+'px';
	    map.relayout();
}

function displayEditPlace(place){
	 var listEl = $('#placesList')
	 removeAllChildNods(listEl);
	 removeMarker();
	 
	 displayInfowindow(makeInfoWindow(marker,place,closeMapModal),marker);
	 
}

//검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = $('#placesList'), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();

    
    for ( var i=0; i<places.length; i++ ) {
    	
        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x);
       	var marker = addMarker(placePosition, i);
        var itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
		
        if(i==0){
        	if(typeof(toEditTarget)=='undefined')
        		displayInfowindow(makeInfoWindow(marker,places[i],closeMapModal),marker);	
        	else{
        		
        		
        		if($(toEditTarget).attr("name")=="editMapWrap"){
        			displayInfowindow(makeInfoWindow(marker,places[i],editMapContent),marker);
        		}else if($(toEditTarget).hasClass("editSchedule")){
        			displayInfowindow(makeInfoWindow(marker,places[i],editScheduleContent),marker);
        		}
        		
        		
        		
        	}
        	
        }
        
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);
		
		
        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
		 (function(marker, place) {
            daum.maps.event.addListener(marker, 'click', function() {
            	if(typeof(toEditTarget)=='undefined')
            		
                	displayInfowindow(makeInfoWindow(marker,place,closeMapModal),marker);
            	else{
            		
            		displayInfowindow(makeInfoWindow(marker,place,editMapContent),marker);
            	}
                panTo(marker)
            });

            
            $(itemEl).on("click",  function () {
            	if(typeof(toEditTarget)=='undefined')
                	displayInfowindow(makeInfoWindow(marker,place,closeMapModal),marker);
            	else
            		displayInfowindow(makeInfoWindow(marker,place,editMapContent),marker);
                panTo(marker)
            });

        })(marker, places[i]);
   
       $(listEl).append(itemEl);
    }

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
   map.setBounds(bounds);
}

//검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

	
	
    var el  = $('<li class="list-group-item">')
    
    var itemStr = '<span class=""></span>' +'<div class="info">' +'<h5>' + places.place_name + '</h5>';
    
    var itemStr = "<div class='row align-items-center'><div class='col-2 '><i class='fas fa-map-marker-alt marker_font'></i></div><div class='col-10'>"+"<div class='row'>"+"<div class='col-12'>"+places.place_name
    +"</div>";
    
    if (places.road_address_name) {
        itemStr += '<div class="col-12">' + places.road_address_name + '</div>' +
                    '<div class="col-12 text-muted">' +  places.address_name  + '</div>';
    } else {
        itemStr += '<div class="col-12">' + places.road_address_name + '</div>'; 
    }
    
    itemStr += '  <div class="tel col-12">' + places.phone  + '</div>'+"</div></div>";
    
 

   $(el).html(itemStr);
    
    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    insertMap_markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < insertMap_markers.length; i++ ) {
    	insertMap_markers[i].setMap(null);
    }   
    insertMap_markers = [];
}


// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(infoWindow,marker) {

    infowindow_for_Modal.setContent(infoWindow[0]);
    infowindow_for_Modal.open(map, marker);

}

function makeInfoWindow(marker,place,callbackFunc){
	
	var $wrapper= $('<button class="btn btn-info btn-block">');
    $wrapper.append('<strong>이 위치를 추가</strong><br>');
    $wrapper.append('<span style="text-align:center;">'+place.place_name+'</span>');
    $wrapper.append("<i class='fas fa-map-marker-alt marker_font'></i>");
    
    $wrapper.on('click',function(){
    	callbackFunc(marker,place);
    });
    
    return $wrapper;
}

function closeMapModal(marker,place){
	
	addMapOnSummerNote(marker,place);
	$('#insertMap').modal('hide');
}

//summernote에 붙이기
function addMapOnSummerNote(marker,place){

	var $mapDiv = $('<div class="card" name="editMapWrap" style="border:3px solid black;" contenteditable="false" onclick="">');
	var $mapBody = $('<div class="card-body">');
	var $mapRow = $('<div class="row">');
	var $mapCol2 = $('<div class="col-2"><img class="img-fluid" src="../resources/images/icon_navi.png"/></div>');
	var $mapCol10 = $('<div class="col-10">');
	var $col10Row = $('<div class="row">');
	var $col10RowCol1 =$('<div class="col-12 map_address place_name">'+place.place_name+'</div>');
	var $col10RowCol2 =$('<div class="col-12 map_address address_name">'+place.address_name+'</div>');
	var $btnWrapper = $('<div class="map_btn_wrapper float-right">');
	var $btn_edit =$('<button class="btn btn-primary mr-3" name="editBtn">수정</button>');
	var $btn_del =$('<button class="btn btn-info" name="delBtn">삭제</button>');
	
	$btnWrapper.append($btn_edit);
	$btnWrapper.append($btn_del);
	
	
	$col10Row.append($col10RowCol1);
	$col10Row.append($col10RowCol2);
	$mapCol10.append($col10Row);
	$mapRow.append($mapCol2);
	$col10Row.append($btnWrapper);
	$mapRow.append($mapCol10);
	$mapBody.append($mapRow);
	$mapDiv.append($mapBody);
	
	
	
	$btn_edit.on("click",function(){
		toEditTarget=$mapDiv;
		
		$('#placeKeyword').val($col10RowCol1.text());
		editMap();
	});
	
	$btn_del.on("click",function(){
		deleteMap($(this));
	});
	
	
	$mapDiv.on('mouseover',function(){
		$(this).css('border','3px solid #00bfff');
		
		$(this).find('.map_btn_wrapper').css("visibility","visible");
		
		
	}).on('mouseout',function(){
		
		$(this).css('border','3px solid black');
		
		$(this).find('.map_btn_wrapper').css("visibility","hidden");
	});
	
	$('#summernote').summernote('insertNode', $mapDiv[0]);
}

function editMap(){
	toggleMapModal();
	searchPlaces();
}

function editMapContent(marker,place){
	if(typeof(toEditTarget)!='undefined')
	{
		$(toEditTarget).find('.place_name').text(place.place_name);
		$(toEditTarget).find('.address_name').text(place.address_name);
		$('#insertMap').modal('hide');
	}
}

function editScheduleContent(marker,place){
	$(toEditTarget).text("");
	$(toEditTarget).siblings("input").val(place.address_name);
	$(toEditTarget).append("<i class='fas fa-map-marker-alt'>"+place.address_name+"</i>");
	 
	$('#insertMap').modal('hide');
}


function deleteMap(obj){

	$(obj).closest('[name=editMapWrap]').remove();	
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
 $(el).children().remove();
}
 


function panTo(marker) {
	
	
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new daum.maps.LatLng(marker.getPosition().getLat(), marker.getPosition().getLng());
    
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon);            
}  

$(document).on('show.bs.modal', '.modal', function (event) {
    var zIndex = 1040 + (10 * $('.modal:visible').length);
    $(this).css('z-index', zIndex);
    setTimeout(function() {
        $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
    }, 0);
});
</script>