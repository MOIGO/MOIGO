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
        
        				backgroundColor :'transparent',
        				fontSize :25,
        				fontName:'Poppins',
        				legend: 'none',
              			pieSliceText: 'label',        
                       'width':500,
                       'height':500,
                       sliceVisibilityThreshold: .2,
                       slices: {
                           0: { color: '#add8e6' },
                           1: { color: '#d6ddf2' }
                         },
				        pieSliceTextStyle: {
				            color: 'black',
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
          				backgroundColor :'transparent',
          				fontSize :20,
          				fontName:'Poppins',
          				legend: 'none',
                			pieSliceText: 'label',        
                         'width':500,
                         'height':500,
                         sliceVisibilityThreshold: .05,
                         slices: {
                             0: { color: '#add8e6' },
                             1: { color: '#d6ddf2' },
                             2: { color: '#8a96b8' },
                           },
  				        pieSliceTextStyle: {
  				            color: 'black',
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
        	  ['${minterestCount[0].minterestCount}', ${minterestCount[0].minterestCount}],
              ['${minterestCount[1].minterestCount}', ${minterestCount[1].minterestCount}],
              ['${minterestCount[2].minterestCount}', ${minterestCount[2].minterestCount}],
              ['${minterestCount[3].minterestCount}', ${minterestCount[3].minterestCount}],
              ['${minterestCount[4].minterestCount}', ${minterestCount[4].minterestCount}],
              ['${minterestCount[5].minterestCount}', ${minterestCount[5].minterestCount}],
              ['${minterestCount[6].minterestCount}', ${minterestCount[6].minterestCount}],
              ['${minterestCount[7].minterestCount}', ${minterestCount[7].minterestCount}]
          ]);

          // Set chart options
          var options = {'title':'Member Interest Rate',
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
                         'height':500,
                         sliceVisibilityThreshold: .2,
                         slices: {
                             0: { color: '#add8e6' },
                             1: { color: '#d6ddf2' }
                           },
  				        pieSliceTextStyle: {
  				            color: 'black',
  				          },
          };

          // Instantiate and draw our chart, passing in some options.
          var chart = new google.visualization.PieChart(document.getElementById('chart_div3'));
          chart.draw(data, options);
        }
    </script>
</head>
<body>
	<c:import url="common/adminSidebar.jsp"></c:import>

	<div class="row">
	<div class="col-lg-4" id="chart_div"></div>
	<div class="col-lg-4" id="chart_div2"></div>
	<div class="col-lg-4" id="chart_div3"></div>
	
	</div>







	</div>
	<!-- --노란줄 두개 okay  -->
	</div>
	<!-- 전체 페이지 끝 -->
</body>
</html>