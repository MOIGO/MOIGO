<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>

<%-- 
<script src="${root}/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${root}/resources/css/bootstrap/bootstrap.min.css"> 
<script src="${root}/resources/js/bootstrap/bootstrap.min.js" ></script>	
<link rel="stylesheet" href="${root}/resources/css/common/fonts.css" > 
--%>

<style>

</style>

</head>

<body>
<div class="col-2 d-none d-lg-block">
     	<div class="card" style="width: 18rem;">
		  <div class="card-header">
		    	다가오는 일정   <span id="moreSchedule" style="float:right;cursor:pointer">더보기</span>
		  </div>
		  <ul class="list-group list-group-flush" id="closeSchedule">
		    
		  </ul>
		</div>
</div>
 
 <c:out value="${memberGrade}"/>
</body>

<script>

	$('#moreSchedule').on('click',function(){
		
		
		
		if('${memberGrade>=1}'=="true")
			$("#groupNoForm").attr("action", "${root}/groups/groupSchedule.gp").submit();
		else
			alert("회원 전용 메뉴입니다.");   
	});

	function makeCloseSchedule(obj){
		
		console.log(obj);
	var $item = $('<li class="list-group-item" style="cursor:pointer"></li>');	
	var $dot = $('<i class="fas fa-circle"></i>').css("color",obj.colorLabel);
	$item.append($dot);
	
	var $span= $('<span class="ml-2">');
	var $title =$('<div class="ml-2">').text(obj.scheduleName);
	var date = milisecToDate(obj.startTime);
	
	$item.on("click",function(){
		
		if('${memberGrade>=1}'=="true")
			openScheduleViewModal(obj.scheduleNo);
		else
			alert("회원 전용 메뉴입니다.");
	});
	
	$span.text(getTimeToString(date));
	
	//getDayToKor(milisecToDate(obj.startTime).getDay()
	
	$item.append($span);
	$item.append($title);
	
		 $('#closeSchedule').append($item);
	
		
	}

	$(function(){
		
		$.ajax({
			url:'${root}/groups/selectCloseScheduleList.gp',
			data:{groupNo:'${param.groupNo}'},
			success:function(data){
				console.log(data);
				
				for(var i =0;i<data.schedules.length;++i){
					
					
					if(i>3)
						break;
					
					makeCloseSchedule(data.schedules[i]);
					
					
					
				}
				
			},error:function(data){
				
			}
			
			
		});
		
		
		
	});

</script>

</html>

