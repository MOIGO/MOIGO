<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>

<style type="text/css">
.carousel-inner div {
	width: 100%;
	height: 100%;
}

.admin_group_table {
	height: 600px;
	overflow: scroll;
}

.detail_group {
	table-layout: fixed;
	word-wrap: break-word;
}

tr:hover {
	background-color: #f5f5f5;
}

.group_detail {
	padding: 30px 70px;
}


.carousel-inner div {
	width: 100%;
	height: 700px;
}
.carousel-control-prev>span, .carousel-control-next>span {
	background-color: green;
}
</style>
</head>
<body>

	<c:import url="common/adminSidebar.jsp"></c:import>

	<div class="row"></div>
	<br>

	<div class="row">
		<div class="col-1"></div>
		<div class="col-5">
			<input class="form-control admin_group_search col-5" id="myInput"
				type="text" placeholder="Search.."> <br>
			<div class="admin_group_table ">

				<table class="table table-bordered text-center">
					<thead class="thead-light table-primary">
						<tr>
							<th>no</th>
							<th>name</th>
							<th>Grade</th>
							<th>State</th>
							<th>상세보기</th>
						</tr>
					</thead>
					<c:forEach items="${groupList}" var="group">
						<tbody id="myTable">
							<tr>
								<td>${group.groupNo}</td>
								<td>${group.groupName}</td>
								<td>${group.groupGradeCode}</td>
								<td>${group.groupStateCode}</td>
								<td><button type="button" data-target="#targetDiv"
										data-toggle="collapse" data-id="${group.groupNo}"
										class="btn btn-outline-success btn-sm show_view_detail_group">확인</button>
								</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>

			</div>

		</div>
		<div class="col-6">

			<div class="collapse text-center" id="targetDiv">
				<div id="demo" class="carousel slide group_detail" >

					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#demo" data-slide-to="0" class="active"></li>
						<li data-target="#demo" data-slide-to="1"></li>
						<li data-target="#demo" data-slide-to="2"></li>
					</ul>

					<!-- The slideshow -->
					<div class="carousel-inner">
						<div class="carousel-item active group_detail_slide1">
							
						</div>
						<div class="carousel-item">
							<h4> 가입 회원 </h4>
							<table class="table table-bordered table-hover text-center grp_per_member">
								<thead class="thead-dark">
									<tr>
										<th style="width:18%">NAME</th>
										<th style="width:18%">댓글수</th>
										<th style="width:22%">게시글수</th>
										<th style="width:20%">GRADE</th>
										<th style="width:22%">회원정보</th>
									</tr>
								</thead>
								<tbody class="group_detail_slide2">
								</tbody>
							</table>
						</div>
						<div class="carousel-item">
							<img src="ny.jpg" alt="New York">
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="carousel-control-prev" href="#demo" data-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</a> <a class="carousel-control-next" href="#demo" data-slide="next">
						<span class="carousel-control-next-icon"></span>
					</a>

				</div>


			</div>

		</div>

	</div>
	</div>
	<!-- container end-->



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
	
	//group detail ajax--
	$(".show_view_detail_group").click(function () {
		var id = $(this).data('id');
		   $.ajax({
	            url: "${pageContext.request.contextPath}/grpDetail.ad",
	            type:'get',
	            data: {id:id},
	            dataType:"json",
	            success:function(data){	
	            		$(".group_detail_slide1").empty();
		            	$('.group_detail_slide2').empty();

	            		//console.log(data[0]);
		            	var str ='<h4>상세정보</h4>'+
		            			'<table class="table table-bordered text-center detail_group">'+
		            			'<tr>'+
		            			'<td>번호</td>' +
								'<td colspan="2" style="width:70%">'+data[0].groupNo+'</td>' +
								' </tr>'+
		            			'<tr>'+
		            			'<td >이름</td>' +
								'<td colspan="2" style="width:70%">'+data[0].groupName+'</td>' +
								' </tr>'+
								'<tr>'+
		            			'<td>그룹소개</td>' +
								'<td colspan="2">'+data[0].groupMsg+'</td>' +
								' </tr>'+
								'<tr>'+
		            			'<td>그룹지역</td>' +
								'<td colspan="2">'+data[0].groupPicture+'</td>' +
								' </tr>'+
								
								'<tr>'+
		            			'<td>가입회원수</td>' +
								'<td colspan="2">'+data[0].memNum+'</td>' +
								' </tr>'+
								'<tr>'+
		            			'<td>등급</td>' +
								'<td colspan="2">'+data[0].groupGradeCode+'</td>' +
								' </tr>'+
								'<tr>'+
		            			'<td>상태</td>' +
								'<td colspan="2">'+data[0].groupStateCode+'</td>' +
								' </tr>'+
								
								'<tr>'+
		            			'<td>등급</td>' +
								'<td colspan="2">'+data[0].maxMember+'</td>' +
								' </tr>'+
								'<tr>'+
		            			'<td>생성날짜</td>' +
								'<td colspan="2">'+data[0].enrollDate+'</td>' +
								' </tr>'+
								
								'<tr>'+
		            			'<td>관심사</td>' +
								'<td>'+data[0].interestBigCode+'</td>' +
								'<td>'+data[0].interestSmallCode+'</td>' +
								' </tr>'+
								
							
								'<tr>'+
		            			'<td>가입제한조건</td>' +
								'<td colspan="2">'+data[0].allowSignup+'</td>' +
								' </tr>'+
								'<tr>'+
		            			'<td>가입 연령</td>' +
								'<td colspan="2">'+data[0].minAge+'~'+data[0].minAge+'</td>' +
								' </tr>'+
								
								'<tr>'+
		            			'<td>성별제한</td>' +
								'<td colspan="2">'+data[0].groupGender+'</td>' +
								' </tr>'+
								
								'<table>';
		            	 $('.group_detail_slide1').append(str);
		            	 
		            	  for(var i in data[1]){
				            	console.log(i);
				            	var num = i*1+1;
				            	var idx =data[1][i].memberGradeName.indexOf('(');
				            	var str ='<tr>'+
										
		 								' <td>'+data[1][i].memberName+'</td>' +
		 							
		 								' <td>'+data[1][i].postCount+'</td>' +
		 								' <td>'+data[1][i].replyCount+'</td>' +
		 								' <td>'+data[1][i].memberGradeName.substring(0,idx)+'</td>' +
		 								'<td><button type="button" data-target="#groupModal" data-toggle="modal" data-id="'+data[1][i].groupNo+'" class="btn btn-outline-success btn-sm">보기</button></td>'+
										'<tr>';
		            	  }//for문 end
		            	  $('.group_detail_slide2').append(str);
	            }//success end
	        });//ajax end		
		});//--
  
});
   

/*  function adminSideClick(e){
    $('.sidenav').toggle('slow');
    $('.body_background').toggleClass('extended-panel');

  }*/
</script>

</body>
</html>