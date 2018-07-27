<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>

<style type="text/css">
.admin_member_table {
	height: 500px;
	overflow: scroll;
}

tr:hover {
	background-color: #f5f5f5;
}

tr {
	background-color: #f5f5f5;
}

.mem_detail {
	padding: 50px 80px;
}

.carousel-inner div {
	width: 100%;
	height: 500px;
}


.carousel-control-prev>span, .carousel-control-next>span {
	background-color: green;
}

.mem_per_group {
	table-layout: fixed;
	word-wrap: break-word;
}
</style>
</head>
<body>

	<c:import url="common/adminSidebar.jsp"></c:import>

	<div class="row"></div>
	<br>

	<div class="row">
		<div class="col-1"></div>
		<div class="col-lg-5 col-md-12 col-sm-12 col-xs-12">
			<input class="form-control admin_member_search col-5" id="myInput"
				type="text" placeholder="Search.."> <br>
			<div class="admin_member_table ">

				<table class="table table-bordered text-center">
					<thead class="thead-light table-primary">
						<tr>
							<th>no</th>
							<th>name</th>
							<th colspan="3">email</th>
							<th>상세정보</th>
						</tr>
					</thead>
					<c:forEach items="${memberList}" var="member">
						<tbody id="myTable">
							<tr>
								<td>${member.memberNo}</td>
								<td>${member.memberName}</td>
								<td colspan="3">${member.memberEmail}</td>
								<td><button type="button" data-target="#targetDiv"
										data-toggle="collapse" data-id="${member.memberNo}"
										class="btn btn-outline-success btn-sm show_view_detail_member">보기</button>
								</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>

			</div>

		</div>
		<div class="col-6">

			<div class="member_detail collapse text-center " id="targetDiv">
				<div id="demo" class="carousel slide mem_detail">

					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#demo" data-slide-to="0" class="active"></li>
						<li data-target="#demo" data-slide-to="1"></li>
						
					</ul>

					<!-- The slideshow -->
					<div class="carousel-inner">
						<div class="carousel-item active member_detail_slide1">
						</div>
						<div class="carousel-item">
							<h4> 가입 그룹 </h4>
							<table class="table table-bordered table-hover text-center mem_per_group">
								<thead class="thead-dark">
									<tr>
										<th style="width:15%">GNO</th>
										<th style="width:35%">NAME</th>
										<th style="width:26%">GRADE</th>
										<th style="width:24%">그룹정보</th>
									</tr>
								</thead>
								<tbody class="member_detail_slide2">
								</tbody>
							</table>
						</div>
						
					</div>

					<!-- Left and right controls -->
					<a class="carousel-control-prev" href="#demo" data-slide="prev">
						<span class="carousel-control-prev-icon" ></span>
					</a> <a class="carousel-control-next" href="#demo" data-slide="next">
						<span class="carousel-control-next-icon" ></span>
					</a>


				</div>


			</div>

		</div>

	</div>
	
	
	</div>

	</div>
	<!-- container end-->

 


<div class="modal fade" id="groupModal">
    <div class="modal-dialog ">
      <div class="modal-content">
				<div class="modal-body">
				
					<div class="tabbable">
						<!-- Only required for left/right tabs -->
						<div class="btn-group ">
							<ul class="nav nav-tabs">
								<li><button type="button"
										class="btn btn-outline-light active" a href="#tab4"
										data-toggle="tab">Group Info</button></li>				
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane active" id="tab4">
								<br>
								<form action="" method="get">
									<fieldset class="form-group">
										<legend> 그룹 정보 </legend>
										<div class="form-group row">
											<label for="inputGname" class="col-sm-2 col-form-label">Name</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="inputGname"
													readonly>
											</div>
										</div>
										<div class="form-group row">
											<label for="inputGmsg" class="col-sm-2 col-form-label">Message</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="inputGmsg"
													readonly>
											</div>
										</div>
										<div class="form-group row">
											<label for="inputGaddress" class="col-sm-2 col-form-label">Address</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="inputGaddress"
													readonly>
											</div>
										</div>
										<div class="form-group row">
											<label for="inputMaxMem" class="col-sm-2 col-form-label">maxM</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="inputMaxMem"
													readonly>
											</div>
										</div>
										<div class="form-group row">
											<label for="inputGenrollDate" class="col-sm-2 col-form-label">EnrollD</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="inputGenrollDate"
													readonly>
											</div>
										</div>

										<div class="form-group row align-items-center">
											<label class="col-sm-2 col-form-label">Status</label>
											<div class="col-sm-5">
												<label class="sr-only" for="inlineFormInputPost">Grade</label>
												<div class="input-group">
													<div class="input-group-prepend">
														<div class="input-group-text">Grade</div>
													</div>
													<input type="text" class="form-control"
														id="inputGgc" readonly>
												</div>
											</div>
											<div class="col-sm-5">
												<label class="sr-only" for="inlineFormInputReply">State</label>
												<div class="input-group">
													<div class="input-group-prepend">
														<div class="input-group-text">State</div>
													</div>
													<input type="text" class="form-control"
														id="inputGsc" readonly>
												</div>
											</div>
										</div>
										<div class="form-group row align-items-center">
											<label class="col-sm-2 col-form-label">Inhibition</label>
											<div class="col-sm-5">
												<label class="sr-only" for="inlineFormInputPost">Age</label>
												<div class="input-group">
													<div class="input-group-prepend">
														<div class="input-group-text">Age</div>
													</div>
													<input type="text" class="form-control"
														id="inputAge" readonly>
												</div>
											</div>
											<div class="col-sm-5">
												<label class="sr-only" for="inlineFormInputReply">Gender</label>
												<div class="input-group">
													<div class="input-group-prepend">
														<div class="input-group-text">Gender</div>
													</div>
													<input type="text" class="form-control"
														id="inputGender" readonly>
												</div>
											</div>
										</div>
										<div class="form-group row align-items-center">
											<label class="col-sm-2 col-form-label">Activity</label>
											<div class="col-sm-5">
												<label class="sr-only" for="inlineFormInputPost">Post</label>
												<div class="input-group">
													<div class="input-group-prepend">
														<div class="input-group-text">Post</div>
													</div>
													<input type="text" class="form-control"
														id="inlineFormInputPost" readonly>
												</div>
											</div> 
											<div class="col-sm-5"> 
												<label class="sr-only" for="inlineFormInputReply">Reply</label>
												<div class="input-group">
													<div class="input-group-prepend">
														<div class="input-group-text">Reply</div>
													</div>
													<input type="text" class="form-control"
														id="inlineFormInputReply" readonly>
												</div>
											</div>
										</div>
									</fieldset>
								</form>
							</div>



							<div class="tab-pane" id="tab5">
								<div class="container-fluid">
									<div class="row">
										<div id="modalAccuseList">
											<table class="table table-hover table-sm">
												<thead class="thead-light">
													<tr>
														<th>신고내용</th>
														<th>신고자</th>
														<th>신고날짜</th>
													</tr>
												</thead>
												<tbody id="mAccuseTable" class="input_accuse_list">
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="tab-pane" id="tab6">
								<form action="${pageContext.request.contextPath}/sendMessage.ad"
									method="get">
									<div class="form-group">
										<label for="recipient-name" class="col-form-label">Recipient:</label>
										<input type="text" class="form-control" id="masterEmail"
											name="email">
									</div>
									<div class="form-group">
										<label for="message-text" class="col-form-label">Message:</label>
										<textarea class="form-control" id="messageTextToMaster"
											name="messageText"></textarea>
									</div>
									<div class="text-center">
										<button type="submit" class="btn btn-outline-success">Send
											message</button>
									</div>
								</form>

							</div>
						</div>
					</div>
				</div>

				<!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>











	<script>
$(document).ready(function(){
	
	//검색 자바스크립트--
	$("#myInput").on("keyup", function() {
		var value = $(this).val().toLowerCase();
		$("#myTable tr").filter(function() {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    	});
  	});
	//--
	
	//캐러셀 움직임 방지--
	$('.carousel').carousel('pause');
	//--

	//상세 보기
	$(".show_view_detail_member").click(function () {
		var id = $(this).data('id');
		   $.ajax({
	            url: "${pageContext.request.contextPath}/memDetail.ad",
	            type:'get',
	            data: {id:id},
	            dataType:"json",
	            success:function(data){	
	            		$(".member_detail_slide1").empty();
	            		console.log(data[0]);
		            	var str ='<h4> 상세 정보 </h4>'+
		            			'<table class="table table-bordered text-center">'+
		            			'<tr>'+
		            			'<td>이메일</td>' +
								'<td>'+data[0].memberEmail+'</td>' +
								' </tr>'+
								'<tr>'+
		            			'<td>이름</td>' +
								'<td>'+data[0].memberName+'</td>' +
								' </tr>'+
								'<tr>'+
		            			'<td>성별</td>' +
								'<td>'+data[0].memberGender+'</td>' +
								' </tr>'+
								'<tr>'+
		            			'<td>생년월일</td>' +
								'<td>'+data[0].memberBirth+'</td>' +
								' </tr>'+			
								'<tr>'+
		            			'<td>가입한 그룹의 수</td>' +
								'<td>'+data[0].enrollGroup+'</td>' +
								' </tr>'+								
								'<tr>'+
		            			'<td>게시글의 수</td>' +
								'<td>'+data[0].postCount+'</td>' +
								' </tr>'+								
								'<tr>'+
		            			'<td>댓글의 수</td>' +
								'<td>'+data[0].replyCount+'</td>' +
								' </tr>'+
								'<table>';
		            	 $('.member_detail_slide1').append(str);
		            	 
		            	 
		            	 $('.member_detail_slide2').empty();
		            	 for(var i in data[1]){
		            		 console.log("data[1]: "+data[1]);
		            		 var num =i*1+1;
		            		 //console.log("(: "+data[1][i].memberGradeName.toString(data[1][i].memberGradeName.indexOf('('));
		            		 var idx =data[1][i].memberGradeName.indexOf('(');
		            		 var str2 = '<tr>'+		            			
								'<td>'+(num)+'</td>' +
								'<td>'+data[1][i].groupName+'</td>' +
								'<td>'+data[1][i].memberGradeName.substring(0,idx)+'</td>' +
								'<td><button type="button" data-target="#groupModal" data-toggle="modal" data-id="'+data[1][i].groupNo+'" class="btn btn-outline-success btn-sm identifyingClass">보기</button></td>'+
								'<tr>';
		            			
			            	 $('.member_detail_slide2').append(str2);

						 }
		            	 $(".identifyingClass").click(function () {
		         			var grpId =$(this).data('id');		        	
		         		        $.ajax({
		         		            url: "${pageContext.request.contextPath}/gpDetail.ad",
		         		            type:'get',
		         		            data: {grpId:grpId},
		         		            dataType:"json",
		         		            success:function(data){	
		         		            	
		         			            $("#inputGname").val(data[0].groupName);
		         			            $("#inputGmsg").val(data[0].groupMsg);
		         						$("#inputGaddress").val(data[0].groupAddress);
		         			            $("#inputMaxMem").val(data[0].maxMember);
		         			            $("#inputGenrollDate").val(data[0].enrollDate);
		         						$("#inputGgc").val(data[0].groupGradeCode);
		         						$("#inputGsc").val(data[0].groupStateCode);
		         						$("#inputAge").val(data[0].minAge+"~"+data[0].maxAge);
		         					
		         						$("#inputGender").val(data[0].groupGender);
		         						$("#inputGender").val(data[0].groupGender);
		         						
		         			           
		         		            }
		         		        });	           
		         			}); //함수 끝

					}//success 끝
				}); //ajax 끝

			});//--상세보기 끝

});//end






		/*  function adminSideClick(e){
		 $('.sidenav').toggle('slow');
		 $('.body_background').toggleClass('extended-panel');

		 }*/
</script>

</body>
</html>