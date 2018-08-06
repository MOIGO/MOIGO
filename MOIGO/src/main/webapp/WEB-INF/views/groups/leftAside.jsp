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
	
	.deleteListGroup{
		background:#EDEFF2;
		text-align:left;
		
	}
	
	@media (max-width: 992px) {
	
		.numLeaderFontSize{
			
		}
	}


</style>
</head>

<body>

<c:import url="/WEB-INF/views/admin/common/reportModal.jsp" />

<div class="col-3 d-none d-lg-block">
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
						<div class="col-5 numLeaderFontSize">
							<span>멤버:</span> <span class="group_memNum"></span>
						</div>
						<div class="col-7 numLeaderFontSize">
							<span>리더:</span> <span class="group_leader ">홍길동</span>
						</div>
					</div>
				</c:when>
				<c:when test="${param.memberGrade<0 }">
				<div class="row mt-3 notJoined">
						<div class="col-5 numLeaderFontSize">
							<span>멤버:</span> <span class="group_memNum">6명</span>
						</div>
						<div class="col-7  numLeaderFontSize">
							<span>리더:</span>  <span class="group_leader ">홍길동</span>
						</div>
				</div>
					
				</c:when>
				<c:when test="${param.memberGrade eq 0 }">
					<div class="row mt-3 notJoined">
							<div class="col-5 numLeaderFontSize" >
								<span>멤버:</span> <span class="group_memNum">6명</span>
							</div>
							<div class="col-7 numLeaderFontSize">
								<span>리더:</span>  <span class="group_leader ">홍길동</span>
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
	<div class="d-flex flex-column ">
		
	
	<c:if test="${memberGrade>=3}">
		<button class="btn btn-default btn-sm deleteListGroup "><i class="fas fa-cog"></i><span id="groupSetting" class="mr-3">그룹 설정</span></button>
	</c:if>
	
	<c:if test="${memberGrade!=3}">
		<button class="btn btn-default btn-sm deleteListGroup "><i class="fas fa-exclamation mr-2"></i><span id="groupReport" >그룹 신고</span></button>
	</c:if>
	<c:if test="${gm!=null}">
		<button class="btn btn-default btn-sm deleteListGroup "><i class="fas fa-user-minus"></i><span id="groupWithdrawal" >그룹 탈퇴</span></button>
	</c:if>


	</div>
	
 </div>
 
 <form id="groupWithdrawalForm" action="${pageContext.request.contextPath}/groups/groupWithdrawal.gp" method="post">
 	<input type="hidden" name="memberNo" value="${gm.memberNo}"/>
 	<input type="hidden" name="groupNo" value="${groupNo}"/>
 	<input type="hidden" name="deleteGroup"/>
 </form>
 
 
 
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

var reportUrl;
var memberNum;


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
			memberNum=data.grpMemNum;
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
	
	reportUrl="${pageContext.request.contextPath}/reporting2.ad";
	
	$('#accuseReporter').val("${m.memberNo}");
	$('#accuseTarget').val("${groupNo}");
	
	$('#reportingModal').modal("toggle");
}); 

$(function() {

	setGroupDesc('${param.groupNo}','${param.isMember}');
	
	/* 각 메뉴로 이동하는 메소드 */
	$(".group_list").on("click", function() {
		var groupMenu = $(this).text();
		
		if(groupMenu == '전체글'){
			
			currentPage=1;
		/* 	deleteAllPost();
			setPostList(); */
			
			location.href = '${pageContext.request.contextPath}/groups/groupMain.gp?groupNo=${param.groupNo}';
			
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
	

});
	
//회원 탈퇴
$('#groupWithdrawal').on("click",function(){
	
	
	if('${gm.memberGradeCode>=3}'=='true'&&memberNum>1){
		alert("모임장은 탈퇴 할 수 없습니다.");
		return;
	}
	  
	
	
	if('${gm.memberGradeCode>=1}'=='true'){
		
		if(memberNum<=1){
			if(confirm("모임의 마지막 멤버인 경우 모임도 같이 삭제 됩니다. 탈퇴하시겠습니까?")){
				
				$('#groupWithdrawalForm input[name=deleteGroup]').val('Y');
				$('#groupWithdrawalForm').submit();
				return;
			}
					
		}
		
		
		if(confirm("탈퇴하시겠습니까?")){
			$('#groupWithdrawalForm input[name=deleteGroup]').val('N');
			$('#groupWithdrawalForm').submit();
			return;
		}
	}
	
	
	
	
});
	
	
	
//신고 모달 관련 스크립트

$('#reportSubmit').on('click',function(){
	var data =$("input[name=reportRadios]:checked").val()+" | "+$("select[name=myList]").val();
	var data2 =$("#accuseTarget").val();
	var data3 =$("#accuseReporter").val();
	console.log(data+data2+data3);
    $.ajax({
        type: 'post', 
        url: reportUrl, 
        data : {data : data, data2: data2, data3:data3},
        success : function(data){
			alert("성공적으로 신고되었습니다."); 
			$('#reportingModal').modal("hide");
        },error:function(request,status,error){
               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
});	



function Activity(name, list){
    this.name = name;
    this.list = list;
}

var acts = new Array();
	acts[0] = new Activity('폭력적 또는 혐오스러운 콘텐츠', ['세부 신고 항목 선택','청소년 폭력물', '성인 폭력물', '동물 학대','신체적 공격']);
	acts[1] = new Activity('증오 또는 악의적인 콘텐츠', ['세부 신고 항목 선택','증오심 또는 폭력 조장', '사회적 약자 학대', '괴롭힘','악의적인 내용']);
	acts[2] = new Activity('스팸 또는 과장된 광고 콘텐츠', ['세부 신고 항목 선택','대량광고', '의약품 판매', '현혹하는 텍스트','현혹하는 이미지']);
	acts[3] = new Activity('권리침해', ['세부 신고 항목 선택','내 저작권을 침해함', '내 개인정보를 침해함', '기타 법적 문제']);
	acts[4] = new Activity('아동학대', ['세부 신고 항목 선택','상해','언어폭력','기타 모욕적인 행위']);
	acts[5] = new Activity('기타', []);
	
function updateList(str){
    var frm = document.myForm;
    var oriLen = frm.myList.length;
    var numActs;
    
    for (var i = 0; i < acts.length; i++){

        if (str == acts[i].name) {
            numActs = acts[i].list.length;
            for (var j = 0; j < numActs; j++)
                frm.myList.options[j] = new Option(acts[i].list[j],
				acts[i].list[j]);
            for (var j = numActs; j < oriLen; j++)
				frm.myList.options[numActs] = null;
        }
    }
    if($(".myList").css("display") == "none"){   
        jQuery('.myList').css("display", "block");   
    }
}

</script>

</html>

