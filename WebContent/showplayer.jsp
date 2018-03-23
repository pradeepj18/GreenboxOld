<%@ page language="java" contentType="text/html; charset=UTF-8" import="DBManager.DBManager,java.sql.*,java.lang.Object.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>

</script>
<body>
<!-- <div class="col-md-12"> -->

<%
	try
	{
		DBManager.loadDriver();
		ResultSet rs=null;
		String tourId= request.getParameter("tourId");
		String ttGender=request.getParameter("ttGender");
		String ttId=request.getParameter("ttId");
		String category=request.getParameter("memcategory");
		if(category.equals("1"))
		{
			out.println("<b>PLAYER LIST</b>");
		%>
			 <div class="row">
		     <div class="col-md-3">
		     NAME
		     </div>
		     <div class="col-md-9">
		     JNO
		     </div>
		   </div>
		   
		<%
		
			if(ttId.matches("[0-9]+") && tourId.matches("[0-9]+"))
			{	
				rs=null;
				rs=DBManager.fetchQuery("select jerseyNo,tp.barcodeId,fName,lName from tourPlayer tp,member m where tp.barcodeId=m.barcodeId and tp.tourId="+tourId+" and tp.ttId="+ttId+";");
				if(rs.next())
				{
					rs.beforeFirst();
					while(rs.next())
					{
						%>
						<input type="text" name='fName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("fName") %>" id='fName<%=rs.getString("barcodeId") %>'>
						<input type="text" name='jerseyNo<%=rs.getString("barcodeId") %>' pattern="[0-9]+" value="<%=rs.getInt("jerseyNo") %>" id='jerseyNo<%=rs.getString("barcodeId") %>' style="width:5%;">
						<input type="button" class="btn btn-primary" value="UPDATE" onclick="updateConfirm('<%=rs.getString("barcodeId")%>',<%=category%>)">
						<input type="button" class="btn btn-danger" value="DELETE" onclick="deleteConfirm('<%=rs.getString("barcodeId")%>',<%=category%>)">
						<br>
						<%
					}
				}
				else
				{
			%>
				NO PLAYER
			<%
				}
			}
		}
		else if(category.equals("2"))
		{
			out.println("<b>COACH LIST</b>");
		%>
			 <div class="row">
		     <div class="col-md-3">
		     COACH NAME
		     </div>
		     </div>
		<%
			if(ttId.matches("[0-9]+") && tourId.matches("[0-9]+"))
			{	
				rs=null;
				rs=DBManager.fetchQuery(" select tc.tcId,m.fName,m.mName,m.lName,tc.barcodeId from member m,tourCoach tc where m.barcodeId=tc.barcodeId and tc.tourId="+tourId+" and tc.ttId="+request.getParameter("ttId")+";");
				if(rs.next())
				{
					rs.beforeFirst();
					while(rs.next())
					{
						%>
						<input type="text" name='fName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("fName") %>" id='fName<%=rs.getString("barcodeId") %>'>
						<input type="text" name='mName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("mName") %>" id='mName<%=rs.getString("barcodeId") %>'>
						<input type="text" name='lName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("lName") %>" id='lName<%=rs.getString("barcodeId") %>'>
						<input type="button" class="btn btn-primary" value="UPDATE" onclick="updateConfirm('<%=rs.getString("barcodeId")%>',<%=category%>)">
						<input type="button" class="btn btn-danger" value="DELETE" onclick="deleteConfirm('<%=rs.getString("barcodeId")%>',<%=category%>)">
						<br>
						<%
					}
				}
			else
			{
		%>
				NO COACH
		<%
			}
		}
		}
		else if(category.equals("3"))
		{
			out.println("<b>MANAGER LIST</b>");
		%>
			 <div class="row">
		     <div class="col-md-3">
		     MANAGER NAME
		     </div>
		     </div>
		<%
			if(ttId.matches("[0-9]+") && tourId.matches("[0-9]+"))
			{	
				rs=null;
				rs=DBManager.fetchQuery("select tm.tmId,m.fName,m.mName,m.lName,tm.barcodeId from member m,tourManager tm where m.barcodeId=tm.barcodeId and tm.tourId="+tourId+" and tm.ttId="+ttId+";");
				if(rs.next())
				{
					rs.beforeFirst();
					while(rs.next())
					{
						%>
						<input type="text" name='fName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("fName") %>" id='fName<%=rs.getString("barcodeId") %>'>
						<input type="text" name='mName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("mName") %>" id='mName<%=rs.getString("barcodeId") %>'>
						<input type="text" name='lName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("lName") %>" id='lName<%=rs.getString("barcodeId") %>'>
						<input type="button" class="btn btn-primary" value="UPDATE" onclick="updateConfirm('<%=rs.getString("barcodeId")%>',<%=category%>)">
						<input type="button" class="btn btn-danger" value="DELETE" onclick="deleteConfirm('<%=rs.getString("barcodeId")%>',<%=category%>)">
						<br>
						<%
					}
				}
			else
			{
		%>
				NO MANAGER
		<%
			}
		}
		}
		else if(category.equals("4"))
		{
			out.println("<b>OFFICIAL LIST</b>");
		%>
			 <div class="row">
		     <div class="col-md-3">
		     OFFICIAL NAME
		     </div>
		     </div>
		<%
			if(ttId.matches("[0-9]+") && tourId.matches("[0-9]+"))
			{	
				rs=null;
				rs=DBManager.fetchQuery("select t.toId,m.fName,m.mName,m.lName,t.barcodeId from member m,tourOfficial t where m.barcodeId=t.barcodeId and t.tourId="+tourId+";");
				if(rs.next())
				{
					rs.beforeFirst();
					while(rs.next())
					{
						%>
						<input type="text" name='fName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("fName") %>" id='fName<%=rs.getString("barcodeId") %>'>
						<input type="text" name='mName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("mName") %>" id='mName<%=rs.getString("barcodeId") %>'>
						<input type="text" name='lName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("lName") %>" id='lName<%=rs.getString("barcodeId") %>'>
						<input type="button" class="btn btn-primary" value="UPDATE" onclick="updateConfirm('<%=rs.getString("barcodeId")%>',<%=category%>)">
						<input type="button" class="btn btn-danger" value="DELETE" onclick="deleteConfirm('<%=rs.getString("barcodeId")%>',<%=category%>)">
						<br>
						<%
					}
				}
			else
			{
		%>
				NO OFFICIALS
		<%
			}
		}
		}
		else if(category.equals("5"))
		{
			out.println("<b>TEAM LIST</b>");
		%>
			 <div class="row">
		     <div class="col-md-3">
		     TEAM NAME
		     </div>
		     </div>
		<%
			if(ttId.matches("[0-9]+") && tourId.matches("[0-9]+"))
			{	
				rs=null;
				rs=DBManager.fetchQuery("select tt.ttId,t.tName from team t,tourTeam tt where t.tId=tt.tId and tt.tourId="+tourId+" and tt.ttGender='"+ttGender+"';");
				if(rs.next())
				{
					rs.beforeFirst();
					while(rs.next())
					{
						%>
						<input type="text" name='tName<%=rs.getString("ttId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("tName") %>" id='tName<%=rs.getString("ttId") %>'>
						<input type="button" class="btn btn-primary" value="UPDATE" onclick="updateConfirm('<%=rs.getString("ttId")%>',<%=category%>)">
						<input type="button" class="btn btn-danger" value="DELETE" onclick="deleteConfirm('<%=rs.getString("ttId")%>',<%=category%>)">
						<br>
						<%
					}
				}
			else
			{
		%>
				NO TEAMS
		<%
			}
		}
		}
			
	
	
}
catch(Exception e) 
{
	System.out.println("showplayer.jsp  "+e);
}
%>
<!-- </div> -->
</body>
</html>