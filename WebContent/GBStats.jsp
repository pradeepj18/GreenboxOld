<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,DBManager.DBManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Tournament Statistics</title>
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">

  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
</head>
<style>
hr
{
color:black;
background-color:red;
}
</style>
<body>
<%
try
{
int tourId=1;
DBManager.loadDriver();
ResultSet rs=null,rs1=null,rs2=null;
rs=DBManager.fetchQuery(" select mid,(select tName from team where tid in (select tid from tourTeam where ttId=pm.tid1 and mid=pm.mid)) as tname1,(select count(*) from tourGoal where ttId=pm.tid1 and mid=pm.mid) as goal1,(select tName from team where tid in (select tid from tourTeam where ttId=pm.tid2 and mid=pm.mid)) as tname2,(select count(*) from tourGoal where ttId=pm.tid2 and mid=pm.mid) as goal2  from print_match pm where tourId="+tourId+" order by mid;");
%>
<div class="container">
       
  <%-- <table class="table table-bordered">
    <thead>
      <tr>
        <th>MATCH NO</th>
        <th>TEAM NAME</th>
        <th>TOTAL GOAL</th>
        <th>TEAM NAME</th>
        <th>TOTAL GOAL</th>
      </tr>
    </thead>
    <tbody>
<%while(rs.next()){ %>
      <tr>
        <td><%=rs.getInt("mid") %></td>
        <td><%=rs.getString("tname1") %></td>
        <td><%=rs.getInt("goal1") %></td>
        <td><%=rs.getString("tname2") %></td>
        <td><%=rs.getInt("goal2") %></td>
        
      </tr>
  <%} %>
    </tbody>
  </table> --%>
  <h2>TOURNAMENT HISTORY-</h2>
  <%
  rs=null;
  rs=DBManager.fetchQuery("select count(*) as goal from tourGoal where tourId="+tourId+"");
  if(rs.next())
  {
  %>
  <h3>TOTAL GOAL - &nbsp;<b><%=rs.getInt("goal") %></b></h3>
  <%} %>
  <%
  rs=null;
  rs=DBManager.fetchQuery("select count(*) as foul from tourFoul where tourId="+tourId+"");
  if(rs.next())
  {
  %>
  <h3>TOTAL FOUL - &nbsp;<b><%=rs.getInt("foul") %></b></h3>
  <%} %>
  <%
  rs=null;
  rs=DBManager.fetchQuery("select count(*) as card from tourCard where tourId="+tourId+"");
  if(rs.next())
  {
	  rs1=DBManager.fetchQuery("select (select count(*) as card from tourCard where tourId="+tourId+" and cname='Y') as y,(select count(*) as card from tourCard where tourId="+tourId+" and cname='R') as r;");
  		rs1.next();
  %>
  <h3>TOTAL CARD - &nbsp;<b><%=rs.getInt("card") %></b>&nbsp;(YELLOW &nbsp;-&nbsp;<%=rs1.getInt("y") %>&nbsp;,&nbsp;RED &nbsp;-&nbsp;<%=rs1.getInt("r") %>)</h3>
  <%} %>
  <hr>
  <h2>TOURNAMENT TOP SCORER</h2>
  <div class="row">
  <h3><b>
  <div class="col-md-3">PLAYER NAME</div>
  <div class="col-md-2">TEAM NAME</div>
  <div class="col-md-2">GOAL</div>
  </b></h3>
  </div>
  <%
  rs=DBManager.fetchQuery("select ttId,barcodeId,count(barcodeId) gcount from tourGoal where tourId="+tourId+" group by barcodeId order by gcount desc limit 5;");
  while(rs.next())
  {

  	System.out.println("select (select t.tName from team t where tid in (select tid from tourTeam where ttId="+rs.getInt("ttId")+" and tourId="+tourId+")) as tname,(select m.fName from member m where barcodeId="+rs.getInt("barcodeId")+") as fname,(select m.lName from member m where barcodeId="+rs.getInt("barcodeId")+") as lname,(select m.photo from member m where barcodeId="+rs.getInt("barcodeId")+") as photo;");
  rs1=DBManager.fetchQuery("select (select t.tName from team t where tid in (select tid from tourTeam where ttId="+rs.getInt("ttId")+" and tourId="+tourId+")) as tname,(select m.fName from member m where barcodeId="+rs.getInt("barcodeId")+") as fname,(select m.lName from member m where barcodeId="+rs.getInt("barcodeId")+") as lname,(select m.photo from member m where barcodeId="+rs.getInt("barcodeId")+") as photo;");	
  if(rs1.next())
  {
  	%>
  	
  	<div class="row">
  	<h4>
  	
  	<div class="col-md-3"><%= rs1.getString("fName")%>&nbsp;<%= rs1.getString("lName")%></div>
  	<div class="col-md-2"><%= rs1.getString("tname")%></div>
  	<div class="col-md-2"><%=rs.getInt("gcount") %></div>
  	</h4>
  	</div>
  
   <%}
  	
  }

  %>
   <hr>
  <br><br><br><br>
 
  <table class="table table-bordered">
  <thead>
  <tr>
  <th></th>
  <th>FIRST HALF</th>
  <th>SECOND HALF</th>
  <th>PENALTY</th>
  </tr>
  </thead>
  <tbody>
  <%
  rs=null;
  rs=DBManager.fetchQuery("select (select count(*) from tourGoal where gtype=1 and tourId="+tourId+") as 1hf,(select count(*) from tourGoal where gtype=2 and tourId="+tourId+") as 2hf,(select count(*) from tourGoal where gtype='P' and tourId="+tourId+") as p,(select count(*) from tourGoal where gtype='G' and tourId="+tourId+") as g;");
  if(rs.next())
  {
  %>
  <tr>
  <td>GOAL</td>
  <td><%=rs.getInt("1hf") %></td>
  <td><%=rs.getInt("2hf") %></td>
  <td><%=rs.getInt("p") %></td>
  </tr>
  <%} %>
  
  
    <%
  rs=null;
  rs=DBManager.fetchQuery("select (select count(*) from tourFoul where ftype=1 and tourId="+tourId+") as 1hf,(select count(*) from tourFoul where ftype=2 and tourId="+tourId+") as 2hf,(select count(*) from tourFoul where ftype='P' and tourId="+tourId+") as p,(select count(*) from tourFoul where ftype='G' and tourId="+tourId+") as g;");
  if(rs.next())
  {
  %>
  <tr>
  <td>FOUL</td>
  <td><%=rs.getInt("1hf") %></td>
  <td><%=rs.getInt("2hf") %></td>
  <td><%=rs.getInt("p") %></td>
  </tr>
  <%} %>
     <%
  rs=null;
  rs=DBManager.fetchQuery("select (select count(*) from tourCard where ctype=1 and tourId="+tourId+" and cname='Y') as 1hfy,(select count(*) from tourCard where ctype=1 and tourId="+tourId+" and cname='R') as 1hfr,(select count(*) from tourCard where ctype=2 and tourId="+tourId+" and cname='Y') as 2hfy,(select count(*) from tourCard where ctype=2 and tourId="+tourId+" and cname='R') as 2hfr,(select count(*) from tourCard where ctype='P' and tourId="+tourId+" and cname='Y') as py,(select count(*) from tourCard where ctype='P' and tourId="+tourId+" and cname='R') as pr;");
  if(rs.next())
  {
  %>
  <tr>
  <td>FOUL</td>
  <td>(Y &nbsp;-&nbsp;<%=rs.getInt("1hfy") %>&nbsp;,&nbsp;R &nbsp;-&nbsp;<%=rs.getInt("1hfr") %>)</td>
  <td>(Y &nbsp;-&nbsp;<%=rs.getInt("2hfy") %>&nbsp;,&nbsp;R &nbsp;-&nbsp;<%=rs.getInt("2hfr") %>)</td>
  <td><%-- (YELLOW &nbsp;-&nbsp;<%=rs.getInt("py") %>&nbsp;,&nbsp;RED &nbsp;-&nbsp;<%=rs.getInt("pr") %>) --%>-</td>
  </tr>
  <%} %>
  </tbody>
  </table>
<hr>
   
   
   
   <h3>GOAL HAT-TRICK</h3>
   <div class="row">
  <table class="table table-bordered">
  <thead>
  <tr>
  <th>MATCH NO</th>
  <th>TEAM NAME</th>
  <th>PLAYER NAME</th>
  <th>GOAL SCORED</th>
  </tr>
  </thead>
  <tbody>
   <%
   
   rs=null;rs1=null;
   int count=0;
   rs=DBManager.fetchQuery("select mid,count(*) as goal from tourGoal group by mid having goal>=3;");
   while(rs.next())
   {
	   rs1=DBManager.fetchQuery("select mid,barcodeId,(select tName from team where tid in (select tid from tourTeam where ttId=tg.ttId)) as tname,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname,count(barcodeId) as goal from tourGoal tg where tg.mid="+rs.getInt("mid")+" and tourId="+tourId+" group by barcodeId having goal>=3");
	
	   while(rs1.next())
	   {
		   %>
		   	<tr>
 			 	<td><%=rs1.getInt("mid") %></td>
  				<td><%=rs1.getString("tname") %></td>
  				<td><%=rs1.getString("fname") %>&nbsp;<%=rs1.getString("lname") %></td>
  				<td><%=rs1.getString("goal") %></td>
  			</tr>
		   <% 
		   count++;
	   }
   }
   %>
   </tbody>
   </table>
   <h3>TOTAL HAT-TRICK &nbsp;-&nbsp;<%=count %></h3>
   </div>
   <hr>
     <h3>TEAM PERFORMANCE</h3>
   <div class="row">
  <table class="table table-bordered">
  <thead>
  <tr>
  <th>TEAM NAME</th>
  <th>GOAL SCORED</th>
  <th>FOUL</th>
  <th>YELLOW CARD</th>
  <th>RED CARD</th>
  </tr>
  </thead>
  <tbody>
   <%
   
 rs1=null;

   rs1=DBManager.fetchQuery("select ttId,(select tName from team where tid in(select tid from tourTeam where ttId=tt.ttId)) as tname,(select lcase(SUBSTRING_INDEX(tFlag,'/',-2)) from team where tid in(select tid from tourTeam where ttId=tt.ttId)) as flag,(select count(ttId) from tourGoal where ttId=tt.ttId and tourId="+tourId+") as goal,(select count(ttId) from tourFoul where ttId=tt.ttId and tourId="+tourId+") as foul,(select count(ttId) from tourCard where cname='Y' and ttId=tt.ttId and tourId="+tourId+") as y,(select count(ttId) from tourCard where cname='R' and ttId=tt.ttId and tourId="+tourId+") as r from tourTeam tt where tourId="+tourId+";");
   System.out.println("+++select ttId,(select tName from team where tid in(select tid from tourTeam where ttId=tt.ttId)) as tname,(select lcase(SUBSTRING_INDEX(tFlag,'/',-2)) from team where tid in(select tid from tourTeam where ttId=tt.ttId)) as flag,(select count(ttId) from tourGoal where ttId=tt.ttId and tourId="+tourId+") as goal,(select count(ttId) from tourFoul where ttId=tt.ttId and tourId="+tourId+") as foul,(select count(ttId) from tourCard where cname='Y' and ttId=tt.ttId and tourId="+tourId+") as y,(select count(ttId) from tourCard where cname='R' and ttId=tt.ttId and tourId="+tourId+") as r from tourTeam tt where tourId="+tourId+";");
   while(rs1.next())
   {
	   %>
		   	<tr>
  				<td><%=rs1.getString("tname") %></td>
  				<td><%=rs1.getInt("goal") %></td>
  				<td><%=rs1.getInt("foul") %></td>
  				<td><%=rs1.getInt("y") %></td>
  				<td><%=rs1.getInt("r") %></td>
  			</tr>
		   <% 
   }
   %>
   </tbody>
   </table>
   </div>
   <hr>
   <h2>PLAYER'S LIST WITH RED CARD</h2>
    <%
  rs=null;
  rs=DBManager.fetchQuery("select mid, (select tName from team where tid in (select tid from tourTeam where ttId=tc.ttId)) as tname,(select m.fName from member m where barcodeId=tc.barcodeId ) as fName,(select m.lName from member m where barcodeId=tc.barcodeId ) as lName from tourCard tc where cname='R' and tourId="+tourId+";");
  %>
  <div class="row">
  <table class="table table-bordered">
  <thead>
  <tr>
  <th>MATCH NO</th>
  <th>TEAM NAME</th>
  <th>PLAYER NAME</th>
  </tr>
  </thead>
  <tbody>
  <%
  while(rs.next())
  {
  %>
  <tr>
  <td><%=rs.getInt("mid") %></td>
  <td><%=rs.getString("tname") %></td>
  <td><%=rs.getString("fName") %>&nbsp;<%=rs.getString("lName") %></td>
  </tr>
  <%} %>
  </tbody>
  </table>
  </div>
   <hr>
  
   
   <h2>PLAYER'S LIST WITH YELLOW CARD</h2>
    <%
  rs=null;
  rs=DBManager.fetchQuery("select mid, (select tName from team where tid in (select tid from tourTeam where ttId=tc.ttId)) as tname,(select m.fName from member m where barcodeId=tc.barcodeId ) as fName,(select m.lName from member m where barcodeId=tc.barcodeId ) as lName from tourCard tc where cname='Y' and tourId="+tourId+";");
  %>
  <div class="row">
  <table class="table table-bordered">
  <thead>
  <tr>
  <th>MATCH NO</th>
  <th>TEAM NAME</th>
  <th>PLAYER NAME</th>
  </tr>
  </thead>
  <tbody>
  <%
  while(rs.next())
  {
  %>
  <tr>
  <td><%=rs.getInt("mid") %></td>
  <td><%=rs.getString("tname") %></td>
  <td><%=rs.getString("fName") %>&nbsp;<%=rs.getString("lName") %></td>
  </tr>
  <%} %>
  </tbody>
  </table>
  </div>
   
</div>
<%}
catch(Exception e){System.out.println(e);}%>
</body>
</html>