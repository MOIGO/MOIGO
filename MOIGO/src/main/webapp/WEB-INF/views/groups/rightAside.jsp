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
<div class="col-2">
     	<div class="card" style="width: 18rem;">
		  <div class="card-header">
		    	다가오는 일정   <span id="moreSchedule" style="float:right;cursor:pointer">더보기</span>
		  </div>
		  <ul class="list-group list-group-flush" id="closeSchedule">
		    
		  </ul>
		</div>
</div>
 
 
</body>

<script>

	$('#moreSchedule').on('click',function(){
		$("#groupNoForm").attr("action", "${root}/groups/groupSchedule.gp").submit();
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
		openScheduleViewModal(obj.scheduleNo);
	});
	
	$span.text(date.getMonth()+"월"+" " +date.getDate()+"일 "+ date.getHours()+":"+date.getMinutes());
	
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

