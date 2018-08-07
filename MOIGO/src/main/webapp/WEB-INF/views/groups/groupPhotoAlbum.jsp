<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="${root}/resources/js/groups/jquery.ui.widget.js" ></script>
<script src="${root}/resources/js/groups/jquery.iframe-transport.js" ></script>
<script src="${root}/resources/js/groups/jquery.fileupload.js" ></script>
<link rel="stylesheet" href="${root}/resources/css/groups/datepicker.min.css">
<script src="${root}/resources/js/groups/datepicker.min.js"></script>
<style>

   body{
      background: #EDEFF2;
   }
   
   .card, .card-header{
   		background:white;
   }
   
	.group_tit {
		float : left;
		margin-bottom: 0px;
		font-family: 'nanum-barun-gothic-bold', sans-serif;
		font-size: 1.3em;
	}

	.group_tit:hover {
	cursor: default;
	}
	
	.btn:focus, .btn:active:focus, .btn.active:focus {
   		box-shadow: none !important;
   		outline: none !important;
	}
	
	/* 사진첩 부분 */
	.photo_body {
		padding : 0em;
		padding-bottom : 10px;
	}
	
	.gpa_btn_wrap {
		float : right;
	}
	
	#photoUploadBtn {
		margin-right: 3px;
	}
	
	#photoDropzone {
		display : none;
		margin : 20px;
		height : 200px;
		border : 2px dashed #007BFF;
		text-align: center;
	}
	
	.dropzone_top {
		margin-top: 50px;	
	}
	
	.dropzone_txt {
		margin-bottom: 4px;
		font-size : 0.9em;
		cursor: default; 
	}
	
	#photoSelfBtn {
		margin-top: 2px;
	}
	
	#photoHeader {
		text-align: center;
		margin : 10px 0px 8px 0px;
	}
	
	.photo_day_btn {
		font-size : 1.5em;
		color : darkgray;
		cursor: pointer;
	}
	
	#photoDayTxt {
		padding : 0px 5px 0px 5px;
		font-size: 1.6em;
		font-family: 'nanum-barun-gothic-bold', sans-serif;
		cursor: pointer; 
	}
	
	#datepicker {
		position: absolute;
		top : 100px;
		left : 190px;
		z-index : 10;
	}
	
	.datepicker--cells, .datepicker--nav-title,
	.datepicker--days-names, .datepicker--buttons {
		font-family: 'nanum-barun-gothic-bold', sans-serif;
	}
	
	.photo_border {
		background: #DDD;
		height : 1px;
	}
	
	#photoNone {
		display: none;
		margin : 20px;
		padding-top : 170px;
		height : 400px;
		text-align: center;
	}

	#photoBody {
		margin : 20px 20px 0px 20px;
	}
	
	.photo {
		display : inline-block;
		float : left;
		margin-bottom : 10px;
		width : 140px;
		height : 140px;
		border : 1px solid #DDD;
		background: skyblue;
		/* background-image : url('${root}/resources/images/common/img_profile.png'); */
		background-size : 100%;
		cursor: pointer;
	}
	
	.photo_not_last {
		margin-right : 10px;
	}
	
	.photo_check {
		position : relative;
		display : none;
		top : 5px;
		left : 5px;
		width : 1.2em;
		height : 1.2em;
		font-size: 1.2em;
		cursor: pointer;
	}
	
	.photo_unchecked {
		color : darkgray;
	}
	
	.photo_unchecked:hover, .photo_checked {
		color : #0078ff;
	}
	
	/* progress modal 부분 */
	.gpa_modal_header {
		display: inline;
      text-align: center;
      padding : 10px 10px 7px 10px;
	}
	
	.gpa_modal_tit {
		display : inline;
		font-family:'nanum-barun-gothic-bold', sans-serif;
		font-size: 1.3em;
		cursor: default;
	}
	
	.gpp_modal_body {
		padding: 20px;
		cursor: default;
	}
	
	.gpa_modal_footer {
		display : inline-block;
		text-align: center;
		padding: 12px 0px 12px 0px;
	}
	
	.gpp_lbl {
		font-family:'nanum-barun-gothic-bold', sans-serif;
      	font-size: 1em;
	}
	
	.progress_right {
		float: right;
	}
	
	#photoOneLbl {
		color : #007BFF;
	}
	
	.bar {
		height : 15px;
		border-radius : 0.25em;
		background: #007BFF;
	}
	
	#photoOneName {
		margin-top: 20px;
	}
	
	.gpi_modal_body {
		cursor : default;
	}
	
	.gpi_info_wrap {
		margin-bottom: 10px;
	}
	
	.gpi_info {
		color: gray;
	}
	
	#groupPhotoDragIcon {
    	margin-right: 2px;
	}
	
	.gpi_lbl {
		font-size: 0.9em;
    	vertical-align: middle;
	}
	
	.gpi_length_wrap {
		margin: 10px 0px 10px 0px;
		font-family:'nanum-barun-gothic-bold', sans-serif;
	}
	
	#photoCurrentLength {
		color : #007BFF;
	}
	
	.insert_photo {
		display : inline-block;
		float : left;
		margin-bottom : 10px;
		width : 109px;
		height : 109px;
		border : 1px solid #DDD;
		background-size : 100% 100%;
	}
	
	.insert_photo_delete {
	    position: relative;
		display : none;
		top: 2px;
	    left: 90px;
	    font-size: 1.1em;
	    color : gray;
	    cursor: pointer;
	}
	
	#insertFileAdd {
		display : inline-block;
		float : left;
		margin-bottom : 10px;
		width : 109px;
		height : 109px;
     	text-align: center;
		background: #EEE;
		cursor : pointer;
	}
	
	.insert_file_icon {
	    position: relative;
    	top: 30px;
    	width : inherit;
    	font-size: 3em;
    	color: grey;
	}
	
</style>
<title>사진첩</title>
</head>
<body>
<div class="container">
   <div class="row">
   
     <c:import url="/WEB-INF/views/groups/leftAside.jsp"/>
     
     <div class="col-7">
        <div class="card">
           <div class="card-header" >           
              <p class="group_tit">사진첩</p>
              <div class="gpa_btn_wrap">
	              <button type="button" id="photoUploadBtn" class="btn btn-primary btn-sm">사진올리기</button>
	              <button type="button" id="photoDeleteBtn" class="btn btn-danger btn-sm">삭제</button>
              </div>
           </div>
            <div class="card-body photo_body">
            	<input type="file" id="fileupload" name="files" hidden="hidden" accept="image/*" multiple/>
            	<div id="photoDropzone" class="card">
            		<div class="dropzone_txt dropzone_top">
            			이미지 파일을 여기다 올려주세요<br />
            			(한 번에 최대 100개까지 가능합니다)
            		</div>
            		<div class="dropzone_txt">또는</div>
            		<button type="button" id="photoSelfBtn" class="btn btn-primary btn-sm">이미지 선택</button>
            	</div>
            	<div id="photoWrap">
            		<div id="photoHeader">
            			<span id="photoDayPrev" class="fa fa-chevron-left photo_day_btn"></span>
            			<span id="photoDayTxt" class="photo_day_txt"></span>
            			<span id="photoDayNext" class="fa fa-chevron-right photo_day_btn"></span>
            			<div id="datepicker"></div>
            		</div>
            		<div class="photo_border"></div>
            		<div id="photoNone" class="card">
            			모임 사진이 없습니다. <br />
            			모임 사진을 추가해주세요.
            		</div>
            		<div id="photoBody">
            			<div class="photo photo_not_last"></div>
            			<div class="photo photo_not_last"></div>
            			<div class="photo photo_not_last"></div>
            			<div class="photo"></div>
            		</div>
            	</div>
           </div>
        </div>
     </div>
     
     <c:import url="/WEB-INF/views/groups/rightAside.jsp"/>
    
   </div>
</div>

<!-- 파일 업로드 progress bar modal -->
<div class="modal" id="groupPhotoProgressModal" tabindex="-1" role="dialog" aria-labelledby="groupPhotoProgressTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-sm" role="document">
		<div class="modal-content">

			<div class="modal-header gpa_modal_header">
				<h5 class="modal-title gpa_modal_tit" id="groupPhotoProgressTitle">사진 올리기</h5>
			</div>

			<div class="modal-body gpp_modal_body" >
					<span class="gpp_lbl">올라가는 중...</span>
					<span class="gpp_lbl progress_right">
						<span id="photoOneLbl"></span>
						<span>/</span>
						<span id="photoMaxLbl"></span>
					</span>
	              	<div id="progressAll" class="progress">
    					<div class="bar all_bar" style="width: 0%;"></div>
					</div>
					
					<div class="gpp_lbl" id="photoOneName"></div>
					<div id="progressOne">
    					<div class="bar one_bar" style="width: 0%;"></div>
					</div>
			</div>
               
			<div class="modal-footer gpa_modal_footer">
					<button type="button" class="btn btn-secondary btn-sm" id="gpCancelBtn" data-dismiss="modal">취소</button>
			</div>
               
		 </div>
	</div>
</div>

<div class="modal" id="groupPhotoInsertModal" tabindex="-1" role="dialog" aria-labelledby="groupPhotoInsertTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">

			<div class="modal-header gpa_modal_header">
				<h5 class="modal-title gpa_modal_tit" id="groupPhotoInsertTitle">사진 올리기</h5>
			</div>

			<div class="modal-body gpi_modal_body" >
				<div class="gpi_info_wrap">
					<span class="fas fa-arrows-alt gpi_info" id="groupPhotoDragIcon"></span>
					<span class="gpi_lbl gpi_info">사진을 마우스로 드래그하여 순서를 변경할 수 있습니다.</span>
				</div>
				<div class="photo_border"></div>	
				<div class="gpi_length_wrap">
					<span class="gpi_lbl">사진</span>&nbsp;
					<span class="gpi_lbl" id="photoCurrentLength"></span>
					<span class="gpi_lbl">/</span>
					<span class="gpi_lbl">100</span>
				</div>
				<div class="gpi_photo_wrap">
				</div>
			</div>
               
			<div class="modal-footer gpa_modal_footer">
					<button type="button" class="btn btn-primary btn-sm" id="gpInsertConfirmBtn">올리기</button>
					<button type="button" class="btn btn-secondary btn-sm" id="gpInsertCancelBtn" data-dismiss="modal">취소</button>
			</div>
               
		 </div>
	</div>
</div>

<script>

	var year = new Date().getYear() + 1900;
	var month = new Date().getMonth() + 1;
	
	function getPhotoAlbumList(year, month) {
		$("#photoBody").children().remove();
	}
	
	 function addClassMonthpicker(){
			$("#datepicker").find('div, svg, nav').each(function() {
				$(this).addClass('monthpicker');
			});
	   }
	 
	 var photoLength = 0;
	 var photoOne = 0; 
	 var fileList = [];
	 
function createPhotoInsertList(fileList) {
	$(".gpi_photo_wrap").children().remove();
	$(".gpi_photo_wrap").next().remove();
	$("#photoCurrentLength").text(fileList.length);
	if(fileList.length != 0)
		$("#gpInsertConfirmBtn").prop("disabled", false);
	
	console.log(fileList);
	for(var i = 0; i < fileList.length; i++){
		var insertAppend = "<div class='insert_photo photo_not_last'><span class='fas fa-times insert_photo_delete'></span></div>";
		if(i % 4 == 3)
			insertAppend = "<div class='insert_photo'><span class='fas fa-times insert_photo_delete'></span></div>";
		$(".gpi_photo_wrap").append(insertAppend);
		$(".insert_photo").eq(i).css("background-image", "url('" + URL.createObjectURL(fileList[i]) + "')");
	}
	
	$(".gpi_photo_wrap").after("<div id='insertFileAdd'><span class='fas fa-file-upload insert_file_icon'></span></div>");
	
	$(".gpi_photo_wrap").sortable({
		update: function(event, ui) {
			
		}
	});
	
	$(".insert_photo").each(function() {
		
		$(this).on("mouseover", function() {
			$(this).find(".insert_photo_delete").css("display", "block");
		});
		
		$(this).on("mouseout", function() {
			$(this).find(".insert_photo_delete").css("display", "none");
		});
	
	});
	
	$(".insert_photo_delete").each(function() {
		$(this).on("click", function() {
			fileList.splice($(this).index(), 1);
			$(this).parent().remove();
			createPhotoInsertList(fileList);
			if(fileList.length == 0)
				$("#gpInsertConfirmBtn").prop("disabled", true);
		});
	});
	
	$("#insertFileAdd").on("click", function() {
		$("#fileupload").click();
	});
}
	
   $(function() {
	   
	    $("#fileupload").fileupload({
    		url : "${root}/groups/uploadGroupPhoto.gp",
    		dataType : "json",
    		dropZone : $("#photpDropzone"),
    		sequentialUploads : true, // 순차적 업로드 조건
    		limitConcurrentUploads : 1, // 동시 업로드 조건
    		add: function(e, data){
    			var uploadFile = data.files[0];
	   			var state = 0;
	   			photoLength++;
	
				if(uploadFile.size > 10485760)// 1개의 파일을 업로드할 때 10MB까지 가능
					state = 1;
				else if(!(/png|jpe?g|gif/i).test(uploadFile.name))// 이미지 파일만 올릴 수 있도록 정규식 적용
	               	state = 2;
				else if(data.originalFiles.length > 100)
					state = 3;
				else
					var jqXHR = data.submit().success(function(result, textStatus, jqXHR) {
						fileList.push(data.files[0]);
						if(photoLength == photoOne){
							$('#groupPhotoProgressModal').modal("hide");
		                	$('#groupPhotoInsertModal').modal({
						          backdrop: 'static',
						          keyboard: false
						    }).show(); 
		                	createPhotoInsertList(fileList);
						}
					});
				
				if(photoLength == data.originalFiles.length){
					if(state == 1)
                    	alert('파일 용량은 10MB를 초과할 수 없습니다.');
					else if(state == 2)
						alert('png, jpg, gif 만 가능합니다');
					else if(state == 3)
						alert('사진은 한 번에 100개 이하만 업로드 가능합니다.');	
					else{
						$('#groupPhotoProgressModal').modal({
					          backdrop: 'static',
					          keyboard: false
					    }).show();
					}
				}
				
				$("#gpCancelBtn").on("click", function() {
					jqXHR.abort();					
					$('#groupPhotoInsertModal').modal({
				          backdrop: 'static',
				          keyboard: false
				    }).show();
					createPhotoInsertList(fileList);
				});	
				
            },
            progress : function(e, data) {
            	
            	photoOne++;
            	if(photoLength >= photoOne)
            		$("#photoOneLbl").text(photoOne);
            	
            	$("#photoOneName").text(data.files[0].name);
            	var progressOne = parseInt(data.loaded / data.total * 100, 10);
                $('#progressOne .one_bar').css('width', progressOne + '%');
        
			},
           	progressall: function(e, data) {
           		$("#photoMaxLbl").text(photoLength);
                var progressAll = parseInt(data.loaded / data.total * 100, 10);
                $('#progressAll .all_bar').css('width', progressAll + '%');
           	}
    	});
    	
    	$("#photoDayTxt").text(year + "년 " + month + "월");
    	
    	$("#photoUploadBtn").on("click", function() {
    		
			if($("#photoDropzone").css("display") == "none"){
				$("#photoDropzone").css("display", "block");
				$("#photoDropzone").after("<div class='photo_border'></div>");	
				$("#datepicker").css("top", "345px");
			}
			else{
				$("#photoDropzone").css("display", "none");
				$("#photoDropzone").next().remove();
				$("#datepicker").css("top", "100px");
			}			
		});
    	
    	$("#photoSelfBtn").on("click", function() {
			$("#fileupload").click();
		});
      
    	$("#photoDayPrev").on("click", function() {
    		if(month == 1){
    			year = year - 1;
				month = 12;    			
    		}
    		else
    			month = month - 1;
    		
    		$("#photoDayTxt").text(year + "년 " + month + "월");
		});
    	
		$("#photoDayNext").on("click", function() {
			
			if(month == 12){
    			year = year + 1;
				month = 1;    			
    		}
    		else
    			month = month + 1;
    		
    		$("#photoDayTxt").text(year + "년 " + month + "월");
			
		});
		
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
		
		$("#datepicker").datepicker({
			language : "ko",
			view : "months",
			minView : "months",
			onSelect: function(date, inst) {
				addClassMonthpicker();
				$("#datepicker").hide();
				
				var dates = date.split(".");
				if(date != ""){
					year = dates[0];
					month = dates[1];
					if(month < 10)
						month = dates[1].substring(1);
				}
				$("#photoDayTxt").text(year + "년 " + month + "월");
			},
			onChangeMonth : function() {
				addClassMonthpicker();
			},
			onChangeYear : function() {
				addClassMonthpicker();
			},
			onChangeDecade : function() {
				addClassMonthpicker();
			},
			onChangeView : function(view) {
				addClassMonthpicker();
			}
		}).hide();
		
		$("#datepicker").addClass("monthpicker");
		
		$("#photoDayTxt").click(function(){
    	    $("#datepicker").find('div').each(function() {
    			$(this).removeClass('-selected-');
    		});
    	    $("#datepicker").toggle();
		});
		
		addClassMonthpicker();
		
		$(document).click(function(e) {
			if(!$(e.target).hasClass('photo_day_txt') && !$(e.target).hasClass('monthpicker'))
				$("#datepicker").hide();
		});
		
		$("#gpInsertConfirmBtn").on("click", function() {
			var formData = new FormData();
			for(var i=0; i < fileList.length; i++){
				formData.append("files", fileList[i]);
				formData.append("groupNo", "${param.groupNo}");
				formData.append("memberNo", "${m.memberNo}");				
			}
			$.ajax({
				url : "${root}/groups/insertGroupPhoto.gp",
				type : "POST",
	    		dataType : "json",
	    		data : formData,
	    		async : false,
	    		cache: false,
	    	    contentType: false,
	    	    processData: false,
	    	    success : function(data) {
					
				},
				error : function() {
					console.log("파일 업로드 오류");
				}
			});
		});
		
		$("#gpInsertCancelBtn").on("click", function() {
			photoLength = 0;
			photoOne = 0;
			fileList = [];
		});	
		
		$(".photo").each(function() {
			var inp = "<input type='checkbox' value='' class='photo_inp' hidden='hidden'/>"
			var chk = "<span class='far fa-check-circle photo_check photo_unchecked'></span>";
			$(this).append(inp + chk);

			$(this).on("mouseover", function() {
				$(this).find(".photo_check").css("display", "block");
			});
			
			$(this).on("mouseout", function() {
				$(this).find(".photo_check").css("display", "none");
			});
			
			$(this).on("click", function() {
				// 누르면 사진 보여주는 기능 추가
			});
		});
		
		$(".photo_check").each(function() {
			$(this).on("click", function(event) {
				event.stopPropagation();
				$(this).prev().click();
				if($(this).prev().is(":checked")){
					$(this).parent().css("outline", "3px solid #0078ff");
					$(this).parent().css("border", "none");
					$(this).removeClass('far photo_unchecked').addClass('fas photo_checked');
					$(".photo_check").css("display", "block");
					$(".photo").off("mouseover mouseout");
				}
				else{
					$(this).parent().css("outline", "none");
					$(this).parent().css("border", "1px solid #DDD");
					$(this).removeClass('fas photo_checked').addClass('far photo_unchecked');
				}
				
				if($(".photo_inp:checked").length == 0){
					$(".photo_check").css("display", "none");
					$(".photo").each(function() {
						$(this).on("mouseover", function() {
							$(this).find(".photo_check").css("display", "block");
						});
						
						$(this).on("mouseout", function() {
							$(this).find(".photo_check").css("display", "none");
						});
					});
				}
				
			});
		});
		
		$("#photoDeleteBtn").on("click", function() {
			if($(".photo_inp:checked").length == 0)
				alert("선택된 사진이 없습니다. 삭제할 사진을 선택해주세요.");
			else{
				
				
			}
		});
		
   });
   
</script>
</body>
</html>