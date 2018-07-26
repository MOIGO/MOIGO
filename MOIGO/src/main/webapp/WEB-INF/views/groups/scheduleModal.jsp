<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d862551bbf9771ee59207808ec1876ca&libraries=services,clusterer,drawing"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
 
<style>


</style>

<div id="insertScheduleModalWrapper"> 

<div class="modal" id="insertSchedule" tabindex="-1"role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">일정 만들기</h5>
					<button type="button" class="close" data-dismiss="modal"aria-label="Close">
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
						<div class="flex-fill">
							<strong>시작일자</strong>
							<input type="text" id="startDate" class="form-control"/>
							<input type="text" id="startTime" class="form-control" />
						</div>
					</div>
					
				
				</div>
			</div>
		</div>
</div>

</div>

<script>
	$(function(){
		$('#startDate').datepicker();
		$('#startTime').timepicker({
		});
	});

</script>