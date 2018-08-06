<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/header.jsp" />
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="groupMemberList" value="${requestScope.groupMemberList}" />
<c:set var="searchMemberList" value="${requestScope.searchGroupMemberList}" />
<html>
<head>
<script src="https://unpkg.com/ionicons@4.2.2/dist/ionicons.js"></script>
<link rel="stylesheet" href="${root}/resources/css/groups/cropper.min.css">
<script src="${root}/resources/js/groups/cropper.min.js"></script>
<script src="${root}/resources/js/groups/jquery-cropper.min.js"></script>
<style>

body {
	background: #EDEFF2;
}

/* card 부분 */
.card, .card-header {
	background: white;
}

/* 그룹 공통 부분 */
.group_tit {
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

input:-webkit-autofill,
input:-webkit-autofill:hover,
input:-webkit-autofill:focus,
input:-webkit-autofill:active {
	transition: background-color 5000s ease-in-out 0s;
}

/* 멤버 검색 부분 */
.gm_inp:focus, .gm_inp:active:focus {
	border-color: #343A40;
	box-shadow: none;
}

.gm_search_btn {
	margin: 0px;
	padding: 0px;
	width: 38px;
}

#searchBtn {
	vertical-align: text-bottom;
	font-size: 24px;
}

/* 멤버 리스트 부분 */
.search_result_none {
	padding-top : 135px;
	height : 300px;
	text-align: center;
	color: gray;
}

.list-group-item {
	padding-left: 13px;
	padding-right: 13px;
}

#listImg {
	width: 50px;
	height: 50px;
}

.list_wrap {
	width: 100%;
	height: 50px;
}

.list_inner {
	display: inline-block;
	vertical-align: bottom;
	margin-left: 5px;
	padding-top: 2px;
	height: 100%;
}

.list_txt {
	margin: 0px;
	vertical-align: bottom;
	/* border: 1px solid black; */
}

#listName {
	font-family: 'nanum-barun-gothic-bold', sans-serif;
	font-size: 1.1em;
}

#listMsg {
	display: block;
	font-size: 0.9em;
}

#profileBtn {
	float: right;
    margin-top: 15px;
    margin-right: 2px;
    color: darkgray;
    font-size: 1.3em;
}

#profileBtn:hover {
	cursor: pointer;
}

.badge:hover {
	cursor: default;
}

#groupLeader {
	float: right;
	margin-top: 12px;
	margin-left: 6px;
	padding: 7px 7px 5px 6px;
	font-family: 'nanum-barun-gothic-bold', sans-serif;
	font-size: 1em;
}

/* 프로필 Modal 영역 */
.gm_modal_header {
	display: inline;
	text-align: center;
	padding: 10px 10px 7px 10px;
}

.gm_modal_tit {
	display: inline;
	padding-left: 35px;
	font-family: 'nanum-barun-gothic-bold', sans-serif;
	font-size: 1.4em;
}

.gm_modal_tit:hover {
	cursor: default;
}

.gm_close {
	vertical-align: text-top;
	font-size: 2em;
}

.gm_modal_body {
	height: 260px;
	text-align: center;
}

#profileImg {
	margin-bottom: 10px;
	width: 150px;
	height: 150px;
	border: 1px solid gray;
}

.profile_upload_inp {
	display: none;
}

.profile_upload_btn {
	position: absolute;
	top: 110px;
	left: 280px;
	width: 48px;
	height: 48px;
	border: 3px solid white;
	border-radius: 50%;
	background-image: url("${root}/resources/images/common/btn_profile.png");
	background-size: 100%;
}

.profile_upload_btn:hover {
	cursor: pointer;
}

#profileLbl {
	float: left;
	margin: 0px 5px 3px 3px;
	font-family: 'nanum-barun-gothic-bold', sans-serif;
}

#msgMaxLength {
	color: #0078ff;
}

#profileMsg {
	resize: none;
	font-size: 0.9em;
	font-weight: normal;
}

.gm_modal_footer {
	display: inline-block;
	text-align: center;
	padding: 10px 0px 10px 0px;
}

/* 프로필 사진 변경 modal 부분 */
#profileUploadTitle {
	padding-left: 0px;
}

#profileUploadBody {
	height: 500px;
}

#profileUploadLbl {
	margin-left: 33px;
	font-size: 0.9em;
	color: gray;
}

#profileUploadBtn {
	top: 10px;
	left: 100px;
	width: 35px;
	height: 35px;
	background-size: 100%;
}

#profileUploadCropper {
	outline: 1px solid black;
	margin-top: 5px;
	width: inherit;
	height: 430px;
}

#cropperImg {
	max-width: 100%;
}
</style>
<title>멤버</title>
</head>
<body>
<!-- 모임 컨텐츠 -->
<div class="container">
	<div class="row">

		<!-- 모임의 좌측 메뉴 -->
		<c:import url="/WEB-INF/views/groups/leftAside.jsp" />
		<c:import url="/WEB-INF/views/groups/mapModal.jsp" />
		<c:import url="/WEB-INF/views/groups/scheduleModal.jsp" >
			<c:param name="groupNo" value="${groupNo }" />
			<c:param name="memberNo" value="${gm.memberNo}" />
			<c:param name="memberGrade" value="${memberGrade}" />
		</c:import>
		

		<!-- 모임의 가운데(주요 기능부분) -->
		<div class="col-lg-7">
			<div class="card">

				<!-- 모임의 각 메뉴 타이틀 -->
				<div class="card-header">
					<p class="group_tit">멤버</p>
				</div>

				<!-- 모임 내용 -->
				<div class="card-body">
				
					<!-- 멤버 검색 부분 -->
					<form id="searchMemberForm" action="${root}/groups/searchGroupMember.gp">
						<div class="input-group mb-3">
							<input type="hidden" name="groupNo" value="${param.groupNo}"/>
							<input type="text" class="form-control gm_inp" name="searchName" id="gmSearchInp" placeholder="멤버 검색" />
							<div class="input-group-append">
								<button class="btn btn-outline-secondary gm_search_btn" type="button">
									<ion-icon id="searchBtn" name="search"></ion-icon>
								</button>
							</div>
						</div>
					</form>

					<c:if test="${searchMemberList eq null}">
						<c:set var="resultMemberList" value="${groupMemberList}"></c:set>
					</c:if>
					<c:if test="${searchMemberList eq '[]'}">
						<div class="card search_result_none">검색 결과가 없습니다.</div>
					</c:if>
					<c:if test="${searchMemberList ne null}">
						<c:set var="resultMemberList" value="${searchMemberList}"></c:set>
					</c:if>
					<!-- 멤버 리스트 부분 -->
					<ul class="list-group">
							<c:forEach var="groupMember" items="${resultMemberList}">
							<c:if test="${groupMember.memberGradeCode > 0}">
								<li class="list-group-item group_member_list_one">
									<div class="list_wrap">
										<c:if test="${groupMember.profileImg eq null and groupMember.profileThumb eq null}">
											<img id="listImg" class="rounded-circle" src="${root}/resources/images/common/img_profile.png">
										</c:if>
										<c:if test="${groupMember.profileThumb ne null}">
											<img id="listImg" class="rounded-circle" src="${root}/resources/images/profiles/${groupMember.groupNo}/${groupMember.profileThumb}">
										</c:if>
										<span class="list_inner" <c:if test="${groupMember.profileMsg eq null}">style="padding-top: 13px;"</c:if>>
											<span class="list_txt" id="listName">${groupMember.memberName}</span>
											<c:if test="${groupMember.profileMsg ne null}">
												<span class="list_txt" id="listMsg">${groupMember.profileMsg}</span>
											</c:if>
										</span> 
										<c:if test="${groupMember.memberGradeCode eq 3}">
											<span class="badge badge-primary" id="groupLeader">모임장</span>
										</c:if>
										<c:if test="${groupMember.memberGradeCode eq 2}">
											<span class="badge badge-success" id="groupLeader">운영진</span>
										</c:if>
										<c:if test="${groupMember.memberNo == m.memberNo}">
											<c:set var="loginGroupMember" value="${groupMember}"/>
											<span id="profileBtn" class="fas fa-pen" data-toggle="modal"></span>
										</c:if>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>

				</div>

			</div>

		</div>

		<!-- 모임의 우측 메뉴 -->
		<c:import url="/WEB-INF/views/groups/rightAside.jsp" />

	</div>
</div>

<!-- 프로필 modal 부분 -->
<div class="modal" id="profileModal" tabindex="-1" role="dialog"
	aria-labelledby="profileTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">

			<div class="modal-header gm_modal_header">
				<h5 class="modal-title gm_modal_tit" id="profileTitle">멤버 프로필</h5>
				<button type="button" class="btn close gm_close"
					data-dismiss="modal" aria-label="Close">
					<span class="modal_close" aria-hidden="true">&times;</span>
				</button>
			</div>
			
			<c:url var="updateGroupMember" value="/groups/updateGroupMember.gp" >
				<c:param name="groupNo" value="${param.groupNo}" />
				<c:param name="memberNo" value="${loginGroupMember.memberNo}"/>
			</c:url>
			
			<div class="modal-body gm_modal_body">
				<form id="profileForm" method="POST" action="${updateGroupMember}" enctype="multipart/form-data">
					<c:if test="${loginGroupMember.profileThumb eq null}">
						<img class="rounded-circle" id="profileImg" src="${root}/resources/images/common/img_profile.png">
					</c:if>
					<c:if test="${loginGroupMember.profileThumb ne null}">
						<img class="rounded-circle" id="profileImg" src="${root}/resources/images/profiles/${loginGroupMember.groupNo}/${loginGroupMember.profileThumb}">
						<input type="hidden" name="profileImg" value="${loginGroupMember.profileImg}"/>
						<input type="hidden" name="profileThumb" value="${loginGroupMember.profileThumb}"/>
					</c:if>
					<input type="hidden" name="resizeProfile" id="resizeProfile" />
					<input type="file" class="profile_upload_inp" name="uploadProfile" id="profileChangeInp"  accept="image/*"/>
					<div class="profile_upload_btn" id="profileChangeBtn"></div>
					<div class="form-group">
						<label id="profileLbl" for="profileMsg">
							상태 메시지 &nbsp;&nbsp;
							<span id="msgLengthCnt">${fn:length(loginGroupMember.profileMsg)}</span>
							 / 
						 	<span id="msgMaxLength">30</span>
						</label>
						<textarea class="form-control gm_inp" name="profileMsg" id="profileMsg" draggable="false" maxlength="30" rows="1" placeholder="최대 30자까지 입력 가능합니다.">${loginGroupMember.profileMsg}</textarea>
					</div>
				</form>
			</div>

			<div class="modal-footer gm_modal_footer">
				<button type="button" id="profileConfirmBtn" class="btn btn-dark">확인</button>
			</div>

		</div>
	</div>
</div>

<!-- 프로필 사진 업로드 modal 부분 -->
<div class="modal" id="profileUploadModal" tabindex="-1" role="dialog"
	aria-labelledby="profileUploadTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">

			<div class="modal-header gm_modal_header">
				<h5 class="modal-title gm_modal_tit" id="profileUploadTitle">프로필 사진 변경</h5>
			</div>

			<div class="modal-body gm_modal_body" id="profileUploadBody">
				<input type="file" class="profile_upload_inp" id="profileUploadInp" accept="image/*" /> 
				<label id="profileUploadLbl" for="profileUploadBtn">이미지파일은 최대 10MB까지 업로드 가능합니다.</label>
				<div class="profile_upload_btn" id="profileUploadBtn"></div>
				<div id="profileUploadCropper">
					<img id="cropperImg" />
				</div>
			</div>

			<div class="modal-footer gm_modal_footer">
				<button type="button" id="profileUploadCloseBtn" class="btn btn-danger">취소</button>
				<button type="button" id="profileUploadConfirmBtn" class="btn btn-dark">확인</button>
			</div>

		</div>
	</div>
</div>

<script>
	/* 
	     1. 정렬기준을 직급, 이름, 나, 나머지로 정렬하기
	   v 2. 프로필 modal 작성 상태에서 x나 바깥 영역 누르면 confirm dialog
	        (history 찾아보기) 
	     3. fontfaceobserver 말고 local/sessionStorage를 이용해서 폰트 띄울것
	 */
	 
	 /* 상태메시지 실시간 글자수 색깔 변경 */
	 function countColorChange() {
		if ($("#profileMsg").val().length == 30)
			$("#msgLengthCnt").css("color", "red");
		else if ($("#profileMsg").val().length > 14)
			$("#msgLengthCnt").css("color", "orange");
		else
			$("#msgLengthCnt").css("color", "black");
	}

	$(function() {
		
		var normalmemberLogin = "${loginGroupMember.memberGradeCode}";
		/* 
		   로그인한 모임의 멤버가 멤버리스트를 볼 경우 자신의 이름 위치가
		   운영진 바로 아래로 위치하도록 하는 부분
		*/
		$("li").has("#profileBtn").addClass("login_group_member");
		if(normalmemberLogin == 1)
			$(".group_member_list_one").has(".badge-success").last().after($(".login_group_member"));

		/* 검색부분의 border 부분을 수정 */
		$("#gmSearchInp").on("focus", function() {
			$(".gm_search_btn").css("border-color", "#343A40");
		}).on("focusout", function() {
			$(".gm_search_btn").css("border-color", "#6C757D");
		}).on("keyup", function(event) {
			/* enterkey를 눌렀을 때 발생하는 event */
			if (event.keyCode == 13)
				$("#searchMemberForm").submit();
		});
		
		/* 검색버튼을 눌렀을 때 발생하는 이벤트 */
		$(".gm_search_btn").click(function() {
			$("#searchMemberForm").submit();
		});

		/* 프로필의 modal을 누를때 esc나 모달 바깥영역을 클릭했을 경우 닫아주는 이벤트를 막는 부분*/
		$("#profileBtn").on("click", function() {
			$('#profileModal').modal({
				backdrop : 'static',
				keyboard : false
			}).css("margin-left", "20px");
			
			countColorChange();
		});

		/* 프로필 사진 업로드 버튼 이미지 커스텀 */
		$("#profileChangeBtn").on("click", function() {
			$(".profile_upload_inp").val("");
			$("#profileChangeInp").click();
		});
		
		var cropperImg = "";
		// 프로필 파일을 업로드 했지만 확인을 누르지 않고 취소했을때 발생하는 이벤트
		$(".gm_close").click(function(){
			if("${loginGroupMember.profileThumb}" != "")
				$("#profileImg").attr("src", "${root}/resources/images/profiles/${loginGroupMember.groupNo}/${loginGroupMember.profileThumb}");
			else
				$("#profileImg").attr("src", "${root}/resources/images/common/img_profile.png");
			
			if("${loginGroupMember.profileMsg}" != "")
				$("#profileMsg").val("${loginGroupMember.profileMsg}");
			else
				$("#profileMsg").val("");
			
			cropperImg = "";
		});	

		/* 프로필 사진 업로드부분의 파일이 변경됐을 경우 발생하는 이벤트 */
		$(".profile_upload_inp").on("change", function() {

			// cropper.js 사용시 이미지를 갱신해주려면 이전 이미지 파일을 destroy 해줘야 함
			$("#cropperImg").cropper("destroy");
			var reader = new FileReader();
		
			var ext = $(this).val().split(".").pop().toLowerCase();

			if (ext.length > 0) {
				if ($.inArray(ext, [ "gif", "png", "jpg", "jpeg" ]) == -1)
					alert("이미지파일(.jpg, .png, .gif)만 업로드 가능합니다.");
				else {
					if ($(this).attr("id") == "profileChangeInp")
						$("#profileUploadModal").toggle();

					// src는 local resource 경로를 읽지 못하므로 filereader를 사용
					reader.readAsDataURL($(this)[0].files[0]);
					reader.onload = function() {

						var $cropperImg = $("#cropperImg");
						$cropperImg.attr("src", reader.result);
						/* cropper.js의 초기 option setting */
						$cropperImg.cropper({
							aspectRatio : 1 / 1,
							viewMode : 1,
							zoomable : false,
							autoCropArea : 1.0,
							minCropBoxWidth : 100,
							minCropBoxHeight : 100
						});
					
						/* 프로필 사진 변경 modal의 확인 버튼을 눌렀을때 발생하는 이벤트 */
						$("#profileUploadConfirmBtn").click(function() {
							cropperImg = $cropperImg.cropper("getCroppedCanvas",{width : 150,height : 150}).toDataURL();
							$("#profileImg").attr("src",$cropperImg.cropper("getCroppedCanvas",{width : 150,height : 150}).toDataURL());
							$("#profileUploadModal").hide();
						});
					};
				}		
			}
		});

		/* 프로필 사진 변경 부분에서 클릭했을때 파일 input 효과주기 */
		$("#profileUploadBtn").on("click", function() {
			$("#profileUploadInp").click();
		});

		/* 프로필 사진 변경 모달을 닫기 위한 click 이벤트  */
		$("#profileUploadCloseBtn").click(function() {
			$("#profileUploadModal").hide();
		});

		$('#profileMsg').on("keyup", function() {
			$("#msgLengthCnt").text($(this).val().length);

			if ($(this).val().length > 30) {
				/* 상태메시지를 한글로 30자 이상 입력했을 경우 alert로 알려줌 */
				alert("상태 메시지는 최대 30자까지 작성 가능합니다.");
				/* 29자까지 입력하고 마지막을 space로 마치면 글자수를
				   31자로 인식하는 현상을 잡아주기 위해 내용을 갱신해줌*/
				$("#msgLengthCnt").text(30);
			}
			else 
				countColorChange();
		});
		
		/* 프로필 modal의 확인 버튼을 누르면 발생하는 이벤트 */
		$("#profileConfirmBtn").click(function() {
			$("#resizeProfile").val(cropperImg);
			$("#profileForm").submit();
		});

	});
</script>
</body>
</html>