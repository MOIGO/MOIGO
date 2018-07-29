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
								<strong class="mr-5" >위치</strong><button type="button" class='btn btn-link editSchedule' onclick="openScheduleMapModal(this);"><i class="fas fa-map-marker-alt">지도에서 선택</i></button>
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
									<input class="form-check-input" type="checkbox" id="allDay" value="N">
									<label class="form-check-label" for="allDay">하루 종일</label>
								</div>
							</div>
						</div>
						
					</div>
					
					</div>
				</div>
			
				<div class="modal-footer">
		 
		        <button type="button" onclick="" class="btn btn-primary btn-block">첨부 하기</button>
		      </div>
			</form>
		</div>
	</div>
</div>

</div>

<script>
	function toggleScheduleModal(){

		 $('#insertSchedule').modal("toggle");	    
	}
	
	function editSchedule(scheduleNo){
		
		toggleScheduleModal();
		
		$('#insertSchedule').find(".modal-footer button").unbind();
		$('#insertSchedule').find(".modal-footer button").on("click",updateSchedule);
		
		getOneSchedule(scheduleNo);
		
		
	
	}
	
	function getOneSchedule(scheduleNo){
	 	$.ajax({
			url:"${pageContext.request.contextPath}/groups/selectOneSchedule.gp",
			data:{	scheduleNo:scheduleNo}
				,success:(function(data){
					if(data!=null){
						
						setTargetScheduleData(data.schedule);
					}else
						alert("일정을 불러오는 과정에서 문제가 생겼습니다.");
				
				}),error:(function(data){
					
				})
	
			}); 
	}
	
	function setTargetScheduleData(obj){
		
		
		$('#insertSchedule').find("[name=scheduleName]").val(obj.scheduleName);
		$('#insertSchedule').find("[name=scheduleContent]").val(obj.scheduleContent);
		if(obj.scheduleAddress!=null)
			$("#insertSchedule .editSchedule .fas").text(obj.scheduleAddress);
		else
			$("#insertSchedule .editSchedule .fas").text("지도에서 선택");
		
		
		milisecToDate(obj.startTime);
		
		$('#startTime').timepicker("setTime",milisecToDate(obj.startTime));
		$('#startDate').datepicker("setDate",milisecToDate(obj.startTime));
		
		
		if(obj.endTime!=null){
			$('#endTime').timepicker("setTime",milisecToDate(obj.endTime));
			$('#endDate').datepicker("setDate",milisecToDate(obj.endTime));
		}else{
			$('#endTime').timepicker("setTime",null);
			$('#endDate').datepicker("setDate",null);
		}
		
		 if(obj.allDay=='Y'){
			 $('#allDay').click();
		 }
		
		$('#scheduleLabelColor').val(obj.colorLabel);
		
		
	}

	function getTimesFromInput(){
		var startDate = parseDateAndTime($('#startDate'),$('#startTime'));
		 
		var endDates;
		var endTimes;
		var endDate =null;
		
		var timeString = getTimeToString(startDate); 
		
		if($('#endDate').val().length>0&&$('#endTime').val().length>0){
			
			var endDate = parseDateAndTime($('#endDate'),$('#endTime'));
			
			timeString+=" - " +getTimeToString(endDate);
			endDate = endDate.getTime();
			
		}else{
			endDate="none";
		}
		
		return {"startTime":startDate.getTime(),"endTime":endDate,"timeString":timeString};
		
	}
	
	
	function updateSchedule(){
		
		
		
		var times=  getTimesFromInput();
		
	  	$.ajax({
			url:"${pageContext.request.contextPath}/groups/updateSchedule.gp",
			data:{	scheduleNo:$(toEditTarget).find('[name=scheduleNo]').val(),
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
						editScheduleOnSummerNote(data.schedule);
						$('#insertSchedule').modal('hide');
					}
					else
						alert("일정 수정에 실패하였습니다.");
					
					
					closeScheduleModal();
					
				}),error:(function(data){
					
				})
	
			});
	}
	
	function parseDateAndTime(dateObj,timeObj){
		var dates = ($(dateObj).val()).split(".");
		var times = ($(timeObj).val()).split(":");
		
		return new Date(dates[0],(parseInt(dates[1])-1),dates[2],times[0],times[1],(new Date()).getSeconds(),0); 
		
	}
	
	function editScheduleOnSummerNote(){
		
		var startDate = parseDateAndTime($('#startDate'),$('#startTime'));	
		
		var times = getTimesFromInput();
		
		$(toEditTarget).find('[name=day]').text(startDate.getDate());
		$(toEditTarget).find('[name=dayofweek]').text(getDayToKor(startDate.getDay()));
		$(toEditTarget).find('.scheduleName').text($('#insertSchedule input[name=scheduleName]').val());
		$(toEditTarget).find('.scheduleTime').text(times.timeString);

	}

	function addScheduleOnSummerNote(scheduleObj){
		
		var startDate = parseDateAndTime($('#startDate'),$('#startTime'));
	
		var times=  getTimesFromInput();
		var $mapDiv = $('<div class="card" name="editScheduleWrap" style="border:3px solid black;" contenteditable="false" onclick="">');
		var $scheduleNo=$('<input type="hidden" name="scheduleNo" value="'+scheduleObj.scheduleNo+'">');
		var $mapBody = $('<div class="card-body">');
		var $mapRow = $('<div class="row">');
		var $mapCol2 = $('<div class="col-2">');
		var $mapCol10 = $('<div class="col-10">');
		var $col10Row = $('<div class="row">');
		var $col10RowCol1 =$('<div class="col-12 map_address scheduleName">'+scheduleObj.scheduleName+'</div>');
		
		var $mapCol2Day =$('<div name="day" style="text-align:center;font-weight:700; font-size:2.0em; margin-top:-10px;">'+startDate.getDate()+'</div>');
		var $mapCol2Dow =$('<div name="dayofweek" style="text-align:center;color:blue; margin-top:-10px;">'+getDayToKor(startDate.getDay())+'</div>');
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
		
		
		
		$btn_edit.on("click",function(){
			toEditTarget=$mapDiv;
			
			editSchedule(scheduleObj.scheduleNo);
			
		});
		
		$btn_del.on("click",function(){
	
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
		
		$('#summernote').summernote('insertNode', $mapDiv[0]);
		
	}
	
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
	
	function deleteScehduleFromNote(obj){

		$(obj).closest('[name=editScheduleWrap]').remove();	
	}
	
	function milisecToDate(milisecondData){
		
		var date = new Date(milisecondData);
		
		return date;
	}
	
	function getTimeToString(dateObj){
		
		
		return dateObj.getFullYear()+"년 "+(parseInt(dateObj.getMonth())+1)+"월 "+dateObj.getDate()+"일 "+dateObj.getHours()+":"+dateObj.getMinutes();
	}
	
	function getDayToKor(day){
		
		
		var days = ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'];
		
		return days[day];
		
	}

	function insertSchedule(){
		 
		
		if(!$('#insertSchedule input[name=scheduleName]').val()){
			alert("일정 제목은 필수 입력 사항입니다.");
			return;
		}
		
		var times=  getTimesFromInput();
		console.log(times);
		
	 	$.ajax({
			url:"${pageContext.request.contextPath}/groups/insertSchedule.gp",
			data:{	groupNo:"${param.groupNo}",
					scheduleName:$('#insertSchedule input[name=scheduleName]').val(),
					scheduleContent:$('#insertSchedule textarea').val(),
					scheduleAddress:$('#insertSchedule input[name=scheduleAddress]').val(),
					startT:times.startTime,
					endT:times.endTime,
					memberNo:'${param.memberNo}',
					allDay:$('#allDay').val(),
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
			$('#endDate').datepicker("option","minDate",getDate(this));
		});
		
		$('#endDate').on("change",function(){
			if($('#endDate').datepicker("getDate")<$('#startDate').datepicker("getDate")){
				alert("종료 날짜는 시작 날짜 이후여야 합니다 다시 설정해주세요.");
				$('#endDate').val("");
				$('#endDate').datepicker("hide");
			}
		});
		
		
		$('#insertSchedule').on('hide.bs.modal',function(){
			$('#insertSchedule').find("[name=scheduleName]").val("");
			$('#insertSchedule').find("[name=scheduleContent]").val("");
			
			$("#startDate").datepicker( "destroy" );
			 
			 $("#endDate").datepicker( "destroy" );
			 
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
			
			var date = new Date();
			if(date.getMinutes()>30){
				date.setMinutes(0);
				date.setHours(date.getHours()+1);
			}
			else
				date.setMinutes(30);
			
			if($('#endTime').timepicker("getTime")==null&&
					$('#endDate').datepicker("getDate")>$('#startDate').datepicker("getDate")){
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