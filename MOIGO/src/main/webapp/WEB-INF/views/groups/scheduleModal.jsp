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
					<button type="button" class="close" data-dismiss="modal"aria-label="Close" onclick="closeScheduleModal();">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="d-flex flex-column">
						<input id="scheduleTitle" type="text" name="scheduleName" maxlength="250" class="form-control mb-3" placeholder="일정 제목"/>
						<textarea name="scheduleContent" class="form-control" id="scheduleContent" cols="10" rows="2" style="resize:none;" placeholder="일정 설명"></textarea>
						
						<div class="mt-2">
							<strong >위치</strong><button type="button" class='btn btn-link'>지도에서 선택</button>
						</div>
						<div class="mt-2">
							<div class="row">
								<div class="col-2"><strong>시작</strong></div>
								<div class="col-5"><input type="text" id="startDate" class="form-control"/></div>
								<div class="col-5"><input type="text" id="startTime" class="form-control" /></div>
							</div>
						</div>
						
						<div class="mt-2">
							<div class="row">
								<div class="col-2"><strong>종료</strong></div>
								<div class="col-5"><input type="text" id="endDate" class="form-control"/></div>
								<div class="col-5"><input type="text" id="endTime" class="form-control" /></div>
							</div>
						</div>
						</div>
					
				</div>
			</div>
		</div>
</div>

</div>

<script>
	$(function(){
		
		$('#insertSchedule').on('shown.bs.modal',function(){
			$('#startDate').datepicker({showButtonPanel: true, 
		         closeText: '닫기', 
		         dateFormat: "yy.mm.dd"});
		
			$('#endDate').datepicker({showButtonPanel: true, 
		         closeText: '닫기', 
		         dateFormat: "yy.mm.dd"});
			
			$('#startDate').datepicker("setDate",new Date());
			
			$('#startDate').on("change",function(){
				$('#endDate').datepicker("option","minDate",getDate(this));
			});
			$('#endDate').on("change",function(){
				$('#startDate').datepicker("setDate",getDate(this));
			});
		
			
			$('#startTime').timepicker();
			$('#startTime').timepicker('setTime',new Date());
			$('#endTime').timepicker();
		});
	
		
		
		
		
		
		
	});
	
	 function getDate( element ) {
	      var date;
	      
	      try {
	    	 
	        date = $.datepicker.parseDate( "yy.mm.dd", element.value );
	        console.log(date);
	      } catch( error ) {
	        date = null;
	      }
	 
	      return date;
	 }
	 
	 function closeScheduleModal(){
			
		 $( "#startDate" ).datepicker( "destroy" );
		 $( "#endDate" ).datepicker( "destroy" );
	 }

</script>