<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<!--Load the AJAX API-->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawGenderChart);
      
      // Set a callback to run when the Google Visualization API is loaded
      google.charts.setOnLoadCallback(drawAddressChart);
      
      
      // Set a callback to run when the Google Visualization API is loaded
      google.charts.setOnLoadCallback(drawMinterestChart);
      
      // Set a callback to run when the Google Visualization API is loaded
      google.charts.setOnLoadCallback(drawGinterestChart);
      
      // Set a callback to run when the Google Visualization API is loaded
     // google.charts.setOnLoadCallback(drawGgradeChart);
      
  
      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawGenderChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Gender');
        data.addColumn('number', 'percent');
        data.addRows([
       	 ['Male', ${genderCount[0].genderCount}],
            ['Female', ${genderCount[1].genderCount}],
       
       ]);

        // Set chart options
        var options = {'title':'Member Gender Rate',
        				titleTextStyle:{
        					fontName:'Poppins',
        					fontSize: 27
        			  	},
        
        				backgroundColor :'#edecea',
        				fontSize :25,
        				fontName:'Poppins',
        				legend: 'none',
              			pieSliceText: 'label',        
                       'width':400,
                       'height':400,
                       sliceVisibilityThreshold: .2,
                       slices: {
                           0: { color: '#add8e6' },
                           1: { color: '#d6ddf2' }
                         },
				        pieSliceTextStyle: {
				            color: '#344c41',
				          },
        };

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
      
      
      
      
      function drawAddressChart() {

          // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Address');
          data.addColumn('number', 'percent');
          data.addRows([
        	  
          	 ['${addressCount[0].metrocity}', ${addressCount[0].addressCount}],
             ['${addressCount[1].metrocity}', ${addressCount[1].addressCount}],
             ['${addressCount[2].metrocity}', ${addressCount[2].addressCount}],
             ['${addressCount[3].metrocity}', ${addressCount[3].addressCount}],
             ['${addressCount[4].metrocity}', ${addressCount[4].addressCount}],
             ['${addressCount[5].metrocity}', ${addressCount[5].addressCount}],
             ['${addressCount[6].metrocity}', ${addressCount[6].addressCount}],
             ['${addressCount[7].metrocity}', ${addressCount[7].addressCount}]
             
          ]);

          // Set chart options
          var options = {'title':'Member Address Rate',
          				titleTextStyle:{
          					fontName:'Poppins',
          					fontSize: 27
          			  	},
          				backgroundColor :'#edecea',
          				fontSize :20,
          				fontName:'Poppins',
          				legend: 'none',
                			pieSliceText: 'label',        
                         'width':400,
                         'height':400,
                         sliceVisibilityThreshold: .05,
                         slices: {
                             0: { color: '#add8e6' },
                             1: { color: '#d6ddf2' },
                             2: { color: '#e6d7ad' },
                           },
  				        pieSliceTextStyle: {
  				            color: '#344c41',
  				          },
          };

          // Instantiate and draw our chart, passing in some options.
          var chart = new google.visualization.PieChart(document.getElementById('chart_div2'));
          chart.draw(data, options);
        }
      
      function drawMinterestChart() {

          // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Gender');
          data.addColumn('number', 'percent');
          data.addRows([
        	  ['${minterestCount[0].bigInterest}', ${minterestCount[0].minterestCount}],
              ['${minterestCount[1].bigInterest}', ${minterestCount[1].minterestCount}],
              ['${minterestCount[2].bigInterest}', ${minterestCount[2].minterestCount}],
              ['${minterestCount[3].bigInterest}', ${minterestCount[3].minterestCount}],
              ['${minterestCount[4].bigInterest}', ${minterestCount[4].minterestCount}],
              ['${minterestCount[5].bigInterest}', ${minterestCount[5].minterestCount}],
              ['${minterestCount[6].bigInterest}', ${minterestCount[6].minterestCount}],
              ['${minterestCount[7].bigInterest}', ${minterestCount[7].minterestCount}]
          ]);

          // Set chart options
          var options = {'title':'Member Interest Rate',
          				titleTextStyle:{
          					fontName:'Poppins',
          					fontSize: 27
          			  	},
          
          				backgroundColor :'#edecea',
          				fontSize :15,
          				fontName:'Poppins',
          				legend: 'none',
                		pieSliceText: 'label',        
                         'width':400,
                         'height':400,
                         sliceVisibilityThreshold: .05,
                         slices: {
                             0: { color: '#add8e6' },
                             1: { color: '#d6ddf2' },
                             2: { color: '#e6d7ad' },
                             3: { color: '#a9cf9b' },
                             4: { color: '#ade6bb' },
                             5: { color: '#d9e6ad' },
                             6: { color: '#d7ade6' },
                             7: { color: '#ade6d7' },
                             7: { color: '#22252e' }
                           },
  				        pieSliceTextStyle: {
  				            color: '#344c41'
  				          }
          };

          // Instantiate and draw our chart, passing in some options.
          var chart = new google.visualization.PieChart(document.getElementById('chart_div3'));
          chart.draw(data, options);
        }
      
      
      
      function drawGinterestChart() {

          // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Interest');
          data.addColumn('number', 'percent');
          data.addRows([
        	  
          	 ['${ginterestCount[0].bigInterest}', ${ginterestCount[0].ginterestCount}],
             ['${ginterestCount[1].bigInterest}', ${ginterestCount[1].ginterestCount}],
             ['${ginterestCount[2].bigInterest}', ${ginterestCount[2].ginterestCount}]
       
          ]);

          // Set chart options
          var options = {'title':'Group Interest Rate',
          				titleTextStyle:{
          					fontName:'Poppins',
          					fontSize: 27
          			  	},
          			  backgroundColor :'#edecea',
        				fontSize :15,
        				fontName:'Poppins',
        				legend: 'none',
              		pieSliceText: 'label',        
                       'width':400,
                       'height':400,
                       sliceVisibilityThreshold: .05,
                         slices: {
                             0: { color: '#add8e6' },
                             1: { color: '#d6ddf2' },
                             2: { color: '#e6d7ad' }
                           },
  				        pieSliceTextStyle: {
  				            color: '#344c41'
  				          }
          };

          // Instantiate and draw our chart, passing in some options.
          var chart1 = new google.visualization.PieChart(document.getElementById('chart_div7'));
          chart1.draw(data, options);
        
        }
    </script>
</head>
<body>
	<c:import url="common/adminSidebar.jsp"></c:import>
	
	
	<div class="row">

		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="row">
							<div class="col-lg-4" id="chart_div"></div>
							<div class="col-lg-4" id="chart_div2"></div>
							<div class="col-lg-4" id="chart_div3"></div>					
						</div>
				</div>
				<div class="carousel-item">
					<table class="columns">
						<tr>
							<td><div id="chart_div7" style="border: 1px solid #ccc"></div></td>
							<td><div id="Anthony_chart_div"
									style="border: 1px solid #ccc"></div></td>
						</tr>
					</table>
					<div class="row">
							<div class="col-lg-4" id=""></div>
							<div class="col-lg-4" id="chart_div2"></div>
											
						</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src=".../800x400?auto=yes&bg=555&fg=333&text=Third slide"
						alt="Third slide">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
<!-- 	<div class="row" >
		<div class="card" style="width: 100%;">
			<div class="card-header">
				<ul class="nav nav-tabs card-header-tabs pull-right" id="myTab"
					role="tablist">
					<li class="nav-item"><a class="nav-link active" id="home-tab"
						data-toggle="tab" href="#home" role="tab" aria-controls="home"
						aria-selected="true">MEMBER</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="false">GROUP</a></li>
					<li class="nav-item"><a class="nav-link" id="contact-tab"
						data-toggle="tab" href="#contact" role="tab"
						aria-controls="contact" aria-selected="false">ACCUSE</a></li>
				</ul>
			</div>
			<div class="card-body" >
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
						<div class="row">
							<div class="col-lg-4" id="chart_div"></div>
							<div class="col-lg-4" id="chart_div2"></div>
							<div class="col-lg-4" id="chart_div3"></div>					
						</div>
						<div class="row">
							<div class="col-lg-4" id="chart_div4"></div>
							<div class="col-lg-4" id="chart_div5"></div>
							<div class="col-lg-4" id="chart_div6"></div>					
						</div>
					</div>
					<div class="tab-pane fade" id="profile" role="tabpanel"> 
						<div class="row">
							<div class="col-lg-4" id="chart_div7"></div>
							<div class="col-lg-4" id="chart_div8"></div>
							<div class="col-lg-4" id="chart_div9"></div>					
						</div>
					</div>
					<div class="tab-pane fade" id="contact" role="tabpanel"
						aria-labelledby="contact-tab">
						<div class="row">
							<div class="col-lg-4" id="chart_div1"></div>
							<div class="col-lg-4" id="chart_div8"></div>
							<div class="col-lg-4" id="chart_div9"></div>					
						</div>
						
						</div>
				</div>
			</div>
		</div>
	</div> -->

	





	</div>
	<!-- --노란줄 두개 okay  -->
	</div>
	<!-- 전체 페이지 끝 -->
</body>
</html>