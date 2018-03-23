<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="DBManager.DBManager,java.sql.*,java.util.Date,java.text.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PRINT MATCH SUMMARY</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style>
body
{
font-family:ROBOTO;
}
.player
{
font-size:10pt;
width:50%;
}
.title
{
font-size:15pt;
}
.gfc
{
font-size:15pt;
}
</style>
</head>

<body>
<%
	int tAscore=0,tBscore=0,tid=0;
String status="";
		Date dnow = new Date();
		SimpleDateFormat yy = new SimpleDateFormat("yyyy-MM-dd");
		String mdate = yy.format(dnow);
		DBManager.loadDriver();
		ResultSet rs = null,rs1=null;
		rs=DBManager.fetchQuery("select UCASE(DATE_FORMAT(now(),'%d %M %Y')) as mdate;");
		//if(rs.next())
		//	mdate=rs.getString("mdate");
	%>
<div class="container">
<div class="row">
<div class="col-md-12">
<center><h2>MATCH SUMMARY&nbsp;&nbsp;-&nbsp;&nbsp;<%=mdate %></h2></center><br>
<% 
int i=1;
rs=null;
rs = DBManager.fetchQuery(
		"select mid,tid1,(select tName from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tid1 and tourId="
				+ request.getParameter("tourId")
				+ ") as tname1,tid2,(select tName from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tid2 and tourId="
				+ request.getParameter("tourId")
				+ ") as tname2,gender,pool,TIME_FORMAT(mtime,'%H:%i') as time,w.Flag,tourId from wmatch w where tourId="
				+ request.getParameter("tourId") + " and Flag='2'");

while(rs.next())
{
	tAscore=0;tBscore=0;tid=0;status="";
%>

<div class="panel panel-primary">
<div class="panel-heading">
<div class="row">
<div class="col-md-3"><center><span>#MATCH NO&nbsp;<%=i %></span></center></div>
<div class="col-md-6"><center><span><%=rs.getString("tname1") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString("tname2") %></span></center></div>
<div class="col-md-3"><center><span>#POOL&nbsp;&nbsp;&#<%=rs.getInt("pool")+64 %></span></center></div>
</div>
</div>

<div class="panel-body">
<div class="row" style="font-size:20pt;color:blue;">
<%
rs1=null;
rs1=DBManager.fetchQuery("select (select count(gno)  from tourGoal where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+") as tAscore,(select count(gno)  from tourGoal where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+") as tBscore;");
if(rs1.next())
{
	tAscore=rs1.getInt("tAscore");
	tBscore=rs1.getInt("tBscore");
	if(tAscore==tBscore)
		status="MATCH DRAW";
	else if(tAscore<tBscore)
	{
	status=""+rs.getString("tname2")+" WON THE MATCH";
	}
	else
	{
		status=""+rs.getString("tname1")+" WON THE MATCH";	
	}
//rs1=DBManager.fetchQuery("select (select count(gno)  from tourGoal where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and gtype='1') as tAscoreHF1,(select count(gno)  from tourGoal where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and gtype='2') as tAscoreHF2,(select count(gno)  from tourGoal where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and gtype='G') as tAscoreG,(select count(gno)  from tourGoal where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and gtype='P') as tAscoreP;");
%>
<div class="col-md-5">
<center><span style="float:right;"><%=rs.getString("tname1") %></span></center></div>
<div class="col-md-2"><center><span ><%=rs1.getInt("tAscore") %>&nbsp;&nbsp;-&nbsp;&nbsp;<%=rs1.getInt("tBscore") %></span></center></div>
<div class="col-md-5"><center><span style="float:left;"><%=rs.getString("tname2") %></span></center></div>
<%} %>
</div><hr>
<div class="row title">
<div class="col-md-12"><center><span>FIRST HALF</span></center></div>
</div>
<div class="row title">
<!-- First half 1st team start -->

<div class="col-md-6">

<div class="row">

<div class="col-md-4">
<%
rs1=null;
rs1=DBManager.fetchQuery("select (select count(gno)  from tourGoal where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and gtype='1') as tAscoreHF1;");
rs1.next();
%>
<center><span>GOAL&nbsp;(&nbsp;<%=rs1.getInt("tAscoreHF1") %>&nbsp;)</span></center>
</div>
<div class="col-md-4">
<%
rs1=null;
rs1=DBManager.fetchQuery("select (select count(fno)  from tourFoul where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and ftype='1') as tAscoreHF1");
rs1.next();
%>
<center><span>FOUL&nbsp;(&nbsp;<%=rs1.getInt("tAscoreHF1") %>&nbsp;)</span></center>
</div>
<div class="col-md-4">
<%
rs1=null;
rs1=DBManager.fetchQuery("select (select count(cno)  from tourCard where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and ctype='1' and cname='Y') as tAYHF1,(select count(cno)  from tourCard where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and ctype='1' and cname='R') as tARHF1,(select count(cno)  from tourCard where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and cname='Y') as tAY,(select count(cno)  from tourCard where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and cname='R') as tAR;");
rs1.next();
%>
<center><span>CARD&nbsp;(&nbsp;<b style="color:yellow"><%=rs1.getInt("tAYHF1") %></b>&nbsp;/&nbsp;<b style="color:red"><%=rs1.getInt("tARHF1") %></b>&nbsp;)</span></center>
</div>
</div>
</div>
<!-- First half 1st team end -->

<!-- First half 2nd team start -->
<div class="col-md-6">

<div class="row">
<div class="col-md-4">
<%
rs1=null;
rs1=DBManager.fetchQuery("select (select count(gno)  from tourGoal where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+" and gtype='1') as tBscoreHF1");
rs1.next();
%>
<center><span>GOAL&nbsp;(&nbsp;<%=rs1.getInt("tBscoreHF1") %>&nbsp;)</span></center>
</div>
<div class="col-md-4">
<%
rs1=null;
rs1=DBManager.fetchQuery("select (select count(fno)  from tourFoul where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+" and ftype='1') as tBscoreHF1");
rs1.next();
%>
<center><span>FOUL&nbsp;(&nbsp;<%=rs1.getInt("tBscoreHF1") %>&nbsp;)</span></center>
</div>
<div class="col-md-4">
<%
rs1=null;
rs1=DBManager.fetchQuery("select (select count(cno)  from tourCard where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+" and ctype='1' and cname='Y') as tBYHF1,(select count(cno)  from tourCard where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+" and ctype='1' and cname='R') as tBRHF1,(select count(cno)  from tourCard where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+" and cname='Y') as tBY,(select count(cno)  from tourCard where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+" and cname='R') as tBR;");
rs1.next();
%>
<center><span>CARD&nbsp;(&nbsp;<b style="color:yellow"><%=rs1.getInt("tBYHF1") %></b>&nbsp;/&nbsp;<b style="color:red"><%=rs1.getInt("tBRHF1") %></b>&nbsp;)</span></center>
</div>
</div>
</div>
</div><hr>
<!-- First half 2nd team end -->


 <div class="row ">
<div class="col-md-6 player">
<!------------------------------ First half 1st team players  --------------------------->
<div class="col-md-4">
<%
rs1=null;
rs1=DBManager.fetchQuery("select barcodeId,count(*) as goal,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourGoal tg where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and gtype='1' group by barcodeId;");
if(rs1.next())
{
	rs1.beforeFirst();
	while(rs1.next()){
%>
<center><span><%=rs1.getString("fname")+" "+rs1.getString("lname")+" " %>(&nbsp;<%=rs1.getInt("goal") %>&nbsp;)</span></center>
<%}}else{ %>
<span>&nbsp;&nbsp;</span>
<%} %>
</div>
<!-- 1st half 1st team player foul -->
<div class="col-md-4">
<%
rs1=null;
rs1=DBManager.fetchQuery("select barcodeId,count(*) as foul,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourFoul tg where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and ftype='1' group by barcodeId;");
if(rs1.next())
{
	rs1.beforeFirst();
	while(rs1.next()){
%>
<span><%=rs1.getString("fname")+" "+rs1.getString("lname")+" " %>(&nbsp;<%=rs1.getInt("foul") %>&nbsp;)</span>
<%}}else{ %>
<span>&nbsp;&nbsp;</span>
<%} %>
</div>
<!-- 1st half 1st team player card -->
<div class="col-md-4">
<%
rs1=null;
ResultSet rs2=null;
rs1=DBManager.fetchQuery("select barcodeId,count(*) as ycard,cname,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourCard tg where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and ctype='1' and cname='Y' group by barcodeId;");
rs2=DBManager.fetchQuery("select barcodeId,count(*) as rcard,cname,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourCard tg where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and ctype='1' and cname='R' group by barcodeId;");
if(rs1.next() ||rs2.next())
{
	rs1.beforeFirst();
	rs2.beforeFirst();
while(rs1.next())
{
%>
<center><span><%=rs1.getString("fname")+" "+rs1.getString("lname")+" " %>(&nbsp;<%=rs1.getInt("ycard") %>&nbsp;<%=rs1.getString("cname") %>)</span></center>
 
<%}
while(rs2.next())
{%>
	<center><span><%=rs2.getString("fname")+" "+rs2.getString("lname")+" " %>(&nbsp;<%=rs2.getInt("rcard") %>&nbsp;<%=rs2.getString("cname") %>)</span></center>
<% }} %>
</div>
</div>

<!------------------------------ First half 2nd team players  --------------------------->
<div class="col-md-6 player">
<!-- 1st half 1st team player goal -->
<div class="col-md-4">
<%
rs1=null;
rs1=DBManager.fetchQuery("select barcodeId,count(*) as goal,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourGoal tg where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+" and gtype='1' group by barcodeId;");
if(rs1.next())
{
	rs1.beforeFirst();
	while(rs1.next()){
%>
<center><span><%=rs1.getString("fname")+" "+rs1.getString("lname")+" " %>(&nbsp;<%=rs1.getInt("goal") %>&nbsp;)</span></center>
<%}}else{ %>
<span>&nbsp;&nbsp;</span>
<%} %>
</div>
<!-- 1st half 1st team player foul -->
<div class="col-md-4">
<%
rs1=null;
rs1=DBManager.fetchQuery("select barcodeId,count(*) as foul,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourFoul tg where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+" and ftype='1' group by barcodeId;");
if(rs1.next())
{
	rs1.beforeFirst();
	while(rs1.next()){
%>
<span><%=rs1.getString("fname")+" "+rs1.getString("lname")+" " %>(&nbsp;<%=rs1.getInt("foul") %>&nbsp;)</span>
<%}}else{ %>
<span>&nbsp;&nbsp;</span>
<%} %>
</div>
<!-- 1st half 1st team player card -->
<div class="col-md-4">
<%
rs1=null;
rs2=null;
rs1=DBManager.fetchQuery("select barcodeId,count(*) as ycard,cname,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourCard tg where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+" and ctype='1' and cname='Y' group by barcodeId;");
rs2=DBManager.fetchQuery("select barcodeId,count(*) as rcard,cname,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourCard tg where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+" and ctype='1' and cname='R' group by barcodeId;");
if(rs1.next() ||rs2.next())
{
	rs1.beforeFirst();
	rs2.beforeFirst();
while(rs1.next())
{
%>
<center><span><%=rs1.getString("fname")+" "+rs1.getString("lname")+" " %>(&nbsp;<%=rs1.getInt("ycard") %>&nbsp;<%=rs1.getString("cname") %>)</span></center>
 
<%}
while(rs2.next())
{%>
	<center><span><%=rs2.getString("fname")+" "+rs2.getString("lname")+" " %>(&nbsp;<%=rs2.getInt("rcard") %>&nbsp;<%=rs2.getString("cname") %>)</span></center>
<% }} %>
</div>
</div>
</div> 
<hr>

<!-- Second HALF 1st team start -->
<div class="row title">
<div class="col-md-12"><center><span>SECOND HALF</span></center></div>
</div>
<div class="row title">
<div class="col-md-6">
<div class="row">

<div class="col-md-4">
<%
rs1=null;
rs1=DBManager.fetchQuery("select (select count(gno)  from tourGoal where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and gtype='2') as tAscoreHF2");
rs1.next();
%>
<center><span>GOAL&nbsp;(&nbsp;<%=rs1.getInt("tAscoreHF2") %>&nbsp;)</span></center>
</div>
<div class="col-md-4">
<%
rs1=null;
rs1=DBManager.fetchQuery("select (select count(fno)  from tourFoul where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and ftype='2') as tAscoreHF2");
rs1.next();
%>
<center><span>FOUL&nbsp;(&nbsp;<%=rs1.getInt("tAscoreHF2") %>&nbsp;)</span></center>
</div>
<div class="col-md-4">
<%
rs1=null;
rs1=DBManager.fetchQuery("select (select count(cno)  from tourCard where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and ctype='2' and cname='Y') as tAYHF2,(select count(cno)  from tourCard where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and ctype='2' and cname='R') as tARHF2,(select count(cno)  from tourCard where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and cname='Y') as tAY,(select count(cno)  from tourCard where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and cname='R') as tAR;");
rs1.next();
%>
<center><span>CARD&nbsp;(&nbsp;<b style="color:yellow"><%=rs1.getInt("tAYHF2") %></b>&nbsp;/&nbsp;<b style="color:red"><%=rs1.getInt("tARHF2") %></b>&nbsp;)</span></center>
</div>
</div>
</div>
<!-- Second half 1st team end -->

<!-- Second half 2nd team start -->
<div class="col-md-6">
<div class="row">
<div class="col-md-4">
<%
rs1=null;
rs1=DBManager.fetchQuery("select (select count(gno)  from tourGoal where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+" and gtype='2') as tBscoreHF2");
rs1.next();
%>
<center><span>GOAL&nbsp;(&nbsp;<%=rs1.getInt("tBscoreHF2") %>&nbsp;)</span></center>
</div>
<div class="col-md-4">
<%
rs1=null;
rs1=DBManager.fetchQuery("select (select count(fno)  from tourFoul where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+" and ftype='2') as tBscoreHF2");
rs1.next();
%>
<center><span>FOUL&nbsp;(&nbsp;<%=rs1.getInt("tBscoreHF2") %>&nbsp;)</span></center>
</div>
<div class="col-md-4">
<%
rs1=null;
rs1=DBManager.fetchQuery("select (select count(cno)  from tourCard where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+" and ctype='2' and cname='Y') as tBYHF2,(select count(cno)  from tourCard where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+" and ctype='2' and cname='R') as tBRHF2,(select count(cno)  from tourCard where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+" and cname='Y') as tBY,(select count(cno)  from tourCard where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+" and cname='R') as tBR;");
rs1.next();
%>
<center><span>CARD&nbsp;(&nbsp;<b style="color:yellow"><%=rs1.getInt("tBYHF2") %></b>&nbsp;/&nbsp;<b style="color:red"><%=rs1.getInt("tBRHF2") %></b>&nbsp;)</span></center>
</div>
</div>
</div>
</div><hr>
<div class="row">
<div class="col-md-6 player">
<!------------------------------ 2nd half 1st team players  --------------------------->
<div class="col-md-4">
<%
rs1=null;
rs1=DBManager.fetchQuery("select barcodeId,count(*) as goal,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourGoal tg where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and gtype='2' group by barcodeId;");
if(rs1.next())
{
	rs1.beforeFirst();
	while(rs1.next()){
%>
<center><span><%=rs1.getString("fname")+" "+rs1.getString("lname")+" " %>(&nbsp;<%=rs1.getInt("goal") %>&nbsp;)</span></center>
<%}}else{ %>
<span>&nbsp;&nbsp;</span>
<%} %>
</div>
<!-- 1st half 1st team player foul -->
<div class="col-md-4">
<%
rs1=null;
rs1=DBManager.fetchQuery("select barcodeId,count(*) as foul,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourFoul tg where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and ftype='2' group by barcodeId;");
if(rs1.next())
{
	rs1.beforeFirst();
	while(rs1.next()){
%>
<span><%=rs1.getString("fname")+" "+rs1.getString("lname")+" " %>(&nbsp;<%=rs1.getInt("foul") %>&nbsp;)</span>
<%}}else{ %>
<span>&nbsp;&nbsp;</span>
<%} %>
</div>
<!-- 1st half 1st team player card -->
<div class="col-md-4">
<%
rs1=null;
 rs2=null;
rs1=DBManager.fetchQuery("select barcodeId,count(*) as ycard,cname,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourCard tg where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and ctype='2' and cname='Y' group by barcodeId;");
rs2=DBManager.fetchQuery("select barcodeId,count(*) as rcard,cname,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourCard tg where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+" and ctype='2' and cname='R' group by barcodeId;");
if(rs1.next() ||rs2.next())
{
	rs1.beforeFirst();
	rs2.beforeFirst();
while(rs1.next())
{
%>
<center><span><%=rs1.getString("fname")+" "+rs1.getString("lname")+" " %>(&nbsp;<%=rs1.getInt("ycard") %>&nbsp;<%=rs1.getString("cname") %>)</span></center>
 
<%}
while(rs2.next())
{%>
	<center><span><%=rs2.getString("fname")+" "+rs2.getString("lname")+" " %>(&nbsp;<%=rs2.getInt("rcard") %>&nbsp;<%=rs2.getString("cname") %>)</span></center>
<% }} %>
</div>
</div>

<!------------------------------ 2nd half 2nd team players  --------------------------->
<div class="col-md-6 player">
<!-- 1st half 1st team player goal -->
<div class="col-md-4">
<%
rs1=null;
rs1=DBManager.fetchQuery("select barcodeId,count(*) as goal,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourGoal tg where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+" and gtype='2' group by barcodeId;");
if(rs1.next())
{
	rs1.beforeFirst();
	while(rs1.next()){
%>
<center><span><%=rs1.getString("fname")+" "+rs1.getString("lname")+" " %>(&nbsp;<%=rs1.getInt("goal") %>&nbsp;)</span></center>
<%}}else{ %>
<span>&nbsp;&nbsp;</span>
<%} %>
</div>
<!-- 1st half 1st team player foul -->
<div class="col-md-4">
<%
rs1=null;
rs1=DBManager.fetchQuery("select barcodeId,count(*) as foul,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourFoul tg where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+" and ftype='2' group by barcodeId;");
if(rs1.next())
{
	rs1.beforeFirst();
	while(rs1.next()){
%>
<span><%=rs1.getString("fname")+" "+rs1.getString("lname")+" " %>(&nbsp;<%=rs1.getInt("foul") %>&nbsp;)</span>
<%}}else{ %>
<span>&nbsp;&nbsp;</span>
<%} %>
</div>
<!-- 1st half 1st team player card -->
<div class="col-md-4">
<%
rs1=null;
rs2=null;
rs1=DBManager.fetchQuery("select barcodeId,count(*) as ycard,cname,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourCard tg where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+" and ctype='2' and cname='Y' group by barcodeId;");
rs2=DBManager.fetchQuery("select barcodeId,count(*) as rcard,cname,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourCard tg where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+" and ctype='2' and cname='R' group by barcodeId;");
if(rs1.next() ||rs2.next())
{
	rs1.beforeFirst();
	rs2.beforeFirst();
while(rs1.next())
{
%>
<center><span><%=rs1.getString("fname")+" "+rs1.getString("lname")+" " %>(&nbsp;<%=rs1.getInt("ycard") %>&nbsp;<%=rs1.getString("cname") %>)</span></center>
 
<%}
while(rs2.next())
{%>
	<center><span><%=rs2.getString("fname")+" "+rs2.getString("lname")+" " %>(&nbsp;<%=rs2.getInt("rcard") %>&nbsp;<%=rs2.getString("cname") %>)</span></center>
<% }} %>
</div>
</div>
</div> 
</div>
 <div class="panel-footer panel-primary" style="background-color: #3333ff; color:white; font-size:15pt;"><center><%=status %></center></div>
 </div>
 
 <%i++;} %>
 <!-- Panel end here -->
</div>

</div>
</div>
</body>
</html>