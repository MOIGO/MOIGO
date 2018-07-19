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
</style>
</head>
<body>
	<c:import url="common/adminSidebar.jsp"></c:import>

    
 
  	

	<div class="row report_body_whole"> <!-- 전체 row content 내부 시작 -->
	  	<div class="col-sm-12 col-md-1 col-lg-1 col-xs-12 d-none d-lg-block"></div> <!-- 사이드바 사이 거리 주기 -->
	  
	    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12"> <!-- 첫번째 단 -->
		    <br>
		    <h2>Recent Report</h2>
		    <br>
		    <input class="form-control admin_group_search col-sm-12 col-xs-8" id="myInput" type="text" placeholder="Search.."> <!-- search -->
		    <br>
	    
	    
		<table class="table table-bordered table-hover text-center">
			<thead class="thead-dark">
		        <tr>
		          <th>신고자</th>
		          <th>피신고자</th>
		          <th>신고타입</th>
		          <th colspan="4">신고내용</th>         
		          <th>신고 삭제</th> 
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
    
    <div class=" col-md-2 col-lg-1 d-none d-sm-block">
    	<div class="">
    	
    	</div>
    
    </div>
   
    
    
   
    <!-- top 5 신고 시작 -->
 	<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
	    <h2>Blacklist M</h2>
	    <div class="float-right"><i class="fas fa-sync" style="color: tomato"></i> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> 
	    
	    <br>
	    <table class="table table-hover ">
	      <thead class="thead-light table-primary">
	        <tr >
	          <th>누적순위</th>
	          <th>계정명</th>
	          <th>신고횟수</th>
	          <th>관리</th>
	          
	        </tr>
	      </thead>
	      <tbody id="myTable">
	        <tr>
	          <td>t</td>
	          <td>t</td>
	          <td>t</td>
	          <td><button type="button" data-target="#myModal" data-toggle="modal" data-id="${accuse.targetMember}" class="btn btn-outline-info btn-sm identifyingClass">관리</button></td>
	        </tr>
	    
	
	      </tbody>
	    </table>
	    <br>
	    <h2>Blacklist G </h2>
	    
	    
	    <div class="float-right"><i class="fas fa-sync" style="color: tomato"></i> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> 
	    
	    
	    <br>
	    <table class="table table-hover ">
	      <thead class="thead-light table-primary">
	        <tr >
	          <th>누적순위</th>
	          <th>그룹명</th>
	          <th>신고횟수</th>
	          <th>관리</th>
	          
	        </tr>
	      </thead>
	      <tbody id="myTable">
	        <tr>
	          <td>t</td>
	          <td>t</td>
	          <td>t</td>
	          <td><button type="button" class="btn btn-outline-info btn-sm">관리</button></td>
	        </tr>
	        <tr>
	          <td>t</td>
	          <td>t</td>
	          <td>t</td>
	       	  <td><button type="button" class="btn btn-outline-info btn-sm">관리</button></td>
	        </tr>
	    
	
	      </tbody>
	   	 </table>
	    
	    
    </div><!-- 두번째 단 end -->
 
  </div> <!-- row end -->

</div><!-- row content end-->
</div>














<div class="modal fade" id="myModal">
    <div class="modal-dialog ">
      <div class="modal-content">
      
   		<div class="modal-body">
        <div class="tabbable"> <!-- Only required for left/right tabs -->
         <div class="btn-group ">
        	<ul class="nav nav-tabs">
			    <li><button type="button" class="btn btn-outline-light active" a href="#tab1" data-toggle="tab">Member Info</button></li>
			    <li><button type="button" class="btn btn-outline-light" a href="#tab2" data-toggle="tab">Report Bin</button></li>
			    <li><button type="button" class="btn btn-outline-light" a href="#tab3" data-toggle="tab">Message</button></li>
		   </ul>
		  </div> 
		   
        <div class="tab-content">
	        <div class="tab-pane active" id="tab1">
	        	<div class="hiddennn"></div>
	        </div>
	        
	        
	        
	        <div class="tab-pane" id="tab2">
	        	<div  class="container-fluid">
	        	<div class="row">
	        	   <table class="table table-hover table-sm">	        	   
			      	<thead class="thead-light">
			        <tr>
			          <th>신고내용</th>
			          <th>신고자</th>
			          <th>신고날짜</th>			     			          
			        </tr>
			      </thead>
			      <tbody id="myTable" class="input_accuse_list">
			       
			        
			      </tbody>
			    </table>
	        </div>
	        </div>
	        </div>
	        <div class="tab-pane" id="tab3">
			    <form action="${pageContext.request.contextPath}/sendMessage.ad" method="get">
		          <div class="form-group">
		            <label for="recipient-name" class="col-form-label">Recipient:</label>
		            <input type="text" class="form-control" id="recipientName" name="email">
		          </div>
		          <div class="form-group">
		            <label for="message-text" class="col-form-label">Message:</label>
		            <textarea class="form-control" id="messageText" name="messageText">귀하는 신고가 누적되어 회원 자격이 박탈당했습니다.</textarea>
		          </div>
		          <div class="text-center">
		        <button type="submit" class="btn btn-success">Send message</button>
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
	$(".identifyingClass").click(function () {
		var id = $(this).data('id');
	        	
	        $.ajax({
	            url: "${pageContext.request.contextPath}/mrDetail.ad",
	            type:'get',
	            data: {id:id},
	            dataType:"json",
	            success:function(data){	
	            	
		            $(".hiddennn").text(data[0].memberEmail);
		            $("#recipientName").val(data[0].memberEmail);
		            console.log(data[1].length);
		            
		            for(var i in data[1]){
		            	console.log(i);
		            	var str ='<tr>'+
								'<td>'+data[1][i].content+'</td>' +
 								' <td>'+data[1][i].targetMember+'</td>' +
 								' <td>'+data[1][i].accuseDate+'</td>' +
								' </tr>';
		            	 $('.input_accuse_list').append(str);
		            }
	              
	            }
	        });
	        	
	            
	           
	});
	    
	
	
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
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