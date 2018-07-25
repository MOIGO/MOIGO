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
	
</style>
</head>

<body>
	  
<div class="col-3">
 	<div class="card">
		<img class="card-img-top" src="http://via.placeholder.com/300x300"
			alt="Card image cap">
		<div class="card-body">
			<div class="row">
				<h3 class="card-title groupName bolder_text lead">Moigo Official</h3>
			</div>
			<div class="row joinBtnWrapper">
				<button class="btn btn-block" onclick="joinGroup();">가입하기</button>
			</div>
			<div class="row mt-3">
				<p class="card-text groupDesc">테스트 그룹입니다.</p>
			</div>
			<div class="row mt-3 notJoined">
				<div class="col-6 test">
					멤버: <span class="group_memNum">6명</span>
				</div>
				<div class="col-6 test">
					리더 : <span class="group_leader ">홍길동</span>
				</div>
			</div>
			
			<div class="row mt-3 joined">
				<div class="col-6 test">
					멤버: <span class="group_memNum">6명</span>
				</div>
				<div class="col-6  test">
					<i class="fas fa-plus-circle"></i> 그룹 초대
				</div>
			</div>
			
			
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
	<div class="d-flex justify-content-end">
		<i class="fas fa-cog"></i><span id="groupSetting">그룹 설정</span>
	</div>
 </div>
 
 <form id="groupNoForm" action="${root}/groups/joinGroup.gp">
 	<input type="hidden" name="groupNo" id="groupNo" value="${param.groupNo}"/>
 	<c:if test="${m.memberNo ne null }">
 		<input type="hidden" name="memberNo" value="${m.memberNo}"/>
 	</c:if>
 </form>

</body>

<script>



function setGroupDesc(groupNo){
	$.ajax({
		url:'${root}/groups/selectOneGroup.gp',
		data:{groupNo:groupNo},
		dataType:"json",
		success:function(data){
			var  group = data.group;
			
			console.log(data);
			if((group.groupPicture).indexOf('createGroupDefaultPictures')>0){
				$('.card-img-top').attr("src",group.groupPicture);
			}else{
				$('.card-img-top').attr("src",'${root}/resources/images/groupCovers/${param.groupNo}/'+group.groupPicture);
			}
			
			if(data.isMember>0){
				$('.joinBtnWrapper').css("display","none");
				$('.joined').css("display","relative");
				$('.notJoined').css("display","none");
			}else{
				$('.joinBtnWrapper').css("display","relative");
				$('.joined').css("display","none");
				$('.notJoined').css("display","relative");
			}
			
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

$(function() {

	setGroupDesc('${param.groupNo}');
	
	/* 각 메뉴로 이동하는 메소드 */
	$(".group_list").on("click", function() {
		var groupMenu = $(this).text();
		
		if(groupMenu == '전체글')
			alert("전체글!");
		else if(groupMenu == '사진첩')
			alert("사진첩");
		else if(groupMenu == '일정')
			$("#groupNoForm").attr("action", "${root}/groups/groupSchedule.gp").submit();
		else
			$("#groupNoForm").attr("action", "${root}/groups/groupMember.gp").submit();
		
	});
	
	$("#groupSetting").on("click", function() {
		$("#groupNoForm").attr("action", "${root}/groups/groupSetting.gp").submit();
	});
});
	
</script>

</html>

