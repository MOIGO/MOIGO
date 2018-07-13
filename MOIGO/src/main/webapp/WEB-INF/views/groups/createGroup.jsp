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

</style>



</head>

<body>
	
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>

	<div class="container">
		<div class="make_cover">
			<form action="">
				<div class="form-group">
					<label for="inpGrpName" id="labGroupName" class="labTitle">밴드 이름</label>
					<div class="input-group input-group-lg">
						<input type="text" id="inpGrpName" name="inpGrpName" placeholder="밴드 이름 입력" class="form-control "/>
					</div>
				</div>
			</form>
		</div>
	</div><!--make band name container end  -->
	
	<div class="container">
		<div class="row cover_select">
			<div class="main_cover col-5">
				<img class="cover img-thumbnail" src="http://via.placeholder.com/400x300" alt="" />
			</div>
			<div class="col-7 cover_list">
				<div class="list_head d-flex flex-row test">
					<div class="test align-self-center"><h3>커버 선택</h3></div>
					
						<div class=" p-1 ml-auto align-self-center"><span class="cover_paging"><strong class="cover_curr_page">1</strong>/6</span></div>
						<div class="pt-3 btn_area">
							<nav aria-label="Page navigation">
							  <ul class="pagination ">
							    <li class="page-item">
							      <a class="page-link" href="#" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							        <span class="sr-only">Previous</span>
							      </a>
							    </li>
							    <li class="page-item">
							      <a class="page-link" href="#" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							        <span class="sr-only">Next</span>
							      </a>
							    </li>
							  </ul>
							</nav>
						</div>
				</div>
		
				<div class="row mt-2 cover_list">
					<div class="col-3 mb-4"><img src="http://via.placeholder.com/140x100" alt="" class="img-fluid"/></div>
					<div class="col-3 mb-4"><img src="http://via.placeholder.com/140x100" alt="" class="img-fluid"/></div>
					<div class="col-3 mb-4"><img src="http://via.placeholder.com/140x100" alt="" class="img-fluid"/></div>
					<div class="col-3 mb-4"><img src="http://via.placeholder.com/140x100" alt="" class="img-fluid"/></div>
					<div class="col-3 mb-4"><img src="http://via.placeholder.com/140x100" alt="" class="img-fluid"/></div>
					<div class="col-3 mb-4"><img src="http://via.placeholder.com/140x100" alt="" class="img-fluid"/></div>
					<div class="col-3 mb-4"><img src="http://via.placeholder.com/140x100" alt="" class="img-fluid"/></div>
					<div class="col-3 mb-4"><img src="http://via.placeholder.com/140x100" alt="" class="img-fluid"/></div>

				</div>
			
			</div>
			
		</div>
	</div><!--cover container end  -->
	<div class="container mt-4">
		<div class="row constraint_select">
			<div class="col-12">
				<h3 class="labTitle">밴드 공개 설정(필수)</h3>
			</div>
			<div class="col-12 constraints">
				<div class=" d-flex flex-row test justify-content-around">
					<div class="custom-control custom-radio w-25">
					  <input type="radio" id="customRadio1" name="openSetting" class="custom-control-input mt-4" value="private">
					  <label class="custom-control-label bolder_text" for="customRadio1">비공개 모임</label><br>
					  <span>모임의 게시글이 공개되지 않습니다. 초대를 통해서만 가입할 수 있습니다.</span>
					</div>
					<div class="custom-control custom-radio w-25">
					  <input type="radio" id="customRadio2" name="openSetting" class="custom-control-input mt-4" value="protedted">
					  <label class="custom-control-label bolder_text" for="customRadio2">모임명 공개 모임</label><br>
					   <span>누구나 모임을 검색해 찾을 수 있지만, 게시물은 멤버만 볼 수 있습니다.</span>
					</div>
					<div class="custom-control custom-radio w-25">
					  <input type="radio" id="customRadio3" name="openSetting" class="custom-control-input mt-4" value="public">
					  <label class="custom-control-label bolder_text " for="customRadio3">공개 모임</label><br>
					   <span>누구나 모임을 검색해 찾을 수 있고, 게시물을 볼 수 있습니다.</span>
					</div>
			
				</div>
			
			</div>
		
		</div>
		
	</div><!--group open setting div end  -->
	
	<div class="container mt-4">
		 
		 <label class="labTitle">밴드 제약 설정(선택)</label>
		 <button class="btn btn-primary btn-sm" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
		   	펼치기
		  </button>
		
		<div class="collapse" id="collapseExample">
		  <div class="card card-body">
		    	<form action="">
		    	
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
							    <label for="ageSelect" class="bolder_text">최소 나이</label>
							    <select class="form-control" id="ageSelect" name="age_select">
							    	<option value="N">무관</option>
							      	<option value="1991">1991</option>
							    </select>
							</div>
						</div>
						<span class="col-1 mt-5"> 부터 </span>
						<div class="col-5 mt-1">
							<div class="form-group">
							    <label for="ageSelect" class="bolder_text">최대 나이</label>
							    <select class="form-control" id="ageSelect" name="age_select">
							    	<option value="N">무관</option>
							      	<option value="1991">1991</option>
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
									    <label for="citySelect" class="bolder_text">시</label>
									    <select class="form-control" id="citySelect" name="age_select">
									    	<option value="N">서울특별시</option>
									    </select>
									</div>
								</div>
								<div class="col mt-1">
									<div class="form-group">
									    <label for="districtSelect" class="bolder_text">구/군</label>
									    <select class="form-control" id="districtSelect" name="age_select">
									    	<option value="N">강남구</option>
									    </select>
									</div>
								</div>
								<div class="col mt-1">
									<div class="form-group">
									    <label for="districtSelect" class="bolder_text">동</label>
									    <select class="form-control" id="districtSelect" name="age_select">
									    	<option value="N">강남구</option>
									    </select>
									</div>
								</div>
							</div>
						</div>
						<div class="col-2 mt-5">
							<div class="custom-control custom-radio">
							  <input type="radio" id="default" name="openSetting" class="custom-control-input mt-4" value="private">
							  <label class="custom-control-label bolder_text " for="customRadio1">지역 무관</label><br>
							</div>
						</div>
		    		</div>
		    	</form>
		  </div>
		</div>
	</div>
	
	
</body>

<script>

	
</script>

</html>

</html>
