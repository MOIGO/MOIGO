<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<title>대시보드</title>

<script type="text/javascript"	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawWeeklyMemberEnrollChart);
      google.charts.setOnLoadCallback(drawWeeklyGroupMakeChart);
      google.charts.setOnLoadCallback(drawMemberEnrollPerMonthChart);
      google.charts.setOnLoadCallback(drawGroupEnrollPerMonthChart);

      function drawWeeklyMemberEnrollChart() {
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Day');
          data.addColumn('number', 'Member');

          
          data.addRows([
            ['${weeklyMemEnroll[0].enrollD}', ${weeklyMemEnroll[0].countWmember}],   
            ['${weeklyMemEnroll[1].enrollD}', ${weeklyMemEnroll[1].countWmember}],  
            ['${weeklyMemEnroll[2].enrollD}', ${weeklyMemEnroll[2].countWmember}],  
            ['${weeklyMemEnroll[3].enrollD}', ${weeklyMemEnroll[3].countWmember}],  
            ['${weeklyMemEnroll[4].enrollD}', ${weeklyMemEnroll[4].countWmember}],  
            ['${weeklyMemEnroll[5].enrollD}', ${weeklyMemEnroll[5].countWmember}],
            ['${weeklyMemEnroll[6].enrollD}', ${weeklyMemEnroll[6].countWmember}]
          ]);

          var options = {
        	'title':'A Week\'s Change of New Member',
  			titleTextStyle:{
  			fontName:'Poppins',
  			fontSize: 23
  			},
  			legend: 'none',
  		
  			fontSize :11,
  			fontName:'Poppins',	           
            hAxis: {
              title: 'Date'
            },
            vAxis: {
              title: 'Number'
            },
        	backgroundColor :'transparent',
            width:600,
            height:400
            
          };

          var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
          chart.draw(data, options);
        }
      
      function drawWeeklyGroupMakeChart() {
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Day');
          data.addColumn('number', 'Group');

          
          data.addRows([
            ['${weeklyGrpMake[0].enrollD}', ${weeklyGrpMake[0].countWgroup}],   
            ['${weeklyGrpMake[1].enrollD}', ${weeklyGrpMake[1].countWgroup}],  
            ['${weeklyGrpMake[2].enrollD}', ${weeklyGrpMake[2].countWgroup}],  
            ['${weeklyGrpMake[3].enrollD}', ${weeklyGrpMake[3].countWgroup}],  
            ['${weeklyGrpMake[4].enrollD}', ${weeklyGrpMake[4].countWgroup}],  
            ['${weeklyGrpMake[5].enrollD}', ${weeklyGrpMake[5].countWgroup}],
            ['${weeklyGrpMake[6].enrollD}', ${weeklyGrpMake[6].countWgroup}]
          ]);

          var options = {
        		  
          
        	'title':'A Week\'s Change of New Group',
  			titleTextStyle:{
  			fontName:'Poppins',
  			fontSize: 23
  			},
  			legend: 'none',
  			fontSize :11,
  			fontName:'Poppins',	           
            hAxis: {
              title: 'Date'
            },
            vAxis: {
              title: 'Number'
            },
        	backgroundColor :'transparent',
            width:600,
            height:400
            
          };

          var chart = new google.visualization.LineChart(document.getElementById('chart_div2'));
          chart.draw(data, options);
        }
      
      function drawMemberEnrollPerMonthChart() {
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Day');
          data.addColumn('number', 'Group');

          
          data.addRows([
            ['${MemEnrollperMonth[0].enrollM}', ${MemEnrollperMonth[0].mmCount}],   
            ['${MemEnrollperMonth[1].enrollM}', ${MemEnrollperMonth[1].mmCount}],  
            ['${MemEnrollperMonth[2].enrollM}', ${MemEnrollperMonth[2].mmCount}],
            ['${MemEnrollperMonth[3].enrollM}', ${MemEnrollperMonth[3].mmCount}],
            ['${MemEnrollperMonth[4].enrollM}', ${MemEnrollperMonth[4].mmCount}]
          ]);

          var options = {
        		  
          
        	'title':'New Member per Month',
  			titleTextStyle:{
  			fontName:'Poppins',
  			fontSize: 23
  			},
  			legend: 'none',
  			fontSize :11,
  			fontName:'Poppins',	           
            hAxis: {
              title: 'Month'
            },
            vAxis: {
              title: 'Number'
            },
        	backgroundColor :'transparent',
            width:600,
            height:400
            
          };

          var chart = new google.visualization.LineChart(document.getElementById('chart_div3'));
          chart.draw(data, options);
        }
      function drawGroupEnrollPerMonthChart() {
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Day');
          data.addColumn('number', 'Group');

          
          data.addRows([
            ['${GrpEnrollperMonth[0].enrollM}', ${GrpEnrollperMonth[0].grCount}],   
            ['${GrpEnrollperMonth[1].enrollM}', ${GrpEnrollperMonth[1].grCount}],  
            ['${GrpEnrollperMonth[2].enrollM}', ${GrpEnrollperMonth[2].grCount}],
            ['${GrpEnrollperMonth[3].enrollM}', ${GrpEnrollperMonth[3].grCount}],
            ['${GrpEnrollperMonth[4].enrollM}', ${GrpEnrollperMonth[4].grCount}]

          ]);

          var options = {
        		  
          
        	'title':'New Group per Month',
  			titleTextStyle:{
  			fontName:'Poppins',
  			fontSize: 23
  			},
  			legend: 'none',
  			fontSize :11,
  			fontName:'Poppins',	           
            hAxis: {
              title: 'Month'
            },
            vAxis: {
              title: 'Number'
            },
        	backgroundColor :'transparent',
            width:650,
            height:400
            
          };

          var chart = new google.visualization.LineChart(document.getElementById('chart_div4'));
          chart.draw(data, options);
        }
      
</script>      
<style type="text/css">
	.well{
		margin: 0 auto;
		text-align: center;
	}

</style>
</head>
<body>
	<c:import url="common/reportModal.jsp"></c:import>
	<c:import url="common/adminSidebar.jsp"></c:import>
    
    <div class="col-sm-12 body_background">
    <br>
			<div class="row">
			<div class="col-lg-1"></div>
			<div class="card text-white bg-warning mb-3 text-center"
				style="min-width: 18rem;">
				<div class="card-header">오늘의 가입자</div>
				<div class="card-body">
					<h1 class="card-title">${memberDashCount[0].todayMember}</h1>			
				</div>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="card text-white bg-success mb-3 text-center" style="min-width: 18rem;">
				<div class="card-header">오늘의 생성그룹</div>
				<div class="card-body">
					<h1 class="card-title">${groupDashCount[0].todayGroup}</h1>
				</div>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="card bg-light mb-3 text-center" style="min-width: 18rem;">
				<div class="card-header">전체 가입자</div>
				<div class="card-body">
					<h1 class="card-title">${memberDashCount[0].totalMember}</h1>
					
				</div>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="card text-white bg-dark mb-3 text-center" style="min-width: 18rem;">
				<div class="card-header">전체그룹</div>
				<div class="card-body">
					<h1 class="card-title">${groupDashCount[0].totalGroup}</h1>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-lg-6" id="chart_div"><!--  for bar chart --></div>
			<div class="col-lg-6 " id="chart_div2"><!--  for bar chart --></div>

		</div>
		<div class="row">
			<div class="col-lg-6" id="chart_div3"><!--  for bar chart --></div>
			<div class="col-lg-6 " id="chart_div4"><!--  for bar chart --></div>

		</div>
		<div class="row">
			<div class="col-sm-6" id="dBoardtable1">
				<!--Div that will hold the pie chart-->


			</div>
			<div class="col-sm-6 " id="dBoardtable2"></div>

		</div>
		
		
		
		
		
	</div>  
	
	
  </div>
</div>


</body>
</html>