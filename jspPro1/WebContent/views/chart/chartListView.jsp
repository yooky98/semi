<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.HashMap, java.util.Map.Entry, com.kh.product.model.vo.*" %>
<%
	HashMap<String,Integer> list = (HashMap<String,Integer>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>chart</title>
<link href='https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap' rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link href="<%=request.getContextPath() %>/resources/css/productMainViewStyle.css" rel="stylesheet">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
        
        var dataRow = [];
       
       <%System.out.print(list);%>
		
       <% for(Entry<String, Integer>ls : list.entrySet()){ %>
       	
 		    dataRow = ['<%=ls.getKey()%>', <%=ls.getValue()%>];
       		data.addRow(dataRow);
     	
       <% } %>

        // Set chart options
        var options = {'title':'어느 카테고리의 제품이 등록되어 있습니까?',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
</script>
<style>
	#chart_div{
		position:absolute;
		top:100px;
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<body>
    <!--Div that will hold the pie chart-->
    <div id="chart_div" style = "background-color: rgb(239, 240, 227)"></div>
  </body>
</body>
</html>