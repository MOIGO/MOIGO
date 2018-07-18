<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>

 <style type="text/css">
	.admin_group_table{ height: 600px; overflow: scroll;}
    tr:hover {background-color: #f5f5f5;}
	.group_detail{ padding: 50px 120px; border: 10px solid #d2e7d2; }
  </style>
</head>
<body>

	<c:import url="common/adminSidebar.jsp"></c:import>

  <div class="row"> 
  </div>
  <br>

  <div class="row">
   <div class="col-1"></div>
   <div class="col-5">
    <input class="form-control admin_group_search col-5" id="myInput" type="text" placeholder="Search..">
   <br>
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
				        <td><button type="button"  data-target="#targetDiv" data-toggle="collapse" data-id="${group.groupNo}"class="btn btn-outline-success btn-sm show_view_detail_group">확인</button> </td>   	
	        		</tr>      
	      		</tbody>
	   </c:forEach>
    </table>
  
    </div>

  </div>
  <div class="col-6">
  	<br><br><br>
  	<div class="group_detail collapse" id="targetDiv">
  	
  	
  	</div>
  
  </div>

</div>
</div><!-- container end-->



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
		            	var str ='<h4> 상세 정보 </h4>'+
		            			'<table class="table table-bordered text-center">'+
		            			'<tr>'+
		            			'<td>이름</td>' +
								'<td>'+data[0].groupName+'</td>' +
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
								'<td>'+data[0].enrollGR+'</td>' +
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