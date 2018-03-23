<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Refresh Score</title>
</head>
<body>
<%
DBManager.loadDriver();
ResultSet rs=null;
int tid1=0,tid2=0;
int tAscore=0,tBscore=0;
int flag=Integer.parseInt(request.getParameter("flag"));
rs=DBManager.fetchQuery("select gender,tid1,(select tname from team t,tourTeam tt where tt.tId = t.tId and w.tid1 = tt.ttId and tourId="+request.getParameter("tourId")+") as tname1,tid2,(select tname from team t,tourTeam tt where tt.tId = t.tId and w.tid2 = tt.ttId and tourId="+request.getParameter("tourId")+") as tname2 from wmatch w where mid="+request.getParameter("mid")+";");
if(rs.next())
{
tid1=rs.getInt("tid1");
tid2=rs.getInt("tid2");
}
if(flag==1)
{
rs=null;
rs=DBManager.fetchQuery("select count(gno) as tAscore from tourGoal where tourId="+request.getParameter("tourId")+" and mid="+request.getParameter("mid")+" and ttId="+tid1+";");
if(rs.next())
{
tAscore=rs.getInt("tAscore");
}
out.println(tAscore);
}
else if(flag==2)
{
rs=null;
rs=DBManager.fetchQuery("select count(gno) as tBscore from tourGoal where tourId="+request.getParameter("tourId")+" and mid="+request.getParameter("mid")+" and ttId="+tid2+";");
if(rs.next())
	tBscore=rs.getInt("tBscore");
	out.println(tBscore);
}
%>
</body>
</html>