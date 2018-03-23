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
</head>
<body>
<div class="container">
<%
int tourId=1;
int i=0;
int p=0,w=0,d=0,l=0,gf=0,ga=0,gd=0,pts=0,loose=0,won=0;
DBManager.loadDriver();
ResultSet rs=null,rs1=null,rs2=null,rs3=null,rs4=null;
rs=DBManager.fetchQuery("select count(*),pname from tourPool where tourId="+tourId+" and tpgender='M' group by pname;");
while(rs.next())
{
%>
  <div class="panel panel-primary">
      <div class="panel-heading">
      <div class="row">
      <div class="col-md-3"><span>POS GROUP &#<%=(i+65) %></span></div>
      <div class="col-md-1"><span>P</span></div>
      <div class="col-md-1"><span>W</span></div>
      <div class="col-md-1"><span>D</span></div>
      <div class="col-md-1"><span>L</span></div>
      <div class="col-md-1"><span>GF</span></div>
      <div class="col-md-1"><span>GA</span></div>
      <div class="col-md-1"><span>GD</span></div>
      <div class="col-md-2"><span>POINTS</span></div>
      
      </div>
      </div>
      <div class="panel-body">
      
      <%
      rs1=DBManager.fetchQuery("select *,(select tName from team t where t.tId in(select tId from tourTeam tt where tt.ttId=tp.ttId)) as tName from tourPool tp where  tourId="+tourId+" and tpgender='M' and pname="+rs.getInt("pname"));
      while(rs1.next())
      {
      %>
      <div class="row">
      <div class="col-md-3"><span><%=rs1.getString("tName") %></span></div>
      <div class="col-md-1">
      <%
      rs2 = DBManager.fetchQuery("select count(tid1) as total,(select count(twon) from print_match where teamWon="+rs1.getInt("ttId")+" and tourId="+tourId+") as win,(select count(teamWon) from print_match where teamWon=0 and (tid1="+rs1.getInt("ttId")+" or tid2 ="+rs1.getInt("ttId")+") and tourId="+tourId+") as draw,(select sum(tAscore) from print_match where tourId="+tourId+" and tid1="+rs1.getInt("ttId")+") as ta1,(select sum(tBscore) from print_match where tourId="+tourId+" and tid2="+rs1.getInt("ttId")+") as ta2,(select sum(tAscore) from print_match where tourId="+tourId+" and tid1!="+rs1.getInt("ttId")+" and tid2="+rs1.getInt("ttId")+") as tb1,( select sum(tBscore) from print_match where tourId="+tourId+" and tid1="+rs1.getInt("ttId")+" and tid2!="+rs1.getInt("ttId")+") as tb2 from print_match where tid1="+rs1.getInt("ttId")+" or tid2="+rs1.getInt("ttId")+" and tourId="+tourId );  
    
      if(rs2.next())
      {
    	  p=rs2.getInt("total");
      	  won=rs2.getInt("win");
      	  d=rs2.getInt("draw");
      }
      %>
      <span><%=p %></span>
      </div>
      <div class="col-md-1">
      <span><%=(won) %></span>
      </div>
      <div class="col-md-1">
         <%
  //    rs2 = DBManager.fetchQuery("select count(tid1) as total,(select count(twon) from print_match where teamWon="+rs1.getInt("ttId")+" and tourId="+tourId+") as win,(select count(teamWon) from print_match where teamWon=0 and (tid1="+rs1.getInt("ttId")+" or tid2 ="+rs1.getInt("ttId")+") and tourId="+tourId+") as draw from print_match where tid1="+rs1.getInt("ttId")+" or tid2="+rs1.getInt("ttId")+" and tourId="+tourId);
   		%>
         <span><%=d%></span>
      </div>
      <div class="col-md-1"><span><%=(p-(d+won)) %></span></div>
      <div class="col-md-1"><span><%=rs2.getInt("ta1")+rs2.getInt("ta2") %></span></div>
      <div class="col-md-1"><span><%=rs2.getInt("tb1")+rs2.getInt("tb2") %></span></div>
      <div class="col-md-1"><span><%=(rs2.getInt("ta1")+rs2.getInt("ta2"))-(rs2.getInt("tb1")+rs2.getInt("tb2")) %></span></div>
      <div class="col-md-2"><span><%=won*3 + (d*1)%></span></div>
      </div>
      <%} %>
      </div>
    </div>
    <%i++;} %>
</div>
<%

%>
</body>
</html>