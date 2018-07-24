<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>


<style>
.labTitle{
	font-size: 2em;
	
	 font-family:'nanum-barun-gothic-bold'
}

.cover_item_0{
	display: list-item;
	float:left;
}
.constraints{
	border:1em solid #f7f7f9;	
}

.bolder_text{
	font-weight: bolder;
}

.button_sizing{
	width:120px;
	height:50px;
}

.default_img_small{
	width:150px;
	height:100px;
}

.mainCover{
	width:400px;
}

.coverMask{
	color:red;
	background:#004085;
	opacity: 0.3;
	text-align:center;
	position:absolute;
	top:0;
	bottom:0;
	left:14px;
	right:14px;
	box-sizing: border-box;
	
	font-size:2em;
}

.btn_radioPos{
	position: relative;
	top:30px;
}

</style>



</head>

<body>
	
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	<form action="${root}/groups/createGroup.gp">
	<div class="container">
		<div class="make_cover">
			
				<div class="form-group">
					<label for="inpGrpName" id="labGroupName" class="labTitle">밴드 이름</label>
					<div class="input-group input-group-lg">
						<input type="text" id="inpGrpName" name="inpGrpName" placeholder="밴드 이름 입력" class="form-control "/>
					</div>
				</div>
			
		</div>
	</div><!--make band name container end  -->
	
	<div class="container mt-4">
		<div class="row cover_select">
			<div class="col-5  m-auto">
				<img class="mainCover img-thumbnail" src="../resources/images/createGroupDefaultPictures/defaultPic01.jpg" alt="" />
				<input type="hidden" value="" name="groupImgSrc" id="inpCoverImg"/>
			</div>
			<div class="col-7 cover_list ">
				<div class="list_head d-flex flex-row ">
					<div class=" align-self-center"><h3>커버 선택</h3></div>
					
						<div class=" p-1 ml-auto align-self-center"><span class="cover_paging"><strong class="cover_curr_page">1</strong>/<strong>2</strong></span></div>
						<div class="pt-3 btn_area">
							<nav aria-label="Page navigation">
							  <ul class="pagination ">
							    <li class="page-item">
							      <a class="page-link" href="#" aria-label="Previous" onclick="nextPicList(-1)">
							        <span aria-hidden="true">&laquo;</span>
							        <span class="sr-only">Previous</span>
							      </a>
							    </li>
							    <li class="page-item">
							      <a class="page-link" href="#" aria-label="Next" onclick="nextPicList(1)">
							        <span aria-hidden="true">&raquo;</span>
							        <span class="sr-only">Next</span>
							      </a>
							    </li>
							  </ul>
							</nav>
						</div>
				</div>
		
				<div class="row mt-4 cover_lists">
					<a class="col-3 mb-4"><img src="../resources/images/createGroupDefaultPictures/addNewPicture.jpg" alt="" class="img-fluid"/></a>
					<a class="col-3 mb-4 cover_set_0"><img src="../resources/images/createGroupDefaultPictures/defaultPic01.jpg" alt="" class="img-fluid"/></a>
					<a class="col-3 mb-4 cover_set_0"><img src="../resources/images/createGroupDefaultPictures/defaultPic02.jpg" alt="" class="img-fluid"/></a>
					<a class="col-3 mb-4 cover_set_0"><img src="../resources/images/createGroupDefaultPictures/defaultPic03.jpg" alt="" class="img-fluid"/></a>
					<a class="col-3 mb-4 cover_set_0"><img src="../resources/images/createGroupDefaultPictures/defaultPic04.jpg" alt="" class="img-fluid"/></a>
					<a class="col-3 mb-4 cover_set_0"><img src="../resources/images/createGroupDefaultPictures/defaultPic05.jpg" alt="" class="img-fluid"/></a>
					<a class="col-3 mb-4 cover_set_0"><img src="../resources/images/createGroupDefaultPictures/defaultPic06.jpg" alt="" class="img-fluid"/></a>
					<a class="col-3 mb-4 cover_set_0"><img src="../resources/images/createGroupDefaultPictures/defaultPic07.jpg" alt="" class="img-fluid"/></a>	
					                             
					<a class="col-3 mb-4 cover_set_1" style="display:none;"><img src="../resources/images/createGroupDefaultPictures/defaultPic08.jpg" alt="" class="img-fluid"/></a>
					<a class="col-3 mb-4 cover_set_1" style="display:none;"><img src="../resources/images/createGroupDefaultPictures/defaultPic09.jpg" alt="" class="img-fluid"/></a>
					<a class="col-3 mb-4 cover_set_1" style="display:none;"><img src="../resources/images/createGroupDefaultPictures/defaultPic10.jpg" alt="" class="img-fluid"/></a>
					<a class="col-3 mb-4 cover_set_1" style="display:none;"><img src="../resources/images/createGroupDefaultPictures/defaultPic11.jpg" alt="" class="img-fluid"/></a>
					<a class="col-3 mb-4 cover_set_1" style="display:none;"><img src="../resources/images/createGroupDefaultPictures/defaultPic12.jpg" alt="" class="img-fluid"/></a>
					<a class="col-3 mb-4 cover_set_1" style="display:none;"><img src="../resources/images/createGroupDefaultPictures/defaultPic13.jpg" alt="" class="img-fluid"/></a>
					<a class="col-3 mb-4 cover_set_1" style="display:none;"><img src="../resources/images/createGroupDefaultPictures/defaultPic14.jpg" alt="" class="img-fluid"/></a>		
				</div>
			
			</div>
			
		</div>
	</div><!--cover container end  -->
	<div class="container mt-5">
		<div class="row constraint_select">
			<div class="col-12">
				<h3 class="labTitle">밴드 공개 설정(필수)</h3>
			</div>
			<div class="col-12 constraints">
				<div class=" d-flex flex-row  justify-content-around">
					<div class="form-check form-check-inline ">
					  <input type="radio" id="openSetting1" name="openSetting" class="form-check-input" style="position:relative;top:40px;" value="private">
					  <label class="form-check-label" for="openSetting1"><strong>비공개 모임</strong><br><span>모임의 게시글이 공개되지 않습니다. 초대를 통해서만 가입할 수 있습니다.</span></label>
					</div>
			
					<div class="form-check form-check-inline ">
					  <input type="radio" id="openSetting2" name="openSetting" class="form-check-input" style="position:relative;top:40px;" value="protedted">
					  <label class="form-check-label" for="openSetting2"><strong>모임명 공개 모임</strong><br> <span>누구나 모임을 검색해 찾을 수 있지만, 게시물은 멤버만 볼 수 있습니다.</span><br></label>
					</div>
					<div class="form-check form-check-inline">
					  <input type="radio" id="openSetting3" name="openSetting" class="form-check-input" style="position:relative;top:40px;" value="public">
					 	 <label class="form-check-label" for="openSetting3"><strong>공개 모임</strong><br><span>누구나 모임을 검색해 찾을 수 있고, 게시물을 볼 수 있습니다.</span></label>
					</div>
			
				</div>
			
			</div>
		
		</div>
		
	</div><!--group open setting div end  -->
	
	<div class="container mt-5">
		 
		 <label class="labTitle">밴드 제약 설정(선택)</label>
		 <button class="btn btn-primary btn-sm" type="button" data-toggle="collapse" data-target="#divRestrict">
		   	펼치기
		  </button>
		
		<div class="collapse" id="divRestrict">
		  <div class="card card-body">
		    	
		    	
		    		<div class="form-group">
					    <label for="genderSelect" class="bolder_text">성별 제약</label>
					    <select class="form-control" id="genderSelect" name="gender_select">
					      	<option value="N">무관</option>
					     	<option value="M">남</option>
					     	<option value="F">여</option>
					    </select>
					</div>
					
					<div class="row">
						<div class="col-5 mt-1">
							<div class="form-group">
							    <label for="min_ageSelect" class="bolder_text">최소 나이</label>
							    <select class="form-control" id="min_ageSelect" name="minAge">
							    	
							    </select>
							</div>
						</div>
						<span class="col-1 mt-5"> 부터 </span>
						<div class="col-5 mt-1">
							<div class="form-group">
							    <label for="max_ageSelect" class="bolder_text">최대 나이</label>
							    <select class="form-control" id="max_ageSelect" name="maxAge">
							    	
							    </select>
							</div>
						</div>
						<span class="col-1 mt-5"> 까지 </span>
		    		</div>
		    		
		    		<div class="row">
		    			<div class="col-10">
		    				<div class="row">
								<div class="col mt-1">
									<div class="form-group">
									    <label for="create_city_select" class="bolder_text">시</label>
									    <select class="form-control" id="create_city_select" name="create_city_select">
									    	<option value="N">서울특별시</option>
									    </select>
									</div>
								</div>
								<div class="col mt-1">
									<div class="form-group">
									    <label for="create_city_select" class="bolder_text">구/군</label>
									    <select class="form-control" id="create_district_select" name="create_city_select">
									    	<option value="N">강남구</option>
									    </select>
									</div>
								</div>
								<div class="col mt-1">
									<div class="form-group">
									    <label for="create_borough_select" class="bolder_text">동</label>
									    <select class="form-control" id="create_borough_select" name="create_borough_select">
									    	<option value="N">신사동</option>
									    </select>
									</div>
								</div>
							</div>
						</div>
						<div class="col-2 mt-5">
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="checkbox" id="districtDefault" value="N">
							  <label class="form-check-label" for="districtDefault">지역 무관</label>
							</div>
						</div>
		    		</div>
		    		
		    		<div class="row">
						<div class="col">
						<label for="maxNumber" class="bolder_text">최대 인원 수</label>
							<div class="input-group">
								<div class="input-group-prepend">
										<span class="input-group-text bg-primary" id="basic-addon1">1 / </span>
								</div>
								
								<input type="number" class="form-control" id="maxNumber" name="max_number" min="1" value="1" max="100"/>
								
								<div class="input-group-append">
									<span class="input-group-text" id="basic-addon1">명/최대(50 명)</span>
								</div>
							</div>
						</div>
						<div class="col-2 mt-4">
							
						</div>
					</div>
					
		  </div>
		</div>
	</div> <!--distric container end  -->
	<div class="container mt-5">
		
			
		<label class="labTitle">추가정보 (선택)</label>
		<button class="btn btn-primary btn-sm"  data-toggle="collapse" data-target="#interestCategory"  type="button" >관심분야 </button>
			
		
		
		<div class="collapse" id="interestCategory">
			  <div class="card card-body ">
				
        		<div class="form-check form-check-inline">
                 <input type="checkbox"id="f1" class="form-check-input"name="interest" value="B001"> 
                 <label class="form-check-label" for="f1">라이프스타일</label>
                 </div>
                 <div class="form-check form-check-inline">
                 <input type="checkbox"id="f2" class="form-check-input"name="interest" value="B002"> <label class="form-check-label" for="f2">영어/외국어</label>
                 </div>
                 <div class="form-check form-check-inline">
                 <input type="checkbox"id="f3" class="form-check-input"name="interest" value="B003"> <label class="form-check-label" for="f3">컴퓨터</label>
                 </div>
                 <div class="form-check form-check-inline">
                 <input type="checkbox"id="f4" class="form-check-input"name="interest" value="B004"> <label class="form-check-label" for="f4">디자인/미술</label>
                 </div>
                 <div class="form-check form-check-inline">
                 <input type="checkbox"id="f5" class="form-check-input"name="interest" value="B005"> <label class="form-check-label" for="f5">취업</label>
                 </div>
                 <div class="form-check form-check-inline">
                 <input type="checkbox"id="f6" class="form-check-input"name="interest" value="B006"> <label class="form-check-label" for="f6">음악/공연</label>
                 </div>
                 <div class="form-check form-check-inline">
                 <input type="checkbox"id="f7" class="form-check-input"name="interest" value="B007"> <label class="form-check-label" for="f7">스포츠</label>
                 </div>
                 <div class="form-check form-check-inline">
                 <input type="checkbox"id="f8" class="form-check-input"name="interest" value="B008"> <label class="form-check-label" for="f8">뷰티/미용</label>
                 </div>
                 <div class="form-check form-check-inline">
                 <input type="checkbox"id="f9" class="form-check-input"name="interest" value="B009"> <label class="form-check-label" for="f9">게임</label>
                 </div>
		             
		        </div>
	   		</div>
		</div>
	
	
	
	
	<div class="container mt-4">
		<div class="d-flex justify-content-center">
				<button type="reset" class="btn btn-secondary btn-lg mr-4 button_sizing">취소하기</button>
				<button type="submit" class="btn btn-primary btn-lg button_sizing">완료</button>		
		</div>		
	</div>
</form>
</body>

<script>

	var cover_curr_page =0;
	
	$(function(){
		var imgNum = Math.floor(Math.random()*6);
		
		setMainCover($("[class*='cover_set_0'] > img").eq(imgNum));
		
		var cover_imgs = $("[class*='cover_set'] > img").css("cursor","pointer");
		
		$(cover_imgs).on("click",function(){
			setMainCover(this);
		});
		
		setSelectYears($('#min_ageSelect'),100);
		setSelectYears($('#max_ageSelect'),100);
		
		$('#maxNumber').change(function(){
			if($(this).val()>100)
				$(this).val(100);
			else if($(this).val()<1)
				$(this).val(1);
		});
	});
	
	
	
	function setSelectYears(selectObj,years){
		
		 var n =new Date().getFullYear();
		 
		console.log(selectObj);
		 $(selectObj).append($("<option>").val(-1).text('무관'));	 
		 for(var i=0 ;i<years;++i){
			 $(selectObj).append($("<option>").val(n-i).text(n-i));	 
		 }
	}
	
	
	function setMainCover(imgObj){
		
		$("[class*='coverMask']").remove();
		
		$(imgObj).parent().append("<i class='fas fa-check coverMask'></i>")
		
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
	
	
	
	
</script>

</html>

</html>
