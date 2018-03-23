<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,DBManager.DBManager"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GreenBox | Team History</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="materialize/css/materialize.min.css"  media="screen,projection"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=no"/>
<link href="css/daywise.css" rel="stylesheet">

<style>
.team-banner{
	background-image:url("images/football-stadium.jpg");	
}
</style>

</head>
<body>
<%
try
{
	String mdate=request.getParameter("mdate");
	int day=Integer.parseInt(request.getParameter("day"));
	int tourId=1;
	ResultSet rs=null;
DBManager.loadDriver();
%>
<div class="container-fluid">
	<div class="row" style="background-color:aliceblue;">
		<div class="col s4 m4 l4">
			<img class="img-responsive pull-left" id="psLogo" src="images/PlaysoftechLogo.png">
		</div>
		<div class="col s4 m4 l4">
			<img class="img-responsive" id="tourLogo" src="images/GreenBox_logo.png">
		</div>
		<div class="col s4 m4 l4">
			<img class="img-responsive right" id="gbLogo" src="images/logos_2.png">
		</div>
 	</div>
</div>

<div class="container-fluid team-banner" style="margin-top: -1%;">
<%
rs=DBManager.fetchQuery("select UCASE(DATE_FORMAT('"+mdate+"','%D %M %W')) as dayfor;");
rs.next();
%>
	<div class="row valign-wrapper">
            <div class="col s4">
             <img src="images/GreenBox_logo.png" alt="" class="responsive-img">
            </div>
            <div class="col s8">
              <span class="white-text flow-text">
               	<span class="day  red-text text-accent-4">DAY</span><span class="number"> <%=day %></span><span class="full-date"> <%=rs.getString("dayfor") %></span>
              </span>
            </div>
   </div>
</div>
<div class="container-fluid">
<%
int count=1;
rs=null;
rs = DBManager.fetchQuery("select mid,tid1,(select tName from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tid1) as tname1,(select lcase(SUBSTRING_INDEX(tFlag,'/',-1)) from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tid1) as taphoto,(select tName from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tid2) as tname2,(select lcase(SUBSTRING_INDEX(tFlag,'/',-1)) from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tid2) as tbphoto,tid2,tascore,tbscore,UCASE(DATE_FORMAT(mdate,'%D %M %W')) as dayfor,TIME_FORMAT(mtime,'%H:%i') as time from print_match where mdate='"+mdate+"' and tourId="+tourId);
while(rs.next())
{
%>
	 <div class="row">
   	<div class="col s12">
   		<div id="matches">
		     	<a href="matchhistory.jsp?tourId=1&mid=<%=rs.getInt("mid") %>" target="_blank" style="color: black;">
			     	<div class="card" style="padding: 1% 1% 0.1%;">
			     		<div class="row">
			     			<div class="col s2 m2 l2">
			     				<span class="match">MATCH NO <%=rs.getInt("mid") %></span>
			     			</div>
			     			<div class="col s6 m6 l6">
			     				<span class="teama"><%=rs.getString("tname1") %></span> <span class="vs">VS</span> <span class="teamb"><%=rs.getString("tname2") %></span>
			     			</div>
			     			<div class="col s4 m4 l4">
			     				<span class="match"><%=rs.getString("dayfor") %>&nbsp;<%=rs.getString("time") %></span>
			     				
			     			</div>
			     			
			     		</div>
			     	</div>
			     </a>
		     	</div>
   	</div>
   </div>
</div>
<%}%>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="materialize/js/materialize.min.js"></script>
<%	
}
catch(Exception e){System.out.println("Error in daywise : "+e);} %>
</body>
</html>