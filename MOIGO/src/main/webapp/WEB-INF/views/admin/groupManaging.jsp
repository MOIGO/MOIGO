<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>

<style type="text/css">
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
	padding: 50px 70px;
	
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
			
			<div class="group_detail collapse text-center" id="targetDiv"></div>

		</div>

	</div>
	</div>
	<!-- container end-->



	<script>
$(document).ready(function(){
	
	//검색 자바스크립트
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
  
	$(".show_view_detail_group").click(function () {
		var id = $(this).data('id');
		   $.ajax({
	            url: "${pageContext.request.contextPath}/grpDetail.ad",
	            type:'get',
	            data: {id:id},
	            dataType:"json",
	            success:function(data){	
	            		$(".group_detail").empty();
	            		console.log(data[0]);
		            	var str ='<h3>'+data[0].groupNo+'</h3>'+
		            			'<table class="table table-bordered text-center detail_group">'+
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
		            	 $('.group_detail').append(str);

	            }, error : function(code){
	            	console.log(code);
	            }
	        });
		
		
	});
  
});
   

/*  function adminSideClick(e){
    $('.sidenav').toggle('slow');
    $('.body_background').toggleClass('extended-panel');

  }*/
</script>

</body>
</html>