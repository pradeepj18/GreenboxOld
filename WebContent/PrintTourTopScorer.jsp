<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Print TOP SCORER</title>
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">

  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
<div class="col-xs-2 "></div>
<div class=" col-xs-8">
  <h2>TOURNAMENT TOP SCORER</h2>
  <table class="table table-bordered table-responsive" style="width:100%;">
    <thead>
      <tr>
        <th>SRNO</th>
        <th>PLAYER NAME</th>
        <th>TEAM</th>
        <th>TOTAL GOAL</th>
        <th>TOTAL FOUL</th>
      </tr>
    </thead>
    <tbody>
   
        <%
int tourId=1;
DBManager.loadDriver();
ResultSet rs=null,rs1=null;
int i=1;
//rs=DBManager.fetchQuery("select ttId,barcodeId,count(barcodeId) gcount from tourGoal where tourId="+tourId+" group by barcodeId order by gcount desc;");
rs=DBManager.fetchQuery("select ttId,barcodeId,count(barcodeId) gcount,(select count(tf.barcodeId) from tourFoul tf where tf.barcodeId=tg.barcodeId) as fcount from tourGoal tg where tourId="+tourId+" group by barcodeId order by gcount desc;");

while(rs.next())
{
	if(i<=10)
	{
	
//System.out.println("select (select t.tName from team t where tid in (select tid from tourTeam where ttId="+rs.getInt("ttId")+" and tourId="+tourId+")) as tname,(select m.fName from member m where barcodeId="+rs.getInt("barcodeId")+") as fname,(select m.lName from member m where barcodeId="+rs.getInt("barcodeId")+") as lname,(select m.photo from member m where barcodeId="+rs.getInt("barcodeId")+") as photo;");	
rs1=DBManager.fetchQuery("select (select t.tName from team t where tid in (select tid from tourTeam where ttId="+rs.getInt("ttId")+" and tourId="+tourId+")) as tname,(select m.fName from member m where barcodeId="+rs.getInt("barcodeId")+") as fname,(select m.lName from member m where barcodeId="+rs.getInt("barcodeId")+") as lname,(select m.photo from member m where barcodeId="+rs.getInt("barcodeId")+") as photo;");	
if(rs1.next())
{
	%>
	<tr style="background-color: #d9ffcc">
	
	<td><%=i %></td>
<td><%= rs1.getString("fName")%>&nbsp;&nbsp;<%= rs1.getString("lName")%></td>
<td><%= rs1.getString("tname")%></td>
<td><%=rs.getInt("gcount") %></td>
<td><%=rs.getInt("fcount") %></td>
</tr>
<% 
}
//out.println("td>"+rs1.getString("tname")+" -> "+rs1.getString("fName")+" "+rs1.getString("lName")+" --> "+rs.getInt("gcount")+"<br>");	

}
	else
	{
		rs1=DBManager.fetchQuery("select (select t.tName from team t where tid in (select tid from tourTeam where ttId="+rs.getInt("ttId")+" and tourId="+tourId+")) as tname,(select m.fName from member m where barcodeId="+rs.getInt("barcodeId")+") as fname,(select m.lName from member m where barcodeId="+rs.getInt("barcodeId")+") as lname,(select m.photo from member m where barcodeId="+rs.getInt("barcodeId")+") as photo;");	
		if(rs1.next())
		{
			%>
			<tr>
			
			<td><%=i %></td>
		<td><%= rs1.getString("fName")%>&nbsp;&nbsp;<%= rs1.getString("lName")%></td>
		<td><%= rs1.getString("tname")%></td>
		<td><%=rs.getInt("gcount") %></td>
<td><%=rs.getInt("fcount") %></td>
		</tr>
		<% 
		}	
	}
i++;
}
%>
      
    </tbody>
  </table>
  <div class="col-xs-2 "></div>
</div>

</div>

</body>
</html>