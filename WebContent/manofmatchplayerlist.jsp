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
	String tid=request.getParameter("tid");
	String tourId=request.getParameter("tourId");
	DBManager.loadDriver();
	ResultSet rs= DBManager.fetchQuery("select barcodeId,fName,lName from member where barcodeId in(select barcodeId from tourPlayer where ttId="+tid+" and tourId="+tourId+");");
%>

		<label>SELECT TEAM</label>
			<select class="select-picker" id="player" name="pname" style="padding-right: 7%;margin-left: 9%;font-family: sans-sarif;">
					<option>Select player</option>
					<% while(rs.next())
						{
					%>
					<option value="<%=rs.getInt("barcodeId")%>" onclick="showbarcode(<%=rs.getInt("barcodeId")%>)"><%=rs.getString("fName") %> <%=rs.getString("lName") %></option>
					<%} %> 
			</select>
</body>
</html>