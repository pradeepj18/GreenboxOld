<%@ page language="java" import="java.sql.*"
	import="DBManager.DBManager" import="java.util.Date" import="java.text.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

System.out.println("+++++");
	ResultSet rs=null,rs1=null;
	int tourId=1;
	int twon=0;
%>
		<div class="score-container clearfix">
		<%
rs=DBManager.fetchQuery("select count(*) from wmatch where Flag='1' and tourId="+tourId+"");
rs.next();
if(rs.getInt("count(*)")!=1)
{
%>
	 		   <img class="img-responsive" src="images/updateLive1.jpg" style="max-width: 100%; height: auto; display: inline-block; width: 100%;">
 <%
}else{%>
			
			<center>
	 		   <img class="img-responsive" src="images/auction.png" style="max-width: 100%; height: auto; display: inline-block; width: 100%; padding: 2%;">
	 		</center>
	 		<center>
	 			<div style="border-color: black;border: 2px solid;width: 27%;background-color: white;height: 30px;padding: 0px 0px;">
	 				<span id="score-half-text">FIRST HALF</span>
	 			</div></center>
				<div class="row">
				
				<%
				rs=null;
					rs = DBManager.fetchQuery("select mid,tid1,(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.tourId="+tourId+" and tt.ttId=tid1) as tname1,(select lcase(SUBSTRING_INDEX(tFlag,'/',-1)) as flag from team t,tourTeam tt where t.tId=tt.tId and tt.tourId="+tourId+" and tt.ttId=tid1) as tflag1,tid2,(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.tourId="+tourId+" and tt.ttId=tid2) as tname2,(select lcase(SUBSTRING_INDEX(tFlag,'/',-1)) as flag from team t,tourTeam tt where t.tId=tt.tId and tt.tourId="+tourId+" and tt.ttId=tid2) as tflag2 from wmatch where tourId="+tourId+" and flag='1'");
					if(rs.next()){
					
						rs1=DBManager.fetchQuery("select (select count(ttId) from tourGoal where mid="+rs.getInt("mid")+" and tourId="+tourId+" and ttId="+rs.getInt("tid1")+") as goal1,(select count(ttId) from tourGoal where mid="+rs.getInt("mid")+" and tourId="+tourId+" and ttId="+rs.getInt("tid2")+") as goal2;");
						rs1.next();
				%>
				
				  <div class="col-md-12" style="margin-top: 17%;">
					<img class="img-responsive pull-left team1" src="images/ScoreBoard_Logo/<%=rs.getString("tflag1")%>">
					<div class="clearfix">
						<span class="num" style="font-size: 79px;float: left;margin-left: 15%;color: #000;margin-top:-10%"><%=rs1.getInt("goal1") %></span>
						<span style="font-size: 79px;float: left;margin-left: 6%;color: #000;margin-top:-10%">-</span> 
						<span style="font-size: 79px;color: #000;float: left;margin-left: 7%;margin-top:-10%"><%=rs1.getInt("goal2") %></span>
					</div>
					<img class="img-responsive pull-right team2" src="images/ScoreBoard_Logo/<%=rs.getString("tflag2")%>">
				  </div>
				
				</div>
				<div class="row">
				<div class="col-md-5 col-xs-5">
					<span id="tname1"><%=rs.getString("tname1") %></span>
				</div>
				<div class="col-md-2 col-xs-2" >
					<span id="vs">VS</span>
				</div>
				<div class="col-md-5 col-xs-5">
					<span id="tname2"><%=rs.getString("tname2") %></span>
				</div>
				<%twon=rs.getInt("mid"); %>
				<%} %>
				
				</div>
					
				<div class="row" style="padding: 1% 2%;background-color: skyblue;margin-top: 3.2%;width: 102.2%;height:15%">
					<div class="col-md-12 col-lg-12" style="margin-left:2%;font-size:25px;">
					<%
					rs1=null;
					rs1=DBManager.fetchQuery("select twon from print_match where mid="+rs.getInt("mid"));
					rs1.next();
					%>
					
					<span>
					
					TOSS WON BY <b><%=rs1.getString("twon") %></b>
					</span></div>
				
				</div>
				 <%} %>
 		</div>


</body>
</html>