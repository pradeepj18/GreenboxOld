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
<div class="row">
<div class="col-md-2"></div>
<div class="col-md-8">

<%
	int tourId=Integer.parseInt(request.getParameter("tourId"));
	try
	{
			DBManager.loadDriver();
			int poolCount = 0;
			int teamCount=0;
			ResultSet rs= null,rs1=null;
			rs = DBManager.fetchQuery("select count(*),pname from tourPool where tourId="+tourId+" and tpgender='M' group by pname;");
			if(!rs.next())
				out.println("<br><br><center>No Boys Pool Found</center>");
			rs.beforeFirst();
			boolean f=true;
			int max=0;
			while(rs.next())
			{
				if(f)
				{
					out.println("<h3><center>POOL (MALE)</center></h3>");
					f=false;
				}
				if(rs.getInt("count(*)")>max)
					max=rs.getInt("count(*)");
				teamCount+=rs.getInt("count(*)");
				poolCount++;
			}
			
			ResultSet[] rss=new ResultSet[poolCount];
		
			%>
			<br>
			<table class="table table-bordered table-responsive" style="width:100%;">
    		<thead>
    		  <tr>
			<%
			int ii=0;
			for(ii=0;ii<poolCount;ii++)
			{
				out.print("<th>POOL &#" +(ii+65)+ "</th>");

				rss[ii]=DBManager.fetchQuery("select *,(select tName from team t where t.tId in(select tId from tourTeam tt where tt.ttId=tp.ttId)) as tName from tourPool tp where  tourId="+tourId+" and tpgender='M' and pname="+(ii+1)+" order by poolId;");
			}
			%>
			  </tr>
    		</thead>
    		<tbody>
			<% 
			out.println("<tr>");
			int k=1;
			for(int i=0;i<max;i++)
			{
				for(int j=0;j<poolCount;j++)
				{
					if(rss[j].next())
					{ 	
						out.print("<td>"+rss[j].getString("tName")+"</td>");						
					}
					else
						out.println("<td></td>");
				}
				out.println("</tr>");
			}
			%>
			</tbody>
			</table>
			<% 
	}
	catch(Exception e){}
	finally{DBManager.close();}
			%>
			</div>
<div class="col-md-2"></div>
</div>
</div>
			
</body>
</html>