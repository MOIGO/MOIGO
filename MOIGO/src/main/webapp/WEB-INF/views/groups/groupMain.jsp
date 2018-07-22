<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootStrap/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootStrap/bootstrap.min.js"></script>
     --%>

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>

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

</style>

</head>

<body>
	
	<c:import url="/WEB-INF/views/groups/mapModal.jsp" />

	<div class="container">

		<div class="row">


			<c:import url="/WEB-INF/views/groups/leftAside.jsp">
            	<c:param name="groupNo" value="G007"/>
         	</c:import>

			<div class="col-7">
				<div class="col">
					<button class="btn btn-primary btn-block" type="button" data-toggle="modal" data-target="#postEdit" onclick="createSummerNote();">글쓰기</button>
					<input type="hidden" name="memberNo" value="${m.memberNo}" />
					<div id="postDiv" class="">
						
					</div>
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
						<button type="button" class="btn btn-primary" onclick="submitPost()">확인</button>
					</div>
			</div>
		</div>
	</div>
	

</body>

<script>

$(function(){
	setPostList(1);
});

function deleteAllPost(){
	$('#postDiv').children().remove();
}


function setPostList(currentPage){
	$.ajax({
		url:"${pageContext.request.contextPath}/groups/getPostList.gp",
		data:{groupNo:"G001",currPage:currentPage},
		dataType:"json",
		success:function(data){

			console.log(data);
			
			for(var i = 0; i <data.posts.length;++i){
				
				var $postOuter= $('<div class="p-3 postOuter  mb-3"></div>');
				$postOuter.append($("<input>").attr("type","hidden").val(data.posts[i].postNo));
				$postOuter.append(makeProfile(data.posts[i]));
				$postOuter.append(makeContent(data.posts[i]));
				$postOuter.append(makeReply(data.posts[i].postReplyWithMem));
				$postOuter.append(makeSubmitReply(data.posts[i].postNo));
				$('#postDiv').append($postOuter);
			}

		},
		error:function(){
			console.log("ajax오류");
		}
		
	});
	
}

function makeSubmitReply(postNo){
	var $inputWrapper =$('<div>');
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
	}
	else{
		$profileImgWrapper = $('<div class="align-self-start">');
		if(obj.groupMember.profileImg!=null)
			$profileImg= $("<img class='replyProfileImg rounded-circle '>").attr("src",obj.groupMember.profileImg);
		else
			$profileImg= $("<img class='replyProfileImg rounded-circle '>").attr("src",'${root}/resources/images/common/img_profile.png');
	}
	
	var $profileAndDate =$("<div class='d-flex w-75 flex-column'>");
	var $userDataWrapper =$("<div class='d-flex'>");
	var $userName =$("<span class='mr-4 ' style='overflow:hidden;text-overflow:ellipsis; font-weight:bold'>").text(obj.groupMember.memberName);
	var $userMsg = $("<span class='w-50 text-muted' style='overflow:hidden;text-overflow:ellipsis;'>").text(obj.groupMember.profileMsg);
	var $replyContent;
	
	if(typeof(obj.postNo)!='undefined'){
		$replyContent = $("<div class='d-inline-flex replyContent '>"); 
		$replyContent.append(obj.content);
	}
	
	
	var $upLoadDateWrapper=$('<div class="d-flex">');
	var $dropDownWrapper=$('<div >')
	let now = new Date(obj.submitDate);
	
	var $upLoadWrapper  = $("<span>").text(	now.getMonth()+"월"+" "+now.getDate()+"일");
	
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
	if(typeof(obj.replyNo)!='undefined')
		$profileWrapper.append(makeDropDown(false));
	else
		$profileWrapper.append(makeDropDown(true));
	return $profileWrapper;
}




function makeDropDown(isPost,num){
	$dropDownWrapper =$("<div class='d-flex'>");
	
	var $dropDown =$('<div class="dropdown">');
	var $dropDownBtn=$('<button class="btn btn-link" type="button" id="dropdownMenuButton" data-toggle="dropdown"><i class="fas fa-ellipsis-v"></i></button>');
	var $dropDownMenu=$('<div class="dropdown-menu">');
	
	var $dropDownItem1
	var $dropDownItem2
	
	if(isPost){
		$dropDownItem1=$("<a class='dropdown-item'>글 수정</a>");
		$dropDownItem2=$("<a class='dropdown-item'>공지 등록</a>");
		var $dropDownItem3=$("<a class='dropdown-item'>삭제하기</a>");
		var $dropDownItem4=$("<a class='dropdown-item'>신고하기</a>");
		$dropDownMenu.append($dropDownItem1);
		$dropDownMenu.append($dropDownItem2);
		$dropDownMenu.append($dropDownItem3);
		$dropDownMenu.append($dropDownItem4);
		
	}else{
		$dropDownItem1=$("<a class='dropdown-item'>댓글 수정</a>");
		$dropDownItem2=$("<a class='dropdown-item'>댓글 삭제</a>");
		$dropDownMenu.append($dropDownItem1);
		$dropDownMenu.append($dropDownItem2);
	}
	
	$dropDown.append($dropDownBtn);
	$dropDown.append($dropDownMenu);
	$dropDownWrapper.append($dropDown);
	
	return $dropDownWrapper;
	
}

function submitPost(){
	
	console.log($('#summernote').summernote('code'));
	
	$.ajax({
		url:"${pageContext.request.contextPath}/groups/submitPost.gp",
		data:{groupNo:"G001",memberNo:'${m.memberNo}',content:$('#summernote').summernote('code'),isNotice:"N"},
		dataType:"json",
		success:function(data){
			
			if(data.result>0){
				alert("글 등록 성공!");
			}else
				alert("글 등록 실패!");
			
			deleteAllPost();
			setPostList(1);
			destroyPostEditModal();
		},
		error:function(){
			alert("글 등록 도중 에러가 생겼습니다.");
			destroyPostEditModal();
		}
		
	});

}

function submitReply(postNo,obj){
	console.log(obj.val());
	
	$.ajax({
		url:"${pageContext.request.contextPath}/groups/insertReply.gp",
		data:{postNo:postNo,memberNo:'${m.memberNo}',content:$(obj).val()},
		dataType:"json",
		success:function(data){
			
			if(data.result>0){
				alert("댓글 등록 성공!");
			}else
				alert("댓글 등록 실패!");
			
			deleteAllPost();
			setPostList(1);
			
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
	
	$('#summernote').summernote({
		  toolbar: [
		  	['style', ['bold', 'italic', 'underline', 'clear']],
		   	['font', ['strikethrough', 'superscript', 'subscript']],
		    ['fontsize', ['fontsize']],
		    ['color', ['color']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['mybutton', ['insertmap']]
		  ],

		  buttons: {
		     insertmap: insertMap
		  }
	});
}

function toggleMapModal(){
	 $('#insertMap').modal("toggle");
     $('#insertMap').on("shown.bs.modal",makeMap());
}
	
</script>

</html>