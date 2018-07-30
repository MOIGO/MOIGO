<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<link rel="stylesheet" href="${root}/resources/css/schedule/fullcalendar.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" >
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="${root}/resources/js/schedule/fullcalendar.min.js" ></script>
<script src="${root}/resources/js/schedule/gcal.min.js" ></script>
<script src="${root}/resources/js/schedule/locale-all.js" ></script>
<style>

   body{
      background: #EDEFF2;
   }
   
   .card, .card-header{
   		background:white;
   }
   
	.group_tit {
		float : left;
		margin-bottom: 0px;
		font-family: 'nanum-barun-gothic-bold', sans-serif;
		font-size: 1.3em;
	}

	.group_tit:hover {
	cursor: default;
	}
	
	#insertScheduleBtn {
		float: right;
		margin-bottom: 0px;
	}
	
	#calendar {
		padding:0px 15px 15px 15px;
	}
   
   .fc-header-toolbar{
   		margin-top: 15px !important;
   		margin-bottom: 10px !important;
   }
   
   .fc-bg .custom-border{
         height : 100% !important;
         border: 2px solid #00BFFF !important;
   }
   
   .fc td, .fc th{
        border-style: none !important;
        border-bottom-width: 1px !important;
        border-bottom-style: solid !important;
   }
   
   .fa-chevron-left, .fa-chevron-right{
        color: darkgray;
   }
   
   .btn:focus, .btn:active:focus, .btn.active:focus {
   		box-shadow: none !important;
   		outline: none !important;
	}
	
	.fc-list-item-time, .fc-list-item-marker, .fc-list-item-title, .table-active{
		border-color: #DDD;
	}
    
</style>
<title>일정</title>
</head>
<body>
	<c:import url="/WEB-INF/views/groups/mapModal.jsp" />
	<c:import url="/WEB-INF/views/groups/scheduleModal.jsp" >
		<c:param name="groupNo" value="${param.groupNo}" />
		<c:param name="memberNo" value="${m.memberNo}" />
	</c:import>

<div class="container">
   <div class="row">
     
     <c:import url="/WEB-INF/views/groups/leftAside.jsp"/>
     
     <div class="col-7">
        <div class="card">
           <div class="card-header" >           
              <p class="group_tit">일정</p>
              <!-- toggleScheduleModal(); editSchedule(undefined, 'S010');-->
              <button type="button" id="insertScheduleBtn" class="btn btn-primary btn-sm" onclick="toggleScheduleModal();">일정만들기</button>
           </div>
           <div class="card-body" id="calendar">
           </div>
        </div>
     </div>
     
     <c:import url="/WEB-INF/views/groups/rightAside.jsp"/>
    
   </div>
</div>

<script>

   function customCalendar() {
      // location of sort date header
         $(".fc-day-header").css({
            "padding-top" : "5px",
            "padding-bottom" : "5px",
            "text-align" : "left",
         });
         
         // 요일 header에서 요일이 적혀있는 span을 찾아서 css 적용
         $(".fc-day-header").find("span").css({
        	 "margin-left" : "5px",
        	 "font-family" : "'nanum-barun-gothic-bold', sans-serif"
       	 });
         
         // 달력의 숫자 위치를 정렬하는 부분
         $(".fc-day-number").css({
            "float" : "left",
            "font-family" : "'nanum-barun-gothic-bold', sans-serif",
            "padding-left" : "5px"
         });
         
         // 토요일과 일요일의 색을 변경
         $(".fc-sat").css("color", "#007bff");
         $(".fc-sun").css("color", "#dc3545");
         
         // header에 가운데에 있는 h2태그에 클래스를 추가
         $(".fc-center").find("h2").addClass("full-title");
          
         // 추가한 클래스에 커스텀 스타일을 적용
         $(".full-title").css({
             "margin-left" : "7px",
             "margin-right" : "7px",
              "font-size" : "1.6em",
              "font-family" : "'nanum-barun-gothic-bold', sans-serif",
              "vertical-align" : "middle",
              "cursor" : "pointer",
              "display" : "inline-block"
          });
         
         $(".full-title").click(function() {
			alert("얍");
		});
         
        // 오늘 날짜에 걸려있는 bootstrap 스타일의 클래스를 제거 
        $(".fc-today").removeClass("alert-info");
       
        $(".fc-today-button").removeClass("btn-primary");
        $(".fc-today-button").addClass("btn-outline-primary");
        
        $(".fc-month-button").removeClass("btn-primary");
        $(".fc-month-button").addClass("btn-outline-dark");
        
        $(".fc-listMonth-button").removeClass("btn-primary");
        $(".fc-listMonth-button").addClass("btn-outline-dark");
        
        $(".fc-prev-button").removeClass("btn-primary");
        $(".fc-next-button").removeClass("btn-primary");
       
        $(".fc-next-button").css({
           "background" : "white",
           "font-size" : "1.5em",
           "padding" : "0px",
           "height" : "1.5em"
        });
        
        $(".fc-prev-button").css({
           "background" : "white",
           "font-size" : "1.5em",
           "padding" : "0px",
           "height" : "1.5em"
        });
        
        
        $(".fc-bg").find(".fc-today").append("<div class='custom-border'/>");
     
   }

   $(function() {
      // fullcalendar를 적용시켜주는 메소드
      $('#calendar').fullCalendar({
         
         // fullcalendar의 header 부분의 구성을 설정
         header : {
            left : "today",
            center : "prev,title,next",
            right : "month,listMonth"
         },
         
         // fullcalendar의 테마를 bootstrap4로 지정
        themeSystem : 'bootstrap4',
         
         // bootstrap4로 지정했을 경우 아이콘을 사용 부분
         bootstrapFontAwesome : {
            prev : "fa-chevron-left",
            next : "fa-chevron-right"
         },
         
         // fullcalendar의 시작 요일을 '월'요일로 지정
         firstDay : 1,
         
         // fullcalendar의 메인 언어를 설정
         locale:"ko",
         
         // fullcalendar의 size를 지정
         height : 800,
         
         // fullcalendar가 다음 달 두번째 주까지 보여주던 기능을 사용하지 않음
         fixedWeekCount : false,
         
         // 공휴일을 가져오기 위해서 구글의 calendar를 연동할 때 필요한 ApiKey
         googleCalendarApiKey : "AIzaSyAam0_4FBr7PhEoIkBna7pmnl7IF_sQfCo",
         
         // 공휴일을 가져오기 위한 event
          events : {
            googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com", 
            className : "ko-holidays",
            color : "#F23F2B",
            textColor : "white"
         },
         
         eventClick:function(event) {
                if(event.url) {
                    alert(event.title + "\n" + event.url, "width=700,height=600");
                    return false;
                }
            }
      });
      
      customCalendar();
      
      $('.fc-prev-button').on("click", function(){
    	  customCalendar();
      });
   
      $('.fc-next-button').on("click", function(){
    	  customCalendar();
      });
      
      $('.fc-today-button').on("click", function(){
    	  customCalendar();
      });
      
      $('.fc-month-button').on("click", function(){
    	  customCalendar();
      });
      
   });
   
</script>
</body>
</html>