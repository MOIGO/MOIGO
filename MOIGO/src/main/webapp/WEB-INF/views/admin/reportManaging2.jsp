<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>

 <style type="text/css">
	div.vertical-line{
    border-left: 4px solid #808080;
    height: 100%;
    margin-left: auto;
    margin-right: auto;
    width: 10px;
}
	#modalAccuseList{
	height: 450px;
	width: 100%;
	overflow: scroll;
	}
</style>
</head>
<body>
	<c:import url="common/adminSidebar.jsp"></c:import>

    
 
  	

	<div class="row report_body_whole"> <!-- 전체 row content 내부 시작 -->
	  <!-- 	<div class="col-sm-12 col-md-1 col-lg-1 col-xs-12 d-none d-lg-block"></div> --> <!-- 사이드바 사이 거리 주기 -->
	  
	    <div class="col-lg-7 col-md-12 col-sm-12 col-xs-12"> <!-- 첫번째 단 -->
		    <br>
		    <h2>Recent Report</h2>
		    <br>
		    <form>
		   
		    
		   
		    <div class="row">
		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <select class=" col-sm-2 col-xs-2">		    
			    <option>content</option>
			    <option>reporter</option>
			    <option>target</option>  
		    </select>
		    <input class="admin_group_search col-sm-4 col-xs-4" id="myInput" type="text" placeholder="Search.."> 
		    <button type="button" class="btn btn-outline-info">검색</button>&nbsp;&nbsp;
		    <br>
		    <div class="form-check text-right">		  
						<input class="form-check-input" type="checkbox" name="exampleRadios"id="exampleRadios1" value="처리된 신고 불포함" onClick="updateList(this.value)"> 
						<label class="form-check-label" for="exampleRadios1">not including processed reports</label>
			</div>
		    </div>
		    
		    </form>
		    <br>
	    
	    
		<table class="table table-bordered table-hover text-center">
			<thead class="thead-dark">
		        <tr>
		          <th>신고자</th>
		          <th>피신고자</th>
		          <th>신고타입</th>
		          <th colspan="4">신고내용</th>         
		          <th>상세 정보</th> 
		        </tr>
			</thead>
	      
	      
			<c:forEach items="${accuseList}" var="accuse">
				<tbody id="myTable">
					<tr>
		          		<td>${accuse.reporter}</td>
		          		<td>
				          <c:choose>
				          	<c:when test="${!empty accuse.targetMember}">${accuse.targetMember}</c:when>
				          	<c:otherwise>${accuse.targetGroup}</c:otherwise>
				          </c:choose>         
		          		</td>
		          		<td>
				          <c:choose>
				          	<c:when test="${!empty accuse.targetMember}">member</c:when>
				          	<c:otherwise>group</c:otherwise>
				          </c:choose>  
		         		 </td>
				        <td colspan="4">${accuse.content}</td>
				        <td><button type="button" class="btn btn-outline-success btn-sm">확인</button> </td>   	
	        		</tr>      
	      		</tbody>
			</c:forEach>
		</table>
   <!-- 페이징 처리할 부분 -->
		<!-- <br><br><br><br><br> -->

		<div class="pagingArea" align="center">
			<ul class="pagination justify-content-center">
				 <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/adminReport.ad?currentPage=1">&lt;&lt;</a></li>
						<c:if test="${pi.currentPage le 1}">
						<li class="page-item"><a class="page-link">Pre</a></li>
				</c:if><c:if test="${pi.currentPage gt 1}">
					 <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/adminReport.ad?currentPage=${pi.currentPage -1}">Pre</a></li>
				</c:if>
				<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
					<c:if test="${i eq pi.currentPage}">
					<li class="page-item"><a class="page-link">${i}</a></li>
					</c:if>	<c:if test="${i ne pi.currentPage}">
					 		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/adminReport.ad?currentPage=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				
				
				<c:if test="${pi.currentPage ge pi.maxPage}">
						<li class="page-item"><a class="page-link">Next</a></li>
				</c:if><c:if test="${pi.currentPage lt pi.maxPage}">
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/adminReport.ad?currentPage=${pi.currentPage + 1}">Next</a></li>
				</c:if>
				      <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/adminReport.ad?currentPage=${pi.maxPage}">&gt;&gt;</a></li>
				
			</ul>
		</div>
		
		<br><br>
		
	</div> <!-- 첫번째 단 끝 -->
     
  </div> <!-- row end -->

</div><!-- row content end-->
</div>












  

<script>
$(document).ready(function(){

	$(".identifyingClass").click(function () {
		var id = $(this).data('id');	
	        $.ajax({
	            url: "${pageContext.request.contextPath}/mrDetail.ad",
	            type:'get',
	            data: {id:id},
	            dataType:"json",
	            success:function(data){	
	            	
		            $("#inputEmail3").val(data[0].memberEmail);
		            $("#inputName").val(data[0].memberName);
		            $("#inputAddress").val(data[0].memberAddress);
		            $("#inputBirth").val(data[0].memberBirth);
		            $("#inputEnrollDate").val(data[0].enrollDate);
		            $("#inlineFormInputPost").val(data[0].postCount);
					$("#inlineFormInputReply").val(data[0].replyCount);
		            
		            $("#recipientName").val(data[0].memberEmail);
		            console.log(data[1].length);
		            $('.input_accuse_list').empty();
		            for(var i in data[1]){
		            	console.log(i);
		            	var str ='<tr onclick="move('+data[1][i].accuseNo+')">'+
									'<td>'+data[1][i].content+'</td>' +
	 								'<td>'+data[1][i].reporter+'</td>' +
	 								'<td>'+data[1][i].accuseDate+'</td>' +
								'</tr>';
		            	 $('.input_accuse_list').append(str);       	 
		            }	
		            
		            $("#memDelSubmit").click(function() {
		       	  	 var id =data[0].memberNo;
		       	  	  $.ajax({
		       	            url: "${pageContext.request.contextPath}/memDelete.ad",
		       	            type:'get',
		       	            data: {id:id},
		       	            dataType:"json",
		       	            success:function(data){	
		       	            	alert('회원번호 '+data+' 성공적으로 삭제 되었습니다.');
		       	            		       	            	
		       	            },error:function(request,status,error){
		       	                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       	            }
		       	  	  


		       	  	  });

		       	    
		       	}); 
		            
		           
	            }
	        });	           
		}); //함수 끝
	
		
		$(".identifyingClass2").click(function () {
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
						$("#inputGsc").val(data[0].minAge);
						$("#inputGsc").val(data[0].maxAge);
						$("#inputGsc").val(data[0].groupGender);
						$("#masterEmail").val(data[0].masterEmail); //모임장
						
			            $("#messageTextToMaster").val("그룹 "+data[0].groupName+" 모임장에게 알립니다. 귀하가 모임장으로 있는 그룹은 많은 신고가 접수되어 확인한 결과 운영방침에 맞지 않다고 판단되어 비가용 처리되었습니다. 문의사항이 있다면 본 메일로 문의하십시오.");
			            
			            $('.input_accuse_list').empty();
			            for(var i in data[1]){
			            	console.log(i);
			            	var str ='<tr onclick="move('+data[1][i].accuseNo+')">'+
										'<td>'+data[1][i].content+'</td>' +
		 								'<td>'+data[1][i].reporter+'</td>' +
		 								'<td>'+data[1][i].accuseDate+'</td>' +
									'</tr>';
			            	 $('.input_accuse_list').append(str);
			            }
			            
			            
			            $("#grpDelSubmit").click(function() {
				       	  	 var id =data[0].groupNo;
				       	  	  $.ajax({
				       	            url: "${pageContext.request.contextPath}/grpDelete.ad",
				       	            type:'get',
				       	            data: {id:id},
				       	            dataType:"json",
				       	            success:function(data){	
				       	            	alert('그룹번호 '+data+' 성공적으로 블라인드 처리 되었습니다.');
				       	            	location.reload();	       	            	
				       	            },error:function(request,status,error){
				       	                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				       	            }
				       	  	  });				       	    
				       	});  
		            }
		        });	           
			}); //함수 끝
			
			
   $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });   
			
			
   $("#mAccuseInput").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#mAccuseTable tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  }); 
   
 
   
   
}); //시작 이벤트 끝



</script>


</body>
</html>