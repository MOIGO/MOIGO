<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>


<style>
.labTitle {
	font-size: 2em;
	font-family: 'nanum-barun-gothic-bold'
}

.cover_item_0 {
	display: list-item;
	float: left;
}

.constraints {
	border: 1em solid #f7f7f9;
}

.bolder_text {
	font-weight: bolder;
}

.button_sizing {
	width: 120px;
	height: 50px;
}

.default_img_small {
	width: 150px;
	height: 100px;
}

.mainCover {
	width: 400px;
}

.coverMask {
	color: red;
	background: #004085;
	opacity: 0.3;
	text-align: center;
	position: absolute;
	top: 0;
	bottom: 0;
	left: 14px;
	right: 14px;
	box-sizing: border-box;
	font-size: 2em;
}

.btn_radioPos {
	position: relative;
	top: 30px;
}

#coverUploadInp {
	display: none;
}

.addNewImgFileBtn {
	cursor: pointer;
}
</style>



</head>

<body>

	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	<form
		action="${pageContext.request.contextPath}/groups/createGroupEnd.gp"
		method="post" enctype="multipart/form-data" id="createGroupForm">
		<input type="hidden" name="memberNo" value="${m.memberNo}" />
		<c:if test="${group ne null }">
			<input type="hidden" name="groupNo" value="${group.groupNo}" />
		</c:if>
		
		
		<div class="container">
			<div class="make_cover">

				<div class="form-group">
					<label for="inpGrpName" id="labGroupName" class="labTitle">밴드
						이름</label>
					<div class="input-group input-group-lg">
						<input type="text" id="inpGrpName" name="groupName"
							placeholder="밴드 이름 입력" class="form-control " required />
					</div>
					<input type="file" class="profile_upload_inp" name="groupImageFile"
						id="coverUploadInp" accept="image/*" />
				</div>

			</div>
		</div>
		<!--make band name container end-->

		<div class="container mt-4">
			<div class="row cover_select">
				<div class="col-5  m-auto">
					<img class="mainCover img-thumbnail"
						src="../resources/images/createGroupDefaultPictures/defaultPic01.jpg"
						alt="" /> <input type="hidden" value="groupPicture"
						id="inpCoverImg" name="groupDefaultImg" />
				</div>
				<div class="col-7 cover_list ">
					<div class="list_head d-flex flex-row ">
						<div class=" align-self-center">
							<h3>커버 선택</h3>
						</div>

						<div class=" p-1 ml-auto align-self-center">
							<span class="cover_paging"><strong class="cover_curr_page">1</strong>/<strong>2</strong></span>
						</div>
						<div class="pt-3 btn_area">
							<nav aria-label="Page navigation">
								<ul class="pagination ">
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Previous" onclick="nextPicList(-1)"> <span
											aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
									</a></li>
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Next" onclick="nextPicList(1)"> <span
											aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
									</a></li>
								</ul>
							</nav>
						</div>
					</div>

					<div class="row mt-4 cover_lists">
						<a class="col-3 mb-4 addNewImgFileBtn"><img
							src="../resources/images/createGroupDefaultPictures/addNewPicture.jpg"
							alt="" class="img-fluid" /></a> <a class="col-3 mb-4 cover_set_0"><img
							src="../resources/images/createGroupDefaultPictures/defaultPic01.jpg"
							alt="" class="img-fluid" /></a> <a class="col-3 mb-4 cover_set_0"><img
							src="../resources/images/createGroupDefaultPictures/defaultPic02.jpg"
							alt="" class="img-fluid" /></a> <a class="col-3 mb-4 cover_set_0"><img
							src="../resources/images/createGroupDefaultPictures/defaultPic03.jpg"
							alt="" class="img-fluid" /></a> <a class="col-3 mb-4 cover_set_0"><img
							src="../resources/images/createGroupDefaultPictures/defaultPic04.jpg"
							alt="" class="img-fluid" /></a> <a class="col-3 mb-4 cover_set_0"><img
							src="../resources/images/createGroupDefaultPictures/defaultPic05.jpg"
							alt="" class="img-fluid" /></a> <a class="col-3 mb-4 cover_set_0"><img
							src="../resources/images/createGroupDefaultPictures/defaultPic06.jpg"
							alt="" class="img-fluid" /></a> <a class="col-3 mb-4 cover_set_0"><img
							src="../resources/images/createGroupDefaultPictures/defaultPic07.jpg"
							alt="" class="img-fluid" /></a> <a class="col-3 mb-4 cover_set_1"
							style="display: none;"><img
							src="../resources/images/createGroupDefaultPictures/defaultPic08.jpg"
							alt="" class="img-fluid" /></a> <a class="col-3 mb-4 cover_set_1"
							style="display: none;"><img
							src="../resources/images/createGroupDefaultPictures/defaultPic09.jpg"
							alt="" class="img-fluid" /></a> <a class="col-3 mb-4 cover_set_1"
							style="display: none;"><img
							src="../resources/images/createGroupDefaultPictures/defaultPic10.jpg"
							alt="" class="img-fluid" /></a> <a class="col-3 mb-4 cover_set_1"
							style="display: none;"><img
							src="../resources/images/createGroupDefaultPictures/defaultPic11.jpg"
							alt="" class="img-fluid" /></a> <a class="col-3 mb-4 cover_set_1"
							style="display: none;"><img
							src="../resources/images/createGroupDefaultPictures/defaultPic12.jpg"
							alt="" class="img-fluid" /></a> <a class="col-3 mb-4 cover_set_1"
							style="display: none;"><img
							src="../resources/images/createGroupDefaultPictures/defaultPic13.jpg"
							alt="" class="img-fluid" /></a> <a class="col-3 mb-4 cover_set_1"
							style="display: none;"><img
							src="../resources/images/createGroupDefaultPictures/defaultPic14.jpg"
							alt="" class="img-fluid" /></a>
					</div>

				</div>

			</div>
		</div>
		<!--cover container end  -->
		<div class="container mt-5">
			<div class="row constraint_select">
				<div class="col-12">
					<h3 class="labTitle">밴드 공개 설정(필수)</h3>
				</div>
				<div class="col-12 constraints">
					<div class=" d-flex flex-row  justify-content-around">
						<div class="form-check form-check-inline ">
							<input type="radio" id="openSetting1" name="openSetting"
								class="form-check-input" style="position: relative; top: 40px;"
								value="PRIVATE" required> <label
								class="form-check-label" for="openSetting1"><strong>비공개
									모임</strong><br>
							<span>모임의 게시글이 공개되지 않습니다. 초대를 통해서만 가입할 수 있습니다.</span></label>
						</div>

						<div class="form-check form-check-inline ">
							<input type="radio" id="openSetting2" name="openSetting"
								class="form-check-input" style="position: relative; top: 40px;"
								value="PROTECTED" required> <label
								class="form-check-label" for="openSetting2"><strong>모임명
									공개 모임</strong><br> <span>누구나 모임을 검색해 찾을 수 있지만, 게시물은 멤버만 볼 수
									있습니다.</span><br></label>
						</div>
						<div class="form-check form-check-inline">
							<input type="radio" id="openSetting3" name="openSetting"
								class="form-check-input" style="position: relative; top: 40px;"
								value="PUBLIC" required> <label class="form-check-label"
								for="openSetting3"><strong>공개 모임</strong><br>
							<span>누구나 모임을 검색해 찾을 수 있고, 게시물을 볼 수 있습니다.</span></label>
						</div>

					</div>

				</div>

			</div>

		</div>
		<!--group open setting div end  -->
		
		<c:if test="${group eq null}">
		
		<div class="container mt-5">

			<label class="labTitle">밴드 제약 설정(선택)</label>
			<button class="btn btn-primary btn-sm" type="button"
				data-toggle="collapse" data-target="#divRestrict">펼치기</button>

			<div class="collapse" id="divRestrict">
				<div class="card card-body">

					<div class="form-group">
						<label for="genderSelect" class="bolder_text">성별 제약</label> <select
							class="form-control" id="genderSelect" name="groupGender">
							<option value="N">무관</option>
							<option value="M">남</option>
							<option value="F">여</option>
						</select>
					</div>

					<div class="row">
						<div class="col-5 mt-1">
							<div class="form-group">
								<label for="min_ageSelect" class="bolder_text">최소 나이</label> <select
									class="form-control" id="min_ageSelect" name="minAge"></select>
							</div>
						</div>
						<span class="col-1 mt-5"> 부터 </span>
						<div class="col-5 mt-1">
							<div class="form-group">
								<label for="max_ageSelect" class="bolder_text">최대 나이</label> <select
									class="form-control" id="max_ageSelect" name="maxAge"></select>
							</div>
						</div>
						<span class="col-1 mt-5"> 까지 </span>
					</div>

					<div class="row">
						<div class="col-10">
							<div class="row">

								<div class="col-10">
									<input type="hidden" id="regionFull" name="groupAddress" />
									<div class="row">
										<div class="col mt-1">
											<div class="form-group">
												<label for="conditionRegionLarge" class="bolder_text">시</label>
												<select class=" form-control condition_region"
													id="conditionRegionLarge">
													<option value="regionNone">- 시도 -</option>
												</select>
											</div>
										</div>
										<div class="col mt-1">
											<div class="form-group">
												<label for="conditionRegionMedium" class="bolder_text">구/군</label>
												<select class=" form-control condition_region"
													id="conditionRegionMedium">
													<option value="regionNone">- 시군구 -</option>
													<option>전체</option>
												</select>
											</div>
										</div>
										<div class="col mt-1">
											<div class="form-group">
												<label for="conditionRegionSmall" class="bolder_text">읍면동</label>
												<select class=" form-control condition_region"
													id="conditionRegionSmall">
													<option value="regionNone">- 읍면동 -</option>
													<option>전체</option>
												</select>
											</div>
										</div>


									</div>
								</div>
								<div class="col-2 mt-5">
									<span class="form-check"> <input
										class="form-check-input" type="checkbox" id="regionNone">
										<label class="form-check-label" for="regionNone">지역 무관</label>
									</span>
								</div>

							</div>

							<div class="row">
								<div class="col">
									<label for="maxNumber" class="bolder_text">최대 인원 수</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text bg-primary" id="basic-addon1">1
												/ </span>
										</div>

										<input type="number" class="form-control" id="maxNumber"
											name="maxMember" min="1" value="30" max="50" />

										<div class="input-group-append">
											<span class="input-group-text" id="basic-addon1">명/최대(50
												명)</span>
										</div>
									</div>
								</div>
							</div>


							<div class="row mt-3">
								<div class="col-12">
									<label class="bolder_text">가입 신청</label>
								</div>
								<div class="col-12">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" id="allowSignupY"
											name="allowSignup" value="Y" checked> <label
											class="form-check-label" for="allowSignup">가입 신청 받기</label>
									</div>

									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" id="allowSignupN"
											name="allowSignup" value="N"> <label
											class="form-check-label" for="allowSignup">자동 가입</label>
									</div>


									<span id="allowSignupDesc">※멤버 가입 시 리더의 승인이 필요합니다.</span>

								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:if>
		<!--distric container end  -->
		<div class="container mt-5">

			<label class="labTitle">그룹 분류(선택)</label>
			<button class="btn btn-primary btn-sm" data-toggle="collapse"
				data-target="#interestCategory" type="button">펼치기</button>

			<div class="collapse" id="interestCategory">
				<div class="card card-body ">
					<div class="row">
						<div class="col-4">
							<div class="form-check form-check-inline">
								<input type="radio" id="f1" class="form-check-input"
									name="interestBigCode" value="B001"> <label
									class="form-check-label" for="f1">라이프스타일</label>
							</div>
						</div>
						<div class="col-4">
							<div class="form-check form-check-inline ">
								<input type="radio" id="f2" class="form-check-input"
									name="interestBigCode" value="B002"> <label
									class="form-check-label" for="f2">영어/외국어</label>
							</div>
						</div>
						<div class="col-4">
							<div class="form-check form-check-inline ">
								<input type="radio" id="f3" class="form-check-input"
									name="interestBigCode" value="B003"> <label
									class="form-check-label" for="f3">컴퓨터</label>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-4">
							<div class="form-check form-check-inline">
								<input type="radio" id="f4" class="form-check-input"
									name="interestBigCode" value="B004"> <label
									class="form-check-label" for="f4">디자인/미술</label>
							</div>
						</div>
						<div class="col-4">
							<div class="form-check form-check-inline">
								<input type="radio" id="f5" class="form-check-input"
									name="interestBigCode" value="B005"> <label
									class="form-check-label" for="f5">취업</label>
							</div>
						</div>
						<div class="col-4">
							<div class="form-check form-check-inline">
								<input type="radio" id="f6" class="form-check-input"
									name="interestBigCode" value="B006"> <label
									class="form-check-label" for="f6">음악/공연</label>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-4">
							<div class="form-check form-check-inline">
								<input type="radio" id="f7" class="form-check-input"
									name="interestBigCode" value="B007"> <label
									class="form-check-label" for="f7">스포츠</label>
							</div>
						</div>
						<div class="col-4">
							<div class="form-check form-check-inline">
								<input type="radio" id="f8" class="form-check-input"
									name="interestBigCode" value="B008"> <label
									class="form-check-label" for="f8">뷰티/미용</label>
							</div>
						</div>
						<div class="col-4">
							<div class="form-check form-check-inline">
								<input type="radio" id="f9" class="form-check-input"
									name="interestBigCode" value="B009"> <label
									class="form-check-label" for="f9">게임</label>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="container mt-4">
			<div class="d-flex justify-content-center">
				<button type="reset"
					class="btn btn-secondary btn-lg mr-4 button_sizing">취소하기</button>
				<button type="button" class="btn btn-primary btn-lg button_sizing" id="createGroupBtn">완료</button>
			</div>
		</div>
	</form>
</body>

<script>

	
	var cover_curr_page =0;
	
	$(function(){
		
		var cover_imgs = $("[class*='cover_set'] > img").css("cursor","pointer");
		$(cover_imgs).on("click",function(){
			setMainCover(this);
			$('input[name=groupImageFile]').val(null);
		});
		
		setSelectYears($('#min_ageSelect'),100);
		setSelectYears($('#max_ageSelect'),100);
		
		
		
		$('#maxNumber').change(function(){
			if($(this).val()>50)
				$(this).val(50);
			else if($(this).val()<1)
				$(this).val(1);
		});
		
		largeRegion();
		
		
		if('${group!=null}'=='true'){
			 
			$('#inpGrpName').val('${group.groupName}');
			
			
			console.log("${root}/resources/images/groupCovers/${group.groupNo}/'+'${group.groupPicture}");
			if(('${group.groupPicture}').indexOf('createGroupDefaultPictures')>0){
				$('.mainCover').attr("src",'${group.groupPicture}');
				$('#inpCoverImg').val('${group.groupPicture}');
			
			}else{
				$('.mainCover').attr("src",'${root}/resources/images/groupCovers/${group.groupNo}/${group.groupPicture}');
				$('#inpCoverImg').val('${group.groupPicture}');
			}
		
			
		 }else{
			 var imgNum = Math.floor(Math.random()*6);
				
				setMainCover($("[class*='cover_set_0'] > img").eq(imgNum));
			 
			
		 }

		
	});
	
	function largeRegion(){
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
	                
	               	if(i==0)
	               		$("#conditionRegionLarge").append("<option value="+regionLarges[i] + " "+ selected +">"+regionLarges[i]+"</option>");
	               	else
	               		$("#conditionRegionLarge").append("<option value="+regionLarges[i]+">"+regionLarges[i]+"</option>");
	            }
					
	           },error:function(data){
	                 console.log("에러입니다"); 
	           }
	        });
	}
	
	function setSelectYears(selectObj,years){
		
		 var n =new Date().getFullYear();
		 
		
		 $(selectObj).append($("<option>").val(-1).text('무관'));	 
		 for(var i=0 ;i<years;++i){
			 $(selectObj).append($("<option>").val(n-i).text(n-i));	 
		 }
	}
	
	
	function setMainCover(imgObj){
		
		$("[class*='coverMask']").remove();
		
		$(imgObj).parent().append("<i class='fas fa-check coverMask'></i>")
		
		$('#groupDefaultImg').val($(imgObj).attr("src"));
		
		$("img[class*=mainCover]").attr("src",$(imgObj).attr("src"));
		$("#inpCoverImg").val($(imgObj).attr("src"));
	}
	
	function nextPicList(pageDirection){
		cover_curr_page+=pageDirection;
		
		if(cover_curr_page>1)
			cover_curr_page=1;
		
		if(cover_curr_page<0)
			cover_curr_page=0;
		
		$('strong[class=cover_curr_page]').text(cover_curr_page+1);
		
		for(var i =0; i<2;++i){
			console.log(cover_curr_page+" "+i+" "+"[class*=cover_set_"+i+"]");
			if(i==cover_curr_page)
				$("[class*=cover_set_"+i+"]").css("display","");
			else
				$("[class*=cover_set_"+i+"]").css("display","none");
		}
	}
	
	$('#allowSignupY').change(function(){
		
		if($('#allowSignupY').is(":checked")){
			$('#allowSignupDesc').text("※멤버 가입 시 리더의 승인이 필요합니다.");
		}
	});
	$('#allowSignupN').change(function(){
		if($('#allowSignupN').is(":checked")){
			$('#allowSignupDesc').text("※멤버 가입 시 리더가 승인하지 않습니다.초대 받은 멤버가 바로 가입할 수 있습니다.")
		}
	});
	
	
	$('#coverUploadInp').change(function(){
		
		console.log("들어옴");
		readURL(this);
	});
	
	function readURL(input) {
		 
		
	    if (input.files && input.files[0]) {
	    	
	    	console.log(input);
	    	console.log(input.files[0]);
	    	if(input.files[0].size/1024/1024>=10){
	    		alert("파일 크기는 10mb 이하여야 합니다.");
	    		
	    		setMainCover($("[class*='cover_set_0'] > img").eq( Math.floor(Math.random()*6)));
	    		$('#groupImage').val(null);
	    		return;
	    	}
	    	var Extension = input.files[0].name.substring(
	    			input.files[0].name.lastIndexOf('.') + 1).toLowerCase();
	    	
	    	if(Extension == "gif" || Extension == "png" || Extension == "bmp"
                || Extension == "jpeg" || Extension == "jpg")
	    		{
		    		var reader = new FileReader();
		    		 
			        reader.onload = function (e) {
			            $('.mainCover').attr('src', e.target.result);
			            $('#inpCoverImg').val(null);
			            $("[class*='coverMask']").remove();
			        }
			 
			        reader.readAsDataURL(input.files[0]);
	    	
	    		}else{
	    			setMainCover($("[class*='cover_set_0'] > img").eq( Math.floor(Math.random()*6)));
		    		$('#groupImage').val(null);
	    			alert("이미지 파일을 올려주세요");
	    			return;
	    			
	    		}

	    }
	}
	
	$('.addNewImgFileBtn').on("click",function(){
		$('#coverUploadInp').click();
	});
	
	$("#conditionRegionLarge").change(function(){
		mediumRegion($(this).val());
	});
	
	$("#conditionRegionLarge").change(function(){
		smallRegion($(this).val());
	});
	
	// 시군구를 찾기 위한 ajax
	function mediumRegion(lRegion) {
		
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
	              
	         
	            	$("#conditionRegionMedium").append("<option value='"+regionMediums[i] + "' >"+regionMediums[i]+"</option>");
	           }
	             
	       },error:function(data){
	            console.log("에러입니다"); 
	       }
	 	});
	}
	//읍면동을 찾기 위한 ajax
	function smallRegion(lmRegion){

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
	        
	              regionSmalls[i] = features[i].properties.emd_kor_nm;
	              
	           		
	             $("#conditionRegionSmall").append("<option value="+regionSmalls[i]+">"+regionSmalls[i]+"</option>");
	           		
	           }
	             
	       },error:function(data){
	            console.log("에러입니다"); 
	       }
	  });
		
	}
	
	
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
    else{
       $(".condition_region").prop("disabled", false);
       $("#conditionRegionSmall").children().not(":lt(2)").remove();
       $("#conditionRegionSmall").val("regionNone").prop("selected", true);
       $("#conditionRegionMedium").children().not(":lt(2)").remove();
       $("#conditionRegionMedium").val("regionNone").prop("selected", true);
       
    }
 });
	  
 
 $("#createGroupBtn").click(function() {
    
	if($('#inpGrpName').val().trim().length<=0)
		{
	 		alert("모임 이름을 입력해 주세요");
	 		return;
		} 
	 
	 
	 if($('#min_ageSelect').val()!=-1&&$('#max_ageSelect').val()!=-1){
		 if($('#min_ageSelect').val()>$('#max_ageSelect').val()){
		    	alert("최소나이는 최대나이 보다 작아야 합니다.");
		    	return;
		 }
	 }
	 
	if($('#maxNumber').val()<=0||$('#maxNumber').val()>50){
  	  alert("최대 멤버 수를 확인해 주세요");
	 }
    else if(!$("#regionNone").is(":checked")){
       
       var rLarge = $("#conditionRegionLarge").val();
       var rMedium = $("#conditionRegionMedium").val();
       var rSmall = $("#conditionRegionSmall").val();
   		
       var regionFull = "";
       
      
       // 지역을 한 String으로 담기 위해서 구분
       if(rLarge != "regionNone")
          regionFull = rLarge;
       if (rMedium != "전체" && rMedium != "regionNone")
          regionFull += " " + rMedium;
       if(rSmall != "전체" && rSmall != "regionNone")
          regionFull += " " + rSmall;      
       
      
     	
          $("#regionFull").val(regionFull);
          
          if('${group==null}'=='true')
          	$("#createGroupForm").submit();
          else
        	  $("#createGroupForm").attr("action",'${root}/groups/updateGroupEnd.gp').submit();
    }else{

  	 $("#regionFull").val("지역무관");
  	 
  	 if('${group==null}'=='true')
       	$("#createGroupForm").submit();
       else
     	  $("#createGroupForm").attr("action",'${root}/groups/updateGroupEnd.gp').submit();
    }	
 });
	    
	
</script>

</html>

</html>
