<%@ page language="java" contentType="text/html; charset=UTF-8" import="DBManager.DBManager,java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
	String mid=request.getParameter("mid");
	String tourId=request.getParameter("tourId");
	DBManager.loadDriver();
	ResultSet rs= DBManager.fetchQuery("select tid1,(select tName from team where tid=tid1) as tname1,tid2,(select tName  from team where tid=tid2) as tname2 from print_match where mid="+mid+" and tourId="+tourId+";");
	if(rs.next())
	{
%>
	<label>SELECT TEAM</label>
			<select class="select-picker" id="team" name="tname" style="padding-right: 7%;margin-left: 9%;font-family: sans-sarif;">
					<option>Select Team</option>
					<option value="<%=rs.getInt("tid1")%>" onclick="showplayer(<%=rs.getInt("tid1")%>);"><%=rs.getString("tname1") %></option>
					<option value="<%=rs.getInt("tid2")%>" onclick="showplayer(<%=rs.getInt("tid2")%>);"><%=rs.getString("tname2") %></option>
			</select>
	<%} %>

<script>
function getParameter(variable)
{
	var query = window.location.search.substring(1);
	var vars = query.split("&");
	for(var i = 0;i < vars.length;i++)
	{
		var pair = vars[i].split("=");
		if(pair[0] == variable){return pair[1];}
	}
	return (false);
}
</script>
</body>
</html>