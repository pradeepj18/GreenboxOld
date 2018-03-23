<%@ page language="java" contentType="text/html; charset=UTF-8" import="DBManager.DBManager,java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
 <meta charset="utf-8">
 <title>
 Create Google Charts
 </title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 <script type="text/javascript" src="https://www.google.com/jsapi"></script>
 <script type="text/javascript">
 google.load("visualization", "1", {packages:["corechart"]});
 google.setOnLoadCallback(drawChart);
 function drawChart() {
 var data = google.visualization.arrayToDataTable([

 ['Name', 'Score'],
 <%
 	DBManager.loadDriver();
	/* ResultSet rs= DBManager.fetchQuery("select (select tName from tourTeam tt,team t where t.tId=tt.tId and tt.ttId=tg.ttId) as tName,count(gno) as goal from tourGoal tg group by ttId;;"); */
	ResultSet rs = DBManager.fetchQuery("select (select count(gno) from tourGoal where tourId=1) as goal,(select count(fno) from tourFoul where tourId=1) as foul,(select count(cno) from tourCard where cname='Y' and tourId=1) as yellow,(select count(cno) from tourCard where cname ='R' and tourId=1) as red;");
 	 if(rs.next()){
		 /* out.println("['"+rs.getString("tName")+"',"+rs.getString("goal")+"],"); */
		 out.println("['FOUL',"+rs.getString("foul")+"],['RED CARD',"+rs.getString("red")+"],['YELLOW CARD',"+rs.getString("yellow")+"],['GOAL',"+rs.getString("goal")+"],");
	 }
 %>
 
 ]);

 var options = {
	 title: 'Statistics',
	 pieHole: 0.4,
				 
 };
 var chart = new google.visualization.PieChart(document.getElementById("columnchart"));
 chart.draw(data, options);
 }
 </script>
</head>
<body>
 <h3>Column Chart</h3>
 <div id="columnchart" style="width: 900px; height: 500px;"></div>
</body>
</html>
