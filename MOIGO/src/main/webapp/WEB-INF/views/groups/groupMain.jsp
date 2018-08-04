<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootStrap/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootStrap/bootstrap.min.js"></script>
     --%>

<link href="${root}/resources/css/groups/summernote-bs4.css" rel="stylesheet">
<script src="${root}/resources/js/groups/summernote-bs4.js"></script>

<style>
.test {
	border: 1px solid;
}

.vcenter {
	display: inline-block;
	vertical-align: middle;
	float: none;
}

.bandName {
	font-size: 1.5em;
	font-weight: bolder;
}

.postProfileImg{
	width:50px;
	height:50px;
}
body {
	background: #EDEFF2;
}


#postDiv ,.profileWrapper,.contentWrapper,.postOuter {
	background:white;
	
}

#postDiv {

background: #EDEFF2;
}

.postBorder{ 
	box-shadow: 2px 2px grey; 
}

.replyProfileImg{
	width:40px;
	height:40px;
}

.dropdown-item:hover{
	cursor:pointer;
}

.font-elipsis{
	overflow:hidden;
	text-overflow:ellipsis; 
	white-space:nowrap;
}

.font-wordBreak{
	word-break:break-all;
}

.wrap{
		z-index: 1999;
		position:absolute;
		left:250px;
		background-color: grey;
		opacity: 0.5;
		min-width:1000px;
		width:1300px;
		height:100%;
		text-align:center;
		
	}
	
	.contentWrapper iframe{
		width:100% !important;
		height:300px !important;
		
	}

</style>

</head>

<body>
	<c:if test="${currentGroup.groupStateCode ne 'S1' }">
		<div class="wrap row align-items-center justify-content-center" style="font-size:8em;">블라인드<br> 처리된 모임입니다.</div>
		<span>관리자에게 문의해 주세요 moigoAdmin@moigo.com</span>
	</c:if>
	
	<c:import url="/WEB-INF/views/groups/mapModal.jsp" />
	<c:import url="/WEB-INF/views/groups/scheduleModal.jsp" >
		<c:param name="groupNo" value="${groupNo }" />
		<c:param name="memberNo" value="${gm.memberNo}" />
		<c:param name="memberGrade" value="${memberGrade}" />
		<%-- <c:param name="groupStateCode" value="${currGroup.groupStateCode}" /> --%>
	</c:import>

	<div class="container">

		<div class="row">

			<c:import url="/WEB-INF/views/groups/leftAside.jsp">
            	<c:param name="groupNo" value="${groupNo}"/>
            	<c:param name="memberGrade" value="${memberGrade}"/>
            	<c:param name="groupStateCode" value="${currentGroup.groupStateCode}" />
      		</c:import>

			<div class="col-7">
				<div class="col">
			
					<c:if test="${memberGrade>0}">
						<button class="btn btn-primary btn-block" type="button" data-toggle="modal" data-target="#postEdit" onclick="createSummerNote();">글쓰기</button>
					</c:if>
				
					<input type="hidden" name="memberNo" value="${m.memberNo}" />
					
					
					
					<c:choose>
						
						<c:when test="${memberGrade > 0 or fn:trim(openSetting) eq 'PUBLIC' }">
						
							<div class="input-group input-group-lg">
									<label for="searchPost" class="sr-only">searchPost</label>
									<input type="text" class="form-control" id="searchPost" placeholder="검색할 내용을 입력해 주세요"/>
									<div class="input-group-append">
										<button class="btn btn-primary" id="btn_searchPost" type="button" onclick="searchPostList()">검색</button>
									</div>
							</div>	
						
							<div id="postDiv" class="">
								
							</div>
						</c:when>
						
					
						
						 <c:when test="${memberGrade<=0&&fn:trim(openSetting) != 'PUBLIC' }">
							<div class="card" style="font-size:1.3em; background:white;text-align:center;">  
								이 모임의 글은 가입 해야만 볼 수 있습니다.
							</div>
							
						</c:when>
				</c:choose>
				</div>
				<div class="col">
					
				</div>
			</div>

			<c:import url="/WEB-INF/views/groups/rightAside.jsp" />

		</div>
	</div>
	<!--container end-->


	<!--post edit modals  -->
	<div class="modal fade" id="postEdit" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">글쓰기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" onclick="destroyPostEditModal();">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
					<div class="modal-body">
						<div id="summernote"></div>
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal" onclick="destroyPostEditModal();">취소</button>
						<button type="button" class="btn btn-primary" onclick="editOrSubmit()">확인</button>
					</div>
			</div>
		</div>
	</div>
	

</body>

<script>



var pageInfo;
var currentPage=1;
var postFiles=[];

$(function(){
	currentPage=1;
	setPostList();
	
	
});

function searchPostList(){
	
	if(($('#searchPost').val()).trim().length==0){
		currPage =1;
		deleteAllPost();
		setPostList();
		return;
	}

	if($('#searchPost').val()!=null&&(($('#searchPost').val()).trim().length>0)){
		
		$.ajax({
			url:"${pageContext.request.contextPath}/groups/getKeywordPostList.gp",
			data:{	groupNo:"${groupNo}",
					currPage:1,
					keyword:$('#searchPost').val()
					},
			dataType:"json",
			success:function(data){
				$('#postDiv').children().remove();
				
				
				if(data.posts.length>0){
					for(var i = 0; i <data.posts.length;++i){
						
						var $postOuter= $('<div class="p-3 postOuter  mb-3"></div>');
						$postOuter.append(makeProfile(data.posts[i]));
						$postOuter.append(makeContent(data.posts[i]));
						$postOuter.append(makeReply(data.posts[i].postReplyWithMem));
						$postOuter.append(makeSubmitReply(data.posts[i].postNo));
						$('#postDiv').append($postOuter);
					}
				}else{
					currentPage-=1;
				}
			},
			error:function(){
				console.log("ajax오류");
			}
			
		});
		
		
	}
	
}




$(document).ready(function () {
	  $(document).scroll(function() {
	    var maxHeight = $(document).height();
	    var currentScroll = $(window).scrollTop() + $(window).height();

	    if (maxHeight <= currentScroll) {
	     	
	    	
			currentPage+=1;
			if(pageInfo.maxPage<currentPage){
				currentPage-=1;
				return;
			}
			
				
			
	    	if($('#searchPost').val()!=null&&(($('#searchPost').val()).trim().length>0)){
	    		searchPostList();
	    	}else
	    		setPostList();
	    }
	  })
	});
	

function setPostList(){
	
	$.ajax({
		url:"${pageContext.request.contextPath}/groups/getPostList.gp",
		data:{groupNo:"${groupNo}",currPage:currentPage},
		dataType:"json",
		success:function(data){
			
			
			pageInfo = data.pageInfo;
			
			console.log(data);
			
			if(data.posts.length>0){
				
				for(var i = 0; i <data.posts.length;++i){
					
					var $postOuter= $('<div class="p-3 postOuter  mb-3"></div>');
					$postOuter.append(makeProfile(data.posts[i]));
					$postOuter.append(makeContent(data.posts[i]));
					$postOuter.append(makeReply(data.posts[i].postReplyWithMem));
					$postOuter.append(makeSubmitReply(data.posts[i].postNo));
					$('#postDiv').append($postOuter);
				}
			}else{
				currentPage-=1;
			}

		},
		error:function(){
			console.log("ajax오류");
		}
		
	});
	
}

function deleteAllPost(){
	$('#postDiv').children().remove();
}





function makeReply(replyList){
	var $replyWrapper =  $('<div class="p-3 replyWrapper bg-light"> ');
	
	for(var i =0;i< replyList.length;++i){
		$replyWrapper.append(makeProfile(replyList[i]));	
	}
	
	return $replyWrapper;
}

function makeContent(post){
	var $contentWrapper = $('<div class="p-3 contentWrapper">');
	
	$contentWrapper.append(post.content);
	
	$contentWrapper.find('p').css("word-break","break-all");
	$contentWrapper.find('img').addClass("img-fluid");
	
	return $contentWrapper;
}

function makeProfile(obj){
	/*profile Element  */
	
	var $profileWrapper = $('<div class="d-flex align-items-center mt-2 mr-auto profileWrapper">');
	
	var $profileImgWrapper;
	
	var $profileImg;
	
	if(typeof(obj.replyNo)=='undefined'){
		$profileImgWrapper = $('<div class="">');
		if(obj.groupMember.profileImg!=null)
			$profileImg= $("<img class='postProfileImg rounded-circle '>").attr("src",obj.groupMember.profileImg);
		else
			$profileImg= $("<img class='postProfileImg rounded-circle'>").attr("src",'${root}/resources/images/common/img_profile.png');
			$profileImgWrapper.append($("<input class='postNo'>").attr("type","hidden").val(obj.postNo));
			$profileImgWrapper.append($("<input class='postWriterNo'>").attr("type","hidden").val(obj.groupMember.memberNo));
			
	}
	else{
		$profileImgWrapper = $('<div class="align-self-start">');
		if(obj.groupMember.profileImg!=null)
			$profileImg= $("<img class='replyProfileImg rounded-circle '>").attr("src",obj.groupMember.profileImg);
		else
			$profileImg= $("<img class='replyProfileImg rounded-circle '>").attr("src",'${root}/resources/images/common/img_profile.png');
		$profileImgWrapper.append($("<input class='replyNo'>").attr("type","hidden").val(obj.replyNo));
		$profileImgWrapper.append($("<input class='replyWriterNo'>").attr("type","hidden").val(obj.groupMember.memberNo));
	}
	
	var $profileAndDate =$("<div class='d-flex w-75 flex-column'>");
	var $userDataWrapper =$("<div class='d-flex'>");
	var $userName =$("<span class='w-25' style='overflow:hidden;text-overflow:ellipsis; font-weight:bold'>").text(obj.groupMember.memberName);
	var $userMsg = $("<span class='w-75 text-muted font-elipsis'>").text(obj.groupMember.profileMsg);
	var $replyContent;
	
	if(typeof(obj.postNo)!='undefined'){
		$replyContent = $("<div class='d-flex replyContent font-elipsis' style='cursor:pointer;' onclick='toggleElipsis(this);'>"); 
		$replyContent.append(obj.content);
	}
	
	
	var $upLoadDateWrapper=$('<div class="d-flex">');
	var $dropDownWrapper=$('<div>')
	let now = new Date(obj.submitDate);
	
	var $upLoadWrapper  = $("<span>").text(	(now.getMonth()+1)+"월"+" "+now.getDate()+"일");
	
	$upLoadDateWrapper.append($upLoadWrapper);
	
	$userDataWrapper.append($userName);
	$userDataWrapper.append($userMsg);
	
	$profileAndDate.append($userDataWrapper);
	
	if(typeof(obj.replyNo)!='undefined'){
		$profileAndDate.append($replyContent);
	}
	
	$profileAndDate.append($upLoadDateWrapper);
	
	$profileImgWrapper.append($profileImg);
	$profileWrapper.append($profileImgWrapper);
	$profileWrapper.append($profileAndDate);
	
	//멤버면 넣고 아니면 넣지 않기
	
		if(typeof(obj.replyNo)!='undefined')
			$profileWrapper.append(makeDropDown(false,obj.replyNo,obj.groupMember.memberNo,$profileWrapper));
		else
			$profileWrapper.append(makeDropDown(true,obj.postNo,obj.groupMember.memberNo,$profileWrapper));
	
	
	return $profileWrapper;
}

function toggleElipsis(obj){
	$(obj).toggleClass("font-elipsis");
	$(obj).toggleClass("font-wordBreak");
}



function makeDropDown(isPost,num,memberNo,wrapperObj){
	
	$dropDownWrapper =$("<div>");
	
	var $dropDown =$('<div class="dropdown">');
	var $dropDownBtn=$('<button class="btn btn-link" type="button" id="dropdownMenuButton" data-toggle="dropdown"><i class="fas fa-ellipsis-v"></i></button>');
	var $dropDownMenu=$('<div class="dropdown-menu">');
	
	var $dropDownItem1;
	var $dropDownItem2;
	
	
	
	if(isPost){
		
		if($(wrapperObj).find(".postWriterNo").val()=='${gm.memberNo}'||'${memberGrade>=3}'=='true'){
			$dropDownItem1=$("<a class='dropdown-item' >글 수정</a>");
			$dropDownMenu.append($dropDownItem1);
			var $dropDownItem3=$("<a class='dropdown-item' >삭제하기</a>");
			$dropDownMenu.append($dropDownItem3);
			
			$dropDownItem1.on("click",function(){
				prepareUpdatePost(num);
			});
			
			$dropDownItem3.on("click",function(){
				deletePost(num);
			});
		}
		if('${memberGrade >3}'=='true'){
			$dropDownItem2=$("<a class='dropdown-item' >공지 등록</a>");
			$dropDownMenu.append($dropDownItem2);
		}
		
		//신고하기 넣기
		if($(wrapperObj).find(".postWriterNo").val()!='${gm.memberNo}'&&'${memberGrade>=1}'=='true'){
			var $dropDownItem4=$("<a class='dropdown-item' >신고하기</a>");
			$dropDownMenu.append($dropDownItem4);
			
			$dropDownItem4.on("click",function(){
				$('#accuseReporter').val("${gm.memberNo}");
				$('#accuseTarget').val($(wrapperObj).find(".postWriterNo").val());
				$('#reportingModal').modal("toggle"); 
			});
	
		}

	}else{
		
		if($(wrapperObj).find(".replyWriterNo").val()=='${gm.memberNo}'||'${memberGrade>=3}'=='true'){
			$dropDownItem1=$("<a class='dropdown-item'>댓글 수정</a>");
			$dropDownItem2=$("<a class='dropdown-item'>댓글 삭제</a>");
			$dropDownMenu.append($dropDownItem1);
			$dropDownMenu.append($dropDownItem2);
			
			$dropDownItem1.on("click",function(){
				addReplyEditForm(num);
			});
			
			$dropDownItem2.on("click",function(){
				deleteReply(num);
			});
		}
		
		//신고하기 넣기
		if($(wrapperObj).find(".replyWriterNo").val()!='${gm.memberNo}'&&'${memberGrade>=1}'=='true'){
			var $dropDownItem4=$("<a class='dropdown-item' >신고하기</a>");
			$dropDownMenu.append($dropDownItem4);
			
			$dropDownItem4.on("click",function(){
				
						
				$('#accuseReporter').val("${gm.memberNo}");
				$('#accuseTarget').val($(wrapperObj).find(".replyWriterNo").val());
				$('#reportingModal').modal("toggle"); 
			});
	
		}
	
	}
	
	$dropDown.append($dropDownBtn);
	$dropDown.append($dropDownMenu);
	$dropDownWrapper.append($dropDown);
	
	return $dropDownWrapper;
	
}

function addReplyEditForm(num){
	toEditContent = $('.replyWrapper').children().find("input[value="+num+"]").closest(".profileWrapper").find(".replyContent");
	
	var originContent = $(toEditContent).text();
	$(toEditContent).text("");
	$(toEditContent).append(makeEditReply(num,originContent));
	
}

function makeSubmitReply(postNo){
	var $inputWrapper =$('<div class="d-flex">');
	var $inputGroup = $('<div class="input-group">');
	var $input = $('<input class="form-control" type="text" placeholder="댓글을 남겨주세요!">');
	var $inputButton = $("<span class='input-group-btn'></span>").append($("<button class='btn btn-secondary' type='button'>등록</button>").on("click",function(){
		submitReply(postNo, $input);
	}));

	$inputGroup.append($input);
	$inputGroup.append($inputButton);
	$inputWrapper.append($inputGroup);
	
	return $inputWrapper;

}

function updateReply(num,newContent,originContent){

	$.ajax({
		url:"${pageContext.request.contextPath}/groups/updateReply.gp",
		data:{replyNo:num,content:newContent},
		dataType:"json",
		success:function(data){
			
			if(data.result>0){
			
				$(toEditContent).text(newContent);
				toEditContent=undefined;
				alert("글 수정 성공!");
				
			}else{
				$(toEditContent).text(originContent);
				alert("댓글 삭제 실패!");
			}
			
		},
		error:function(){
			alert("댓글 삭제 도중 에러가 생겼습니다.");
		}
		
	});
}

function makeEditReply(num,originContent){
	
	var $editWrapper =$('<div class="d-flex">');
	
	var $textArea = $('<textarea class="form-control " style="resize:none;" rows="3" cols="35">');
	
	var $btnWrapper =$('<div class="d-flex">');
	
	var $editBtn = $('<button class="btn btn-primary btn-sm">수정</button>').on("click",function(){
		updateReply(num,$textArea.val(),originContent);
		$editWrapper.remove();
	});
	
	var $cancleBtn = $('<button class="btn btn-info btn-sm">취소</button>').on("click",function(){
		
		$(toEditContent).text(originContent);
		toEditContent=undefined;
		$editWrapper.remove();
	});
	
	
	$textArea.text(originContent);
	
	$btnWrapper.append($editBtn);
	$btnWrapper.append($cancleBtn);
	
	$editWrapper.append($textArea);
	$editWrapper.append($btnWrapper);
	
	return $editWrapper;
}



function prepareUpdatePost(num){
	toEditContent = $('.profileWrapper').children().find("input[value="+num+"]").closest('.profileWrapper').siblings('.contentWrapper');
	$('#postEdit').modal('toggle');
	createSummerNote();
	
	var $temp = $($(toEditContent).html());

	$('#summernote').summernote('code',$temp);
	
	
	
	for(var i =0;i<$temp.siblings('[name=editMapWrap]').length;++i){
		restoreMapEvent($temp.siblings('[name=editMapWrap]').eq(i));
		
	}
	for(var i =0;i<$temp.siblings('[name=editScheduleWrap]').length;++i){
		restoreScheduleEvent($temp.siblings('[name=editScheduleWrap]').eq(i));
	}
	
}

function updatePost(num,postContent){
	$.ajax({
		url:"${pageContext.request.contextPath}/groups/updatePost.gp",
		data:{postNo:num,content:postContent},
		dataType:"json",
		success:function(data){
			var $temp = $('.profileWrapper').children().find("input[value="+num+"]").closest('.profileWrapper').siblings('.contentWrapper');
			if(data.result>0){
				$temp.children().remove();
				
				$temp.append(postContent);
				alert("글 수정 성공!");
			}else
				alert("댓글 삭제 실패!");	
		},
		error:function(){
			alert("댓글 삭제 도중 에러가 생겼습니다.");
		}
		
	});
}

function restoreScheduleEvent(obj){
	
	console.log("들어오나?");
	
	$(obj).find('[name=editBtn]').on("click",function(event){
		//toEditTarget=obj;
		 event.stopPropagation();
		 
		
		editSchedule(obj,$(obj).find("input[name=scheduleNo]").val());
		
	});
	
	$(obj).find('[name=delBtn]').on("click",function(event){
		 event.stopPropagation();
		if(confirm("일정을 삭제 하시겠습니까?")){
			deleteSchedule($(obj).find('[name=scheduleNo]').val(),obj);
		}
			
		
	});
	
	
	$(obj).on('mouseover',function(){
		$(this).css('border','3px solid #00bfff');
		
		$(this).find('.map_btn_wrapper').css("visibility","visible");
		
		
	}).on('mouseout',function(){
		
		$(this).css('border','3px solid black');
		
		$(this).find('.map_btn_wrapper').css("visibility","hidden");
	});
	
}

function restoreMapEvent(obj){
	
	 $(obj).find('[name=editBtn]').on("click",function(event){
		toEditTarget=obj;
		
		event.stopPropagation();
		$('#placeKeyword').val($(obj).find('.place_name').text());
		editMap();
	});
	
	$(obj).find('[name=delBtn]').on("click",function(event){
		event.stopPropagation();
		deleteMap($(obj));
	});
	
	$(obj).on('mouseover',function(){
		$(obj).css('border','3px solid #00bfff');
		
		$(obj).find('.map_btn_wrapper').css("visibility","visible");
		
		
	}).on('mouseout',function(){
		
		$(obj).css('border','3px solid black');
		
		$(obj).find('.map_btn_wrapper').css("visibility","hidden");
	});
}


function deleteReply(num){
	
	$.ajax({
		url:"${pageContext.request.contextPath}/groups/deleteReply.gp",
		data:{replyNo:num},
		dataType:"json",
		success:function(data){
			
			if(data.result>0){
				alert("댓글 삭제 성공!");
				$('.replyWrapper').children().find("input[value="+num+"]").closest(".profileWrapper").remove();
			}else
				alert("댓글 삭제 실패!");
			
		},
		error:function(){
			alert("댓글 삭제 도중 에러가 생겼습니다.");
		}
		
	});
}

function deletePost(num){
	
	$.ajax({
		url:"${pageContext.request.contextPath}/groups/deletePost.gp",
		data:{postNo:num},
		dataType:"json",
		success:function(data){
			
			if(data.result>0){
				alert("글 삭제 성공!");
			}else
				alert("글 삭제 실패!");
			
			deleteAllPost();
			setPostList(1);
		},
		error:function(){
			alert("글 삭제 도중 에러가 생겼습니다.");
		}
		
	});
}

function editOrSubmit(){
	if(typeof(toEditContent)!='undefined'){
		updatePost($(toEditContent).siblings('.profileWrapper').find('input').val(),
				$('#summernote').summernote('code'));
		destroyPostEditModal();
		
		toEditContent=undefined;
	}else{
		submitPost();
	}
	
	
}

function submitPost(){
	
	if(!checkLogin())
		return ;  
	
	$.ajax({
		url:"${pageContext.request.contextPath}/groups/insertPost.gp",
		data:{groupNo:'${groupNo}',memberNo:'${gm.memberNo}',content:$('#summernote').summernote('code'),isNotice:"N"},
		dataType:"json",
		success:function(data){
			
			if(data.result>0){
				alert("글 등록 성공!");
			}else
				alert("글 등록 실패!");
			
			deleteAllPost();
			setPostList();
			destroyPostEditModal();
		},
		error:function(){
			alert("글 등록 도중 에러가 생겼습니다.");
			destroyPostEditModal();
		}
		
	});

}

function checkLogin(){
	

	if('${gm.memberNo}'.length<0)
	{
		alert('${gm.memberNo}');
		alert("로그인 해주세요");
		
		return false;
	}else
		return true;
}

function submitReply(postNo,obj){
	
	if(!checkLogin())
		return ;  
	
	$.ajax({
		url:"${pageContext.request.contextPath}/groups/insertReply.gp",
		data:{postNo:postNo,memberNo:'${gm.memberNo}',content:$(obj).val(),groupNo:'${groupNo}'},
		dataType:"json",
		success:function(data){
			console.log(data);
			
			if(data.result>0){
				alert("댓글 등록 성공!");
				
				$(obj).closest('.postOuter').find('.replyWrapper').append(makeProfile(data.pwm));
				
				$(obj).val("");
			}else
				alert("댓글 등록 실패!");
			
			/* deleteAllPost();
			setPostList();
			 */
		},
		error:function(){
			alert("글 등록 도중 에러가 생겼습니다.");
		}
		
	});

}

function destroyPostEditModal(){
	
	if($('#summernote').length>0){
		 $('#postEdit').modal("hide");
		$('#summernote').summernote('reset');
		$('#summernote').summernote('destroy');
	}
	
}

function createSummerNote(){
	
	var insertMap = function (context) {
		  var ui = $.summernote.ui;

		  // create button
		  var button = ui.button({
		    contents: '<i class="fas fa-map-marked-alt"></i>',
		    container:false,
		    tooltip: '지도 삽입',
		    click: function () {
		      toggleMapModal();
		    }
		  });

		  return button.render();   // return button as jquery object
		}
	
	var insertSchedule = function (context) {
		  var ui = $.summernote.ui;

		  // create button
		  var button = ui.button({
		    contents: '<i class="fas fa-calendar-alt"></i>',
		    container:false,
		    tooltip: '일정 삽입',
		    click: function () {
		    	toggleScheduleModal();
		    }
		  });

		  return button.render();   // return button as jquery object
		}
	
	$('#summernote').summernote({
		  toolbar: [
		  	['style', ['bold', 'italic', 'underline', 'clear']],
		   	['font', ['strikethrough', 'superscript', 'subscript']],
		    ['fontsize', ['fontsize']],
		    ['color', ['color']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['insert', ['link', 'picture', 'video', 'hr', 'readmore']],
		    ['mybutton', ['insertmap']],
		    ['myButton',['insertSchedule']]
		  	
		  ],
		  disableResizeEditor: true,
		  height: 200,
		  callbacks:{
			onImageUpload:function(files,editor,welEditable){
				
				if(files.size/(1024/1024)>=10){
		    		alert("파일 크기는 10mb 이하여야 합니다.");
		    		
		    		return;
		    	}
				
				console.log(files);
				
				var Extension = files[0].name.substring(
						files[0].name.lastIndexOf('.') + 1).toLowerCase();
				
				if(Extension == "gif" || Extension == "png" || Extension == "bmp"
		            || Extension == "jpeg" || Extension == "jpg")
		    		{
						alert("들어옴");
						sendFile(files,this);
		    		}else{
		    			alert("사진 형식만 가능합니다.");
		    		}
				
				
			},onMediaDelete : function ($target, $editable) {
		            console.log($target.attr('src'));   // get image url 
		       }
		    
		  }, 

		  buttons: {
		     insertmap: insertMap,
		     insertSchedule:insertSchedule
		  }
	});
	
}

function sendFile(file, editor) {
	
		var data = new FormData();
		data.append("uploadFile",file[0]);
		data.append("groupNo",'${groupNo}');
		data.append("memberNo","${gm.memberNo}");
	
  		   $.ajax({ // ajax를 통해 파일 업로드 처리
  		    	type : "POST",
  		    	data : data,
  		    	async : false,
  		        url : "${pageContext.request.contextPath}/groups/insertImageFile.gp",
  		        dataType:"json",
  		        cache: false,
  		        contentType: false,
  		        /* enctype: 'multipart/form-data', */
  		        processData: false,
  		        success : function(data) { // 처리가 성공할 경우
  	            // 에디터에 이미지 출력
  	            console.log(data.url);
  		        	$(editor).summernote('editor.insertImage','${root}/resources/images/groupImages/'+data.url);
  		        }
  		    }); 
    	
	}

	$("#summernote").summernote({
	    onMediaDelete : function($target, editor, $editable) {
	        alert($target.context.dataset.filename);         
	        $target.remove();
	    }
	}); 
	
	
	
</script>

</html>