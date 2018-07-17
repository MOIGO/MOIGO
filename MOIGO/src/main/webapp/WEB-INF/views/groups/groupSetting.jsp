<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
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
   .list-group-item {
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
         width : 100px;
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
   
   .form-check-input {
         margin-left: -1em;
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
   
   #maxMember {
         color : #0078ff;
         font-weight: bold;
   }
   
   #conditionFooter {
         display: none;
         text-align : center;
   }
   
   #conditionConfirmBtn {
         margin-top : 15px;
         letter-spacing: -1px;
   }
   
   /* 모임 삭제 모달 부분 */
    .modal-header {
      display: inline;
      text-align: center;
      padding : 10px 10px 7px 10px;
   }
   
   .modal-title {
      display : inline;
      font-family:'nanum-barun-gothic-bold', sans-serif;
      font-size: 1.3em;
   }
   .modal-title:hover, .modal-body:hover {
      cursor: default;
   }
   
   .modal-footer{
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
                  
                  <li class="list-group-item">
                     <span class="setting_tit">모임 관리</span>
                     <button type="button" class="btn btn-dark setting_btn" id="groupUpdateBtn">변경</button>
                  </li>
                  
                   <li class="list-group-item">
                     <span class="setting_tit">가입 조건 관리</span>
                     <button type="button" class="btn btn-dark setting_btn" id="groupConditionBtn">변경</button>
                  </li>
                  
                   <li class="list-group-item">
                     <span class="setting_tit">멤버 설정 관리</span>
                     <button type="button" class="btn btn-dark setting_btn" id="groupMemberManageBtn">변경</button>
                  </li>
                  
                   <li class="list-group-item">
                     <span class="setting_tit">모임 삭제</span>
                     <button type="button" class="btn btn-danger setting_btn" id="groupDeleteBtn" 
                           data-toggle="modal" >삭제</button>
                  </li>
 
               </ul>
               
               
               <!-- 가입 조건 관리 -->
                <form action="">
                
                   <ul class="list-group" id="conditionList"> 
                     <li class="list-group-item">
                        <span class="setting_tit">성별</span>
                        <select class="float_right list_common condition_font_size" id="conditionGender">
                        <option selected value="N">제한없음</option>
                        <option value="M">남성</option>
                        <option value="F">여성</option>
                     </select>
                     </li>
                     
                      <li class="list-group-item">
                        <span class="setting_tit">나이</span>
                        <span class="float_right age_wrap">
                           <span class="age_txt condition_font_size">최대나이</span>
                        <select class="list_common condition_font_size" id="conditionMaxAge">
                           <option selected value="-1">제한없음</option>
                           <c:set var="nowYear" value="2018"></c:set>
                           <c:forEach var="i" begin="1918" end="${nowYear}">
                              <option value="${nowYear - i + 1918}">${nowYear - i + 1918}년생</option>
                           </c:forEach>
                        </select>                     
                           <span class="age_txt condition_font_size">-</span>
                        <span class="age_txt condition_font_size">최소나이</span>
                           <select class="list_common condition_font_size" id="conditionMinAge">
                           <option selected value="-1">제한없음</option>
                        </select>
                        </span>
                     </li>
                     
                      <li class="list-group-item">
                        <span class="setting_tit">지역</span>
                        <span class="float_right region_wrap">
                           <select class="list_common condition_font_size" id="conditionRegionLarge">
                           		<option value="regionNone">- 시도 -</option>
                        	</select>
                        	&nbsp;
	                       <select class="list_common condition_font_size" id="conditionRegionSmall">
	                          <option value="regionNone">- 시군구 -</option>
	                       </select>
                        	&nbsp;
                          <span class="float_right form-check">
                             <input class="form-check-input" type="checkbox" id="regionNone">
                             <label class="form-check-label condition_font_size" for="regionNone">지역 무관</label>
                          </span>
                             
                        </span>
                     </li>
                     
                      <li class="list-group-item">
                        <span class="setting_tit">최대 멤버수</span>
                        <span class="float_right max_member_wrap">
                           <input type="text" class="gs_inp form-control condition_font_size" id="maxMemberInp" maxlength="2"/>
                           <span class="max_member_txt condition_font_size">/</span>
                           <span class="max_member_txt condition_font_size" id="maxMember">30</span>                           
                        </span>
                     </li>
                  </ul>
                  
                   <div class="card-footer gs_footer" id="conditionFooter">
                      <button type="button" class="btn btn-dark" id="conditionConfirmBtn">확인</button>
                   </div>
                  
                </form>
               
               
               <!-- 멤버 설정 관리 -->
               
               <!-- 모임 삭제 -->
               <div class="modal" id="groupDeleteModal" tabindex="-1" role="dialog" aria-labelledby="groupDeleteTitle" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
                 <div class="modal-content">
                 
                    <div class="modal-header">
                       <h5 class="modal-title" id="groupDeleteTitle">모임 삭제</h5>
                    </div>
                    
                    <div class="modal-body">         
                       <span class="delete_info">
                          모임을 삭제하시겠습니까? <br />
                        삭제 후에는 복구가 불가능합니다.
                       </span>
                    </div>
                     
                     <div class="modal-footer">
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

$(function() {
   
   /* 모임 관리 */
   $("#groupUpdateBtn").on("click", function() {
      alert("모임 관리 버튼 확인!");
   });
   
   /* 가입 조건 관리 */
   $("#groupConditionBtn").on("click", function() {
		$(".group_tit").text("가입 조건 관리");
		$("#settingList").css("display", "none");
		$("#conditionList").css("display", "block");
		$("#conditionFooter").css("display", "block");
      
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
					regionLarges[i] = features[i].properties.ctp_kor_nm;
					$("#conditionRegionLarge").append("<option value="+regionLarges[i]+">"+regionLarges[i]+"</option>");
				}
              
           	},error:function(data){
                 console.log("에러입니다"); 
  			}
  		});
   });
   
   // 지역무관을 선택했을 경우 발생하는 이벤트
   $("#regionNone").change(function() {
      if($(this).is(":checked")){
         $("#conditionRegionLarge").prop("disabled", true);
         $("#conditionRegionSmall").prop("disabled", true);
         
         $("#conditionRegionLarge").val("regionNone").prop("selected", true);
         $("#conditionRegionSmall").val("regionNone").prop("selected", true);
      }
      else{
         $("#conditionRegionLarge").prop("disabled", false);
         $("#conditionRegionSmall").prop("disabled", false);
      }
   });

   /* 멤버 설정 관리 */
   $("#groupMemberManageBtn").on("click", function() {
      
   });
   
   /* 모임 삭제 */
   $("#groupDeleteBtn").on("click", function() {
      $('#groupDeleteModal').modal({
           backdrop: 'static',
          keyboard: false
       });
   });

});

</script>
</body>
</html>