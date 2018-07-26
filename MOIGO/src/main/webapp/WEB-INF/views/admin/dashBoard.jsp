<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<script type="text/javascript"	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawWeeklyMemberEnrollChart);
      
      function drawWeeklyMemberEnrollChart() {
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Day');
          data.addColumn('number', 'Member');

          
          data.addRows([
            ['0', 0],   
            ['1', 10],  
            ['2', 23],  
            ['3', 17],  
            ['4', 18],  
            ['5', 9],
            ['6', 11]
          ]);

          var options = {
        	'title':'Weekly New Member Count',
  			titleTextStyle:{
  			fontName:'Poppins',
  			fontSize: 23
  			},
  			legend: 'none',
  			backgroundColor :'transparent',
  			fontSize :25,
  			fontName:'Poppins',	           
            hAxis: {
              title: 'Date'
            },
            vAxis: {
              title: 'Number'
            },
            backgroundColor: '#f1f8e9',
            width:600,
            height:400
            
          };

          var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
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
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="card text-white bg-warning mb-3"
				style="max-width: 18rem;">
				<div class="card-header">오늘의 가입자</div>
				<div class="card-body">
					<h5 class="card-title">Warning card title</h5>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
				</div>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="card text-white bg-success mb-3" style="max-width: 18rem;">
				<div class="card-header">오늘의 생성그룹</div>
				<div class="card-body">
					<h5 class="card-title">Info card title</h5>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
				</div>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="card bg-light mb-3" style="max-width: 18rem;">
				<div class="card-header">전체 가입자</div>
				<div class="card-body">
					<h5 class="card-title">Light card title</h5>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
				</div>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="card text-white bg-dark mb-3" style="max-width: 18rem;">
				<div class="card-header">전체그룹</div>
				<div class="card-body">
					<h5 class="card-title">Dark card title</h5>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
				</div>
			</div>
		</div>


		<div class="row">
        <div class="col-sm-5" id="chart_div" >
           <!--Div that will hold the pie chart-->
  			  <div></div>
    
   			
        </div>
        <div class="col-sm-7">
          <div class="well">
             <div id="chart_div2"></div> 
          </div>
        </div>
        
      </div>
      <div class="row">
        <div class="col-sm-8">
          <div class="well">
            <p>Text</p> 
          </div>
        </div>
        <div class="col-sm-4">
          <div class="well">
            <p>Text</p> 
          </div>
        </div>
      </div>
    </div>
    
  </div>
</div>


</body>
</html>