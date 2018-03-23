<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Man of the Match</title>
</head>
<body>
<%
try
{
	DBManager DB = new DBManager();
	DBManager.loadDriver();
	ResultSet rs=null;
	int ttId = Integer.parseInt(request.getParameter("ttId"));
	int barcodeId=Integer.parseInt(request.getParameter("barcodeId"));
	int mid = Integer.parseInt(request.getParameter("mid"));
	int tourId = 1;
	int mmid = DBManager.getMaxId("manofthematch", "mmid");
//	System.out.println("insert into manofthematch values("+mmid+","+ttId+","+barcodeId+","+mid+","+tourId+")");
	int r=DB.insert("insert into manofthematch values("+mmid+","+ttId+","+barcodeId+","+mid+","+tourId+")");
	if(r>1)
	{
		out.println("<script>alert('Added')</script>");
	}
}
catch(Exception e){
	
}
%>
</body>
</html>