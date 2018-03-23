<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="DBManager.DBManager,java.sql.*,java.util.Date,java.text.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href = "css/page-2.css">
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:700" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Roboto:100" rel="stylesheet" type="text/css">
<title>Green Box</title>
<style>

#left
{
	 margin-left: 70px;
}

#center
{
	 margin-left: 90px;
	 margin-top:2px;
}

</style>
</head>
<body>
<div class="container-fluid page-2-container">
  <div class="row">
    <div class="col-md-7 col-xs-12 pointable-background " style="color:#FFFFFF;"> 
    
    <%
    try{
int tourId=1;
int i=0;
int p=0,d=0,won=0;
DBManager.loadDriver();
ResultSet rs=null,rs1=null,rs2=null,rs3=null,rs4=null;
rs=DBManager.fetchQuery("select count(*),pname from tourPool where tourId="+tourId+" and tpgender='M' group by pname;");
if(rs.next())
{
%>  
<table width="70%" size="2" class="table-responsive" cellpadding="1" style="float:right;margin-right: 4%;margin-top: 28%;font-size: 16pt; ">
<tr class="pointable-header "><th width="8%" >&nbsp;&nbsp;Pos</th>
	<th width="22%">GROUP &#<%=(i+65) %></th>
    <th width="5%" >P</th>
    <th width="5%" >W</th>
    <th width="5%" >D</th>
    <th width="5%" >L</th>
    <th width="5%" class="hidden-xs">GF</th>
    <th width="5%" class="hidden-xs">GA</th>
    <th width="5%" class="hidden-xs">GD</th>
    <th width="5%">Pts</th>
 </tr>
 <%
	int j = 0;
 System.out.println("select pname,ttId,(select count(tid1) from print_match pm where pm.tid1 = tp.ttId or pm.tid2 = tp.ttId) as p,(select count(tid1) from print_match pm where pm.tid1 = tp.ttId and pm.tAScore > tBScore ) as win1,(select count(tid2) from print_match pm where pm.tid2 = tp.ttId and pm.tAScore < tBScore ) as win2,(select count(tid1) from print_match pm where pm.tid1 = tp.ttId and pm.tAScore < tBScore ) as loss1,(select count(tid2) from print_match pm where pm.tid2 = tp.ttId and pm.tAScore > tBScore ) as loss2,(select count(tid1) from print_match pm where (pm.tid2=tp.ttId or pm.tid1 = tp.ttId) and pm.tAScore = tBScore ) as draw,(select tName from team t,tourTeam tt where  t.tId=tt.tId and tt.ttId=tp.ttId) as tName,(select count(gno) from tourGoal tg where tg.ttId = tp.ttId) as score,(select sum(tAScore) from print_match pm where pm.tid1 != tp.ttId and pm.tid2 = tp.ttId) as score1,(select sum(tBScore) from print_match pm where pm.tid1 = tp.ttId and pm.tid2 != tp.ttId) as score2 from tourPool tp where tourId="+tourId+" and pname ="+rs.getInt("pName")+" and tpGender='M' order by (win1*3+win2*3 + draw*1)  desc;");
 
 rs1 = DBManager.fetchQuery("select pname,ttId,(select count(tid1) from print_match pm where pm.tid1 = tp.ttId or pm.tid2 = tp.ttId) as p,(select count(tid1) from print_match pm where pm.tid1 = tp.ttId and pm.tAScore > tBScore ) as win1,(select count(tid2) from print_match pm where pm.tid2 = tp.ttId and pm.tAScore < tBScore ) as win2,(select count(tid1) from print_match pm where pm.tid1 = tp.ttId and pm.tAScore < tBScore ) as loss1,(select count(tid2) from print_match pm where pm.tid2 = tp.ttId and pm.tAScore > tBScore ) as loss2,(select count(tid1) from print_match pm where (pm.tid2=tp.ttId or pm.tid1 = tp.ttId) and pm.tAScore = tBScore ) as draw,(select tName from team t,tourTeam tt where  t.tId=tt.tId and tt.ttId=tp.ttId) as tName,(select count(gno) from tourGoal tg where tg.ttId = tp.ttId) as score,(select sum(tAScore) from print_match pm where pm.tid1 != tp.ttId and pm.tid2 = tp.ttId) as score1,(select sum(tBScore) from print_match pm where pm.tid1 = tp.ttId and pm.tid2 != tp.ttId) as score2 from tourPool tp where tourId="+tourId+" and pname ="+rs.getInt("pName")+" and tpGender='M' order by (win1*3+win2*3 + draw*1)  desc;");
 
       while(rs1.next())
      {
    
    	  if(j == 0){
      %>
	 <tr class="pointable tr" height="50">
	 <%}else if(j ==1){ %>
	 	<tr class="pointable tr1" height="50">
	 <%} else if(j == 2){%>
	 	<tr class="pointable1 tr2" height="50">
	 	<%}else {%>
	 	  <tr class="pointable1 " height="50">
	 <%} %>
	 <th width="8%" >&nbsp;&nbsp;<%=j+1 %></th>
	 
	 <th width="22%"><%=rs1.getString("tName") %></th>
	
	<%
    	  p=rs1.getInt("p");
      	  won=rs1.getInt("win1")+rs1.getInt("win2");
      	  d=rs1.getInt("draw");

      %>
	
    <th width="5%" ><%=p %></th>
    <th width="5%" ><%=won %></th>
    <th width="5%" ><%=d %></th>
    <th width="5%" ><%=(p-(d+won)) %></th>
    <th width="5%" class="hidden-xs"><%=rs1.getInt("score")%></th>
    <th width="5%" class="hidden-xs"><%=rs1.getInt("score1") + rs1.getInt("score2")%></th>
    <th width="5%" class="hidden-xs"><%=(rs1.getInt("score"))-(rs1.getInt("score1") + rs1.getInt("score2")) %></th>
    <th width="5%"><%=won*3 + (d*1)%></th>
    </tr>
     <%
     j = j+1;
      } %>
     
 </table>
<%i++;} 

/* SECOND TABLES */
while(rs.next())
{
%>  
<table width="70%" size="2"  class="table-responsive"  cellpadding="1" style="float:right;margin-right: 4%;margin-top: 5%;font-size: 16pt; ">
<tr class="pointable-header "><th width="8%" >&nbsp;&nbsp;Pos</th>
	<th width="22%">GROUP &#<%=(i+65) %></th>
    <th width="5%" >P</th>
    <th width="5%" >W</th>
    <th width="5%" >D</th>
    <th width="5%" >L</th>
    <th width="5%" class="hidden-xs">GF</th>
    <th width="5%" class="hidden-xs">GA</th>
    <th width="5%" class="hidden-xs">GD</th>
    <th width="5%">Pts</th>
 </tr>
<%
	int j = 0;
//System.out.println("select pname,ttId,(select count(tid1) from print_match pm where pm.tid1 = tp.ttId or pm.tid2 = tp.ttId) as p,(select count(tid1) from print_match pm where pm.tid1 = tp.ttId and pm.tAScore > tBScore ) as win1,(select count(tid2) from print_match pm where pm.tid2 = tp.ttId and pm.tAScore < tBScore ) as win2,(select count(tid1) from print_match pm where pm.tid1 = tp.ttId and pm.tAScore < tBScore ) as loss1,(select count(tid2) from print_match pm where pm.tid2 = tp.ttId and pm.tAScore > tBScore ) as loss2,(select count(tid1) from print_match pm where (pm.tid2=tp.ttId or pm.tid1 = tp.ttId) and pm.tAScore = tBScore ) as draw,(select tName from team t,tourTeam tt where  t.tId=tt.tId and tt.ttId=tp.ttId) as tName,(select count(gno) from tourGoal tg where tg.ttId = tp.ttId) as sscore,(select sum(tAScore) from print_match pm where pm.tid1 != tp.ttId and pm.tid2 = tp.ttId) as sscore1,(select sum(tBScore) from print_match pm where pm.tid1 = tp.ttId and pm.tid2 != tp.ttId) as sscore2 from tourPool tp where tourId="+tourId+" and pname ="+rs.getInt("pName")+" and tpGender='M' order by (win1*3+win2*3 + draw*1)  desc;");
rs1 = DBManager.fetchQuery("select pname,ttId,(select count(tid1) from print_match pm where pm.tid1 = tp.ttId or pm.tid2 = tp.ttId) as p,(select count(tid1) from print_match pm where pm.tid1 = tp.ttId and pm.tAScore > tBScore ) as win1,(select count(tid2) from print_match pm where pm.tid2 = tp.ttId and pm.tAScore < tBScore ) as win2,(select count(tid1) from print_match pm where pm.tid1 = tp.ttId and pm.tAScore < tBScore ) as loss1,(select count(tid2) from print_match pm where pm.tid2 = tp.ttId and pm.tAScore > tBScore ) as loss2,(select count(tid1) from print_match pm where (pm.tid2=tp.ttId or pm.tid1 = tp.ttId) and pm.tAScore = tBScore ) as draw,(select tName from team t,tourTeam tt where  t.tId=tt.tId and tt.ttId=tp.ttId) as tName,(select count(gno) from tourGoal tg where tg.ttId = tp.ttId) as score,(select sum(tAScore) from print_match pm where pm.tid1 != tp.ttId and pm.tid2 = tp.ttId) as score1,(select sum(tBScore) from print_match pm where pm.tid1 = tp.ttId and pm.tid2 != tp.ttId) as score2 from tourPool tp where tourId="+tourId+" and pname ="+rs.getInt("pName")+" and tpGender='M' order by (win1*3+win2*3 + draw*1)  desc;");
 
       while(rs1.next())
      {
    
    	  if(j == 0){
      %>
	 <tr class="pointable tr" height="50">
	 <%}else if(j ==1){ %>
	 	<tr class="pointable tr1" height="50">
	 <%} else if(j == 2){%>
	 	<tr class="pointable1 tr2" height="50">
	 	<%}else {%>
	 	  <tr class="pointable1 " height="50">
	 <%} %>
	 <th width="8%" >&nbsp;&nbsp;<%=j+1 %></th>
	 
	 <th width="22%"><%=rs1.getString("tName") %></th>
	
	<%
    	  p=rs1.getInt("p");
      	  won=rs1.getInt("win1")+rs1.getInt("win2");
      	  d=rs1.getInt("draw");
		if(i <= 1){
      %>
	
    <th width="5%" ><%=p %></th>
    <th width="5%" ><%=won %></th>
    <th width="5%" ><%=d %></th>
    <th width="5%" ><%=(p-(d+won)) %></th>
    <th width="5%" class="hidden-xs"><%=rs1.getInt("score")%></th>
    <th width="5%" class="hidden-xs"><%=rs1.getInt("score1") + rs1.getInt("score2")%></th>
    <th width="5%" class="hidden-xs"><%=(rs1.getInt("score"))-(rs1.getInt("score1") + rs1.getInt("score2")) %></th>
    <th width="5%"><%=won*3 + (d*1)%></th>
    </tr>
     <%
	}
	else if(i >=2 && i <= 3){
	%>	
		
    <th width="5%" ><%=p %></th>
    <th width="5%" ><%=won %></th>
    <th width="5%" ><%=d %></th>
   <th width="5%" ><%=(p-(d+won)) %></th>
    <th width="5%" class="hidden-xs"><%=rs1.getInt("score")%></th>
    <th width="5%" class="hidden-xs"><%=rs1.getInt("score1") + rs1.getInt("score2")%></th>
    <th width="5%" class="hidden-xs"><%=(rs1.getInt("score"))-(rs1.getInt("score1") + rs1.getInt("score2")) %></th>
    <th width="5%"><%=won*3 + (d*1)%></th>
    </tr>
	<%
	}
     j = j+1;
      } %>
     
 </table>
<%i++;} %>
</div>


<div class="col-md-5 col-xs-12 ">
<div class="container1 man-match-container" style="height:400px;overflow: hidden;overflow-y: scroll;">      
      <center>
        <button type="button" class="silver-button">MAN OF THE MATCH</button>
      </center>
    
 <%
 	rs2 = null;
 	rs2 = DBManager.fetchQuery("select (select lcase(SUBSTRING_INDEX(tFlag,'/',-1)) as flag from team where tid in(select tid from tourTeam where ttId=mm.ttId and tourId="+tourId+")) as flag,(select fName from member where barcodeId=mm.barcodeId) as fname,(select lName from member where barcodeId=mm.barcodeId) as lname,mid from manofthematch mm where tourId="+tourId+" order by mid desc;");
 	//System.out.println("select (select lcase(SUBSTRING_INDEX(tFlag,'/',-1)) as flag from team where tid in(select tid from tourTeam where ttId=mm.ttId and tourId="+tourId+")) as tName,(select fName from member where barcodeId=mm.barcodeId) as fname,(select lName from member where barcodeId=mm.barcodeId) as lname,mid from manofthematch mm where tourId="+tourId+" order by mid desc limit 5;");
 	if(rs2.next()){
 %>
 	  <div class="row" style="margin-top:25px;">
      <div class="col-md-2  "></div>
      <div class="col-md-8 btn-btn col-xs-12">
        <button type="button" class="small-logo">
        <%System.out.println("AAA"); %>
        <img class="img-responsive" src="images/man-team-logo/<%=rs2.getString("flag") %>" style="max-width: 100%; height: auto; display: inline-block; width: 100%; padding: 2%;"></button>
        <button type="button" class="man-name-container"><span style="color:#FFFFFF" class="pull-left"><%=rs2.getString("fname") %>&nbsp;<%=rs2.getString("lname") %></span></button>
        <button type="button" class="score-man"><span style="color:#FFFFFF"><%=rs2.getInt("mid") %></span></button>
      </div>
      <div class="col-md-2 "></div>
      </div>
 <%	
 	}
 	while(rs2.next()){
 %>     
      
      <div class="row">
      <div class="col-md-2 "></div>
      <div class="col-md-8 btn-btn col-xs-12">
        <button type="button" class="small-logo">
        <img class="img-responsive" src="images/man-team-logo/<%=rs2.getString("flag") %>" style="max-width: 100%; height: auto; display: inline-block; width: 100%; padding: 2%;"></button>
        <button type="button" class="man-name-container"><span style="color:#FFFFFF" class="pull-left"><%=rs2.getString("fname") %>&nbsp;<%=rs2.getString("lname") %></span></button>
        <button type="button" class="score-man"><span style="color:#FFFFFF"><%=rs2.getInt("mid") %></span></button>
      </div>
     <div class="col-md-2 "></div>
    </div>
   <%}
 	%>
    
    </div>
    </div>
    <br><br><br><br>
    <div class="col-md-5 col-xs-12 " >
    <div class="container1 top-match-container" style="height:800px;overflow: hidden;overflow-y: scroll;">
      <center>
        <button type="button" class="silver-button1">TOP SCORER</button>
      </center> 
       <div class="row">
    <div class="col-md-8 btn-btn col-xs-12">
        <button type="button" class="top-score-title ">
        <span style="color:#FFFFFF" class="pull-left" id="left" >PLAYER</span>
        <span style="color:#FFFFFF" class="center-block">TEAM</span>
        <span style="color:#FFFFFF"  class="right" id="right">G</span></button>
        
                <%


rs=null;rs1=null;
i=1;
rs=DBManager.fetchQuery("select ttId,barcodeId,count(barcodeId) gcount from tourGoal where tourId="+tourId+" group by barcodeId order by gcount desc;");
while(rs.next())
{

	
rs1=DBManager.fetchQuery("select (select t.tName from team t where tid in (select tid from tourTeam where ttId="+rs.getInt("ttId")+" and tourId="+tourId+")) as tname,(select m.fName from member m where barcodeId="+rs.getInt("barcodeId")+") as fname,(select m.lName from member m where barcodeId="+rs.getInt("barcodeId")+") as lname,(select m.photo from member m where barcodeId="+rs.getInt("barcodeId")+") as photo;");	
if(rs1.next())
{
	%>
        
        
        <button type="button" class="top-player">
        <span class="green-patch" style="color:#FFFFFF"> <%=i %></span>
        <span class="player-name"><%= rs1.getString("fName")%>&nbsp;<%= rs1.getString("lName")%></span>
        <span class="center-block" id="center"><%= rs1.getString("tname")%></span>
        <span  class="right" id="right-goal"><%=rs.getInt("gcount") %></span>
         </button>
 <%}
	
	i = i+1;
}
    }catch(Exception e){
    	System.out.println(e);
    }
%>        

      </div>
       </div>
     
      <br>
      <br> <br>
      <br> <br>
      <br>
      <br>
    </div>
    </div>

  </div>
</div>

<!-- ______________JAVASCRIPT  JQUERY__________________________ --> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
<!-- Latest compiled and minified JavaScript --> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>