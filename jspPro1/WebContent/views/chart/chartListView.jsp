<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.HashMap, java.util.Map.Entry, java.util.ArrayList, com.kh.product.model.vo.*, com.kh.order.model.vo.*" %>
<%
	HashMap<String,Integer> ca_list = (HashMap<String,Integer>)request.getAttribute("ca_list");
	HashMap<String,Integer> pd_list = (HashMap<String,Integer>)request.getAttribute("pd_list");
	HashMap<String,Integer> fr_list = (HashMap<String,Integer>)request.getAttribute("fr_list");
	ArrayList<Order> pr_list = (ArrayList<Order>)request.getAttribute("pr_list");
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
      google.charts.setOnLoadCallback(drawChart_category);
      google.charts.setOnLoadCallback(drawChart_sell);
      google.charts.setOnLoadCallback(drawChart_forest);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart_forest(){
    	  var data = new google.visualization.DataTable();
    	  data.addColumn('string', 'Forest');
          data.addColumn('number', 'Amount');
          
          var dataRow = [];
          
          <%System.out.print(fr_list);%>
  		
          <% for(Entry<String, Integer>ls : fr_list.entrySet()){ %>
          	
    		    dataRow = ['<%=ls.getKey()%>', <%=ls.getValue()%>];
          		data.addRow(dataRow);
        	
          <% } %>
          
          var options = {'title':'어느 숲에 얼마의 나무가 심겼나요?',
                  'width':700,
                  'height':400,
                  backgroundColor: 'rgb(239, 240, 227)',
                  };

   		var chart = new google.visualization.PieChart(document.getElementById('chart_forest'));
   		chart.draw(data, options);
      }
      
      
      function drawChart_sell(){
    	  var data = new google.visualization.DataTable();
    	  data.addColumn('string', 'Product');
          data.addColumn('number', 'Amount');
          
          var dataRow = [];
          
          <%System.out.print(pd_list);%>
  		
          <% for(Entry<String, Integer>ls : pd_list.entrySet()){ %>
          	
    		    dataRow = ['<%=ls.getKey()%>', <%=ls.getValue()%>];
          		data.addRow(dataRow);
        	
          <% } %>
          
          var options = {'title':'어느 상품이 팔렸을까요?',
                  'width':700,
                  'height':400,
                  backgroundColor: 'rgb(239, 240, 227)',
                  };

   		var chart = new google.visualization.PieChart(document.getElementById('chart_sell'));
   		chart.draw(data, options);
      }
      
      function drawChart_category() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Category');
        data.addColumn('number', 'Amount');
        
        var dataRow = [];
       
       <%System.out.print(ca_list);%>
		
       <% for(Entry<String, Integer>ls : ca_list.entrySet()){ %>
       	
 		    dataRow = ['<%=ls.getKey()%>', <%=ls.getValue()%>];
       		data.addRow(dataRow);
     	
       <% } %>

        // Set chart options
        var options = {'title':'어느 카테고리의 제품이 등록되어 있습니까?',
                       'width':700,
                       'height':400,
                       backgroundColor: 'rgb(239, 240, 227)',
                       };

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_category'));
        chart.draw(data, options);
      }
      
      
      google.charts.load('current', {'packages':['line']});
      google.charts.setOnLoadCallback(drawChart_price);

    function drawChart_price() {

      var data = new google.visualization.DataTable();
      // 가로축과 세로축 각각의 값들에 대해 기술
      data.addColumn('string', 'Day');
      data.addColumn('number', '판매 액수');

      // 데이터 입력 
      var dataRow = [];
		
      <% for(Order ls : pr_list){ %>
      	
		    dataRow = ['<%=ls.getOrderDate()%>', <%=ls.getTotalprice()/1000%>];
      		data.addRow(dataRow);
    	
      <% } %>

      // 제목, 부제목, 차트크기
      var options = {
        chart: {
          title: '일별 판매금액 추이',
          subtitle: '단위 (천 원)'
        },
        width: 1650,
        height: 500,
        backgroundColor: 'rgb(239, 240, 227)',
        axes: {
          x: {
            0: {side: 'bottom'}
          }
        }
      };

      var chart = new google.charts.Line(document.getElementById('chart_price'));

      chart.draw(data, google.charts.Line.convertOptions(options));
    }
      
      
      
      
</script>
<style>
	#chart_category{
		position:absolute;
		top:100px;
	}
	
	#chart_sell{
		position:absolute;
		top:100px;
		left : 600px;
	}
	
	#chart_forest{
		position:absolute;
		top:100px;
		left : 1200px;
	}
	
	#chart_price{
		position:absolute;
		top:500px;
		left : 100px;
		
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<body>
    <!--Div that will hold the pie chart-->
    <div id="chart_category"></div>
    
    <div id="chart_sell"></div>
    
    <div id="chart_forest"></div>
    
    <div id="chart_price"></div>
  </body>
</body>
</html>