<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="${root}/resources/js/groups/jquery.timepicker.js" ></script>
<link rel="stylesheet" href="${root}/resources/css/groups/jquery.timepicker.css" />
<link rel="stylesheet" href="${root}/resources/css/groups/datepicker.min.css">
<script src="${root}/resources/js/groups/datepicker.min.js"></script>
<style>

.modalSize_schedule{
	max-width:30%;
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
					<input id="scheduleTitle" type="text" name="scheduleName" maxlength="250" class="form-control mb-3" placeholder="일정 제목" required/>
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
									<option value="#DE1D6A" style="background:#DE1D6A;" selected>      </option>
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
			<!-- <div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">일정 만들기</h5>
				<button type="button" class="close" data-dismiss="modal"aria-label="Close" onclick="closeScheduleModal()">
					<span aria-hidden="true">&times;</span>
				</button>
			</div> -->
			
			<div class="modal-body">
				<div class="card">
				  <div class="card-header">
				    <div class="container">
				    	<div class="row justify-content-start">
				    		<div class="col-2">
				    			<input type="hidden" id="scheduleWriter" value=""/>
				    			<div>
				    				<span class="day" ></span><br>
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
				    				<div class="dropdown">
				    					<button class="btn btn-link" type="button" id="scheduleViewDropDown" data-toggle="dropdown" >
				    						<i class="fas fa-ellipsis-v"></i>
				    					</button>
				    					<div class="dropdown-menu">
				    						<a href="" class="dropdown-item">수정</a>
				    						<a href="" class="dropdown-item">삭제</a>
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
		
		$('#viewSchedule').modal("toggle");
		makeScheduleMapView();
	
		getOneSchedule(scheduleNo,setScheduleViewModal);
	
	
	}
	
	function setMemberNameOnView(memberNo){
		
		$.ajax({
			url:"${pageContext.request.contextPath}/groups/selectOneGrpMem.gp",
			data:{	memberNo:memberNo,
					groupNo:'${groupNo}'}
				,success:(function(data){
					if(data!=null){
						$('#viewSchedule').find(".memberName").text(data.groupMember.memberName);
						$('#scheduleWriter').val(data.groupMember.memberNo);	
						
						
						if($('#scheduleWriter').val()!='${m.memberNo}'){
							
							$('#viewSchedule .dropdown').css("display","none");
						}else{
							$('#viewSchedule .dropdown').css("display","block");
						}
						
						
						/* 
						$('# .dropdown-menu a').eq(0).on("click",function(){
							alert("들어옴");
							editSchedule(undefined,scheduleNo);
						});
						
						$('.dropdown-menu a').eq(1).on("click",function(){
							deleteSchedule(scheduleNo,undefined);
						});
						 */
						
					}else 
						alert("일정을 불러오는 과정에서 문제가 생겼습니다.");
				
				}),error:(function(data){
					
				})
	
			}); 
		
	}
	
	function getOneSchedule2(scheduleNo){
		
		var scheduleData;
		$.ajax({
			url:"${pageContext.request.contextPath}/groups/selectOneSchedule.gp",
			data:{	scheduleNo:scheduleNo}
				,success:(function(data){
					if(data!=null){
						//console.log(data);
						scheduleData= data.schedule;
						return scheduleData;
					}else
						alert("일정을 불러오는 과정에서 문제가 생겼습니다.");
				
				}),error:(function(data){
					
				})
	
			});		
		return scheduleData;
	}
	
	
	
	function makeScheduleViewDropDown(scheduleNo){
		$dropDownWrapper =$("<div>");
		
		var $dropDown =$('<div class="dropdown">');
		var $dropDownBtn=$('<button class="btn btn-link" type="button" id="scheduleViewDropDown" data-toggle="dropdown"><i class="fas fa-ellipsis-v"></i></button>');
		var $dropDownMenu=$('<div class="dropdown-menu">');
		
		var $dropDownItem1;
		var $dropDownItem2;
		
		
			$dropDownItem1=$("<a class='dropdown-item' >수정</a>");
			$dropDownItem2=$("<a class='dropdown-item' >삭제</a>");
	
			$dropDownMenu.append($dropDownItem1);
			$dropDownMenu.append($dropDownItem2);
			
			
			$dropDownItem1.on("click",function(){
				editSchedule(undefined,scheduleNo);
			});
			
			
			$dropDownItem2.on("click",function(){
				deleteSchedule(scheduleNo,undefined);
			});

		$dropDown.append($dropDownBtn);
		$dropDown.append($dropDownMenu);
		$dropDownWrapper.append($dropDown);
		
		return $dropDownWrapper;
		
	}
	
	function setScheduleViewModal(obj){
		
		
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
		 $('#insertSchedule').modal("toggle");
	}
	
	function editSchedule(toEditObj,scheduleNo){
    
		toggleScheduleModal();
		
		$('#insertSchedule').find(".modal-footer button").unbind();
		$('#insertSchedule').find(".modal-footer button").on("click",function(){
			updateSchedule(toEditObj,scheduleNo);	
		});

		getOneSchedule(scheduleNo,setTargetScheduleData);

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
	
	function setTargetScheduleData(obj){
		
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
		}else{
			$('#endTime').timepicker("setTime",null);
			$('#endDate').datepicker("setDate",null);
		}
		
		 if(obj.allDay=='Y'){
			 $('#allDay').click();
		 }
		
		$('#scheduleLabelColor').val(obj.colorLabel).prop("selected", true);
		
		
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
	
	
	/*스케줄 업데이트  */
	function updateSchedule(toEditObj,scheduleNo){
		
		var sNO;
		if(typeof(toEditObj)!='undefined'){
			sNO =$(toEditObj).find("input[name=scheduleNo]").val();
		}else
			sNO=scheduleNo;
		
		var times=  getTimesFromInput();

	  	$.ajax({
			url:"${pageContext.request.contextPath}/groups/updateSchedule.gp",
			data:{	scheduleNo:sNO,
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
						
						if(typeof(toEditObj)!='undefined')
							editScheduleOnSummerNote(data.schedule,toEditObj);
							
						$('#insertSchedule').modal('hide');
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
	
	/*섬머노트에 올라가 있는 스케줄 엘리먼트 정보 수정  */
	function editScheduleOnSummerNote(scheduleObj,toEditObj){
		console.log(scheduleObj.endTime);
		
		var timeString = getTimeToString(milisecToDate(scheduleObj.startTime));
		if(scheduleObj.endTime!=null)
			timeString += " - "+getTimeToString(milisecToDate(scheduleObj.endTime));
		
		
		$(toEditObj).find('[name=day]').text(milisecToDate(scheduleObj.startTime).getDate());
		$(toEditObj).find('[name=dayofweek]').text(getDayToKor(milisecToDate(scheduleObj.startTime).getDay()));
		$(toEditObj).find('.scheduleName').text(scheduleObj.scheduleName);
		$(toEditObj).find('.scheduleTime').text(timeString);

	}

	/*섬머노트에 스케줄 엘리먼트 추가  */
	function addScheduleOnSummerNote(scheduleObj){
		
		var startDate = parseDateAndTime($('#startDate'),$('#startTime'));
	
		var times=  getTimesFromInput();
		var $mapDiv = $('<div class="card" name="editScheduleWrap" style="border:3px solid black;" contenteditable="false" onclick="openScheduleViewModal('+"'"+scheduleObj.scheduleNo+"'"+')">');
		var $scheduleNo=$('<input type="hidden" name="scheduleNo" value="'+scheduleObj.scheduleNo+'">');
		var $mapBody = $('<div style="cursor:pointer;" class="card-body">');
		var $mapRow = $('<div class="row">');
		var $mapCol2 = $('<div class="col-2">');
		var $mapCol10 = $('<div class="col-10">');
		var $col10Row = $('<div class="row">');
		var $col10RowCol1 =$('<div class="col-12 map_address scheduleName">'+scheduleObj.scheduleName+'</div>');
		
	
		
		var $mapCol2Day =$('<div name="day" style="text-align:center;font-weight:700; font-size:2.0em; margin-top:-10px;">'+startDate.getDate()+'</div>');
		
		
		console.log(milisecToDate(scheduleObj.startTime).getDay());
		if(milisecToDate(scheduleObj.startTime).getDay()==0)
			$mapCol2Day.css("color","red");
		else if(milisecToDate(scheduleObj.startTime).getDay()==7)
			$mapCol2Day.css("color","blue");
		else
			$mapCol2Day.css("color","black");
		
		var $mapCol2Dow =$('<div name="dayofweek" style="text-align:center; margin-top:-10px;">'+getDayToKor(startDate.getDay())+'</div>');
		var $col10RowCol2 =$('<div class="col-12 map_address scheduleTime">'+times.timeString+'</div>');
		
		
		var $btnWrapper = $('<div class="map_btn_wrapper float-right">');
		var $btn_edit =$('<button class="btn btn-primary mr-3" name="editBtn">수정</button>');
		var $btn_del =$('<button class="btn btn-info" name="delBtn">삭제</button>');
		
		$mapCol2.append($mapCol2Day);
		$mapCol2.append($mapCol2Dow);
		
		$btnWrapper.append($btn_edit);
		$btnWrapper.append($btn_del);
		
		
		$col10Row.append($col10RowCol1);
		$col10Row.append($col10RowCol2);
		$mapCol10.append($col10Row);
		$mapRow.append($mapCol2);
		$col10Row.append($btnWrapper);
		$mapRow.append($mapCol10);
		$mapBody.append($scheduleNo);
		$mapBody.append($mapRow);
		$mapDiv.append($mapBody);
		
		
		
		$btn_edit.on("click",function(event){
			
		
			editSchedule($mapDiv,scheduleObj.scheduleNo);
			event.stopPropagation();
			
		});
		
		$btn_del.on("click",function(event){
			
			event.stopPropagation();
			if(confirm("일정을 삭제 하시겠습니까?")){
				deleteSchedule(scheduleObj.scheduleNo,$mapDiv);
			}
				
			
		});
		
		
		$mapDiv.on('mouseover',function(){
			$(this).css('border','3px solid #00bfff');
			
			$(this).find('.map_btn_wrapper').css("visibility","visible");
			
			
		}).on('mouseout',function(){
			
			$(this).css('border','3px solid black');
			
			$(this).find('.map_btn_wrapper').css("visibility","hidden");
		});
		
		
		if($('#postEdit').find(".note-editor").length>0)
			$('#summernote').summernote('insertNode', $mapDiv[0]);
		
	}
	
	/*스케줄 삭제  */
	function deleteSchedule(scheduleNo,deleteObj){
		$.ajax({
			url:"${pageContext.request.contextPath}/groups/deleteSchedule.gp",
			data:{	scheduleNo:scheduleNo},
			success:(function(data){
					
					if(data.result>0){
						alert("일정 삭제에 성공하였습니다.");
						if(typeof(deleteObj)!='undefined')
							deleteScehduleFromNote(deleteObj);
					}
					else
						alert("일정 삭제에 실패하였습니다.");
				}),error:(function(data){
					alert("삭제 ajax 에러");
				})
	
			}); 
		
	}
	
	/*섬머노트에 올라가있는 스케줄 객체 삭제  */
	function deleteScehduleFromNote(obj){

		$(obj).closest('[name=editScheduleWrap]').remove();	
	}
	
	/*밀리세컨드를 data 객체로 가져오기  */
	function milisecToDate(milisecondData){
		
		var date = new Date(milisecondData);
		
		return date;
	}
	
	/*date객체를 년월일 스트링으로 바꾸기  */
	function getTimeToString(dateObj){
		
		
		return dateObj.getFullYear()+"년 "+(parseInt(dateObj.getMonth())+1)+"월 "+dateObj.getDate()+"일 "+dateObj.getHours()+":"+dateObj.getMinutes();
	}
	
	/*dow를 요일로 바꾸기  */
	function getDayToKor(day){
		
		
		var days = ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'];
		
		return days[day];
		
	}

	/*스케줄 DB에 넣기  */
	function insertSchedule(){
		 
		
		if(!$('#insertSchedule input[name=scheduleName]').val()){
			alert("일정 제목은 필수 입력 사항입니다.");
			return;
		}
		
		var times=  getTimesFromInput();
		
	 	$.ajax({
			url:"${pageContext.request.contextPath}/groups/insertSchedule.gp",
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

						if($("#scheduleConfirmBtn").hasClass("call_schedule")){
							$("#scheduleConfirmBtn").removeClass("call_schedule");
							location.reload();
						}
						else	
							addScheduleOnSummerNote(data.schedule);

					}
					else
						alert("일정 입력에 실패하였습니다.");
					
					
					closeScheduleModal();
					
				}),error:(function(data){
					
				})
	
			}); 
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
			$(this).find(".modal-footer button").on("click",insertSchedule);
	
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
			 
			 $("#scheduleLabelColor").find('option:eq(0)').prop('selected', true);
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