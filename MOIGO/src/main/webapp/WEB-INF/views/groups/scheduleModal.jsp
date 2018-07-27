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
	function insertSchedule(){
		 
		var startDate = ($('#startDate').val()).split(".");
		var startTime = ($('#startTime').val()).split(":");
		var endDate= ($('#endDate').val()).split(".");
		var endTime = ($('#endTime').val()).split(":");
		 
		
		var startDate = new Date(startDate[0],startDate[1],startDate[2],startTime[0],startTime[1],(new Date()).getSeconds(),0);
		var endDate = new Date(endDate[0],endDate[1],endDate[2],endTime[0],endTime[1],0,0);
		
		/*
		console.log(startDate);
		console.log(endDate);
		console.log(startDate +"   "+startTime);
		console.log(endDate +"   "+endTime );
		console.log("${param.groupNo}"+"groupNo");
		console.log("${param.memberNo}"+"memberNo");
		console.log("scheduleName="+"     "+$('#insertSchedule input[name=scheduleName]').val());
		console.log("scheduleContent="+"     "+$('#insertSchedule textarea').val());
		console.log("scheduleAddress="+"     "+$('#insertSchedule input[name=scheduleAddress]').val());
		console.log("scheduleLabelColor="+"     "+$('#scheduleLabelColor option:selected').val()); */
		
		
		$.ajax({
			url:"${pageContext.request.contextPath}/groups/insertSchedule.gp",
			data:{	groupNo:"${param.groupNo}",
					scheduleName:$('#insertSchedule input[name=scheduleName]').val(),
					scheduleContent:$('#insertSchedule textarea').val(),
					scheduleAddress:$('#scheduleLabelColor option:selected').val(),
					startT:startDate,
					endT:endDate,
					memberNo:'${param.memberNo}',
					colorLabel:$('#scheduleLabelColor option:selected').val()
				},success:(function(data){
					
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
					console.log(getDate($('#startDate')));
					$('#endDate').datepicker("setDate",getDate($('#startDate')));
				}
			}
	
		});

		$('#endDate').on("change",function(){
			
			console.log($('#endTime').val());
			if($('#endTime').timepicker("getTime")==null){
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