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
      google.charts.setOnLoadCallback(drawGenderChart2);     
      google.charts.setOnLoadCallback(drawAddressChart);
      google.charts.setOnLoadCallback(drawMinterestChart);
      google.charts.setOnLoadCallback(drawMinterestChart2);
      google.charts.setOnLoadCallback(drawGinterestChart);
      google.charts.setOnLoadCallback(drawGinterestChart2);
      google.charts.setOnLoadCallback(drawGgradeChart);
      google.charts.setOnLoadCallback(drawGstateChart);
      google.charts.setOnLoadCallback(drawReportCountChart);


      function drawGenderChart() {
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
        
        				backgroundColor :'transparent',
        				fontSize :25,
        				fontName:'Poppins',
        				legend: 'none',
              			pieSliceText: 'label',        
                       'width':500,
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
      
      
      
      function drawGenderChart2() {
    	  var data = google.visualization.arrayToDataTable([
    	        ["Gender", "수", { role: "style" } ],
    	        ["Male", ${genderCount[0].genderCount}, "color: #e5e4e2"],
    	        ["Female", ${genderCount[1].genderCount}, "silver"]
    	   
    	      ]);

    	      var view = new google.visualization.DataView(data);
    	      view.setColumns([0, 1,
    	                       { calc: "stringify",
    	                         sourceColumn: 1,
    	                         type: "string",
    	                         role: "annotation" },
    	                       2]);

    	      var options = {
    	        title: "Member Gender Rate",
    	        titleTextStyle:{
  					fontName:'Poppins',
  					fontSize: 27
  			  	},
    	        width: 500,
    	        height: 400,
    	        bar: {groupWidth: "95%"},
    	        legend: { position: "none" },
    	      };
    	      var chart = new google.visualization.ColumnChart(document.getElementById("chart_div7"));
    	      chart.draw(view, options);
    	    /*   var chart2 = new google.visualization.ColumnChart(document.getElementById("chart_div9"));
    	      chart2.draw(view, options); */
    }
      function drawReportCountChart() {
    	  var data = google.visualization.arrayToDataTable([
    	        ["Report", "수", { role: "style" } ],
    	        ["Group", ${gmReportCount[0].gReportCount}, "color: #e5e4e2"],
    	        ["Member", ${gmReportCount[0].mReportCount}, "silver"]
    	   
    	      ]);

    	  
    	      var view = new google.visualization.DataView(data);
    	      view.setColumns([0, 1,
    	                       { calc: "stringify",
    	                         sourceColumn: 1,
    	                         type: "string",
    	                         role: "annotation" },
    	                       2]);

    	      var options = {
    	        title: "Report",
    	        titleTextStyle:{
  					fontName:'Poppins',
  					fontSize: 27
  			  	},
    	        width: 500,
    	        height: 400,
    	        bar: {groupWidth: "95%"},
    	        legend: { position: "none" },
    	      };
    	      var chart = new google.visualization.ColumnChart(document.getElementById("chart_div8"));
    	      chart.draw(view, options);
    	    /*   var chart2 = new google.visualization.ColumnChart(document.getElementById("chart_div9"));
    	      chart2.draw(view, options); */
    }
      function drawMinterestChart2() {
    	  var data = google.visualization.arrayToDataTable([
    	        ["Interest", "수", { role: "style" } ],
    	        ['${minterestCount[0].bigInterest}', ${minterestCount[0].minterestCount}, "color: #add8e6"],
    	        ['${minterestCount[1].bigInterest}', ${minterestCount[1].minterestCount}, "color: #d6ddf2"],
    	        ['${minterestCount[2].bigInterest}', ${minterestCount[2].minterestCount}, "color: #e6d7ad"],
    	        ['${minterestCount[3].bigInterest}', ${minterestCount[3].minterestCount}, "color: #a9cf9b"],
    	        ['${minterestCount[4].bigInterest}', ${minterestCount[4].minterestCount}, "color: #d9e6ad"],
    	        ['${minterestCount[5].bigInterest}', ${minterestCount[5].minterestCount}, "color: #d7ade6"],
    	        ['${minterestCount[6].bigInterest}', ${minterestCount[6].minterestCount}, "color: #ade6d7"],
    	        ['${minterestCount[7].bigInterest}', ${minterestCount[6].minterestCount}, "color: #22252e"]

    	      ]);

    	
    	      var view = new google.visualization.DataView(data);
    	      view.setColumns([0, 1,
    	                       { calc: "stringify",
    	                         sourceColumn: 1,
    	                         type: "string",
    	                         role: "annotation" },
    	                       2]);

    	      var options = {
    	        title: "Member Interest Rate",
    	        titleTextStyle:{
  					fontName:'Poppins',
  					fontSize: 27
  			  	},
    	        width: 720,
    	        height: 400,
    	        bar: {groupWidth: "95%"},
    	        fontSize :9,
    	        legend: { position: "none" },
    	      };
    	      var chart = new google.visualization.ColumnChart(document.getElementById("chart_div10"));
    	      chart.draw(view, options);
    	    /*   var chart2 = new google.visualization.ColumnChart(document.getElementById("chart_div9"));
    	      chart2.draw(view, options); */
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
          				backgroundColor :'transparent',
          				fontSize :16,
          				fontName:'Poppins',
          				legend: 'none',
                			pieSliceText: 'label',        
                         'width':500,
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
          
          				backgroundColor :'transparent',
          				fontSize :15,
          				fontName:'Poppins',
          				legend: 'none',
                			pieSliceText: 'label',        
                         'width':500,
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
                             8: { color: '#22252e' }
                           },
  				        pieSliceTextStyle: {
  				            color: '#344c41',
  				          },
          };

          // Instantiate and draw our chart, passing in some options.
          var chart = new google.visualization.PieChart(document.getElementById('chart_div3'));
          chart.draw(data, options);
        }
      
      function drawGinterestChart2() {
    	  var data = google.visualization.arrayToDataTable([
    	        ["Interest", "수", { role: "style" } ],
    	        ['${ginterestCount[0].bigInterest}',${ginterestCount[0].ginterestCount}, "color: #add8e6"] ,
          		['${ginterestCount[1].bigInterest}',${ginterestCount[1].ginterestCount}, "color: #d6ddf2"],
          		['${ginterestCount[2].bigInterest}',${ginterestCount[2].ginterestCount}, "color: #e6d7ad"],
          	    ['${ginterestCount[3].bigInterest}',${ginterestCount[3].ginterestCount}, "color: #a9cf9b"],
          	    ['${ginterestCount[4].bigInterest}',${ginterestCount[4].ginterestCount}, "color: #d9e6ad"],
          	    ['${ginterestCount[5].bigInterest}',${ginterestCount[5].ginterestCount}, "color: #add8e6"],
          	    ['${ginterestCount[6].bigInterest}',${ginterestCount[6].ginterestCount}, "color: #d7ade6"],
          	    ['${ginterestCount[7].bigInterest}',${ginterestCount[7].ginterestCount}, "color: #ade6d7"]   
    	      ]);

    	
    	      var view = new google.visualization.DataView(data);
    	      view.setColumns([0, 1,
    	                       { calc: "stringify",
    	                         sourceColumn: 1,
    	                         type: "string",
    	                         role: "annotation" },
    	                       2]);

    	      var options = {
    	        title: "Group Interest Rate",
    	        titleTextStyle:{
  					fontName:'Poppins',
  					fontSize: 27
  			  	},
    	        width: 720,
    	        height: 400,
    	        bar: {groupWidth: "95%"},
    	        legend: { position: "none" },
    	        fontSize :10
    	        
    	      };
    	      var chart = new google.visualization.ColumnChart(document.getElementById("chart_div11"));
    	      chart.draw(view, options);
 
    }
      
      function drawGinterestChart() {

          // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Interest');
          data.addColumn('number', 'percent')
           data.addRows([
        	  ['${ginterestCount[0].bigInterest}',${ginterestCount[0].ginterestCount}] ,
        	  ['${ginterestCount[1].bigInterest}',${ginterestCount[1].ginterestCount}],
        	  ['${ginterestCount[2].bigInterest}',${ginterestCount[2].ginterestCount}],
        	  ['${ginterestCount[3].bigInterest}',${ginterestCount[3].ginterestCount}],
        	  ['${ginterestCount[4].bigInterest}',${ginterestCount[4].ginterestCount}],
        	  ['${ginterestCount[5].bigInterest}',${ginterestCount[5].ginterestCount}],
        	  ['${ginterestCount[6].bigInterest}',${ginterestCount[6].ginterestCount}],
        	  ['${ginterestCount[7].bigInterest}',${ginterestCount[7].ginterestCount}],
        	  ['${ginterestCount[8].bigInterest}',${ginterestCount[8].ginterestCount}]
        	   ]);
        
      
          		
          
          // Set chart options
          var options = {'title':'Group Interest Rate',
          				titleTextStyle:{
          					fontName:'Poppins',
          					fontSize: 27
          			  	},
          				backgroundColor :'transparent',
          				fontSize :15,
          				fontName:'Poppins',
          				legend: 'none',
                		pieSliceText: 'label',        
                        width:500,
                        height:400,
                        sliceVisibilityThreshold: .05,
                        slices: {
                             0: { color: '#add8e6' },
                             1: { color: '#d6ddf2' },
                             2: { color: '#e6d7ad' },
                             3: { color: '#a9cf9b' },
                             4: { color: '#ade6bb' },
                             5: { color: '#d9e6ad' }
                           },
  				       pieSliceTextStyle: {
  				            color: '#344c41'
  				       }
          };

          // Instantiate and draw our chart, passing in some options.
/*           var chart1 = new google.visualization.PieChart(document.getElementById('chart_div7'));
          chart1.draw(data, options); */
          var chart = new google.visualization.PieChart(document.getElementById('chart_div6'));
          chart.draw(data, options);
        }
      
      
      function drawGgradeChart() {

          // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Grade');
          data.addColumn('number', 'percent')
           data.addRows([
        	  ['${gGradeCount[0].groupGradeName}',${gGradeCount[0].gGradeCount}] ,
        	  ['${gGradeCount[1].groupGradeName}',${gGradeCount[1].gGradeCount}],
        	  ['${gGradeCount[2].groupGradeName}',${gGradeCount[2].gGradeCount}],
        	  ['${gGradeCount[3].groupGradeName}',${gGradeCount[3].gGradeCount}],
        	  ['${gGradeCount[4].groupGradeName}',${gGradeCount[4].gGradeCount}]      	
        	   ]);
        
      
          		
          
          // Set chart options
          var options = {'title':'Group Grade Rate',
          				titleTextStyle:{
          					fontName:'Poppins',
          					fontSize: 27
          			  	},
          				backgroundColor :'transparent',
          				fontSize :22,
          				fontName:'Poppins',
          				legend: 'none',
                		pieSliceText: 'label',        
                        width:500,
                        height:400,
                        sliceVisibilityThreshold: .05,
                        slices: {
                             0: { color: '#add8e6' },
                             1: { color: '#d6ddf2' },
                             2: { color: '#e6d7ad' },
                             3: { color: '#a9cf9b' },
                             4: { color: '#ade6bb' },
                             5: { color: '#d9e6ad' }
                           },
  				       pieSliceTextStyle: {
  				            color: '#344c41'
  				       }
          };

          var chart = new google.visualization.PieChart(document.getElementById('chart_div4'));
          chart.draw(data, options);
        }
      function drawGstateChart() {

          // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Grade');
          data.addColumn('number', 'percent')
           data.addRows([
        	  ['${groupStateCount[0].groupStateName}',${groupStateCount[0].gGradeCount}] ,
        	  ['${groupStateCount[1].groupStateName}',${groupStateCount[1].gGradeCount}]     
        	   ]);
        
      
          		
          
          // Set chart options
          var options = {'title':'Group State Rate',
          				titleTextStyle:{
          					fontName:'Poppins',
          					fontSize: 27
          			  	},
          				backgroundColor :'transparent',
          				fontSize :22,
          				fontName:'Poppins',
          				legend: 'none',
                		pieSliceText: 'label',        
                        width:500,
                        height:400,
                        sliceVisibilityThreshold: .05,
                        slices: {
                             0: { color: '#add8e6' },
                             1: { color: '#d6ddf2' }
               
                           },
  				       pieSliceTextStyle: {
  				            color: '#344c41'
  				       }
          };

          var chart = new google.visualization.PieChart(document.getElementById('chart_div5'));
          chart.draw(data, options);
        }
    </script>
</head>
<body>
	<c:import url="common/adminSidebar.jsp"></c:import>
	<div class="row" style="width: 100%;">
		<div class="card" style="width: 100%;">
			<div class="card-header">
				<ul class="nav nav-tabs card-header-tabs pull-right" id="myTab"
					role="tablist">
					<li class="nav-item"><a class="nav-link active" id="home-tab"
						data-toggle="tab" href="#home" role="tab" aria-controls="home"
						aria-selected="true">PIE</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="false">SUMMARY</a></li>
			
				</ul>
			</div>
			<div class="card-body" >
				<div class="tab-content" id="myTabContent" style="width: 100%;">
				
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
						<div class="row">
							<div class="col-lg-4" id="chart_div"></div>
							<div class="col-lg-4" id="chart_div2"></div>
							<div class="col-lg-4" id="chart_div3"></div>					
						</div>
						<hr>
						<div class="row">
							<div class="col-lg-4" id="chart_div4"></div>
							<div class="col-lg-4" id="chart_div5"></div>
							<div class="col-lg-4" id="chart_div6"></div>					
						</div>
					</div>
					
					<div class="tab-pane fade" id="profile" role="tabpanel" > 
						<div class="row">
							<div class="col-lg-4" id="chart_div7"></div>
							<div class="col-lg-4" id="chart_div8"></div>
							<div class="col-lg-4" id="chart_div9"></div>					
						</div>
						<div class="row">
							<div class="col-lg-6" id="chart_div10"></div>
							<div class="col-lg-6" id="chart_div11"></div>					
						</div>
					</div>
				
				</div>
			</div>
		</div>
	</div>

	





	</div>
	<!-- --노란줄 두개 okay  -->
	</div>
	<!-- 전체 페이지 끝 -->
	<script type="text/javascript">
	
	
/* 	$(document).ready(function(){
		$("#accuseDiv").on("click", function(){
			 $.ajax({
		            url: "${pageContext.request.contextPath}/acAnalytics.ad",
		            type:'get',
		            dataType:"json",
		            success:function(data){	
		            	
		            }
			 });
		});
	}); */
	
	
	</script>
</body>
</html>