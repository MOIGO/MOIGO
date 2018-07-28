<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
 <script src="${pageContext.request.contextPath}/resources/js/groups/jquery.timepicker.js" ></script>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/groups/jquery.timepicker.css" />
<script src="${pageContext.request.contextPath}/resources/js/groups/datepicker-ko.js" ></script>
<style>

.modalSize_schedule{
	max-width:30%;
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
								<strong >위치</strong><button type="button" class='btn btn-link editSchedule' onclick="openScheduleMapModal(this);"><i class="fas fa-map-marker-alt">지도에서 선택</i></button>
								<input type="hidden" name="scheduleAddress" value=""/>
							</div>
						</div>
					</div>
					<div class="mt-2">
						<div class="row">
							<div class="col-2"><strong>시작</strong></div>
							<div class="col-5"><input type="text" id="startDate" name="startDate" class="form-control"/></div>
							<div class="col-5"><input type="text" id="startTime"  name="startTime" class="form-control" /></div>
						</div>
					</div>
					
					<div class="mt-2">
						<div class="row">
							<div class="col-2"><strong>종료</strong></div>
							<div class="col-5"><input type="text" id="endDate" name="endDate" placeholder="선택" class="form-control"/></div>
							<div class="col-5"><input type="text" id="endTime" name="endTime" placeholder="선택"  class="form-control" /></div>
						</div>
					</div>
					
					<div class="mt-2">
						<div class="row align-items-center">
							<div class="col-2"><strong>라벨 색</strong></div>
							<div class="col-5">
								<select name="colorLabel" id="scheduleLabelColor" class="form-control">
									<option value="#FFFFFF" style="background:#FFFFFF;">      </option>
									<option value="#FF0000" style="background:#FF0000;">      </option>
									<option value="#FF8000" style="background:#FF8000;">      </option>
									<option value="#FFFF00" style="background:#FFFF00;">      </option>
									<option value="#00FF00" style="background:#00FF00;">      </option>
									<option value="#0000FF" style="background:#0000FF;">      </option>
									<option value="#3A01DF" style="background:#3A01DF;">      </option>
									<option value="#A901DB" style="background:#A901DB;">      </option>
								</select>
							
							</div>
							<div class="col-5">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" id="allDay" value="Y">
									<label class="form-check-label" for="allDay">하루 종일</label>
								</div>
							</div>
						</div>
						
					</div>
					
					</div>
				</div>
			
				<div class="modal-footer">
		 
		        <button type="button" onclick="insertSchedule();" class="btn btn-primary btn-block">첨부 하기</button>
		      </div>
			</form>
		</div>
	</div>
</div>

</div>

<script>
	function addScheduleOnSummerNote(scheduleObj){
		
		var startTime= milisecToDate(scheduleObj.startTime);
		var endTime="";
		
		var timeString =getTimeToString(startTime);
		
		console.log(startTime);
		
		if(scheduleObj.endTime!=null){
			endTime=milisecToDate(scheduleObj.endTime);
			timeString+= " - "+getTimeToString(endTime);
		}
		
		
		
		var $mapDiv = $('<div class="card" name="editScheduleWrap" style="border:3px solid black;" contenteditable="false" onclick="">');
		var $mapBody = $('<div class="card-body">');
		var $mapRow = $('<div class="row">');
		var $mapCol2 = $('<div class="col-2">');
		var $mapCol10 = $('<div class="col-10">');
		var $col10Row = $('<div class="row">');
		var $col10RowCol1 =$('<div class="col-12 map_address scheduleName">'+scheduleObj.scheduleName+'</div>');
		
		var $mapCol2Day =$('<div style="font-weight:700; font-size:1.2em">'+startTime.getDate()+'</div>');
		var $mapCol2Dow =$('<div style="color:blue;">'+getDayToKor(startTime.getDay())+'</div>');
		var $col10RowCol2 =$('<div class="col-12 map_address scheduleTime">'+timeString+'</div>');
		
		
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
	
	function milisecToDate(milisecondData){
		
		var date = new Date(milisecondData);
		
		return date;
	}
	
	function getTimeToString(dateObj){
		
		
		return dateObj.getFullYear()+"년 "+dateObj.getMonth()+"월 "+dateObj.getDate()+"일 "+dateObj.getHours()+":"+dateObj.getMinutes();
	}
	
	function getDayToKor(day){
		
		console.log("day " + day);
		var days = ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'];
		
		return days[day];
		
	}

	function insertSchedule(){
		 
		
		if(!$('#insertSchedule input[name=scheduleName]').val()){
			alert("일정 제목은 필수 입력 사항입니다.");
			return;
		}
		
		var startDates = ($('#startDate').val()).split(".");
		var startTimes = ($('#startTime').val()).split(":");
		var startDate = new Date(startDates[0],(parseInt(startDates[1])-1),startDates[2],startTimes[0],startTimes[1],(new Date()).getSeconds(),0);
		
		var endDates;
		var endTimes;
		var endDate ;
		
		if($('#endDate').val()!=null&&$('#endTime').val()!=null){
			endDates= ($('#endDate').val()).split(".");
			endTimes = ($('#endTime').val()).split(":");
			endDate = new Date(endDates[0],(parseInt(endDates[1])-1),endDates[2],endTimes[0],endTimes[1],0,0);
		}
		
		
		
	 	$.ajax({
			url:"${pageContext.request.contextPath}/groups/insertSchedule.gp",
			data:{	groupNo:"${param.groupNo}",
					scheduleName:$('#insertSchedule input[name=scheduleName]').val(),
					scheduleContent:$('#insertSchedule textarea').val(),
					scheduleAddress:$('#insertSchedule input[name=scheduleAddress]').val(),
					startT:startDate.getTime(),
					endT:endDate.getTime(),
					memberNo:'${param.memberNo}',
					colorLabel:$('#scheduleLabelColor option:selected').val()
				},success:(function(data){
					
					if(data.result>0){
						alert("일정 입력에 성공하였습니다.");
						addScheduleOnSummerNote(data.schedule);
					}
					else
						alert("일정 입력에 실패하였습니다.");
					
					
					closeScheduleModal();
					
				}),error:(function(data){
					
				})
	
			}); 
	}

	$(function(){
		
		$('#insertSchedule').on('shown.bs.modal',function(){
			$('#startDate').datepicker({showButtonPanel: true, 
		         closeText: '닫기', 
		         dateFormat: "yy.mm.dd"});
		
			$('#endDate').datepicker({showButtonPanel: true, 
		         closeText: '닫기', 
		         dateFormat: "yy.mm.dd"});
	
			$('#startTime').timepicker();
			$('#endTime').timepicker();
			
			$('#startTime').timepicker({ timeFormat:"H:i",lang: {am:'오전', pm:'오후',AM:'오전', PM:'오후'},step:30});
			$('#endTime').timepicker({ timeFormat:"H:i",lang: {am:'오전', pm:'오후',AM:'오전', PM:'오후'},step:30});
			$('#startTime').timepicker("setTime",new Date());
			$('#startDate').datepicker("setDate",new Date());
			$('#endTime').timepicker("setTime",null);
			$('#endDate').datepicker("setDate",null);
	
		});
		
	});
		
		$('#startDate').on("change",function(){
			$('#endDate').datepicker("option","minDate",getDate(this));
		});
		
		$('#endDate').on("change",function(){
			if($('#endDate').datepicker("getDate")<$('#startDate').datepicker("getDate")){
				alert("종료 날짜는 시작 날짜 이후여야 합니다 다시 설정해주세요.");
				$('#endDate').val("");
				$('#endDate').datepicker("hide");
			}
		});
		
		
		$('#endTime').on("change",function(){
			
			
			if($('#startTime').timepicker('getSecondsFromMidnight')>$('#endTime').timepicker('getSecondsFromMidnight'))
			{
				alert("종료 시간은 시작 시간 이후여야 합니다 다시 설정해주세요.");
				$('#endTime').val("");
				$('#endTime').timepicker("hide");
				return;
			}else{

				if($('#endDate').datepicker("getDate")==null){
					
					$('#endDate').datepicker("setDate",getDate($('#startDate')));
				}
			}
	
		});

		$('#endDate').on("change",function(){
			
			
			if($('#endTime').timepicker("getTime")==null&&
					$('#endDate').datepicker("getDate")>$('#startDate').datepicker("getDate")){
				$('#endTime').timepicker("setTime",(new Date()));
			}
			
		});
		
		$('#scheduleLabelColor').on("change",function(){
		
			$(this).css("background",$(this).find("option:selected").val());
		});
		
		
		$('#allDay').on("change",function(){
			
			if($(this).is(":checked")){
				$('#endTime').attr("disabled","true");
				$( "#endDate" ).datepicker( "disable" );
				$("#endDate").datepicker("setDate",null);
				$("#endTime").timepicker("setTime",null);
				
			}
			else{
				$( "#endDate" ).datepicker( "enable");
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
		 
		 $("#startDate").datepicker( "destroy" );
		 
		 $("#endDate").datepicker( "destroy" );
		 
		 $("#startTime").timepicker( "remove" );
		
		 $("#endTime").timepicker( "remove" );
		 
		 $("#insertSchedule .editSchedule").text("");
		 $("#insertSchedule .editSchedule").append("<i class='fas fa-map-marker-alt'>지도에서 선택</i>");
		

	 }
	 
	 function openScheduleMapModal(obj){
		 toEditTarget = obj;
		 
		 console.log(toEditTarget);
		 toggleMapModal();
	 }
	 
	

</script>