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
   
   /* 모임 공통 부분 */
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
   
   /* option common Part */
   .gs_footer {
         background: white;
         margin-top: 20px;
         padding: 0px;
   }
   
   .gs_inp:focus, .gs_inp:active:focus {
      border-color : #343A40;
      box-shadow: none;
   }
   
   /* 설정 메인 리스트 부분*/
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
		font-family:'nanum-barun-gothic-bold', sans-serif;
   }
   
   .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
   		color : #007BFF;
   }
   
   .gs_member_content {
   		margin-top : 5px;
   }
   #groupMemberSettingBtnWrap{
    margin-top: 5px;
    height: 40px;
   }
   
   #gsCheckAllBtn{
    float : left;
    margin: 8px 0px 0px 13px;
	font-size: 1.2em;
   }
   
   #gsCheckAllLbl{
   	margin-left: 4px;
    margin-top: 7px;
    font-size: 0.9em;
   }
   
.list-group-item {
	padding-left: 13px;
	padding-right: 13px;
}
.gs_check_inp, #gsCheckAllInp {
	display: none;
}
.gs_check_btn {
	float : left;
	margin-top : 17px;
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
.gs_member_btn {
	float : right;
	margin-top : 3px;
	margin-right: 10px;
	padding : 4px 7px 2px 7px;
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

#gmcMemberAddWrap{
	height: 30px;
}

#gmcMemberAddInner {
	float : right;
	height: 20px;
	margin-right : 1px;
}

#gmcMemberAddInner:hover, #gmcMemberAddLbl:hover {
	cursor: pointer;
}

#gmcMemberAddLbl{
	font-size: 0.9em;
	vertical-align: top;
}

#gmcMemberAddBtn {
	color: #28a745;
    font-size: 1.2em;
}

.gmc_member_img{
	float : left;
	margin-right:6px; 
	width:35px; 
	height:35px; 
}
.gmc_member_lbl{
	display: inline-block; 
	padding-top: 7px;
	font-family:'nanum-barun-gothic-bold', sans-serif; 
}
.gmc_minus_btn{
	float: right; 
	margin-top: 8px;
	color: red; 
	font-size: 1.2em; 
}
.gmc_minus_btn:hover {
	cursor: pointer;
}
.gmc_info {
	margin-top : 10px;
	text-align: center;
	height : 20px; 
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
<!-- Group Content -->
<div class="container">
   <div class="row">
      
      <!-- 모임의 좌측 메뉴 -->
      <c:import url="/WEB-INF/views/groups/leftAside.jsp"/>
      
      <!-- 모임의 가운데(주요 기능부분) -->
      <div class="col-7">
         <div class="card">
         
            <!-- Menu Title about Group -->
            <div class="card-header" >           
               <p class="group_tit">설정</p>
            </div>
                    
            <!-- Group Content -->
            <div class="card-body">
               
               <!-- Option List Part -->
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
                   
                   <!-- Sex -->
                   <ul class="list-group" id="conditionList"> 
                     <li class="list-group-item gs_list_group">
                        <span class="setting_tit">성별</span>
                        <select class="float_right list_common condition_font_size" name="groupGender" id="conditionGender">
                        <option selected value="N">제한없음</option>
                        <option value="M">남성</option>
                        <option value="F">여성</option>
                     </select>
                     </li>
                     
                   <!-- Age -->
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
                     
                   <!-- Location -->
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
                     
                   <!-- Maximum Member -->
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
               
               
               <!-- Member Option Management -->
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
                  
                  <!-- Member Option Part -->
               <nav>
                 <div class="nav nav-tabs" id="groupMemberSettingTab" role="tablist">
                   <a class="nav-item nav-link active gs_member_a" id="groupMemberGrade" data-toggle="tab" href="#groupMemberSettingContent" role="tab">멤버등급</a>
                   <a class="nav-item nav-link gs_member_a" id="leaderDelegation" data-toggle="tab" href="#groupMemberSettingContent" role="tab">모임장위임</a>
                   <a class="nav-item nav-link gs_member_a" id="groupMemberWithdraw" data-toggle="tab" href="#groupMemberSettingContent" role="tab">멤버탈퇴</a>
                   <c:if test="${group.allowSignup == 'Y'}">
	                   <a class="nav-item nav-link gs_member_a" id="groupJoinApprove" data-toggle="tab" href="#groupMemberSettingContent" role="tab">가입승인</a>
                   </c:if>
                 </div>
               </nav>
               <div class="tab-content" id="groupMemberSettingContent">
                 <div class="tab-pane fade show active gs_member_content" id="groupMemberSettingContent" role="tabpanel">
               		<div id="groupMemberSettingBtnWrap">
               			<input type='checkbox' id="gsCheckAllInp">
					<span class='far fa-check-circle gs_unchecked not_withdraw' id="gsCheckAllBtn"></span>
					<label id="gsCheckAllLbl" class="not_withdraw" for="gsCheckAllBtn">전체</label>
               			<button type="button" class="btn btn-dark btn-sm gs_member_btn" data-toggle="modal" id="gsConfirmBtn">확인</button>
               		</div>
					<ul class="list-group gs_member_ul">
					</ul>
                 </div>
               </div>
                  
               </div>
               
               <div class="modal" id="groupMemberChangeModal" tabindex="-1" role="dialog" aria-labelledby="groupMemberChangeTitle" aria-hidden="true">
                 <div class="modal-dialog modal-dialog-centered" role="document">
                 <div class="modal-content">
                 
                    <div class="modal-header gs_modal_header">
                       <h5 class="modal-title gs_modal_tit" id="groupMemberChangeTitle"></h5>
                    </div>
                    
                    <!-- MemberList Modal -->
                    <div class="modal-body gs_modal_body" id="gmcModalBody">
                    	<div id="gmcMemberAddWrap">
                    		<div id="gmcMemberAddInner">
		                   		<span class="fas fa-plus-circle" id="gmcMemberAddBtn"></span>
	                    		<label id="gmcMemberAddLbl" for="gmcMemberAddBtn">멤버추가</label>
                    		</div>
                    	</div>         
                      	<div class="card gs_modal_member" id="gmcModalCard">
						  <ul class="list-group list-group-flush" id="gmcMemberUl">
						   
						  </ul>
						</div>
						<div class="gmc_info"></div>
                    </div>
                     
                     <div class="modal-footer gs_modal_footer">
                        <button type="button" class="btn btn-primary btn-sm" id="gmcConfirmBtn">확인</button>
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
                     </div>
                     
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
 
// 설정에서 브라우저의 뒤로가기 버튼을 눌렀을 때 마치 페이지 전환이 되는 것 같은 효과를 주기 위한 메소드
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
/* 가입 조건 관리 메소드 */
var regions = "${group.groupAddress}".split(" ");
var regionMedium = regions[1];
var regionSmall = regions[2];

// 시군구를 찾기 위한 ajax
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
//읍면동을 찾기 위한 ajax
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

/* 멤버 설정 관리 */

var gmSettingId = "groupMemberGrade"; // 선택하는 tab의 id값 : 현재 어떤 tab을 사용하는지 판별
var groupMember = null; // 현재 모임의 멤버리스트를 저장하기 위한 변수

// 현재 모임의 멤버리스트를 가져오기 위한 ajax
function getGroupMember(gmSettingId){
	$(".gs_member_ul").children().remove();
    $.ajax({
		url : "${root}/groups/goGroupMemberSetting.gp",
		data : {groupNo : "${param.groupNo}"},
		dataType : "json",
		async : false,
		success : function(data) {
			groupMember = data.groupMember;
			groupMember = groupMember.filter(gm => gm.memberGradeCode != 3);
			createGroupMemberList(groupMember, gmSettingId);			
		},
		error : function() {
			console.log("멤버설정 멤버리스트 가져오기 오류");
		}
	});
}

// 멤버 설정 관리 modal에 list를 보여주기 위해 담는 map;
var usedMemberList = new Map();
var unusedMemberList = new Map();

// 한명의 그룹 멤버를 찾기 위해 사용하는 메소드
function findOneGroupMember(mNo) {
	var oneMember = null;
	for(var i=0; i < groupMember.length; i++)
		if(groupMember[i].memberNo == mNo)
			oneMember = groupMember[i];
	return oneMember;
}

// 각 tab마다 필요한 그룹 리스트가 다르기 때문에 filter를 걸어준 메소드
function settingModeMember(gMember, gmSettingId) {
	if(gmSettingId != "groupJoinApprove")
		gMember = gMember.filter(gm => gm.memberGradeCode > 0);
	else
		gMember = gMember.filter(gm => gm.memberGradeCode == 0);
	
	return gMember;
}

// usedMemberList를 모임의 멤버리스트로 채우는 메소드
function fillUsedMemberList(gMember){
	for(var i=0; i < gMember.length; i++)
		usedMemberList.set(gMember[i].memberNo, gMember[i]);
	
	return usedMemberList;
}

// unusedMemberList를 모임의 멤버리스트로 채우는 메소드
function fillUnusedMemberList(gMember){
	for(var i=0; i < gMember.length; i++)
		unusedMemberList.set(gMember[i].memberNo, gMember[i]);
	
	return unusedMemberList;
}

// 멤버설정의 멤버 리스트를 만드는 메소드
function createGroupMemberList(groupMember, gmSettingId){
	
	groupMember = settingModeMember(groupMember, gmSettingId);
	
	// 모임의 멤버 리스트 view단을 동적으로 생성하는 부분
	for(var i=0; i < groupMember.length; i++){
		
		unusedMemberList.set(groupMember[i].memberNo, groupMember[i]);
		
		var append = "<li class='list-group-item'><div class='list_wrap'>";
		
		var inp = "<input type='checkbox' class='gs_check_inp' value='" + groupMember[i].memberNo+ "'>";
		var checkBtn = "<span class='far fa-check-circle gs_check_btn gs_unchecked'></span>";
		
		if(gmSettingId == "leaderDelegation"){
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
		if(groupMember[i].memberGradeCode == 2)
			memberGrade = "<span class='badge badge-success' id='groupLeader'>운영진</span>";
	
		append += inp + checkBtn + profileImg + groupMemberName + memberGrade + "</div></li>";
		
		$(".gs_member_ul").append(append);
		
	}	
	
	// list에서 checkbox와 radio를 클릭했을때 발생하는 이벤트
	$(".gs_check_btn").each(function() {
		
		$(this).on("click", function() {
			$(this).prev().click();
			
			if($(this).prev().is(":checked")){
				
				$(this).removeClass('far gs_unchecked').addClass('fas gs_checked');
				
				if(gmSettingId == "leaderDelegation")
					$(".gs_check_btn").not($(this)).removeClass('fas gs_checked').addClass('far gs_unchecked');	
				
				var selectedMember = $(this).prev().val();
				usedMemberList.set(selectedMember, findOneGroupMember(selectedMember));
				unusedMemberList.delete(selectedMember);
			}
			else{
				
				$(this).removeClass('fas gs_checked').addClass('far gs_unchecked');
				
				var unselectedMember = $(this).prev().val();
				unusedMemberList.set(unselectedMember, findOneGroupMember(unselectedMember));
				usedMemberList.delete(unselectedMember);
			}
			
			// 개별 선택이 전체 길이와 일치하는지 아닌지의 여부 판별해서 필요한 기능을 적용 
			if($(".gs_check_inp").length == $(".gs_check_inp:checked").length){
				$("#gsCheckAllInp").prop("checked", true);
				$("#gsCheckAllBtn").removeClass('far gs_unchecked').addClass('fas gs_checked');
			}
			else{
				$("#gsCheckAllInp").prop("checked", false);
				$("#gsCheckAllBtn").removeClass('fas gs_checked').addClass('far gs_unchecked');
			}
		});
	});
	
}

var searchMember = null;
var searchMode = 0;
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
			
			searchMember = data.groupMember.filter(sm => sm.memberGradeCode != 3);
			var memberGradeCnt = 0;
			
			for(var i= 0; i < searchMember.length; i++){
				if(searchMember[i].memberGradeCode == 0 && gmSettingId == "groupJoinApprove"){
					memberGradeCnt = 1;							
				}
				else if(searchMember[i].memberGradeCode > 0 && gmSettingId != "groupJoinApprove")
					memberGradeCnt = 2;
			}
		
			if(memberGradeCnt == 0 || searchMember.length == 0){
				$(".gs_member_ul").append("<div class='card search_result_none'>검색 결과가 없습니다.</div>");
				$("#groupMemberSettingBtnWrap").css("display", "none");
			}
			else{
							
				searchMode = 1;
				
				groupMember = settingModeMember(groupMember, gmSettingId);
				searchMember = settingModeMember(searchMember, gmSettingId);

				usedMemberList.clear();
				unusedMemberList = fillUnusedMemberList(groupMember);
				
				createGroupMemberList(searchMember, gmSettingId);
				
				$("#groupMemberSettingBtnWrap").css("display", "block");
				
				$("#gsCheckAllInp").prop("checked", false);
				$("#gsCheckAllBtn").removeClass('fas gs_checked').addClass('far gs_unchecked');
			}
		},
		error : function() {
			console.log("멤버설정 멤버리스트 가져오기 오류");
		}
	});
}

function createGroupMemberModalList(usedList) {
	
	var iter = usedList.values();
	
	$("#gmcModalBody").css("height", "600px");
	$(".gs_modal_member").css("height", "360px");
	$("#gmcMemberAddWrap").css("display", "block");
	
	for(var i=0; i< usedList.size; i++){
		var usedMember = iter.next().value;
		
		var liAppend = "<li class='list-group-item'>";
		if(usedMember.profileThumb != null)
			liAppend += "<img class='gmc_member_img' src='${root}/resources/images/profiles/${group.groupNo}/"+ usedMember.profileThumb +"'/>";
		else
			liAppend += "<img class='gmc_member_img' src='${root}/resources/images/common/img_profile.png'/>";
		liAppend += "<span class='gmc_member_lbl'>" + usedMember.memberName + "</span>";
		liAppend += "<span class='fas fa-minus-circle gmc_minus_btn'></span></li>";
		
		$("#gmcMemberUl").append(liAppend);
	}
	if(usedList.size > 6)
		$(".gs_modal_member").css("overflow-y", "scroll");
	else{
		$("#gmcMemberUl").append("<li hidden='hidden'></li>");
	}
}


$(function() {
   
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
		for(var i="${nowYear}"; i >= $(this).val(); i--)
	    	$("#conditionMinAge").append("<option value="+ i +">" + i + "년생</option>");
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
   
   // 검색부분의 border 부분을 수정 
	$("#gmSearchInp").on("focus", function() {
		$(".gm_search_btn").css("border-color", "#343A40");
	}).on("focusout", function() {
		$(".gm_search_btn").css("border-color", "#6C757D");
	}).on("keyup", function(event) {
		// enterkey를 눌렀을 때 발생하는 event 
		if (event.keyCode == 13)
			searchGroupMember();
	});
   
   // 멤버 검색 버튼을 눌렀을 때 발생하는 이벤트
	$(".gm_search_btn").click(function() {
		searchGroupMember();
	});
	
	// 확인파트
	$("#gsCheckAllBtn").click(function() {
		
		$("#gsCheckAllInp").click();
		
		groupMember = settingModeMember(groupMember, gmSettingId);
		if(searchMode == 1)	
			searchMember = settingModeMember(searchMember, gmSettingId);
		
		if($(this).prev().is(":checked")){
			$(this).removeClass('far gs_unchecked').addClass('fas gs_checked');
			$(".gs_check_btn").prev().prop("checked", true);
			$(".gs_check_btn").removeClass('far gs_unchecked').addClass('fas gs_checked');
			
			if(searchMode == 1){
				for(var i=0; i < searchMember.length; i++){
					usedMemberList.set(searchMember[i].memberNo, searchMember[i]);
					unusedMemberList.delete(searchMember[i].memberNo);
				}
			}
			else{
				usedMemberList = fillUsedMemberList(groupMember);
				unusedMemberList.clear();
			}
			
		}else{
			$(this).removeClass('fas gs_checked').addClass('far gs_unchecked');
			$(".gs_check_btn").prev().prop("checked", false);
			$(".gs_check_btn").removeClass('fas gs_checked').addClass('far gs_unchecked');
			
			if(searchMode == 1){
				for(var i=0; i < searchMember.length; i++){
					unusedMemberList.set(searchMember[i].memberNo, searchMember[i]);
					usedMemberList.delete(searchMember[i].memberNo);
				}
			}
			else{
				unusedMemberList = fillUnusedMemberList(groupMember);
				usedMemberList.clear();
			}
		}
		
	});
	
	// 멤버설정의 각 탭을 선택했을 때 발생하는 이벤트
	$(".gs_member_a").click(function() {
		gmSettingId = $(this).attr("id");
		
		$("#gmSearchInp").val("");
		
		$("#gsCheckAllInp").prop("checked", false);
		$("#gsCheckAllBtn").removeClass('fas gs_checked').addClass('far gs_unchecked');
		
		$("#groupMemberSettingBtnWrap").css("display", "block");
		
		searchMode = 0;
		usedMemberList.clear();
		unusedMemberList.clear();
		
		getGroupMember(gmSettingId);
		
		if(gmSettingId == "leaderDelegation"){
			$(".not_withdraw").css("display", "none");
			$(".gs_check_btn").first().prev().prop("checked", true);
			$(".gs_check_btn").first().removeClass('far gs_unchecked').addClass('fas gs_checked');
		}
		else{
			$(".not_withdraw").css("display", "inline-block");						
		}
	});
	
	// 멤버리스트 모달
	// 멤버 설정에 있는 확인 버튼을 눌렀을때 발생하는 이벤트
	$("#gsConfirmBtn").on("click", function() {
		
		$('#groupMemberChangeModal').children().css("width", "400px");
		$("#gmcMemberUl").children().remove();
		$(".gs_modal_member").css("overflow-y", "hidden");
		$(".gmc_info").css("display", "none");
		$(".gmc_info").children().remove();
		
		if(gmSettingId == "leaderDelegation"){
			
			$("#groupMemberChangeTitle").text("리더위임");
			$(".gs_modal_member").css("height", "auto");
			$("#gmcModalBody").css("height", "120px");
			$("#gmcMemberAddWrap").css("display", "none");
			
			var selectedLeader = null;
			for(var i=0; i < groupMember.length; i++)
				if($(".gs_check_inp:checked").val() == groupMember[i].memberNo)
					selectedLeader = groupMember[i];
			var liAppend = "<li class='list-group-item'>";
			if(selectedLeader.profileThumb != null)
				liAppend += "<img class='gmc_member_img' src='${root}/resources/images/profiles/${group.groupNo}/"+ selectedLeader.profileThumb +"'/>";
			else
				liAppend += "<img class='gmc_member_img' src='${root}/resources/images/common/img_profile.png'/>";
			liAppend += "<span class='gmc_member_lbl'>" + selectedLeader.memberName + "</span>";
			liAppend += "</li>";
			
			$("#gmcMemberUl").append(liAppend);
			$(".gmc_info").css("display", "block");
			$(".gmc_info").text("위 멤버한테 모임장을 위임하시겠습니까?");
			
		}
		else {
			
			createGroupMemberModalList(usedMemberList);
			
			if(gmSettingId == "groupMemberWithdraw"){
				$("#groupMemberChangeTitle").text("멤버탈퇴");
				$("#gmcModalBody").css("height", "450px");
				$(".gmc_info").css("display", "block");
				$(".gmc_info").text("위 멤버들을 탈퇴시키겠습니까?");
			}
			else if(gmSettingId == "groupMemberGrade"){
				$("#groupMemberChangeTitle").text("멤버등급");
			}
			else {
				$("#groupMemberChangeTitle").text("가입승인");
				$("#gmcModalBody").css("height", "450px");
				$(".gmc_info").css("display", "block");
				$(".gmc_info").text("");
				radioAppend = "<input type='radio' name='memberNo' class='gs_check_inp'>";
				radioAppend += "<span class='far fa-dot-circle gs_unchecked'></span>";
				radioAppend += "<label for=''>승인</label>";
				radioAppend += "<input type='radio' name='memberNo' class='gs_check_inp'>";
				radioAppend += "<span class='far fa-dot-circle gs_unchecked'></span>";
				radioAppend += "<label for=''>거절</label>";
				$(".gmc_info").append(radioAppend);
			}
			
		}
		
		if(gmSettingId != "leaderDelegation" && $(".gs_check_inp:checked").length == 0)
			alert("멤버를 선택하지 않았습니다. 멤버를 선택해 주세요.");
		else
			$('#groupMemberChangeModal').modal({
		          backdrop: 'static',
		          keyboard: false
		    });
		
	});
	
	$("#gmcConfirmBtn").click(function() {
		if(gmSettingId != "leaderDelegation" && usedMemberList == null)
			alert("선택된 멤버가 없습니다. 멤버를 선택해주세요.");
		else{
			
		}
	});
	
	$("#gmcMemberAddInner").click(function() {
		alert("테스트");
	});
   
   /* 모임 삭제 */
   $("#groupDeleteBtn").on("click", function() {
      $('#groupDeleteModal').modal({
          backdrop: 'static',
          keyboard: false
       });
   });
   
   // 모임 삭제 확인 버튼을 눌렀을때 발생하는 이벤트
   $("#groupDelConfirmBtn").on("click", function() {
      location.href = "${root}/groups/deleteGroup.gp?groupNo=${param.groupNo}";
   });
});
</script>
</body>
</html>
