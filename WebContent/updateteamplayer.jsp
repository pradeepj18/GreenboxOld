<%@ page language="java" contentType="text/html; charset=UTF-8" import="DBManager.DBManager,java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#select-team{
  width:87%;
  height:100%;
  margin-left:-2.5%;
  font-family: 'lucida grande',tahoma,verdana,arial,sans-serif;
    font-size: 18px;
    font-weight: 300;
    color: #333333;
}

.ajax-teamhead
{
	font-family: 'Open Sans', sans-serif;
	background:  #0E1957;
	color: #ffffff;
    border-left: 1px solid #e4e4e2;
    border-right: 1px solid #e4e4e2;
    border-top: 1px solid #e4e4e2;
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
    display: block;
    font-size: 16px;
    font-weight: bold;
    padding: 8px 0;
    text-align: center;
    margin-left:-3%;
    margin-top: 0;
    width:87.9%;
}
</style>

</head>
<body>
<% 
	try
	{
			DBManager.loadDriver();
			ResultSet rs = null;
			String tourId=request.getParameter("tourId");
			String gen=request.getParameter("ttGender");
%>
			<div class="ajax-teamhead">Select Team</div>
			<select  name="select-team" size=10 id="select-team" onchange="showplayer();">
			<%
			rs=DBManager.fetchQuery("select tt.ttId,t.tName,tt.ttGender from team t,tournament tour,tourTeam tt where t.tId=tt.tId and tour.tourId=tt.tourId and tour.tourId="+tourId+" and tt.ttGender='"+gen+"' ORDER BY tName asc;");
			if(rs.next()){
			%>	<option value="<%=rs.getInt("ttId") %>" selected="selected" style="padding:9px;"><%=rs.getString("tName")%></option>
			<%}
			while(rs.next())
				{
				
			%>
				<option value="<%=rs.getInt("ttId") %>" style="background:#E9F4FF;padding:9px;" ><%=rs.getString("tName")%></option>
				<% if(rs.next()){ %>
				<option value="<%=rs.getInt("ttId") %>" style="padding:9px;"><%=rs.getString("tName")%></option>
			<%     }
			   } %>
				</select>
				

<%
	}
	catch(Exception e)
	{
		System.out.println("updateteamplayer.jsp "+e);
	}
%>
</body>
</html>