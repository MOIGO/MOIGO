<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<html>
<head>
<%-- 
<script src="${root}/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${root}/resources/css/bootstrap/bootstrap.min.css"> 
<script src="${root}/resources/js/bootstrap/bootstrap.min.js" ></script>	
<link rel="stylesheet" href="${root}/resources/css/common/fonts.css" > 
--%>
<style>
	.bolder_text{
		font-weight: bolder;
	}
	
	.group_list:hover {
		cursor: pointer;
	}
	
	#groupSetting {
		cursor : default;
	}
	
	#groupSetting:hover {
		cursor : pointer;
	}
	
	.customModalSize{
		max-width: 	40%;
	}	
	
	#groupReport:hover {
		cursor : pointer;
	}
	
	
	
</style>
</head>

<body>

<c:import url="/WEB-INF/views/admin/common/reportModal.jsp" />

<div class="col-3">
 	<div class="card">
		<img class="card-img-top" src="http://via.placeholder.com/300x300"
			alt="Card image cap">
		<div class="card-body">
			<div class="row">
				<h3 class="card-title groupName bolder_text lead">Moigo Official</h3>
			</div>
			
			<c:choose>
				<c:when test="${param.memberGrade eq -1 }">
					<div class="row joinBtnWrapper">
						<button class="btn btn-block" type="button" data-toggle="modal" data-target="#joinModal">가입하기</button>
					</div>
				</c:when>
				<c:when test="${param.memberGrade eq 0 }"> 
					<div class="row joinBtnWrapper">
						<button class="btn btn-block" type="button" disabled>승인 대기중</button>
					</div>
				</c:when>
			</c:choose>
			
			<div class="row mt-3">
				<p class="card-text groupDesc"></p>
			</div>
			<c:choose>
				<c:when test="${param.memberGrade>0}">
					<div class="row mt-3 joined">
						<div class="col-6 test">
							멤버: <span class="group_memNum"></span>
						</div>
						<div class="col-6  test">
							<i class="fas fa-plus-circle"></i> 그룹 초대
						</div>
					</div>
				</c:when>
				<c:when test="${param.memberGrade<0 }">
				<div class="row mt-3 notJoined">
						<div class="col-6 test">
							멤버: <span class="group_memNum">6명</span>
						</div>
						<div class="col-6 test">
							리더 : <span class="group_leader ">홍길동</span>
						</div>
				</div>
					
				</c:when>
				<c:when test="${param.memberGrade eq 0 }">
					<div class="row mt-3 notJoined">
							<div class="col-6 test">
								멤버: <span class="group_memNum">6명</span>
							</div>
							<div class="col-6 test">
								리더 : <span class="group_leader ">홍길동</span>
							</div>
					</div>
				</c:when>
				
			</c:choose>
			
		</div>
	</div>
	<br />
	<div>
		<ul class="list-group">
			<li class="list-group-item group_list"><i class="fas fa-book mr-2"></i><span>전체글</span></li>
			<li class="list-group-item group_list"><i class="far fa-images mr-2"></i><span>사진첩</span></li>
			<li class="list-group-item group_list"><i class="far fa-calendar-alt mr-2"></i><span>일정</span></li>
			<li class="list-group-item group_list"><i class="fas fa-users mr-2"></i><span>멤버</span></li>				
		</ul>
	</div>
	<hr />
	<div class="d-flex justify-content-start">
		<i class="fas fa-cog"></i><span id="groupSetting" class="mr-3">그룹 설정</span>
		<i class="fas fa-exclamation"></i><span id="groupReport" >그룹 신고</span>
	</div>
	
 </div>
 
 
 <form id="groupNoForm" action="${root}/groups/joinGroup.gp">
 	<input type="hidden" name="groupNo" id="groupNo" value="${param.groupNo}"/>
 </form>
 
 	<!--join modal  -->
	<div class="modal" id="joinModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog customModalSize modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-center" id="joinModalTitle">가입하기</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
					<div class="modal-body">
						<div class="d-flex flex-column justify-content-center">
							<img src="" alt="" class="img-fluid" />
							<strong class="groupName text-center mt-3 bandName"> </strong>
							<p class="lead groupDesc mt-3 text-center "></p>
							<p class="text-center"><strong class="groupName"></strong> 모임에 가입하시겠습니까?</p>
						</div>
					</div>
					
					<div class="modal-footer">
					
						<button type="button" class="btn btn-primary btn-block" onclick="joinGroup()">확인</button>
					</div>
			</div>
		</div>
	</div>
	

</body>

<script>



function setGroupDesc(groupNo,isMember){
	$.ajax({
		url:'${root}/groups/selectOneGroup.gp',
		data:{groupNo:groupNo},
		dataType:"json",
		success:function(data){
			var  group = data.group;
      
			if((group.groupPicture).indexOf('createGroupDefaultPictures')>0){
				$('.card-img-top').attr("src",group.groupPicture);
				$('#joinModal img').attr("src",group.groupPicture);
			}else{
				$('.card-img-top').attr("src",'${root}/resources/images/groupCovers/${param.groupNo}/'+group.groupPicture);
				$('#joinModal img').attr("src",'${root}/resources/images/groupCovers/${param.groupNo}/'+group.groupPicture);
			}
			
		
			
			$('#joinModal .groupName').text(group.groupName);
			$('#joinModal .groupDesc').text(group.groupMsg);
			$('.groupName').text(group.groupName);
			$('.groupDesc').text(group.groupMsg);
			$('.group_leader').text(data.grpLeader.memberName);
			$('.group_memNum').text(data.grpMemNum+" 명");
		},error:function(data){
			
		}
	});
}

function joinGroup(){
	if('${m.memberNo}'!=null){
		
		$('#groupNoForm').submit();
	}else{
		alert("로그인 해주세요!");
	}
	
	
}

$('#groupReport').on("click",function(){
	$('#reportingModal').modal("toggle");
});

$(function() {

	setGroupDesc('${param.groupNo}','${param.isMember}');
	
	/* 각 메뉴로 이동하는 메소드 */
	$(".group_list").on("click", function() {
		var groupMenu = $(this).text();
		
		if(groupMenu == '전체글'){
			currentPage=1;
			deleteAllPost();
			setPostList();
		}
		else if(groupMenu == '사진첩')
			$("#groupNoForm").attr("action", "${root}/groups/groupPhotoAlbum.gp").submit();
		else if(groupMenu == '일정')
			$("#groupNoForm").attr("action", "${root}/groups/groupSchedule.gp").submit();
		else
			$("#groupNoForm").attr("action", "${root}/groups/groupMember.gp").submit();
		
	});
	
	$("#groupSetting").on("click", function() {
		$("#groupNoForm").attr("action", "${root}/groups/groupSetting.gp").submit();
	});
	
	
	$("#accuseTarget").val();
	$("#accuseReporter").val();
});
	
	
//신고 모달 관련 스크립트

$('#reportSubmit').on('click',function(){
	var data =$("input[name=reportRadios]").val() +" | "+$("select[name=myList]").val();
	var data2 =$("#accuseTarget").val();
	var data3 =$("#accuseReporter").val();
	
	console.log(data+data2+data3);
    $.ajax({
        type: 'post', 
        url: "${pageContext.request.contextPath}/reporting.ad", 
        data : {data : data, data2: data2},
        success : function(data){
		alert("성공"); 
        }
    });
});	

</script>

</html>

