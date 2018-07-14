<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<c:set var="root" value="${pageContext.request.contextPath}"/>
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
   
   /* 멤버 검색 부분 */
   
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
   
   /* 멤버 리스트 부분 */
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
      vertical-align : bottom;
      margin-left : 5px;
      padding-top : 2px;
      height: 100%;
   }
   
   .list_txt {
      margin: 0px;
      vertical-align : bottom;
      /* border: 1px solid black; */
   }
   
   #listName {
      font-family:'nanum-barun-gothic-bold', sans-serif; 
      font-size: 1.1em;
   }
   
   #listMsg {
      display : block;
      font-size : 0.9em;
   }
   
   #profileBtn {
      float: right;
      margin-top : 10px;
      color: darkgray;
      font-size: 1.7em; 
   }
   
   #profileBtn:hover {
      cursor: pointer;
   }
   
   .badge:hover {
      cursor: default;
   }
   
   #groupLeader {
      float: right;
      margin-top : 10px;
      margin-left : 6px;
      padding : 7px 7px 5px 6px;
      font-family:'nanum-barun-gothic-bold', sans-serif;
      font-size: 1em;
   }
   
   /* 프로필 Modal 영역 */
   .modal-header {
		display: inline;
		text-align: center;
		padding : 10px 10px 7px 10px;
   }
   
	.modal-title {
		display : inline;
		padding-left : 35px;
		font-family:'nanum-barun-gothic-bold', sans-serif;
		font-size: 1.4em;
	}
	.modal-title:hover {
		cursor: default;
	}
   
   .close {
   		vertical-align : text-top;
		font-size: 2em;
   }
   
   .modal-body {
   		height : 310px;
   		text-align: center;
   }
   
   #profileImg {
   		margin-bottom: 10px;
   		width: 150px;
   		height: 150px;
   }
   
   .profile_wrap {
   		text-align: left;
   }
   
   #profileLbl {
   		float: left;
   		margin-left : 3px;
   		margin-bottom: 3px;
	    font-family:'nanum-barun-gothic-bold', sans-serif;
   }
   
   #profileMsg {
   		resize: none;
   		font-size : 0.9em;
		font-weight: normal;
   }
   
   .modal-footer {
   		display : inline-block;
   		text-align: center;
   		padding: 15px 0px 15px 0px;
   }
   
   #profileConfirm {
  		padding : 4px 10px 1px 10px;
  		font-size: 1em; 
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
      <div class="col-lg-7">
         <div class="card">
         
            <!-- 모임의 각 메뉴 타이틀 -->
            <div class="card-header" >           
               <p class="group_tit">멤버</p>
            </div>
                    
            <!-- 모임 내용 -->
            <div class="card-body">
               
               <!-- 멤버 검색 부분 -->
               <div class="input-group mb-3">
                  <input type="text" class="form-control gm_inp" placeholder="멤버 검색">
                  <div class="input-group-append">
                     <button class="btn btn-outline-secondary gm_search_btn" type="button">
                        <ion-icon id="searchBtn" name="search"></ion-icon>
                     </button>
                  </div>
               </div>
            
               <!-- 멤버 리스트 부분 -->
               <ul class="list-group">
                  <li class="list-group-item">
                     <div class="list_wrap">
                        <img id="listImg" class="rounded-circle" src="${root}/resources/images/common/img_profile.png">
                        <span class="list_inner">
                           <span class="list_txt" id="listName">홍길동</span>
                           <div class="list_txt" id="listMsg">상태메시지는 최대 30자</div>
                        </span>
                        <span class="badge badge-primary" id="groupLeader">모임장</span>
                        <ion-icon id="profileBtn" name="create" data-toggle="modal" data-target="#profileModal"></ion-icon>
                     </div>
                  </li>
               
                  <li class="list-group-item">
                     <div class="list_wrap">
                        <img class="rounded-circle" src="${root}/resources/images/common/img_profile.png" style="width: 50px; height: 50px;">
                        <span class="list_inner">
                           <span class="list_txt" id="listName">김철수</span>
                           <span class="list_txt" id="listMsg">상태메시지 영역 입니다.</span>
                        </span>
                        <span class="badge badge-success" id="groupLeader">운영진</span>
                     </div>
                  </li>
               </ul>
            
            </div>
           
         </div>
        
      </div>
     
      <!-- 모임의 우측 메뉴 -->
      <c:import url="/WEB-INF/views/groups/rightAside.jsp"/>
     
   </div>
</div>

<!-- 프로필 modal 부분 -->
<div class="modal" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="profileTitle" aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
      
         <div class="modal-header">
            <h5 class="modal-title" id="profileTitle">멤버 프로필</h5>
            <button type="button" class="btn close" data-dismiss="modal" aria-label="Close">
               <span class="modal_close" aria-hidden="true">&times;</span>
            </button>
         </div>
         
         <div class="modal-body">         
         	<form>
	            <img class="rounded-circle" id="profileImg" src="${root}/resources/images/common/img_profile.png">
	            
	            <div class="input-group mb-3 profile_wrap">
					<label class="custom-file" >
						<input type="file" class="custom-file-input" id="profileFile">
						<span class="custom-file-label"></span>
					</label>
				</div>
				
				<div class="form-group">
					<label id="profileLbl" for="profileMsg">상태 메시지</label>
					<textarea class="form-control gm_inp" id="profileMsg" draggable="false" maxlength="30" rows="1" placeholder="최대 30자까지 입력 가능합니다."></textarea>
				</div>
         	</form>
         </div>
         
         <div class="modal-footer">
            <button type="button" id="profileConfirm" class="btn btn-secondary">확인</button>
         </div>
         
      </div>
   </div>
</div>

<script>

   /* 
      1. 정렬기준을 직급, 이름, 나, 나머지로 정렬하기
      2. 프로필 modal 작성 상태에서 x나 바깥 영역 누르면 confirm dialog
         (history 찾아보기)
      3. fontfaceobserver 말고 local/sessionStorage를 이용해서 폰트 띄울것
   */

   $(function() {
      
      /* 검색부분의 border 부분을 수정 */
      $(".gm_search_inp").on("focus",function(){
         $(".gm_search_btn").css("border-color", "#343A40");   
      }).on("focusout",function(){
         $(".gm_search_btn").css("border-color", "#6C757D");   
      });
      
      /* 프로필의 modal을 누르면  */
      $("#profileBtn").on('shown.bs.modal');
      
      
   });
   
</script>
</body>
</html>