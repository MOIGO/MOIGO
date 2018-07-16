<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style type="text/css">
	.well{
		margin: 0 auto;
		text-align: center;
	}

</style>
</head>
<body>
	<c:import url="common/adminSidebar.jsp"></c:import>
    
    <div class="col-sm-9 body_background">
    <br>
      <div class="well">
        <h4>TODAY</h4>
        <p>${serverTime}</p>
      </div>
      
      
      <div class="row">
      	 <div class="card-deck">
      	 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
		       <div class="card bg-warning">
		     	   <h4 class="card-title text-center">Card title</h4>
			      <div class="card-body text-center">
			        <p class="card-text">Some text inside the second card</p>
			      </div>
		    </div>
		    <div class="card bg-success">
		   		  <h4 class="card-title text-center">Card title</h4>
			      <div class="card-body text-center">
			        <p class="card-text">Some text inside the third card</p>
			      </div>
		    </div>
		    <div class="card bg-danger">
		   		  <h4 class="card-title text-center">Card title</h4>
			      <div class="card-body text-center">
			        <p class="card-text">Some text inside the fourth card</p>
			      </div>
		    </div>  
		    </div>
      
      </div>
      
      
      <div class="row">
        <div class="col-sm-5">
           <!--Div that will hold the pie chart-->
  			  <div id="chart_div"></div>
    
   			
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
<script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Mushrooms', 3],
          ['Onions', 1],
          ['Olives', 1],
          ['Zucchini', 1],
          ['Pepperoni', 2]
        ]);

        // Set chart options
        var options = {'legend':'none','title':'How Much Pizza I Ate Last Night',
                       'width':300,
                       'height':500};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        var chart2 = new google.visualization.PieChart(document.getElementById('chart_div2'));
        chart.draw(data, options);
        chart2.draw(data, options);
      }
    </script>
</body>
</html>