<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="group" value="${requestScope.group}"/>
<html>
<head>
<script src="https://unpkg.com/ionicons@4.2.2/dist/ionicons.js"></script>
<style>

   body{
      background: #EDEFF2; 
   }
   
   /* card 부분 */
   .card, .card-header {
         background: white;
   }
   
   /* 그룹 공통 부분 */
   .group_tit {
      margin-bottom:0px; 
      font-family:'nanum-barun-gothic-bold', sans-serif;  
      font-size:1.3em;
   }
   
   .group_tit:hover{
         cursor : default;
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
   
   /* 설정 공통 부분 */
   .gs_footer {
         background: white;
         margin-top: 20px;
         padding: 0px;
   }
   
   .gs_inp:focus, .gs_inp:active:focus {
      border-color : #343A40;
      box-shadow: none;
   }
   
   /* 설정 메인 리스트 부분 */
   .gs_list_group {
      padding: 10px;
      height: 60px;
   }
   
   .setting_tit {
         vertical-align : text-bottom;
         line-height: 5px;
   }
   
   .setting_tit:hover {
         cursor: default;
   }
   
   .setting_btn {
         float : right;
         margin-top: 4px;
         padding: 1px 7px 0px 6px;
         height : 30px;
         font-size: 1em;
         letter-spacing: -1px;
   }
   
   /* 가입 조건 관리 부분 */
   #conditionList{
         display: none;
   }
   
   .condition_font_size {
         font-size: 0.9em;
   }
   
   .float_right {
         float: right;
   }
   
   .list_common{
         margin-top: 7px;
         padding: 2px 0px 2px 0px;
         width : 110px;
         letter-spacing: -1px;
   }
   
   .list_common:focus {
         outline: none;
   }
   
   .age_txt {
         margin : 2px;
   }
   
   .age_txt:hover {
         cursor: default;
   }
   
   .form-check {
         margin-top: 7px;
   }
   
   .gm_region_inp {
         margin-left: -1em;
         margin-top: 5px;
   }
   
   .gm_region_lbl {
         padding-left: 0px;
   }
   
   .max_member_wrap {
         margin-top: 4px;
   }
   
   #maxMemberInp {
         display : inline;
         padding : 5px;
         width : 30px;
         height: 28px;
         font-weight: bolder;
   }
   
   .max_member_txt {
         padding: 2px;
   }
   
   .max_member_txt:hover {
         cursor: default;
   }
   
   #minMember {
         color : #0078ff;
         font-weight: bold;
   }
   
   .gm_join_wrap{
   		margin-top : 2px;
   		padding : 0px;
   }
   
   .gm_join_inner{
   		margin-right: 0px;
   }
   
   .gm_join_inp {
   		margin-right: 0px !important;
   }
   
   .gm_join_lbl {
   		padding-left: 0px;
   		padding-bottom : 2px;
   }
   
   #conditionFooter {
         display: none;
         text-align : center;
   }
   
   #conditionConfirmBtn {
         margin-top : 15px;
         letter-spacing: -1px;
   }
   
   /* 멤버 설정 관리 부분 */
   #memberSearchWrap {
      display: none;
   }
   
   .gm_inp:focus, .gm_inp:active:focus {
      border-color : #343A40;
      box-shadow: none;
   }
   
   .gm_search_btn {
      margin : 0px;
      padding : 0px;
      width : 38px;
   }
   
   #searchBtn {
      vertical-align:text-bottom;
      font-size: 24px; 
   }
   
   .search_result_none {
	padding-top : 135px;
	height : 300px;
	text-align: center;
	color: gray;
}
   
   .gs_member_a {
		color : black;
   }
   
   .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
   		color : #007BFF;
   }
   
   .gs_member_content {
   		margin-top : 5px;
   }
   
.list-group-item {
	padding-left: 13px;
	padding-right: 13px;
}

.gs_check_inp {
	/* display : none; */
}

.gs_check_btn {
	float : left;
	margin-top : 18px;
	margin-right : 7px;
	font-size: 1.2em;
}
.gs_unchecked {
	color : darkgray;
}
.gs_unchecked:hover {
	color : #0078ff;
	cursor: pointer;
}
.gs_checked {
	color : #0078ff;
}
.gs_checked:hover {
	cursor : pointer;
}

#listImg {
	width: 50px;
	height: 50px;
}

.list_wrap {
	width: 100%;
	height: 50px;
}

.list_txt {
	display: inline-block;
	vertical-align: bottom;
	padding-left: 5px;
	padding-top: 13px;
	height: 100%;
	margin: 0px;
	/* border: 1px solid black; */
}

#listName {
	font-family: 'nanum-barun-gothic-bold', sans-serif;
	font-size: 1.1em;
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
   
   /* 모임 삭제 모달 부분 */
    .gs_modal_header {
      display: inline;
      text-align: center;
      padding : 10px 10px 7px 10px;
   }
   
   .gs_modal_tit {
      display : inline;
      font-family:'nanum-barun-gothic-bold', sans-serif;
      font-size: 1.3em;
   }
   .gs_modal_tit:hover, .gs_modal_body:hover {
      cursor: default;
   }
   
   .gs_modal_footer{
      display : inline-block;
      text-align: center;
      padding: 12px 0px 12px 0px;
   }
   
</style>
<title>멤버</title>
</head>
<body>
<!-- 모임 컨텐츠 -->
<div class="container">
   <div class="row">
      
      <!-- 모임의 좌측 메뉴 -->
      <c:import url="/WEB-INF/views/groups/leftAside.jsp"/>
      
      <!-- 모임의 가운데(주요 기능부분) -->
      <div class="col-7">
         <div class="card">
         
            <!-- 모임의 각 메뉴 타이틀 -->
            <div class="card-header" >           
               <p class="group_tit">설정</p>
            </div>
                    
            <!-- 모임 내용 -->
            <div class="card-body">
               
               <!-- 설정 리스트 부분 -->
               <ul class="list-group" id="settingList">
                  
                  <li class="list-group-item gs_list_group">
                     <span class="setting_tit">모임 관리</span>
                     <button type="button" class="btn btn-dark setting_btn" id="groupUpdateBtn">변경</button>
                  </li>
                  
                   <li class="list-group-item gs_list_group">
                     <span class="setting_tit">가입 조건 관리</span>
                     <button type="button" class="btn btn-dark setting_btn" id="groupConditionBtn">변경</button>
                  </li>
                  
                   <li class="list-group-item gs_list_group">
                     <span class="setting_tit">멤버 설정 관리</span>
                     <button type="button" class="btn btn-dark setting_btn" id="groupMemberManageBtn">변경</button>
                  </li>
                  
                   <li class="list-group-item gs_list_group">
                     <span class="setting_tit">모임 삭제</span>
                     <button type="button" class="btn btn-danger setting_btn" id="groupDeleteBtn" 
                           data-toggle="modal" >삭제</button>
                  </li>
 
               </ul>
               
               
               <!-- 가입 조건 관리 -->
                  <c:url var="updateGroupCondition" value="/groups/updateGroupCondition.gp" >
               		<c:param name="groupNo" value="${param.groupNo}" />
            		</c:url>
               
                <form id="updateGroupConditionForm" action="${updateGroupCondition}" method="POST">
                   
                   <!-- 성별 -->
                   <ul class="list-group" id="conditionList"> 
                     <li class="list-group-item gs_list_group">
                        <span class="setting_tit">성별</span>
                        <select class="float_right list_common condition_font_size" name="groupGender" id="conditionGender">
                        <option selected value="N">제한없음</option>
                        <option value="M">남성</option>
                        <option value="F">여성</option>
                     </select>
                     </li>
                     
                   <!-- 나이 -->
                      <li class="list-group-item gs_list_group">
                        <span class="setting_tit">나이</span>
                        <span class="float_right age_wrap">
                           <span class="age_txt condition_font_size">최대나이</span>
                        <select class="list_common condition_font_size" name="maxAge" id="conditionMaxAge">
                           <option selected value="-1">제한없음</option>
                           <c:set var="now" value="<%= new java.util.Date()%>" />
                           <fmt:formatDate var="nowYear" value="${now}" pattern="yyyy"/>
                           <c:forEach var="i" begin="1918" end="${nowYear}">
                              <option value="${nowYear - i + 1918}">${nowYear - i + 1918}년생</option>
                           </c:forEach>
                        </select>                     
                           <span class="age_txt condition_font_size">-</span>
                        <span class="age_txt condition_font_size">최소나이</span>
                           <select class="list_common condition_font_size" name="minAge" id="conditionMinAge">
                           <option selected value="-1">제한없음</option>
                        </select>
                        </span>
                     </li>
                     
                   <!-- 지역 -->
                      <li class="list-group-item gs_list_group">
                        <span class="setting_tit">지역</span>
                        <span class="float_right region_wrap">
                           <input type="hidden" id="regionFull" name="groupAddress"/>
                           <select class="list_common condition_font_size condition_region" id="conditionRegionLarge">
                                 <option value="regionNone">- 시도 -</option>
                           </select>
                           &nbsp;
                           <select class="list_common condition_font_size condition_region" id="conditionRegionMedium">
                             <option value="regionNone">- 시군구 -</option>
                             <option>전체</option>
                          </select>
                           &nbsp;
                          <select class="list_common condition_font_size condition_region" id="conditionRegionSmall">
                             <option value="regionNone">- 읍면동 -</option>
                             <option>전체</option>
                          </select>
                           &nbsp;
                          <span class="float_right form-check">
                             <input class="form-check-input gm_region_inp" type="checkbox" id="regionNone">
                             <label class="form-check-label gm_region_lbl condition_font_size" for="regionNone">지역 무관</label>
                          </span>
                             
                        </span>
                     </li>
                     
                   <!-- 최대 멤버수 -->
                   	 <li class="list-group-item gs_list_group">
                        <span class="setting_tit">최대 멤버수</span>
                        <span class="float_right max_member_wrap">
                           <span class="max_member_txt condition_font_size" id="minMember">1</span>                           
                           <span class="max_member_txt condition_font_size">/</span>
                           <input type="text" class="gs_inp form-control condition_font_size" name="maxMember" id="maxMemberInp" maxlength="2"/>
                           <span class="max_member_txt condition_font_size">(최대 멤버수는 50명 입니다.)</span>
                        </span>
                     </li>
                     
                     <li class="list-group-item gs_list_group">
                     	<span class="setting_tit">가입 신청 받기</span>
                     	<span class="float_right gm_join_wrap">
	                     	<span class="gm_join_inner form-check form-check-inline">
							  <input class="form-check-input gm_join_inp" type="radio" name="allowSignup" id="joinY" value="Y" checked="checked">
							  <label class="form-check-label condition_font_size gm_join_lbl">예</label>
							</span>
							<span class="gm_join_inner form-check form-check-inline">
							  <input class="form-check-input gm_join_inp" type="radio" name="allowSignup" id="joinN" value="N">
							  <label class="form-check-label condition_font_size gm_join_lbl">아니오</label>
							</span>
                        </span>
                     </li>
                  </ul>
                  
                   <div class="card-footer gs_footer" id="conditionFooter">
                      <button type="button" class="btn btn-dark" id="conditionConfirmBtn">확인</button>
                   </div>
                  
                </form>
               
               
               <!-- 멤버 설정 관리 -->
               <div id="memberSearchWrap">    
                                
                  <!-- 멤버 검색 부분 -->
                  <div class="input-group mb-3">
                     <input type="text" class="form-control gm_inp" id="gmSearchInp" placeholder="멤버 검색">
                     <div class="input-group-append">
                        <button class="btn btn-outline-secondary gm_search_btn" type="button">
                           <ion-icon id="searchBtn" name="search"></ion-icon>
                        </button>
                     </div>
                  </div>
                  
                  <!-- 멤버 설정 부분 -->
               <nav>
                 <div class="nav nav-tabs" id="groupMemberSettingTab" role="tablist">
                   <a class="nav-item nav-link active gs_member_a" id="groupMemberGrade" data-toggle="tab" href="#groupMemberSettingContent" role="tab">멤버등급</a>
                   <a class="nav-item nav-link gs_member_a" id="leaderDelegation" data-toggle="tab" href="#groupMemberSettingContent" role="tab">리더위임</a>
                   <a class="nav-item nav-link gs_member_a" id="groupMemberWithdraw" data-toggle="tab" href="#groupMemberSettingContent" role="tab">멤버탈퇴</a>
                   <c:if test="${group.allowSignup == 'Y'}">
	                   <a class="nav-item nav-link gs_member_a" id="groupJoinApprove" data-toggle="tab" href="#groupMemberSettingContent" role="tab">가입승인</a>
                   </c:if>
                 </div>
               </nav>
               <div class="tab-content" id="groupMemberSettingContent">
                 <div class="tab-pane fade show active gs_member_content" id="groupMemberSettingContent" role="tabpanel">
                 	<form id="groupMemberSettingForm" action="">
						<ul class="list-group gs_member_ul">
						</ul>
                 	</form>
                 </div>
               </div>
                  
               </div>
               
               <!-- 모임 삭제 -->
               <div class="modal" id="groupDeleteModal" tabindex="-1" role="dialog" aria-labelledby="groupDeleteTitle" aria-hidden="true">
                 <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
                 <div class="modal-content">
                 
                    <div class="modal-header gs_modal_header">
                       <h5 class="modal-title gs_modal_tit" id="groupDeleteTitle">모임 삭제</h5>
                    </div>
                    
                    <div class="modal-body gs_modal_body">         
                       <span class="delete_info">
                        모임을 삭제하시겠습니까? <br />
                        삭제 후에는 복구가 불가능합니다.
                       </span>
                    </div>
                     
                     <div class="modal-footer gs_modal_footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-danger btn-sm" id="groupDelConfirmBtn">삭제하기</button>
                     </div>
                     
                  </div>
               </div>
            </div>
            
            </div>
           
         </div>
        
      </div>
     
      <!-- 모임의 우측 메뉴 -->
      <c:import url="/WEB-INF/views/groups/rightAside.jsp"/>
     
   </div>
</div>

<script>

/* 
   설정에서 브라우저의 뒤로가기 버튼을 눌렀을 때
   마치 페이지 전환이 되는 것 같은 효과를 주기 위한 메소드
*/ 

function goSettingBack() {
   history.pushState(null, null, location.href);
   window.onpopstate = function() {
        $(".group_tit").text("설정");
        $("#settingList").css("display", "block");
        $("#conditionList").css("display", "none");
        $("#conditionFooter").css("display", "none");
        $("#memberSearchWrap").css("display", "none");
   };
}

var regions = "${group.groupAddress}".split(" ");
var regionMedium = regions[1];
var regionSmall = regions[2];

function mediumRegion(lRegion) {
	
	if(regions[1] == "수원시" || regions[1] == "성남시")
		regionMedium = regions[1] + " " +regions[2];
	
	$.ajax({
        url:'http://api.vworld.kr/req/data?service=data&request=GetFeature&data=LT_C_ADSIGG_INFO&key=D2A9AD49-5624-3245-BB98-EEBB6C10B050'
              +'&domain=http://127.0.0.1:8080&attrFilter=full_nm:like:'+ lRegion +'&size=100',
          type:'GET',
          dataType:'jsonp',
          async: false,
          success:function(data){
           var features =  data.response.result.featureCollection.features;
           var regionMediums = [];
          
           for(var i=0 ; i < features.length; i++){
        	  var selected = "";
              regionMediums[i] = features[i].properties.sig_kor_nm;
              if(regionMedium == regionMediums[i])
	            	selected = "selected";
              $("#conditionRegionMedium").append("<option value='"+regionMediums[i] + "' " + selected + ">"+regionMediums[i]+"</option>");
           }
             
       },error:function(data){
            console.log("에러입니다"); 
       }
 	});
}

function smallRegion(lmRegion){
	
	if(regions[1] == "수원시" || regions[1] == "성남시")
		regionSmall = regions[3];
	
	$.ajax({
        url:'http://api.vworld.kr/req/data?service=data&request=GetFeature&data=LT_C_ADEMD_INFO&key=D2A9AD49-5624-3245-BB98-EEBB6C10B050'
              +'&domain=http://127.0.0.1:8080&attrFilter=full_nm:like:'+ lmRegion +'&size=100',
          type:'GET',
          dataType:'jsonp',
          async: false,
          success:function(data){

           var features =  data.response.result.featureCollection.features;
           var regionSmalls = [];
          
           for(var i=0 ; i < features.length; i++){
        	  var selected = "";
              regionSmalls[i] = features[i].properties.emd_kor_nm;
              if(regionSmall == regionSmalls[i])
	            	selected = "selected";
              $("#conditionRegionSmall").append("<option value="+regionSmalls[i]+ " " + selected + ">"+regionSmalls[i]+"</option>");
           }
             
       },error:function(data){
            console.log("에러입니다"); 
       }
  });
	
}

var gmSettingId = "groupMemberGrade";

function getGroupMember(gmSettingId){
	console.log(gmSettingId);
	$(".gs_member_ul").children().remove();
    $.ajax({
		url : "${root}/groups/goGroupMemberSetting.gp",
		data : {groupNo : "${param.groupNo}"},
		dataType : "json",
		async : false,
		success : function(data) {
			var groupMember = data.groupMember;
			createGroupMemberList(groupMember, gmSettingId);
		},
		error : function() {
			console.log("멤버설정 멤버리스트 가져오기 오류");
		}
	});
}

function createGroupMemberList(groupMember, gmSettingId){
	
	for(var i=0; i < groupMember.length; i++){
		var append = "<li class='list-group-item'><div class='list_wrap'>";
		
		var inp = "<input type='checkbox' class='gs_check_inp'>";
		var checkBtn = "<span class='far fa-check-circle gs_check_btn gs_unchecked'></span>";
		
		if(gmSettingId == "groupMemberWithdraw"){
			inp = "<input type='radio' name='memberNo' class='gs_check_inp' value='" + groupMember[i].memberNo+ "'>";
			checkBtn = "<span class='far fa-dot-circle gs_check_btn gs_unchecked'></span>";
		}
		
		var profileImg = "<img id='listImg' class='rounded-circle' ";
		if(groupMember[i].profileThumb == null)
			profileImg += "src='${root}/resources/images/common/img_profile.png'>";
		else
			profileImg += "src='${root}/resources/images/profiles/${group.groupNo}/"+ groupMember[i].profileThumb +"'>";
		
		var groupMemberName = "<span class='list_txt' id='listName'>"+ groupMember[i].memberName +"</span>";
		
		var memberGrade = "";
		if(groupMember[i].memberGradeCode == 3)
			memberGrade = "<span class='badge badge-primary' id='groupLeader'>모임장</span>";
		else if(groupMember[i].memberGradeCode == 2)
			memberGrade = "<span class='badge badge-success' id='groupLeader'>운영진</span>";
			
		append += inp + checkBtn + profileImg + groupMemberName + memberGrade + "</div></li>";
		
		if(gmSettingId != "groupJoinApprove"){
			if(groupMember[i].memberGradeCode > 0)
				$(".gs_member_ul").append(append);
		}else{
			if(groupMember[i].memberGradeCode == 0)
				$(".gs_member_ul").append(append);
		}
			
	}
	
	$(".gs_check_btn").each(function() {
		$(this).on("click", function() {
			$(this).prev().click();
			if($(this).prev().is(":checked")){
				$(this).removeClass('far').addClass('fas');
				$(this).removeClass('gs_unchecked').addClass('gs_checked');
			}
			else{
				$(this).removeClass('fas').addClass('far');
				$(this).removeClass('gs_checked').addClass('gs_unchecked');
			}
		});
	});
	
}

function searchGroupMember() {
	
	$(".gs_member_ul").children().remove();
	$.ajax({
		url : "${root}/groups/searchGroupMemberSetting.gp",
		data : {
			groupNo : "${group.groupNo}",
			searchName : $("#gmSearchInp").val()
		},
		dataType : "json",
		async : false,
		success : function(data) {
			var groupMember = data.groupMember;
		
			if(groupMember.length != 0)
				createGroupMemberList(groupMember, gmSettingId);
			else
				$(".gs_member_ul").append("<div class='card search_result_none'>검색 결과가 없습니다.</div>");
		},
		error : function() {
			console.log("멤버설정 멤버리스트 가져오기 오류");
		}
	});
}

$(function() {

   console.log("${group}");
   console.log(regions);
   
   /* 모임 관리 */
   $("#groupUpdateBtn").on("click", function() {
      location.href = "${root}/groups/updateGroupDefault.gp?groupNo=${param.groupNo}";
   });
   
   /* 가입 조건 관리 */
   $("#groupConditionBtn").on("click", function() {
	  goSettingBack();
      $(".group_tit").text("가입 조건 관리");
      $("#settingList").css("display", "none");
      $("#conditionList").css("display", "block");
      $("#conditionFooter").css("display", "block");
      
      $("#conditionGender").val("${group.groupGender}").prop("selected", true);
      $("#conditionMaxAge").val("${group.maxAge}").prop("selected", true);
      var minAgeRange = "${nowYear-100}";
      if("${group.maxAge}" != -1)
    	  minAgeRange = "${group.maxAge}";
      for(var i="${nowYear}"; i >= minAgeRange; i--){
    	  $("#conditionMinAge").append("<option value="+ i +">" + i + "년생</option>");
      }
      $("#conditionMinAge").val("${group.minAge}").prop("selected", true);
     
      if("${group.groupAddress}" == "지역무관"){
         $("#regionNone").prop("checked", true);
         $(".condition_region").prop("disabled", true);         
         $(".condition_region").val("regionNone").prop("selected", true);
      }
      
      // 행정구역 list를 가져오기 위한 ajax 부분
      $.ajax({
         url:'http://api.vworld.kr/req/data?service=data&request=GetFeature&data=LT_C_ADSIDO_INFO&key=D2A9AD49-5624-3245-BB98-EEBB6C10B050'
               +'&domain=http://127.0.0.1:8080&attrFilter=ctprvn_cd:between:11,50&size=17',
           type:'GET',
           dataType:'jsonp',
           async: false,
           success:function(data){
           
            var features =  data.response.result.featureCollection.features;
            var regionLarges = [];
           
            for(var i=0 ; i < features.length; i++){
	            var selected = "";
                regionLarges[i] = features[i].properties.ctp_kor_nm;
	            if(regions[0] == regionLarges[i])
	            	selected = "selected";
               $("#conditionRegionLarge").append("<option value="+regionLarges[i] + " "+ selected +">"+regionLarges[i]+"</option>");
            }
            
            if("${group.groupAddress}" != "지역무관"){
            	if(regions[1] != null)
             	  	 mediumRegion(regions[0]);   	  
                else{
   	          	 mediumRegion(regions[0]);   	  
   	           	 $("#conditionRegionMedium").val("전체").prop("selected", true);
   	           	 $("#conditionRegionSmall").prop("disabled", true);  
   	             $("#conditionRegionSmall").val("regionNone").prop("selected", true);  
                }
               
               if(regions[1] != "수원시" && regions[1] != "성남시"){
            	   smallRegion(regions[0] + " " + regions[1]);
               		if(regions[2] == null)
	               		$("#conditionRegionSmall").val("전체").prop("selected", true); 
               }
               else{
               		smallRegion(regions[0] + " " + regions[1] + " " + regions[2]);            	   
            	  	if(regions[3] == null)
               			$("#conditionRegionSmall").val("전체").prop("selected", true);   
               }
            }
              
           },error:function(data){
                 console.log("에러입니다"); 
           }
        });
      
      $("#maxMemberInp").val("${group.maxMember}");
      if("${group.allowSignup}" == 'Y')
    	  $("#joinY").prop("checked", true);
      else
    	  $("#joinN").prop("checked", true);
      
   });
   
   // 최대 나이를 선택했을 때 최소 나이의 범위를 지정해주는 이벤트
   	$("#conditionMaxAge").change(function() {
		$("#conditionMinAge").children().not(":lt(1)").remove();
		for(var i="${nowYear}"; i >= $(this).val(); i--){
	    	  $("#conditionMinAge").append("<option value="+ i +">" + i + "년생</option>");
	     }
	});
   
      var lRegion = "";
      
      $("#conditionRegionLarge").change(function() {
         lRegion = $(this).val();
         $("#conditionRegionMedium").children().not(":lt(2)").remove();
         $("#conditionRegionSmall").children().not(":lt(2)").remove();
         if(lRegion != 'regionNone' && lRegion != "세종특별자치시")
        	 mediumRegion(lRegion);
      });
      
      $("#conditionRegionMedium").change(function() {
    	  
         lRegion = $("#conditionRegionLarge").val();
         var mRegion = $(this).val();
         $("#conditionRegionSmall").children().not(":lt(2)").remove();
         $("#conditionRegionSmall").val("regionNone").prop("selected", true);
         if(mRegion == '전체'){
            $("#conditionRegionSmall").prop("disabled", true);  
            $("#conditionRegionSmall").val("regionNone").prop("selected", true);         
         }
         else if(mRegion != 'regionNone'){
            $("#conditionRegionSmall").prop("disabled", false); 
            smallRegion(lRegion + " " + mRegion);
         }
         else
            $("#conditionRegionSmall").prop("disabled", false);  
      });
      
   // 지역무관을 선택했을 경우 발생하는 이벤트
   $("#regionNone").change(function() {
      if($(this).is(":checked")){
         $(".condition_region").prop("disabled", true);         
         $(".condition_region").val("regionNone").prop("selected", true);
      }
      else
         $(".condition_region").prop("disabled", false);
   });
   
   // 최대 멤버수는 숫자만 입력하고 인원수를 50명 이상은 알려주는 이벤트
   $('#maxMemberInp').keyup(function(event){
      $(this).val($(this).val().replace(/[^0-9]/g,''));
      if($(this).val() > 50){
            alert("최대 멤버 수는 50명입니다.");
            $(this).val("");         
      }
   });
   
   // 가입 조건 확인 버튼을 눌렀을 때 발생하는 이벤트
   $("#conditionConfirmBtn").click(function() {

      if($('#maxMemberInp').val() == 0)
    	  alert("최대 멤버 수는 최소 1명 이상입니다.");
	  // 지역무관 체크박스의 체크여부 판별
      else if(!$("#regionNone").is(":checked")){
         
         var rLarge = $("#conditionRegionLarge").val();
         var rMedium = $("#conditionRegionMedium").val();
         var rSmall = $("#conditionRegionSmall").val();
         
         var regionFull = "";
         
         // 지역 라벨을 선택했을 경우 alert로 다시 선택하라고 알려줌
         if(rLarge == "regionNone" || rMedium == "regionNone" || rMedium != "전체" && rSmall == "regionNone")
            alert("지역을 다시 선택해주세요.");
         
         // 지역을 한 String으로 담기 위해서 구분
         if(rLarge != "regionNone")
            regionFull = rLarge;
         if (rMedium != "전체" && rMedium != "regionNone")
            regionFull += " " + rMedium;
         if(rSmall != "전체" && rSmall != "regionNone")
            regionFull += " " + rSmall;      
         
         // 지역이 존재하는 경우만 submit으로 보낼 수 있도록 if로 판별
         if(regionFull.length != 0){
            $("#regionFull").val(regionFull);
            $("#updateGroupConditionForm").submit();
         }
      }
      else{
    	 $("#regionFull").val("지역무관");
         $("#updateGroupConditionForm").submit();
      }
   });

   /* 멤버 설정 관리 */
   $("#groupMemberManageBtn").on("click", function() {
      goSettingBack();
      $(".group_tit").text("멤버 설정 관리");
      $("#settingList").css("display", "none");
      $("#memberSearchWrap").css("display", "block");
      getGroupMember(gmSettingId);
   });
   
   /* 검색부분의 border 부분을 수정 */
	$("#gmSearchInp").on("focus", function() {
		$(".gm_search_btn").css("border-color", "#343A40");
	}).on("focusout", function() {
		$(".gm_search_btn").css("border-color", "#6C757D");
	}).on("keyup", function(event) {
		/* enterkey를 눌렀을 때 발생하는 event */
		if (event.keyCode == 13)
			searchGroupMember();
	});
   
	$(".gm_search_btn").click(function() {
		searchGroupMember();
	});
	
	$(".gs_member_a").click(function() {
		gmSettingId = $(this).attr("id");
		$("#gmSearchInp").val("");
		getGroupMember(gmSettingId);
	});
   
   /* 모임 삭제 */
   $("#groupDeleteBtn").on("click", function() {
      $('#groupDeleteModal').modal({
          backdrop: 'static',
          keyboard: false
       });
   });
   
   // 모임 삭제하기 버튼을 눌렀을 때 발생하는 이벤트
   $("#groupDelConfirmBtn").on("click", function() {
      location.href = "${root}/groups/deleteGroup.gp?groupNo=${param.groupNo}";
   });

});

</script>
</body>
</html>