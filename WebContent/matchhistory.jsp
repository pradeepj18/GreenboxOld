<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,DBManager.DBManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GreenBox | Match History</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="materialize/css/materialize.min.css"  media="screen,projection"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link href="css/matchhistory.css" rel="stylesheet">
</head>
<body>
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
<div class="container-fluid">
<%
try
{
	int mid=Integer.parseInt(request.getParameter("mid"));
	int tourId=Integer.parseInt(request.getParameter("tourId"));
ResultSet rs=null,rs1=null,rs2=null,rs3=null;
DBManager.loadDriver();
rs = DBManager.fetchQuery("select mid,tid1,(select tName from team where tid in(select tid from tourTeam where ttId=m.tid1)) as tname1,(select lcase(SUBSTRING_INDEX(tFlag,'/',-1)) from team where tid in(select tid from tourTeam where ttId=m.tid1 )) as flag1,tid2,(select tName from team where tid in(select tid from tourTeam where ttId=m.tid2)) as tname2,(select lcase(SUBSTRING_INDEX(tFlag,'/',-1)) from team where tid in(select tid from tourTeam where ttId=m.tid2 )) as flag2,UCASE(DATE_FORMAT(mdate,'%a %d %b %Y')) as mdate,TIME_FORMAT(mtime,'%H:%i') as time from wmatch m where mid="+mid+" and tourId="+tourId+";");

if(rs.next())
{
%>
<div class="row">
	<div class="col s12 m12 l12">
		<div class="card-panel blue darken-3 white-text match-no" >
			<span>MATCH NO <%=mid %></span>
			<span class="date-day"><%=rs.getString("mdate") %></span>
			<span class="right"><%=rs.getString("time") %></span>
		</div>
	</div>
</div>

<div class="row">
	<!-- START TEAM a -->
	<div class="col s12 m6 l6">
	<%
	rs1=DBManager.fetchQuery("select (select count(ttId) from tourGoal where ttId="+rs.getInt("tid1")+" and mid="+mid+" and tourId="+tourId+" and gtype=1) as goal,(select count(ttId) from tourFoul where ttId="+rs.getInt("tid1")+" and mid="+mid+" and tourId="+tourId+" and ftype=1) as foul,(select count(ttId) from tourCard where ttId="+rs.getInt("tid1")+" and mid="+mid+" and tourId="+tourId+" and cname='Y' and ctype='1') as y,(select count(ttId) from tourCard where ttId="+rs.getInt("tid1")+" and mid="+mid+" and tourId="+tourId+" and cname='R' and ctype='1') as r,(select count(ttId) from tourGoal where ttId="+rs.getInt("tid1")+" and mid="+mid+" and tourId="+tourId+" and gtype=2) as goal1,(select count(ttId) from tourFoul where ttId="+rs.getInt("tid1")+" and mid="+mid+" and tourId="+tourId+" and ftype=2) as foul1,(select count(ttId) from tourCard where ttId="+rs.getInt("tid1")+" and mid="+mid+" and tourId="+tourId+" and cname='Y' and ctype='2') as y1,(select count(ttId) from tourCard where ttId="+rs.getInt("tid1")+" and mid="+mid+" and tourId="+tourId+" and cname='R' and ctype='2') as r1;");
	
	if(rs1.next())
	{
	%>
		<div class="card-panel  grey lighten-5">
		<div class=" amber darken-3" style="padding: 1%; margin-left: -2.5%; width: 105%; margin-top: -2.5%;">
			<div class="card-title">
			<center><img src="images/man-team-logo/<%=rs.getString("flag1") %>" class="circle responsive-img"></center>
			</div>
		</div>
		<div class="card-content ">
		 <div class="row">
		 	<div class="col s12">
		      <ul id="tabs-swipe-demo" class="tabs">
		        <li class="tab col s6 m6 l6"><a style="font-size: 17px;" class="active black-text tabs-text" href="#matchinfo">Match Info</a></li>
		        <li class="tab col s6 m6 l6"><a style="font-size: 18px;" class="black-text tabs-text" href="#playerinfo">Player</a></li>
		     </ul>
		     
		     <!-- START MATCH INFO -->
		     <div id="matchinfo">
		     	
		     	<div class="card  red darken-3">
		     		<div class="card-title grey-text text-lighten-5">
		     			<h4 style="padding: 2% 3%;">FIRST HALF</h4>
		     		</div>
		     	
		     	<div class="card-content white">
		     	 <div class="row ">
		     	 	<div class="col s6 m6 l6">
		     	 		  <i class="small material-icons icons-class  green-text text-darken-2">star</i><span class="icons-text">GOAL</span>
		     	 	</div>
		     	 	<div class="col s6 m6 l6">
		     	 		<span class="score-text"><%=rs1.getInt("goal") %></span>
		     	 	</div>
		     	 </div>
		     	 <hr>
		     	 <div class="row">
		     	 	<div class="col s6 m6 l6">
		     	 	<i class="small material-icons icons-class  indigo-text text-darken-3">not_interested</i><span class="icons-text">FOUL</span>
		     	 		
		     	 	</div>
		     	 	<div class="col s6 m6 l6">
		     	 		<span class="score-text"><%=rs1.getInt("foul") %></span>
		     	 	</div>
		     	 </div>
		     	 <hr>
		     	 <div class="row">
		     	 	<div class="col s6 m6 l6">
		     	 	<i class="small material-icons yellow-text icons-class-foul">stop</i><span class="icons-text">Y CARD</span>
		     	 		
		     	 	</div>
		     	 	<div class="col s6 m6 l6">
		     	 		<span class="score-text"><%=rs1.getInt("y") %></span>
		     	 	</div>
		     	 </div>
		     	 <hr>
		     	 <div class="row">
		     	 	<div class="col s6 m6 l6">
		     	 		<i class="small material-icons red-text icons-class-foul">stop</i><span class="icons-text">R CARD</span>
		     	 	</div>
		     	 	<div class="col s6 m6 l6">
		     	 		<span class="score-text"><%=rs1.getInt("r") %></span>
		     	 	</div>
		     	 </div>
		     	 
		     </div>
		    </div>
		    <!-- END FIRST HALF -->
		    
		    <!-- START SECOND HALF -->
		    <div class="card  blue darken-3">
		     		<div class="card-title grey-text text-lighten-5">
		     			<h4 style="padding: 2% 3%;">SECOND HALF</h4>
		     		</div>
		     	
		     	<div class="card-content white">
		     	 <div class="row ">
		     	 	<div class="col s6 m6 l6">
		     	 		  <i class="small material-icons icons-class  green-text text-darken-2">star</i><span class="icons-text">GOAL</span>
		     	 	</div>
		     	 	<div class="col s6 m6 l6">
		     	 		<span class="score-text"><%=rs1.getInt("goal1") %></span>
		     	 	</div>
		     	 </div>
		     	 <hr>
		     	 <div class="row">
		     	 	<div class="col s6 m6 l6">
		     	 	<i class="small material-icons icons-class  indigo-text text-darken-3">not_interested</i><span class="icons-text">FOUL</span>
		     	 		
		     	 	</div>
		     	 	<div class="col s6 m6 l6">
		     	 		<span class="score-text"><%=rs1.getInt("foul1") %></span>
		     	 	</div>
		     	 </div>
		     	 <hr>
		     	 <div class="row">
		     	 	<div class="col s6 m6 l6">
		     	 	<i class="small material-icons yellow-text icons-class-foul">stop</i><span class="icons-text">Y CARD</span>
		     	 		
		     	 	</div>
		     	 	<div class="col s6 m6 l6">
		     	 		<span class="score-text"><%=rs1.getInt("y1") %></span>
		     	 	</div>
		     	 </div>
		     	 <hr>
		     	 <div class="row">
		     	 	<div class="col s6 m6 l6">
		     	 		<i class="small material-icons red-text icons-class-foul">stop</i><span class="icons-text">R CARD</span>
		     	 	</div>
		     	 	<div class="col s6 m6 l6">
		     	 		<span class="score-text"><%=rs1.getInt("r1") %></span>
		     	 	</div>
		     	 </div>
		     	 
		     </div>
		    </div>
		    
		    <!-- END SECOND HALF -->
		  </div>
		     <!-- END MATCH INFO -->
		     
		     <!-- START PLAYER INFO -->
		     <div id="playerinfo">
		     	<%
		     	rs2=null;
		     	rs2=DBManager.fetchQuery("select barcodeId,(select fName from member where barcodeId=tg.barcodeId) as fname,(select lName from member where barcodeId=tg.barcodeId) as lname,(select (SUBSTRING_INDEX(photo,'/',-1)) from member m where m.barcodeId=tg.barcodeId) as photo,(select count(barcodeId) from tourGoal where barcodeId=tg.barcodeId and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+") as goal,(select count(barcodeId) from tourFoul where barcodeId=tg.barcodeId and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+") as foul,(select count(barcodeId) from tourCard where cname='Y' and barcodeId=tg.barcodeId and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+") as y,(select count(barcodeId) from tourCard where cname='R' and barcodeId=tg.barcodeId and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+") as r from tourGoal tg where tg.mid="+rs.getInt("mid")+" and tg.ttId="+rs.getInt("tid1")+" and tg.tourId="+tourId+" group by barcodeId;");
		     	if(!rs2.next())
		     	{
		     		out.println("<center><h5>NO PLAYER'S SCORED</h5></center>");
		     	}
		     	rs2.beforeFirst();
		     	while(rs2.next())
		     	{
		     		
		     	%>
		     	<ul class="collection">
		     	<% %>
		     	
			    <li class="collection-item avatar">
			      <img src="images/Member/<%=rs2.getString("photo") %>" alt="" class="responsive-img player-img">
			      <div style="margin-left: 21%;">
			      <span class="title deep-purple-text text-darken-4" style="font-weight:700;"><%=rs2.getString("fname") %>&nbsp;<%=rs2.getString("lname") %></span>
			      <p>GOAL : <%=rs2.getInt("goal") %><br>
			         FOUL : <%=rs2.getInt("foul") %>
			         <br>
			        Y CARD : <%=rs2.getInt("y") %>
			         <br>
			        R CARD : <%=rs2.getInt("r") %>
			      </p>
			     </div>
			      </li>
			    
      			</ul>
		     	<%}
		     	
		     	%>
		     </div>
		     <!-- END PLAYER INFO -->
	     	</div>
		 </div>
			
		</div>
		</div>
		<%} %>
	</div> <!--END  TEAM A -->
	
	<!-- START TEAM B -->
	<div class="col s12 m6 l6">
	<%
	rs1=null;
	rs1=DBManager.fetchQuery("select (select count(ttId) from tourGoal where ttId="+rs.getInt("tid2")+" and mid="+mid+" and tourId="+tourId+" and gtype=1) as goal,(select count(ttId) from tourFoul where ttId="+rs.getInt("tid2")+" and mid="+mid+" and tourId="+tourId+" and ftype=1) as foul,(select count(ttId) from tourCard where ttId="+rs.getInt("tid2")+" and mid="+mid+" and tourId="+tourId+" and cname='Y' and ctype='1') as y,(select count(ttId) from tourCard where ttId="+rs.getInt("tid2")+" and mid="+mid+" and tourId="+tourId+" and cname='R' and ctype='1') as r,(select count(ttId) from tourGoal where ttId="+rs.getInt("tid2")+" and mid="+mid+" and tourId="+tourId+" and gtype=2) as goal1,(select count(ttId) from tourFoul where ttId="+rs.getInt("tid2")+" and mid="+mid+" and tourId="+tourId+" and ftype=2) as foul1,(select count(ttId) from tourCard where ttId="+rs.getInt("tid2")+" and mid="+mid+" and tourId="+tourId+" and cname='Y' and ctype='2') as y1,(select count(ttId) from tourCard where ttId="+rs.getInt("tid2")+" and mid="+mid+" and tourId="+tourId+" and cname='R' and ctype='2') as r1;");
	
	if(rs1.next())
	{
	%>
	<div class="card-panel  grey lighten-5">
		<div class="  pink darken-2" style="padding: 1%; margin-left: -2.5%; width: 105%; margin-top: -2.5%;">
			<div class="card-title">

			<center><img src="images/man-team-logo/<%=rs.getString("flag2") %>" class="responsive-img"></center>
			
			</div>
		</div>
			<div class="card-content ">
		 <div class="row">
		 	<div class="col s12">
		      <ul id="tabs-swipe-demo" class="tabs">
		        <li class="tab col s6 m6 l6"><a style="font-size: 17px;" class="active black-text tabs-text" href="#matchinfo1">Match Info</a></li>
		        <li class="tab col s6 m6 l6"><a style="font-size: 18px;" class="black-text tabs-text" href="#playerinfo1">Player</a></li>
		     </ul>
		     
		     <!-- START MATCH INFO -->
		     <div id="matchinfo1">
		     	
		     	<div class="card  blue darken-3">
		     		<div class="card-title grey-text text-lighten-5">
		     			<h4 style="padding: 2% 3%;">FIRST HALF</h4>
		     		</div>
		     	
		     	<div class="card-content white">
		     	 <div class="row ">
		     	 	<div class="col s6 m6 l6">
		     	 		  <i class="small material-icons icons-class  green-text text-darken-2">star</i><span class="icons-text">GOAL</span>
		     	 	</div>
		     	 	<div class="col s6 m6 l6">
		     	 		<span class="score-text"><%=rs1.getInt("goal") %></span>
		     	 	</div>
		     	 </div>
		     	 <hr>
		     	 <div class="row">
		     	 	<div class="col s6 m6 l6">
		     	 	<i class="small material-icons icons-class  indigo-text text-darken-3">not_interested</i><span class="icons-text">FOUL</span>
		     	 		
		     	 	</div>
		     	 	<div class="col s6 m6 l6">
		     	 		<span class="score-text"><%=rs1.getInt("foul") %></span>
		     	 	</div>
		     	 </div>
		     	 <hr>
		     	 <div class="row">
		     	 	<div class="col s6 m6 l6">
		     	 	<i class="small material-icons yellow-text icons-class-foul">stop</i><span class="icons-text">Y CARD</span>
		     	 		
		     	 	</div>
		     	 	<div class="col s6 m6 l6">
		     	 		<span class="score-text"><%=rs1.getInt("y") %></span>
		     	 	</div>
		     	 </div>
		     	 <hr>
		     	 <div class="row">
		     	 	<div class="col s6 m6 l6">
		     	 		<i class="small material-icons red-text icons-class-foul">stop</i><span class="icons-text">R CARD</span>
		     	 	</div>
		     	 	<div class="col s6 m6 l6">
		     	 		<span class="score-text"><%=rs1.getInt("r") %></span>
		     	 	</div>
		     	 </div>
		     	 
		     </div>
		    </div>
		    <!-- END FIRST HALF -->
		    
		    <!-- START SECOND HALF -->
		    <div class="card  red darken-3">
		     		<div class="card-title grey-text text-lighten-5">
		     			<h4 style="padding: 2% 3%;">SECOND HALF</h4>
		     		</div>
		     	
		     	<div class="card-content white">
		     	 <div class="row ">
		     	 	<div class="col s6 m6 l6">
		     	 		  <i class="small material-icons icons-class  green-text text-darken-2">star</i><span class="icons-text">GOAL</span>
		     	 	</div>
		     	 	<div class="col s6 m6 l6">
		     	 		<span class="score-text"><%=rs1.getInt("goal1") %></span>
		     	 	</div>
		     	 </div>
		     	 <hr>
		     	 <div class="row">
		     	 	<div class="col s6 m6 l6">
		     	 	<i class="small material-icons icons-class  indigo-text text-darken-3">not_interested</i><span class="icons-text">FOUL</span>
		     	 		
		     	 	</div>
		     	 	<div class="col s6 m6 l6">
		     	 		<span class="score-text"><%=rs1.getInt("foul1") %></span>
		     	 	</div>
		     	 </div>
		     	 <hr>
		     	 <div class="row">
		     	 	<div class="col s6 m6 l6">
		     	 	<i class="small material-icons yellow-text icons-class-foul">stop</i><span class="icons-text">Y CARD</span>
		     	 		
		     	 	</div>
		     	 	<div class="col s6 m6 l6">
		     	 		<span class="score-text"><%=rs1.getInt("y1") %></span>
		     	 	</div>
		     	 </div>
		     	 <hr>
		     	 <div class="row">
		     	 	<div class="col s6 m6 l6">
		     	 		<i class="small material-icons red-text icons-class-foul">stop</i><span class="icons-text">R CARD</span>
		     	 	</div>
		     	 	<div class="col s6 m6 l6">
		     	 		<span class="score-text"><%=rs1.getInt("r1") %></span>
		     	 	</div>
		     	 </div>
		     	 
		     </div>
		    </div>
		    
		    <!-- END SECOND HALF -->
		  </div>
		     <!-- END MATCH INFO -->
		     
		     <!-- START PLAYER INFO -->
		     <div id="playerinfo1">
		     		<%
		     	rs2=null;
		     	rs2=DBManager.fetchQuery("select barcodeId,(select fName from member where barcodeId=tg.barcodeId) as fname,(select lName from member where barcodeId=tg.barcodeId) as lname,(select (SUBSTRING_INDEX(photo,'/',-1)) from member m where m.barcodeId=tg.barcodeId) as photo,(select count(barcodeId) from tourGoal where barcodeId=tg.barcodeId and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+") as goal,(select count(barcodeId) from tourFoul where barcodeId=tg.barcodeId and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+") as foul,(select count(barcodeId) from tourCard where cname='Y' and barcodeId=tg.barcodeId and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+") as y,(select count(barcodeId) from tourCard where cname='R' and barcodeId=tg.barcodeId and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+") as r from tourGoal tg where tg.mid="+rs.getInt("mid")+" and tg.ttId="+rs.getInt("tid2")+" and tg.tourId="+tourId+" group by barcodeId;");
		     	if(!rs2.next())
		     	{
		     		out.println("<center><h5>NO PLAYER'S SCORED</h5></center>");
		     	}
		     	rs2.beforeFirst();
		     	while(rs2.next())
		     	{
		     		
		     	%>
		     	<ul class="collection">
		     	<% %>
		     	
			    <li class="collection-item avatar">
			      <img src="images/Member/<%=rs2.getString("photo") %>" alt="" class="responsive-img player-img">
			      <div style="margin-left: 21%;">
			      <span class="title deep-purple-text text-darken-4" style="font-weight:700;"><%=rs2.getString("fname") %>&nbsp;<%=rs2.getString("lname") %></span>
			      <p>GOAL : <%=rs2.getInt("goal") %><br>
			         FOUL : <%=rs2.getInt("foul") %>
			         <br>
			        Y CARD : <%=rs2.getInt("y") %>
			         <br>
			        R CARD : <%=rs2.getInt("r") %>
			      </p>
			     </div>
			      </li>
			    
      			</ul>
		     	<%}
		     	
		     	%>
		     	
		     </div>
		     <!-- END PLAYER INFO -->
	     	</div>
		 </div>
			
		</div>
		</div>
		<%} %>
	</div> <!--END  TEAM B -->
</div>	
<% 
}
}
catch(Exception e)
{
System.out.println(e);	
}%>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="materialize/js/materialize.min.js"></script>
</body>
</html>