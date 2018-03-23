
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GET TOSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">

  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
<div class="row">

<div class=" col-md-12 " onclick="getscorecard()">
<%
int mid=Integer.parseInt(request.getParameter("mid"));
int tourId=Integer.parseInt(request.getParameter("tourId"));
try
{
DBManager.loadDriver();
ResultSet rs=null;
rs=DBManager.fetchQuery("select mid,gender,tid1,(select tname from team t,tourTeam tt where tt.tId = t.tId and w.tid1 = tt.ttId and tourId="+tourId+") as tname1,tid2,(select tname from team t,tourTeam tt where tt.tId = t.tId and w.tid2 = tt.ttId and tourId="+tourId+") as tname2 from wmatch w where mid="+mid+";");
if(rs.next())
{
%>
<br>
<label style="font-size:15pt;">Current Match Number - <%=mid %></label>
<br>TOSS WON BY - <br>

<input type="radio"  name="tid" id="toss" value="<%=rs.getInt("tid1")%>" onclick="inittoss(<%=rs.getInt("tid1")%>);">&nbsp;&nbsp;<b><%=rs.getString("tname1") %></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="tid" id="toss1" value="<%=rs.getInt("tid2")%>"onclick="inittoss(<%=rs.getInt("tid2")%>);">&nbsp;&nbsp;<b><%=rs.getString("tname2") %></b>
<br><br>
<% 	
}
}
catch(Exception e)
{}
%>
<!-- <span id="GBsc"></span> -->
</div>
</div>
</div>
<script>

/* function getscorecard()
{
 
	var mid = document.getElementById("mid").value;
	var xmlhttp = false;
	if(window.XMLHttpRequest)
	{
		xmlhttp = new XMLHttpRequest();
	}
	
	if(xmlhttp)
	{
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
			{
				document.getElementById("GBsc").innerHTML = xmlhttp.responseText;
			}
		};
	}
	
	xmlhttp.open("GET","GBScoreCard1.jsp?mid="+mid,true);
	xmlhttp.send(null);
} */
</script>
</body>
</html>