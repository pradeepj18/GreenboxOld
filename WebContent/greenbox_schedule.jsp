<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*" import="DBManager.DBManager"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> 
<link rel="stylesheet" href="css2/bootstrap.min.css">
<title>Green Box</title>
<style>
table
{
	font-family:ROBOTO;	
}
table, td, th {
    border: 1px solid black;
    text-align:center;
    font-size:12pt;
   /*  text-transform: capitalize; */
}

table {
    border-collapse: collapse;
    width: 100%;
}

th {
    height: 50px;
}
/* @media print 
{
  @page
  {
 	size:A4;
 	margin:0cm 0.8cm 0.0cm -0.5cm;  
  }

} */
</style>
</head>
<body>

	<!-- <div><img src="Flag/1.png" width=1000 height=200></div> -->
	
 	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br> 
<%
	try
	{	
		DBManager.loadDriver();
		ResultSet rs = null;
		rs = DBManager.fetchQuery("select mid,tid1,(select tname from team t,tourTeam tt where tt.tId = t.tId and w.tid1 = tt.ttId and tourId=1) as tname1,tid2,(select tname from team t,tourTeam tt where tt.tId = t.tId and w.tid2 = tt.ttId and tourId=1) as tname2 from wmatch w");
		int i = 1,t = 0;
		String [] mt = {"2:30","3:00","3:30","4:00","4:30","5:00","5:30","6:00","6:30"};
		String [] dt = {"16","17","18","27","28","29","","","","","","",""};
		String [] day= {"MONDAY","TUESDAY","WEDNESDAY","FRIDAY","SATURDAY","SUNDAY","MONDAY","TUESDAY",""};
		int d = 0;
		
%>
		<table>
			<tr style="color:#ff0000;"><th><b>GAME #</b></th><th><b>ROUND #</b></th><th><b>DATE</b></th><th><b>DAY</b><th><b>TIME</b></th><th><b>VENUE</b></th><th><b>GAME DETAIL</b></th></tr>
		<%
			while(rs.next())
			{
				if(t > 7)
				{
					t = 0;
					d = d+1;
				}
				String tname1 = "";
				String tname2 = "";
				String venue = "";
				String mdate = "";
				if(i <= 24)
				{
					venue="GB Riverside";
				}
				else
				{
					venue = "GB Castel Royale";
				}
				//if((i >= 13 && i <= 16) || (i >= 21 && i <= 24) || (i >= 37 && i <= 40) || (i >= 45 && i <= 48))
				{
					tname1 = rs.getString("tname1");
					tname2 = rs.getString("tname2");
				}
				/* else
				{
					tname1 = rs.getString("tname1");
					tname2 = rs.getString("tname2");
				} */
				if(d%2 == 0)
				{
					
		%>
			<tr>
				<td ><center><%=rs.getInt("mid")%></center></td>
				<td><center>RD<%=(d+1) %></center>
				<td><center><%out.println(dt[d]+"-JAN-2017"); %></center></td>
				<td><center><%=day[d] %></center></td>
				<td><%=mt[t] %> - <%=mt[t+1] %></td>
				<td><%=venue %></td>
				<td><%=tname1 %> <b>v</b> <%=tname2 %></td>

				
			</tr>
 		<%      }
				else
				{
			%>
			<tr  style="background-color:#8cff66;">
				<td><center><%=rs.getInt("mid")%></center></td>
				<td><center>RD<%=(d+1) %></center>
				<td><center><%out.println(dt[d]+"-JAN-2017"); %></center></td>
				<td><center><%=day[d] %></center></td>
				<td><%=mt[t] %> - <%=mt[t+1] %></td>
				<td><%=venue %></td>
				<td><%=tname1 %> <b>v</b> <%=tname2 %></td>

				
			</tr>
			
		<%} i = i+1;t = t+1;} %>
		
		
		<%
	String [] day1= {"FRIDAY","SATURDAY","SUNDAY"};
	String [] type={"QF1","QF2","QF3","QF4"};
	String [] type1={"SF1","SF2"};
	String [] mdate={"27","28","29"};
	String [] mt1 = {"4:30","5:00","5:30","6:00","6:30"};
	String [] mt2 = {"5:30","6:00","6:30"};
	String [] matchs = {"A1 v B2","B1 v A2","C1 v D2","D1 v C2"};
	String [] matchs1= {"QF1 v QF3","QF2 v QF4"};    
	int i1 = 0;
	int j = 0;
	int m = 0;
	int m1 = 0;
%>

	<%for(int ii = 25;ii < 29;ii++){ 
		if(j > 3)
		{
			j = 0;
			i1 = i1+1;
		}
		if(m > 11)
		{
			m = 0;
		}
		if(ii >= 25 && ii <= 29)
		{
			if(day1[i1].equals("FRIDAY"))
			{
		%>
				<tr style="background-color:#FFFF;">
		<% 
		System.out.println(i);
		System.out.println(j);
			}
			else{
	%>
		<tr>
		<%} %>
			<td><%=ii %></td>
			<td><%=type[j] %></td>
			<td><%out.println(mdate[i1]+"-JAN-2017"); %></td>
			<td><%=day1[i1] %></td>
			<td><%=mt1[j] %>-<%=mt1[j+1] %></td>
			<td>GB Castel Royale</td>
			<td><%=matchs[m++]%></td>
		</tr>
	<%	j = j+1;	
	
		}
		else if(ii >=38 && ii <= 39)
		{
			
			if(day1[i1].equals("SATURDAY"))
			{
		%>
				<tr style="background-color:#8cff66;">
		<% 
			}
			else{
	%>
		<tr>
		<%} %>
				<td><%=ii %></td>
				<td><%=type1[j] %></td>
				<td><%out.println(mdate[i1]+"-JAN-2017"); %></td>
				<td><%=day1[i1] %></td>
				<td><%=mt2[j] %>-<%=mt2[j+1] %></td>
				<td>GB Castel Royale</td>
				<td><%=matchs1[m1++] %></td>
			</tr>
		<%	j = j+1;	
			
		}
	}	
	%>	
	<tr>
		<td>29</td>
		<td>SEMI-I</td>
		<td>28-JAN-2017</td>
		<td>SATURDAY</td>
		<td>5:30-6:00</td>
		<td>GB Castel Royale</td>
		<td>QF1 V QF3</td>
	</tr>
	<tr>
		<td>30</td>
		<td>SEMI-II</td>
		<td>28-JAN-2017</td>
		<td>SATURDAY</td>
		<td>6:00-6:30</td>
		<td>GB Castel Royale</td>
		<td>QF2 V QF4</td>
	</tr>
	<tr>
		<td>29</td>
		<td>FINAL</td>
		<td>29-JAN-2017</td>
		<td>SUNDAY</td>
		<td></td>
		<td>GB Castel Royale</td>
		<td>FINAL</td>
	</tr>
	</table>
	<%
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
%>
 
</body>
</html>