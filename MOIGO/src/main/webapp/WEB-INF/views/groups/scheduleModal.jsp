<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>


<script src="${root}/resources/js/groups/jquery.timepicker.js" ></script>
<link rel="stylesheet" href="${root}/resources/css/groups/jquery.timepicker.css" />
<link rel="stylesheet" href="${root}/resources/css/groups/datepicker.min.css">
<script src="${root}/resources/js/groups/datepicker.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d862551bbf9771ee59207808ec1876ca&libraries=services,clusterer,drawing"></script>
<style>

.modalSize_schedule{
	/* max-width:30%; */
	width:500px;
}

.day{
font-weight: 700;
font-size:2.0em;
text-align:center;
}

.datepicker{
	z-index:1151 !important;
}

.datepicker--cells, .datepicker--nav-title,
.datepicker--days-names, .datepicker--buttons {
	font-family: 'nanum-barun-gothic-bold', sans-serif;
}

</style>

<div id="insertScheduleModalWrapper"> 

<div class="modal" id="insertSchedule" tabindex="-1"role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg modalSize_schedule" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">일정 만들기</h5>
				<button type="button" class="close" data-dismiss="modal"aria-label="Close" onclick="closeScheduleModal()">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="">
			<div class="modal-body">
				<input type="hidden" value="${param.groupNo}" name="groupNo"/>
				<div class="d-flex flex-column">
					<input id="scheduleTitle" type="text" name="scheduleName" maxlength="30" class="form-control mb-3" placeholder="일정 제목(최대 30자)" required/>
					<textarea name="scheduleContent" class="form-control" id="scheduleContent" cols="10" rows="2" style="resize:none;" placeholder="일정 설명" required></textarea>
					
					<div class="mt-2">
						<div class="row">
							<div class="col-12">
								<strong class="mr-5" >위치</strong><button type="button" class='btn btn-link editSchedule' onclick="openScheduleMapModal(this);"><i class="fas fa-map-marker-alt">지도에서 선택</i></button>
								<input type="hidden" name="scheduleAddress" value=""/>
							</div>
						</div>
					</div>
					<div class="mt-2">
						<div class="row">
							<div class="col-2"><strong>시작</strong></div>
							<div class="col-5"><input type="text" id="startDate" name="startDate" class="form-control" autocomplete=”off”/></div>
							<div class="col-5"><input type="text" id="startTime"  name="startTime" class="form-control" /></div>
						</div>
					</div>
					
					<div class="mt-2">
						<div class="row">
							<div class="col-2"><strong>종료</strong></div>
							<div class="col-5"><input type="text" id="endDate" name="endDate" placeholder="선택" class="form-control" autocomplete=”off”/></div>
							<div class="col-5"><input type="text" id="endTime" name="endTime" placeholder="선택"  class="form-control"/></div>
						</div>
					</div>
					
					<div class="mt-2">
						<div class="row align-items-center">
							<div class="col-2"><strong>라벨 색</strong></div>
							<div class="col-5">
								<select name="colorLabel" id="scheduleLabelColor" class="form-control">
									<option value="#DE1D6A" style="background:#DE1D6A;" >      </option>
									<option value="#ED6695" style="background:#ED6695;">      </option>
									<option value="#F58F2A" style="background:#F58F2A;">      </option>
									<option value="#FCB735" style="background:#FCB735;">      </option>
									<option value="#4FB846" style="background:#4FB846;">      </option>
									<option value="#8BC441" style="background:#8BC441;">      </option>
									<option value="#2A4082" style="background:#2A4082;">      </option>
									<option value="#1F72DE" style="background:#1F72DE;">      </option>
									<option value="#AD61A4" style="background:#AD61A4;">      </option>
									<option value="#756852" style="background:#756852;">      </option>
								</select>
							
							</div>
							<div class="col-5">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" id="allDay" value="N">
									<label class="form-check-label" for="allDay">하루 종일</label>
								</div>
							</div>
						</div>
						
					</div>
					
					</div>
				</div>
			
				<div class="modal-footer">
		 

		        <button type="button" onclick="" id="scheduleConfirmBtn" class="btn btn-primary btn-block">첨부 하기</button>

		      </div>
			</form>
		</div>
	</div>
</div>

</div>


<div id="viewScheduleModalWrapper">
	<div class="modal" id="viewSchedule" tabindex="-1"role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg modalSize_schedule" role="document">
		<div class="modal-content">
			<div class="modal-header">
				
				<button type="button" class="close" data-dismiss="modal"aria-label="Close" onclick="closeScheduleModal()">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			
			<div class="modal-body">
				<div class="card">
				  <div class="card-header">
				    <div class="container">
				    	<div class="row justify-content-start">
				    		<div class="col-2">
				    			<input type="hidden" id="scheduleWriter" value=""/>
				    			<div>
				    				<span class="day ml-2" ></span><br>
				    				<span class="dayofweek" style="margin-top:-10px;"></span>
				    			</div>
				    		</div>
				    		<div class="col-8">
				    			<div class="row">
				    				<div class="col-12 scheduleName">
				    					
				    				</div>
				    				<div class="col-12 scheduleTime">
				    				
				    				</div>
				    				<div class="col-12 memberName">
				    					
				    				</div>
				    			</div>
				    		</div>
				    		<div class="col-2">
				    			<div>
				    				<div class="dropdown"  id="scheduleViewDropDown">
				    					<button class="btn btn-link" type="button" data-toggle="dropdown" >
				    						<i class="fas fa-ellipsis-v"></i>
				    					</button>
				    					<div class="dropdown-menu">
				    						<button name="edit" class="dropdown-item">수정</button>
				    						<button  name="delete" class="dropdown-item">삭제</button>
				    					</div>
				    					
				    				</div>
				    			</div>
				    		
				    		</div>
				    	</div>
				    </div>
				  </div>
				  <div class="card-body">
				   
				    <p class="card-text scheduleContent"></p>
				    
				    <div id="scheduleMapView" style="width:100%;height:350px;"></div>
				  </div>
				</div>
			</div>
		
		
		</div>
	</div>
</div>
	
 
</div>

<script>

tempSchedule=new Object();

	$(function() {
		
		
		
		
		// datepicker에 적용할 한글 언어 설정
		$.fn.datepicker.language['ko'] = {
			    days: ['일', '월', '화', '수', '목', '금', '토'],
			    daysShort: ['일', '월', '화', '수', '목', '금', '토'],
			    daysMin: ['일', '월', '화', '수', '목', '금', '토'],
			    months: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			    monthsShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			    today: '오늘',
			    clear: '닫기',
			    dateFormat: 'yyyy.mm.dd',
			    timeFormat: 'hh:ii aa',
			    firstDay: 0
			};
			
			// 시작날짜의 datepicker 설정
			$("#startDate").datepicker({
				language : "ko",
				autoClose : true,
				todayButton: new Date(),
				dateFormat: "yyyy.mm.dd",
				onSelect : function(date) {
					$("#startDate").trigger('change');
				}
			});
			
			// 시작 날짜가 처음 열릴 때 선택된 날짜를 오늘 날짜로 지정
			$("#startDate").data('datepicker').selectDate(new Date());
			
			// 종료 날짜의 datepicker 설정
			$("#endDate").datepicker({
				language : "ko",
				autoClose : true,
				todayButton: new Date(),
				dateFormat: "yyyy.mm.dd",
				onSelect : function(date) {
					$("#endDate").trigger('change');
				}
			});
	});

	var scheduleMapView;
	var geocoder;
	
	function makeScheduleMapView(){
		var mapContainer = document.getElementById('scheduleMapView'), // 지도를 표시할 div 
		mapOption = { 
		    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};
		
		scheduleMapView = new daum.maps.Map(mapContainer, mapOption); 
		geocoder = new daum.maps.services.Geocoder();
		scheduleMapView.relayout();
	}
	

	function openScheduleViewModal(scheduleNo){
		
		$('#viewSchedule').modal("show");
		makeScheduleMapView();
	
		getOneSchedule(scheduleNo,setScheduleViewModal);
	
	
	}
	
	function setMemberNameOnView(memberNo){
		
		
		var groupNo = '${groupNo}';
		
		if(groupNo==null||groupNo=="")
			groupNo = '${param.groupNo}';
		
		$.ajax({
			url:"${pageContext.request.contextPath}/groups/selectOneGrpMem.gp",
			data:{	memberNo:memberNo,
					groupNo:groupNo}
				,success:(function(data){
					
					if(data!=null){
				
						$('#viewSchedule').find(".memberName").text(data.groupMember.memberName);
						
						
					}else 
						alert("일정을 불러오는 과정에서 문제가 생겼습니다.");
				
				}),error:(function(data){
					
				})
	
			}); 
		
	}
	


	
	function setScheduleViewModal(obj){
		
		if('${gm.memberNo}'!=obj.memberNo)
			$('#scheduleViewDropDown').css("display","none");
		
		$('#scheduleViewDropDown button[name=edit]').unbind();
		$('#scheduleViewDropDown button[name=edit]').on("click",function(){
			editSchedule(undefined,obj.scheduleNo)
		});
		
		
		$('#scheduleViewDropDown button[name=delete]').unbind();
		$('#scheduleViewDropDown button[name=delete]').on("click",function(){
			
			
			deleteSchedule(undefined,obj.scheduleNo);
			
			location.reload();
		});
		
		
		
		setMemberNameOnView(obj.memberNo);
		
		$('#viewSchedule').find(".day").text(milisecToDate(obj.startTime).getDate());
		
		if(milisecToDate(obj.startTime).getDay()==0)
			$('#viewSchedule').find(".dayofweek").css("color","red");
		else if(milisecToDate(obj.startTime).getDay()==6)
			$('#viewSchedule').find(".dayofweek").css("color","blue");
		else
			$('#viewSchedule').find(".dayofweek").css("color","black");
		
		$('#viewSchedule').find(".dayofweek").text(getDayToKor(milisecToDate(obj.startTime).getDay()));
		$('#viewSchedule').find(".scheduleName").text(obj.scheduleName);
		$('#viewSchedule').find(".scheduleContent").text(obj.scheduleContent);
		
		var timeString = getTimeToString(milisecToDate(obj.startTime));
		if(obj.endTime!=null)
			timeString += " - "+getTimeToString(milisecToDate(obj.endTime));
		$('#viewSchedule').find(".scheduleTime").text(timeString);
		
	
		
		if(obj.scheduleAddress!=null){
			$('#scheduleMapView').css("display","block");
			geocoder.addressSearch(obj.scheduleAddress, function(result, status) {
	
			    // 정상적으로 검색이 완료됐으면 
			     if (status === daum.maps.services.Status.OK) {
	
			        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new daum.maps.Marker({
			            map: scheduleMapView,
			            position: coords
			        });
			    
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        scheduleMapView.setCenter(coords);
			    } 
			}); 
		}else{
			
			$('#scheduleMapView').css("display","none");
		}
		
	}


	function toggleScheduleModal(){
		
		
		 $('#endDate').data('datepicker').clear();
		 $('#insertSchedule').modal("show");
	}
	

	
	//toEditObj ->$mapDiv 
	function editSchedule(toEditObj,scheduleNo){
    
		
		toggleScheduleModal();
		
		if(typeof(scheduleNo)=='object')
			getOneSchedule(scheduleNo.scheduleNo,setTargetScheduleData);
		else
			getOneSchedule(scheduleNo,setTargetScheduleData);
		
		$('#insertSchedule').find(".modal-footer button").unbind();
		$('#insertSchedule').find(".modal-footer button").on("click",function(){
				
			if(typeof(scheduleNo)=='object'){
				updateSchedule(scheduleNo.scheduleNo);
			}
			else{
				
				updateSchedule(scheduleNo);
			}
			editScheduleOnSummerNote(toEditObj);
		
		});
		
		
	
		
	}
	
	
	
	function getOneSchedule(scheduleNo,callbackfunc){
		
		
	 	$.ajax({
			url:"${pageContext.request.contextPath}/groups/selectOneSchedule.gp",
			data:{	scheduleNo:scheduleNo}
				,success:(function(data){
					if(data!=null){
						
						callbackfunc(data.schedule);
					}else
						alert("일정을 불러오는 과정에서 문제가 생겼습니다.");
				
				}),error:(function(data){
					
				})
	
			}); 
	}
	
	//수정을 위해 스케줄 번호를 이용해서 정보를 세팅
	function setTargetScheduleData(obj){
	
		console.log(obj);
		
		$('#insertSchedule').find('input[name=scheduleNo]').val(obj.scheduleNo);
		
		$('#insertSchedule').find("[name=scheduleName]").val(obj.scheduleName);
		$('#insertSchedule').find("[name=scheduleContent]").val(obj.scheduleContent);
		
		
		if(obj.scheduleAddress!=null)
			$("#insertSchedule .editSchedule .fas").text(obj.scheduleAddress);
		else
			$("#insertSchedule .editSchedule .fas").text("지도에서 선택");
		
	
		$('#startTime').timepicker("setTime",milisecToDate(obj.startTime));
		$('#startDate').datepicker("setDate",milisecToDate(obj.startTime));
		
		if(obj.endTime!=null){
			
			$('#endTime').timepicker("setTime",milisecToDate(obj.endTime));
			$('#endDate').data('datepicker').selectDate(milisecToDate(obj.endTime));
			$('#endDate').datepicker({minDate : getDate($('#startDate'))});
		}else{
			$('#endTime').timepicker("setTime",null);
			$('#endDate').datepicker("setDate",null);
		}
		
		 if(obj.allDay=='Y'){
			 $('#allDay').click();
		 }
		
		$('#scheduleLabelColor').val(obj.colorLabel).prop("selected", true);
		$('#scheduleLabelColor').css("background",obj.colorLabel);
		
	}

	
	/*날짜 시간 인풋에서 Date객체,년월일 스트링 가져오기  */
	function getTimesFromInput(){
		
		var startDate = parseDateAndTime($('#startDate'),$('#startTime'));
		var endDate = null;
		
		
		
		var timeString = getTimeToString(startDate); 
		
		if($('#endDate').val().length>0 && $('#endTime').val().length>0){
			
			endDate = parseDateAndTime($('#endDate'),$('#endTime'));
			
			timeString+=" - " +getTimeToString(endDate);
			endDate = endDate.getTime();
				
		}else{
			endDate = "none";
		}
		
		return {"startTime":startDate.getTime(),"endTime":endDate,"timeString":timeString};
		
	}
	
	
	/*뷰로 스케줄 업데이트  */
	function updateSchedule(scheduleNo){
		
		
		
		var times=  getTimesFromInput();
		console.log("스케줄 이름은?");
		console.log($('#insertSchedule input[name=scheduleAddress]').val());
		
	  	$.ajax({
			url:"${pageContext.request.contextPath}/groups/updateSchedule.gp",
			type:"post",
			data:{	scheduleNo:scheduleNo,
					scheduleName:$('#insertSchedule input[name=scheduleName]').val(),
					scheduleContent:$('#insertSchedule textarea').val(),
					scheduleAddress:$('#insertSchedule input[name=scheduleAddress]').val(),
					startT:times.startTime,
					endT:times.endTime,
					allDay:$('#allDay').val(),
					colorLabel:$('#scheduleLabelColor option:selected').val()
				},success:(function(data){
					
					
					
					if(data.result>0){
						alert("일정 수정에 성공하였습니다.");

						$('#viewSchedule').modal('hide');
						
					}
					else
						alert("일정 수정에 실패하였습니다.");
					
					
					closeScheduleModal();
					
				}),error:(function(data){
					
				})
	
			}); 
	}
	
	
	/*날짜 시간 인풋 2개로 date객체 만들기  */
	function parseDateAndTime(dateObj,timeObj){
		

		var dates = ($(dateObj).val()).split(".");

		
		
		if(timeObj.val()==null||timeObj.val().length<=0)
			return new Date(dates[0],(parseInt(dates[1])-1),dates[2],0,0,0,0);
		else{
			var times = ($(timeObj).val()).split(":");
			return new Date(dates[0],(parseInt(dates[1])-1),dates[2],times[0],times[1],(new Date()).getSeconds(),0);
			
		}

	
	}
	
	
 	/*schedule을 db에 넣기  */
	function insertScheduleToDB(){
	
 		
		if(!$('#insertSchedule input[name=scheduleName]').val()){
			alert("일정 제목은 필수 입력 사항입니다.");
			return;
		}
		
		if($('#insertSchedule input[name=scheduleName]').val().length>30){
			alert("일정 제목은 30자 이하여야 합니다.");
			return;
		}
		
		var times=  getTimesFromInput();
		
	 	$.ajax({
			url:"${pageContext.request.contextPath}/groups/insertSchedule.gp",
			type:"post",
			data:{	groupNo:"${param.groupNo}",
					scheduleName:$('#insertSchedule input[name=scheduleName]').val(),
					scheduleContent:$('#insertSchedule textarea').val(),
					scheduleAddress:$('#insertSchedule input[name=scheduleAddress]').val(),
					startT:times.startTime,
					endT:times.endTime,
					memberNo:'${m.memberNo}',
					allDay:$('#allDay').val(),
					colorLabel:$('#scheduleLabelColor option:selected').val()
				},success:(function(data){
					
					if(data.result>0){
						alert("일정 입력에 성공하였습니다.");
						addScheduleElement($('#summernote'),data.schedule);
					}
					else
						alert("일정 입력에 실패하였습니다.");
					
					
					closeScheduleModal();
					
				}),error:(function(data){
					
				})
	
			}); 
		
		
	} 
	
	/*스케줄을 못찾은 경우 삭제된 일정이라고 표시  */
	function addEmptyScheduleElement(addObj){
		
		
		var $mapDiv = $('<div class="card" name="editScheduleWrap" style="border:3px solid black;" contenteditable="false">');
		
		var $mapBody = $('<div class="card-body">');
		var $mapRow = $('<div class="row">');
		var $mapCol2 = $('<div class="col-2">');
		var $mapCol10 = $('<div class="col-10">');
		var $col10Row = $('<div class="row">');
		var $col10RowCol1 = $col10RowCol1=$('<div class="col-12 map_address scheduleName">삭제된 일정입니다.</div>');
			
		
		var $mapCol2Day = $('<div name="day" style="text-align:center;font-weight:700; font-size:2.0em; margin-top:-10px;"></div>');
		var $mapCol2Dow =$('<div name="dayofweek" style="text-align:center; margin-top:-10px;"></div>');
		var $col10RowCol2 =$('<div class="col-12 map_address scheduleTime"></div>');
	
		$mapCol2.append($mapCol2Day);
		$mapCol2.append($mapCol2Dow);
		
		//구성 add
		$col10Row.append($col10RowCol1);
		$col10Row.append($col10RowCol2);
		$mapCol10.append($col10Row);
		$mapRow.append($mapCol2);
		
		$mapRow.append($mapCol10);
		$mapBody.append($mapRow);
		$mapDiv.append($mapBody);
		

	
		$(addObj).append($mapDiv);
		
		
		 
	}
	
	/*섬머노트에 올라가 있는 스케줄 엘리먼트 정보 수정  */
	function editScheduleOnSummerNote(toEditObj){
		
		var times=  getTimesFromInput();
		
	
		
		$(toEditObj).find('[name=scheduleAddress]').val($('#insertSchedule input[name=scheduleAddress]').val());
		$(toEditObj).find('[name=scheduleName]').val($('#insertSchedule input[name=scheduleName]').val());
		$(toEditObj).find('[name=allDay]').val($('#allDay').val());
		$(toEditObj).find('[name=colorLabel]').val($('#scheduleLabelColor option:selected').val());
		$(toEditObj).find('[name=startT]').val(times.startTime);
		$(toEditObj).find('[name=endT]').val(times.endTime);
		$(toEditObj).find('[name=scheduleContent]').val($('#insertSchedule textarea').val());
		
		
		$(toEditObj).find('[name=day]').text(milisecToDate(times.startTime).getDate());
		$(toEditObj).find('[name=dayofweek]').text(getDayToKor(milisecToDate(times.startTime).getDay()));
		$(toEditObj).find('.scheduleName').text($('#insertSchedule input[name=scheduleName]').val());
		$(toEditObj).find('.scheduleTime').text(times.timeString);
	
		
		$('#insertSchedule').modal("hide");
	}

	
	
	/*스케줄 엘리먼트를 섬머노트나 컨텐츠 영역에 만들기 */
	function addScheduleElement(toAddObj,scheduleObj){
		
	
		var startDate = parseDateAndTime($('#startDate'),$('#startTime'));
	
		var times=  getTimesFromInput();
		
		var $mapDiv =$('<div class="card" name="editScheduleWrap" style="border:3px solid black;" contenteditable="false" onclick="openScheduleViewModal('+"'"+scheduleObj.scheduleNo+"'"+')">');
		
		var $mapBody = $('<div style="cursor:pointer;" class="card-body">');
		var $mapRow = $('<div class="row">');
		var $mapCol2 = $('<div class="col-2">');
		var $mapCol10 = $('<div class="col-10">');
		var $col10Row = $('<div class="row">');
		var $col10RowCol1=$('<div class="col-12 map_address scheduleName">'+scheduleObj.scheduleName+'</div>');
			
		
		/* 
		var $inpScheduleName;
		var $inpStartT;
		var $inpEndT;
		var $colorLabel;
		var $allDay;
		var $inpScheduleAddress;
		var $inpMemberNo;
		var $scheduleContent; 
		
		if(scheduleObj==undefined){
			
			//스케줄의 정보를 엘리먼트에 세팅
			$inpScheduleName = $('<input type="hidden" name="scheduleName">').val($('#insertSchedule input[name=scheduleName]').val());         
			$inpStartT = $('<input type="hidden" name="startT">').val(times.startTime);                        
			$inpEndT = $('<input type="hidden" name="endT">').val(times.endTime);                              
			$colorLabel = $('<input type="hidden" name="colorLabel">').val($('#scheduleLabelColor option:selected').val());                  
			$allDay = $('<input type="hidden" name="allDay">').val($('#allDay').val());                              
			$inpScheduleAddress = $('<input type="hidden" name="scheduleAddress">').val($('#insertSchedule input[name=scheduleAddress]').val());
			$inpMemberNo = $('<input type="hidden" name="memberNo">').val('${gm.memberNo}');                     
			$scheduleContent = $('<input type="hidden" name="scheduleContent">').val($('#insertSchedule textarea').val());   
		}else{
			$inpScheduleName = $('<input type="hidden" name="scheduleName">').val(scheduleObj.scheduleName);         
			$inpStartT = $('<input type="hidden" name="startT">').val(scheduleObj.startTime);                        
			$inpEndT = $('<input type="hidden" name="endT">').val(scheduleObj.endTime);                              
			$colorLabel = $('<input type="hidden" name="colorLabel">').val(scheduleObj.colorLabel);                  
			$allDay = $('<input type="hidden" name="allDay">').val(scheduleObj.allDay);                              
			$inpScheduleAddress = $('<input type="hidden" name="scheduleAddress">').val(scheduleObj.scheduleAddress);
			$inpMemberNo = $('<input type="hidden" name="memberNo">').val(scheduleObj.memberNo);                     
			$scheduleContent = $('<input type="hidden" name="scheduleContent">').val(scheduleObj.scheduleContent);   
			
		} */
		
		var $mapCol2Day=$('<div name="day" style="text-align:center;font-weight:700; font-size:2.0em; margin-top:-10px;">'+milisecToDate(scheduleObj.startTime).getDate()+'</div>');
		var $mapCol2Dow =$('<div name="dayofweek" style="text-align:center; margin-top:-10px;">'+getDayToKor(milisecToDate(scheduleObj.startTime).getDay())+'</div>');
		var $col10RowCol2 =$('<div class="col-12 map_address scheduleTime">'+getTimeToString(milisecToDate(scheduleObj.startTime))+"  ~  "+getTimeToString(milisecToDate(scheduleObj.endTime))+'</div>');
		console.log(scheduleObj.endTime);
				
	
		if(milisecToDate(scheduleObj.startTime).getDay()==0)
			$mapCol2Day.css("color","red");
		else if(milisecToDate(scheduleObj.startTime).getDay()==7)
			$mapCol2Day.css("color","blue");
		else
			$mapCol2Day.css("color","black");
		
			
	
		
		var $btnWrapper = $('<div class="map_btn_wrapper float-right">');
		var $btn_edit =$('<button class="btn btn-primary mr-3" name="editBtn">수정</button>');
		var $btn_del =$('<button class="btn btn-info" name="delBtn">삭제</button>');
		
		$mapCol2.append($mapCol2Day);
		$mapCol2.append($mapCol2Dow);
		
		$btnWrapper.append($btn_edit);
		$btnWrapper.append($btn_del);
		
		//기본정보 add
		/* $col10Row.append($inpMemberNo);
		$col10Row.append($inpScheduleAddress);
		$col10Row.append($allDay);
		$col10Row.append($colorLabel);
		$col10Row.append($inpScheduleName);
		$col10Row.append($inpEndT);
		$col10Row.append($inpStartT);
		$col10Row.append($scheduleContent); */
		
		//구성 add
		$col10Row.append($col10RowCol1);
		$col10Row.append($col10RowCol2);
		$mapCol10.append($col10Row);
		$mapRow.append($mapCol2);
		$col10Row.append($btnWrapper);
		$mapRow.append($mapCol10);
		$mapBody.append($mapRow);
		$mapDiv.append($mapBody);
		

	
		
		if($(toAddObj).is("#summernote")){
			
			
			$btn_edit.on("click",function(event){
				
				
				editSchedule($mapDiv,scheduleObj);
				event.stopPropagation();
				
			});
			
			$btn_del.on("click",function(event){
				
					event.stopPropagation();
				
					deleteSchedule($mapDiv,scheduleObj.scheduleNo);
				
					location.reload();
				
			});
			
		
			$mapDiv.on('mouseover',function(){
				$(this).css('border','3px solid #00bfff');
				
				$(this).find('.map_btn_wrapper').css("visibility","visible");
				
				
			}).on('mouseout',function(){
				
				$(this).css('border','3px solid black');
				
				$(this).find('.map_btn_wrapper').css("visibility","hidden");
			});
			
		
			
			var $scheduleInputWrapper=$('<div class="scheduleInputWrapper">');
			
			$scheduleInputWrapper.append($('<input type="hidden">').val(scheduleObj.scheduleNo));
			$scheduleInputWrapper.append($mapDiv[0]);
			$(toAddObj).summernote('insertNode', $scheduleInputWrapper[0]);
		}else
		{	
			$(toAddObj).append($mapDiv);
		}
		
	}
/* 	
	function getArrayIndexWithElement(array,obj){
		
		for(var i =0;i<array.length;++i){
			if(array[i]===obj)
				return i;
		}
		return -1;
	} */
	
	
	/*스케줄 삭제  */
	function deleteSchedule(deleteObj,scheduleNo){
		
		if(confirm("일정을 삭제 하시겠습니까?")){
			
			console.log(deleteObj);
			console.log(scheduleNo);
			
			if(deleteObj!=undefined)
				$(deleteObj).remove();
			
			
			 $.ajax({
				url:"${pageContext.request.contextPath}/groups/deleteSchedule.gp",
				data:{	scheduleNo:scheduleNo},
				type:"get",
				success:(function(data){
					  
						if(data.result>0){
							alert(" 일정 삭제에 성공하였습니다.");
							
						}
						else
							alert("일정 삭제에 실패하였습니다.");
						
						$('#viewSchedule').modal('hide');
					}),error:(function(data){
						alert("삭제 ajax 에러");
					})
		
				});
			
		}
	}
	
	/*섬머노트에 올라가있는 스케줄 객체 삭제  */
	function deleteScehduleFromNote(obj){

		$(obj).closest('[name=editScheduleWrap]').remove();	
	}
	
	/*밀리세컨드를 data 객체로 가져오기  */
	function milisecToDate(milisecondData){
		
		if(milisecondData==null)
			return null;
		
		var date = new Date(milisecondData);
		
		return date;
	}  
	
	/*date객체를 년월일 스트링으로 바꾸기  */
	function getTimeToString(dateObj){
		
		if(dateObj==undefined||dateObj==null)
			return ""; 
		
		
		var hours = (dateObj.getHours()<10?'0':'')+dateObj.getHours();
		var minutes = (dateObj.getMinutes()<10?'0':'')+dateObj.getMinutes();
		
		 return dateObj.getFullYear()+"년 "+(parseInt(dateObj.getMonth())+1)+"월 "+dateObj.getDate()+"일 "+hours+":"+minutes;
	}
	
	/*dow를 요일로 바꾸기  */
	function getDayToKor(day){
		
		
		var days = ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'];
		
		return days[day];
		
	}

	/*스케줄을 임시array에 넣기  */
	function insertScheduleToArray(){
		 
		
		if(!$('#insertSchedule input[name=scheduleName]').val()){
			alert("일정 제목은 필수 입력 사항입니다.");
			return;
		}
		
		var times=  getTimesFromInput();
		
	
		tempSchedule.scheduleNo="notInsertedSchedule";
		tempSchedule.groupNo= "${param.groupNo}";
		tempSchedule.scheduleName=$('#insertSchedule input[name=scheduleName]').val();
		tempSchedule.scheduleContent=$('#insertSchedule textarea').val();
		tempSchedule.scheduleAddress=$('#insertSchedule input[name=scheduleAddress]').val();
		tempSchedule.startT=times.startTime;
		tempSchedule.endT=times.endTime;
		tempSchedule.memberNo='${m.memberNo}';
		tempSchedule.allDay=$('#allDay').val();
		tempSchedule.colorLabel=$('#scheduleLabelColor option:selected').val();
		
	
		
		closeScheduleModal();
		
		return tempSchedule;
	}

		/*스케줄 넣는 모달이 띄워질 때  */
		$('#insertSchedule').on('shown.bs.modal',function(){
			/* $('#startDate').datepicker({showButtonPanel: true, 
		         closeText: '닫기', 
		         dateFormat: "yyyy.mm.dd"});
		
			$('#endDate').datepicker({showButtonPanel: true, 
		         closeText: '닫기', 
		         dateFormat: "yyyy.mm.dd"}); */
	
			/* $('#startTime').timepicker();
			$('#endTime').timepicker(); */
			
			$('#startTime').timepicker({ timeFormat:"H:i",lang: {am:'오전', pm:'오후',AM:'오전', PM:'오후'},step:30});
			$('#endTime').timepicker({ timeFormat:"H:i",lang: {am:'오전', pm:'오후',AM:'오전', PM:'오후'},step:30});
			
			var date = new Date();
			if(date.getMinutes()>30){
				date.setMinutes(0);
				date.setHours(date.getHours()+1);
			}
			else
				date.setMinutes(30);
			
			$('#startTime').timepicker("setTime",date);
			$('#startDate').datepicker("setDate",new Date());
			$('#endTime').timepicker("setTime",null);
			$('#endDate').datepicker("setDate",null);
			
			$(this).find(".modal-footer button").unbind();
			$(this).find(".modal-footer button").on("click",function(){
				
				
				
				
				insertScheduleToDB();
				
				if($("#scheduleConfirmBtn").hasClass("call_schedule")){
					$("#scheduleConfirmBtn").removeClass("call_schedule");
					location.reload();
				}
			});
			
			
			$('#scheduleLabelColor').val('#DE1D6A');
			$('#scheduleLabelColor').css("background","#DE1D6A");
	 
		});
		
		$('#startDate').on("change",function(){
			$('#endDate').datepicker({minDate : getDate(this)});
			if(getDate($('#startDate')) > getDate($('#endDate')))
				$('#endDate').data('datepicker').selectDate(getDate($('#startDate')));
		});
		
		
		/*스케줄 모달이 없어질 때  */
		$('#insertSchedule').on('hide.bs.modal',function(){
			$('#insertSchedule').find("[name=scheduleName]").val("");
			$('#insertSchedule').find("[name=scheduleContent]").val("");
			
			// $("#startDate").datepicker("destroy");
			 
			 $("#endDate").data('datepicker').clear();
			 
			 $("#startTime").timepicker( "remove" );
			
			 $("#endTime").timepicker( "remove" );
			 
			 if($("#allDay").is(":checked")){
				
				$('#allDay').click();
			 }
			
			 $("#insertSchedule .editSchedule").text("");
			 $("#insertSchedule .editSchedule").append("<i class='fas fa-map-marker-alt'>지도에서 선택</i>");
			 $('#scheduleLabelColor').val('#DE1D6A');
			$('#scheduleLabelColor').css("background","#DE1D6A");
			 
			 toEditTarget=undefined;
			 
			 
			
		});
		
		
		$('#endTime').on("change",function(){
			
			if($('#startTime').timepicker('getSecondsFromMidnight')>$('#endTime').timepicker('getSecondsFromMidnight'))
			{
				if($("#startDate").datepicker('getDate').val() == $("#endDate").datepicker('getDate').val()){					
					alert("종료 시간은 시작 시간 이후여야 합니다 다시 설정해주세요.");
					$('#endTime').val("");
					$('#endTime').timepicker("hide");
				}
				return;
				
			}else{

				if($('#endDate').datepicker("getDate")==null){
					
					$('#endDate').datepicker("setDate",getDate($('#startDate')));
				}
			}
	
		});

		$('#endDate').on("change",function(){
			
			var date = new Date();
			if(date.getMinutes()>30){
				date.setMinutes(0);
				date.setHours(date.getHours()+1);
			}
			else
				date.setMinutes(30);
			
			if($('#endTime').timepicker("getTime")==null){
				$('#endTime').timepicker("setTime",(date));
			}
			
		});
		
		$('#scheduleLabelColor').on("change",function(){
		
			$(this).css("background",$(this).find("option:selected").val());
		});
		
		
		$('#allDay').on("change",function(){
			
			if($(this).is(":checked")){
				$('#endTime').attr("disabled","true");
				$('#startTime').attr("disabled","true");
				
				$(this).val('Y');
				
			}
			else{
				
				$(this).val('N');
				$('#startTime').removeAttr("disabled");
				$('#endTime').removeAttr("disabled");
				
			}
			
			
		});
		

	function getDate( element ) {
	      var date;
	      
	      try {
	    	 
	        date = $.datepicker.parseDate("yy.mm.dd", $(element).val());
	       
	      } catch( error ) {
	        date = null;
	      }
	 
	      return date;
	 }
	

	 function closeScheduleModal(){
		 $('#insertSchedule').modal("hide");

	 }
	 
	 function openScheduleMapModal(obj){
		 toEditTarget = obj;
		
		 toggleMapModal();
	 }
	 
	 
	

</script>