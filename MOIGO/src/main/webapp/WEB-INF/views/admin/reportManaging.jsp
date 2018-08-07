<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<title>신고 관리</title>

<style type="text/css">
div.vertical-line {
	border-left: 4px solid #808080;
	height: 100%;
	margin-left: auto;
	margin-right: auto;
	width: 10px;
}

#modalAccuseList {
	height: 450px;
	width: 100%;
	overflow: scroll;
}

input[type="checkbox"] {
	height: 18px;
	width: 18px;
}

.form-check {
	margin: auto auto;
}
</style>
</head>
<body>
	<c:import url="common/adminSidebar.jsp"></c:import> <!-- 사이드바 넣기 -->

	<div class="row report_body_whole"> <!-- 전체 row content 내부 시작 -->
	  	<!-- <div class="col-sm-12 col-md-1 col-lg-1 col-xs-12 d-none d-lg-block"></div> --> <!-- 사이드바 사이 거리 주기 -->
	  
	    <div class="col-lg-7 col-md-12 col-sm-12 col-xs-12"> <!-- 첫번째 단 -->
		    <br>
		    <h2>Recent Report</h2>
		    <br>
		      <form action="${pageContext.request.contextPath}/adminReport.ad" method="get">
		   
		    
		   
		    <div class="row">
		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <select class="col-sm-2 col-xs-2" name="searchOption">		    
			    <option>content</option>
			    <option>reporter</option>
			    <option>target</option>  
		    </select>
		    <input class="admin_group_search col-sm-4 col-xs-4" id="reportSearchingKeyword" name="reportSearchingKeyword" type="text" placeholder="Search.." value="${pi.searchingKey}"> 
		    <button type="submit" class="btn btn-outline-info">검색</button>&nbsp;&nbsp;
		    <br>
		    <div class="form-check text-right">		  
						<input class="form-check-input" type="checkbox" name="reportSearchingConstraint" id="reportSearchingConstraint" value="true" > 
						<label class="form-check-label" for="reportSearchingConstraint"> &nbsp;&nbsp;not including processed reports</label>
			</div>
		    </div>
		     <div class="form-check text-right text-info">		  
						${listCount} 개가 검색되었습니다.
			</div>
		    </form>
		    <br>
	    
	    
		<table class="table table-bordered table-hover text-center table-sm">
			<thead class="thead-dark">
		        <tr>
		          <th>REPORTER</th>
		          <th>TARGET</th>
		          <th>TYPE</th>
		          <th colspan="4">CONTENT</th>         
		          <th>DATE</th>         
		        
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
				        <td colspan="4">${accuse.accuseDate}</td>
	        		</tr>      
	      		</tbody>
			</c:forEach>
		</table>
   <!-- 페이징 처리할 부분 -->
		<!-- <br><br><br><br><br> -->

		<div class="pagingArea" align="center">
			<ul class="pagination justify-content-center">
				 <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/adminReport.ad?currentPage=1&reportSearchingKeyword=${pi.searchingKey}&searchOption=${pi.opt}&reportSearchingConstraint=${pi.chk}">&lt;&lt;</a></li>
						<c:if test="${pi.currentPage le 1}">
						<li class="page-item"><a class="page-link">Pre</a></li>
				</c:if><c:if test="${pi.currentPage gt 1}">
					 <li class="page-item">
					 <a class="page-link" href="${pageContext.request.contextPath}/adminReport.ad?currentPage=${pi.currentPage -1}&reportSearchingKeyword=${pi.searchingKey}&searchOption=${pi.opt}&reportSearchingConstraint=${pi.chk}">Pre</a>
					 </li>
				</c:if>
				<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
					<c:if test="${i eq pi.currentPage}">
					<li class="page-item"><a class="page-link">${i}</a></li>
					</c:if>	<c:if test="${i ne pi.currentPage}">
					 		<li class="page-item">
					 		<a class="page-link" href="${pageContext.request.contextPath}/adminReport.ad?currentPage=${i}&reportSearchingKeyword=${pi.searchingKey}&searchOption=${pi.opt}&reportSearchingConstraint=${pi.chk}">${i}</a>
					 		</li>
					</c:if>
				</c:forEach>
				
				
				<c:if test="${pi.currentPage ge pi.maxPage}">
						<li class="page-item"><a class="page-link">Next</a></li>
				</c:if><c:if test="${pi.currentPage lt pi.maxPage}">
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/adminReport.ad?currentPage=${pi.currentPage + 1}&reportSearchingKeyword=${pi.searchingKey}&searchOption=${pi.opt}&reportSearchingConstraint=${pi.chk}">Next</a></li>
				</c:if>
				      <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/adminReport.ad?currentPage=${pi.maxPage}&reportSearchingKeyword=${pi.searchingKey}&searchOption=${pi.opt}&reportSearchingConstraint=${pi.chk}">&gt;&gt;</a></li>
				
			</ul>
		</div>
		
		<br><br>
		
	</div> <!-- 첫번째 단 끝 -->
    
    <div class=" col-md-2 col-lg-1 d-none d-sm-block">
    	<div class="">
    	
    	</div>
    
    </div>
   
    
    	<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12" style="background: white;">
		<div class="card" style="width: 100%;">
			<div class="card-header">
				<ul class="nav nav-tabs card-header-tabs pull-right" id="myTab"
					role="tablist">
					<li class="nav-item"><a class="nav-link active" id="home-tab"
						data-toggle="tab" href="#home" role="tab" aria-controls="home"
						aria-selected="true">BLACKLIST</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="false">CANCEL</a></li>
			
				</ul>
			</div>
			<div class="card-body" >
					<div class="tab-content" id="myTabContent" style="width: 100%;">

						<div class="tab-pane fade show active" id="home" role="tabpanel"
							aria-labelledby="home-tab">
							<div class="row">
								<br>
								<h2>Blacklist M</h2>
								<div class="float-right">
									<i class="fas fa-sync" style="color: tomato"></i>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</div>

								<br>
								<table class="table table-hover ">
									<thead class="thead-light table-primary">
										<tr>
											<th>누적순위</th>
											<th>계정명</th>
											<th>신고횟수</th>
											<th>관리</th>

										</tr>
									</thead>
									<c:forEach items="${mtop5}" var="mblack">
										<tbody id="myMemberTop5Table">


											<tr>
												<td>${mblack.rNum}</td>
												<td>${mblack.memberName}</td>
												<td>${mblack.aCount}</td>
												<td><button type="button" data-target="#myModal"
														data-toggle="modal" data-id="${mblack.targetMember}"
														class="btn btn-outline-info btn-sm identifyingClass">관리</button></td>
											</tr>


										</tbody>
									</c:forEach>
								</table>
								<br>
								<h2>Blacklist G</h2>


								<div class="float-right">
									<i class="fas fa-sync" style="color: tomato"></i>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</div>


								<br>
								<table class="table table-hover ">
									<thead class="thead-light table-primary">
										<tr>
											<th>누적순위</th>
											<th>그룹명</th>
											<th>신고횟수</th>
											<th>관리</th>

										</tr>
									</thead>
									<c:forEach items="${gtop5}" var="gblack">
										<tbody id="myGroupTop5Table">


											<tr>
												<td>${gblack.rNum}</td>
												<td>${gblack.targetGroup}</td>
												<td>${gblack.aCount}</td>
												<td><button type="button" data-target="#myGroupModal"
														data-toggle="modal" data-id="${gblack.targetGroup}"
														class="btn btn-outline-info btn-sm identifyingClass2">관리</button></td>
											</tr>
									</c:forEach>
								</table>
							</div>
						</div>

						<div class="tab-pane fade" id="profile" role="tabpanel">
							<div class="row">
								<br>
								<h2>삭제된 회원 관리</h2>
								<div class="float-right">
									<i class="fas fa-sync" style="color: tomato"></i>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</div>

								<br>
								<table class="table table-hover ">
									<thead class="thead-light table-primary">
										<tr>
											<th>계정번호</th>
											<th>계정명</th>
											<th>신고횟수</th>
											<th>관리</th>

										</tr>
									</thead>
									<c:forEach items="${deleteM}" var="deleteM">
										<tbody id="myMemberTop5Table">


											<tr>
												<td>${deleteM.targetMember}</td>
												<td>${deleteM.memberName}</td>
												<td>${deleteM.aCount}</td>
												<td><button type="button" data-target="#myModal"
														data-toggle="modal" data-id="${deleteM.targetMember}"
														class="btn btn-outline-info btn-sm identifyingClass">복원</button></td>
											</tr>


										</tbody>
									</c:forEach>
								</table>
								<br>
								<h2>비활성화된 그룹 관리</h2>


								<div class="float-right">
									<i class="fas fa-sync" style="color: tomato"></i>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</div>


								<br>
								<table class="table table-hover ">
									<thead class="thead-light table-primary">
										<tr>
											<th>그룹번호</th>
											<th>그룹명</th>
											<th>신고횟수</th>
											<th>관리</th>

										</tr>
									</thead>
									<c:forEach items="${inactiveG}" var="inactiveG">
										<tbody id="myGroupTop5Table">


											<tr>
												<td>${inactiveG.targetGroup}</td>
												<td>${inactiveG.groupName}</td>
												<td>${inactiveG.aCount}</td>
												<td><button type="button" data-target="#myGroupModal"
														data-toggle="modal" data-id="${inactiveG.targetGroup}"
														class="btn btn-outline-info btn-sm identifyingClass2">복원</button></td>
											</tr>
									</c:forEach>
								</table>
							</div>
						</div>

					</div>
				</div>
		</div>
	</div>
   
    
	    
	    
    
 
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
								<br>
								<form action="" method="get">
									<fieldset class="form-group">
										<legend> 회원 정보 </legend>
										<div class="form-group row">
											<label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
											<div class="col-sm-10">
												<input type="email" class="form-control" id="inputEmail3"
													readonly>
											</div>
										</div>
										<div class="form-group row">
											<label for="inputName" class="col-sm-2 col-form-label">Name</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="inputName"
													readonly>
											</div>
										</div>
										<div class="form-group row">
											<label for="inputAddress" class="col-sm-2 col-form-label">Address</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="inputAddress"
													readonly>
											</div>
										</div>
										<div class="form-group row">
											<label for="inputBirth" class="col-sm-2 col-form-label">BirthD</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="inputBirth"
													readonly>
											</div>
										</div>
										<div class="form-group row">
											<label for="inputEnrollDate" class="col-sm-2 col-form-label">EnrollD</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="inputEnrollDate"
													readonly>
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
								<div class="form-group row">
									<div class="col-sm-12  text-center memDelCancelSubmit">
										<%-- <c:choose>
											<c:when test="$(#inputGsc).val()=='S1'">
												<button type="submit" id="memDelSubmit" class="btn btn-outline-info">
												회원 탈퇴</button>
											</c:when>
											<c:otherwise>
												<button type="submit" id="memDelCancelSubmit" class="btn btn-outline-info">
													회원 탈퇴 취소</button>
											</c:otherwise>
											</c:choose> --%>
										</div>
								</div>
							</div>



							<div class="tab-pane" id="tab2">
								<div class="container-fluid">
									<div class="row">
										<div id="modalAccuseList">
										 <input class=" form-control col-sm-12 col-xs-8" id="mAccuseInput" type="text" placeholder="Search.."> <!-- search -->
											<table class="table table-hover table-sm text-center">
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
							<div class="tab-pane" id="tab3">
								<form action="" method="post">
									<div class="form-group">
										<label for="recipient-name" class="col-form-label">Recipient:</label>
										<input type="text" class="form-control" id="recipientName1"
											name="email">
									</div>
									<div class="form-group">
										<label for="message-text" class="col-form-label">Message:</label>
										<textarea class="form-control" id="messageText1"
											name="messageText">귀하는 신고가 누적되어 회원 자격이 박탈당했습니다. 자세한 설명을 듣고 싶다면 본 메일로 문의하십시오</textarea>
									</div>
									<div class="text-center">
										<button type="button" id="mailSend2" class="btn btn-outline-success">Send
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




<div class="modal fade" id="myGroupModal">
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
								<li><button type="button" class="btn btn-outline-light" 
										a href="#tab5" data-toggle="tab">Report Bin</button></li>
								<li><button type="button" class="btn btn-outline-light" 
										a href="#tab6" data-toggle="tab">Message</button></li>
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
														id="inputPost" readonly>
												</div>
											</div>
											<div class="col-sm-5">
												<label class="sr-only" for="inlineFormInputReply">Reply</label>
												<div class="input-group">
													<div class="input-group-prepend">
														<div class="input-group-text">Reply</div>
													</div>
													<input type="text" class="form-control"
														id="inputReply" readonly>
												</div>
											</div>
										</div>
									</fieldset>
										
									<div class="form-group row">
										<div class="col-sm-12  text-center grpDelCancelSubmit">
										<%-- <c:choose>
											<c:when test="$(#inputGsc).val()!='S2'">
												<button type="submit" id="grpDelSubmit" class="btn btn-outline-info">
												그룹 블라인드</button>
											</c:when>
											<c:otherwise>
												<button type="submit" id="grpDelCancelSubmit" class="btn btn-outline-info">
													그룹 블라인드 취소</button>
											</c:otherwise>
										</c:choose> --%>
										
											
											
										</div>
									</div>
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
								<form action="" method="post">
									<div class="form-group">
										<label for="recipient-name" class="col-form-label">Recipient:</label>
										<input type="text" class="form-control" id="masterEmail"
											name="email">
									</div>
									<div class="form-group">
										<label for="message-text" class="col-form-label">Message:</label>
										<textarea class="form-control" id="messageTextToMaster"
											name="messageText2"></textarea>
									</div>
									<div class="text-center">
										<button type="button" id="mailSend" class="btn btn-outline-success">Send
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
		            
		            $("#recipientName1").val(data[0].memberEmail);
		            console.log(data[1].length);
		            
		            console.log(data[0].delflag);
		            $('.memDelCancelSubmit').empty();
					if(data[0].delflag!='Y'){
						 var strDel='<button type="submit" id="memDelSubmit" class="btn btn-outline-info">회원 탈퇴</button>';					
					}else{
						var strDel='<button type="submit" id="memDelCancelSubmit" class="btn btn-outline-info">회원 탈퇴 취소</button>';	
					}
					$('.memDelCancelSubmit').append(strDel);
					
		            
		            
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
		            
		            $("#mailSend2").click(function() {
					       
			       	 	 var userEmail= $("#recipientName1").val();
			       	     var contents = $("#messageText1").val();
			       	     console.log(userEmail+contents);
			       	  	 $.ajax({
			       	            url: "${pageContext.request.contextPath}/sendMessage.ad",
			       	            type:'post',
			       	            data: {userEmail: userEmail, contents: contents} ,
			       	            dataType:"json",
			       	            success:function(data){	
			       	            	alert("성공적으로 메일을 보냈습니다.");
			       	            },error:function(request,status,error){
			       	                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			       	            }
			       	  	  });
		            });	  
		            $("#memDelCancelSubmit").click(function() {
		       	  	 var id =data[0].memberNo;
		       	  	  $.ajax({
		       	            url: "${pageContext.request.contextPath}/memFlagDelete.ad",
		       	            type:'get',
		       	            data: {id:id},
		       	            dataType:"json",
		       	            success:function(data){	
		       	            	alert('회원번호 '+data+' 성공적으로 회원이 복원 되었습니다.');
		       	            	location.reload();	  
		       	            		       	            	
		       	            },error:function(request,status,error){
		       	                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       	            }
		       	  	  });
		            });
		       	  	$("#memDelSubmit").click(function() {
			       	  	 var id =data[0].memberNo;
			       	  	  $.ajax({
			       	            url: "${pageContext.request.contextPath}/memDelete.ad",
			       	            type:'get',
			       	            data: {id:id},
			       	            dataType:"json",
			       	            success:function(data){	
			       	            	alert('회원번호 '+data+' 성공적으로 삭제 되었습니다.');
			       	            	location.reload();	  
			       	            		       	            	
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
						$("#inputAge").val(data[0].minAge+"~"+data[0].maxAge);
						$("#inputPost").val(data[0].postCount);
						$("#inputReply").val(data[0].replyCount);
						$("#inputGender").val(data[0].groupGender);
						$("#masterEmail").val(data[0].masterEmail); //모임장
						
			            $("#messageTextToMaster").val("그룹 "+data[0].groupName+" 모임장에게 알립니다. 귀하가 모임장으로 있는 그룹은 많은 신고가 접수되어 확인한 결과 운영방침에 맞지 않다고 판단되어 비가용 처리되었습니다. 문의사항이 있다면 본 메일로 문의하십시오.");
			            console.log(data[0].groupStateCode);
			            $('.grpDelCancelSubmit').empty();
						if(data[0].groupStateCode!='S2'){
							 var strDel='<button type="submit" id="grpDelSubmit" class="btn btn-outline-info">그룹 탈퇴</button>';					
						}else{
							var strDel='<button type="submit" id="grpDelCancelSubmit" class="btn btn-outline-info">그룹 탈퇴 취소</button>';	
						}
						$('.grpDelCancelSubmit').append(strDel);
						
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
			            $("#mailSend").click(function() {
						       
				       	 	 var userEmail= $("#masterEmail").val();
				       	     var contents = $("#messageTextToMaster").val();
				       	     console.log(userEmail+contents);
				       	  	 $.ajax({
				       	            url: "${pageContext.request.contextPath}/sendMessage.ad",
				       	            type:'post',
				       	            data: {userEmail: userEmail, contents: contents} ,
				       	            dataType:"json",
				       	            success:function(data){	
				       	            	alert("성공적으로 메일을 보냈습니다.");
				       	            },error:function(request,status,error){
				       	                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				       	            }
				       	  	  });
			            });	  
			            
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
			            $("#grpDelCancelSubmit").click(function() {
				       	  	 var id =data[0].groupNo;
				       	  	  $.ajax({
				       	            url: "${pageContext.request.contextPath}/grpFlagDelete.ad",
				       	            type:'get',
				       	            data: {id:id},
				       	            dataType:"json",
				       	            success:function(data){	
				       	            	alert('그룹번호 '+data+' 성공적으로 블라인드 처리 취소 되었습니다.');
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

$(document).ready(function(){

	});
	



/*  function adminSideClick(e){
    $('.sidenav').toggle('slow');
    $('.body_background').toggleClass('extended-panel');

  }*/
</script>


</body>
</html>