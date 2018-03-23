<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UPdate Toss</title>
</head>
<body onLoad="setTimeout('window.blur()', 1000);"
	onFocus="setTimeout('window.blur()', 1000);">
	<form>
		<%
		ResultSet rs=null,rs1=null;
		String gender="";
			try {
				int mid = Integer.parseInt(request.getParameter("mid"));
				
				int tourId = Integer.parseInt(request.getParameter("tourId"));
				
				String uid1 = (request.getParameter("uid"));
				System.out.println("UID = "+uid1);
						
				DBManager.loadDriver();
				int goal1=0,goal2=0,twon=0,g=0;
				DBManager DB = new DBManager();
				if(uid1.equals("1"))
				{
					int toss = Integer.parseInt(request.getParameter("toss"));
				//System.out.println("+++++++++++++++++++");
				int srno = DBManager.getMaxId("print_match", "srno");
				int court = 1;
				int tid1=0,tid2=0;
			
				String tname1="",tname2="",mtype="";
				rs=DBManager.fetchQuery("select mtype,gender,tid1,(select tname from team t,tourTeam tt where tt.tId = t.tId and w.tid1 = tt.ttId and tourId="+tourId+") as tname1,tid2,(select tname from team t,tourTeam tt where tt.tId = t.tId and w.tid2 = tt.ttId and tourId="+tourId+") as tname2 from wmatch w where mid="+mid+";");
				if(rs.next())
				{
				tid1=rs.getInt("tid1");
				tid2=rs.getInt("tid2");
				tname1=rs.getString("tname1");
				tname2=rs.getString("tname2");
				mtype=rs.getString("mtype");
				gender=rs.getString("gender");
				
				rs1 = DBManager.fetchQuery("select time(now()) as t,curdate() as d,tName from team where tid in(select tid from tourTeam where ttId="+toss+")");
				rs1.next();
				
				DB.insert("insert into print_match (mid,mdate,mtime,twon,court,srno,tid1,tid2,mtype,gender,tourId,teamWon,tAscore,tBscore) value(" + mid + ",'"+ rs1.getString("d") + "','" + rs1.getString("t") + "','" + rs1.getString("tName") + "'," + court+ "," + srno + ","+tid1+","+tid2+",'"+mtype+"','"+gender+"',"+tourId+","+twon+","+goal1+","+goal2+");");
				
				
				}
				rs=null;
				rs=DBManager.fetchQuery("select Flag from wmatch where mid="+mid+" and tourId="+tourId+" and gender='"+gender+"';");
				if(rs.next())
				{
					if(rs.getString("Flag").equalsIgnoreCase("0"))
						DB.insert("update wmatch set Flag='1' where mid="+mid+" and tourId="+tourId+" and gender='"+gender+"';");
				}
				}
				else if(uid1.equals("2"))
				{
					System.out.println("+++UID2");
					rs=null;
					rs=DBManager.fetchQuery("select gender from wmatch where mid="+mid+" and tourId="+tourId+";");
					if(rs.next())
					{
					gender=rs.getString("gender");
					rs=null;
					rs=DBManager.fetchQuery("select Flag from wmatch where mid="+mid+" and tourId="+tourId+" and gender='"+gender+"';");
					if(rs.next())
					{
						if(rs.getString("Flag").equalsIgnoreCase("1"))
							DB.insert("update wmatch set Flag='2' where mid="+mid+" and tourId="+tourId+" and gender='"+gender+"';");
					}	
					} 
					rs=null;
					rs1=null;
					rs=DBManager.fetchQuery("select * from print_match where tourId="+tourId+" and mid="+mid+";");
					if(rs.next())
					{
					rs1=DBManager.fetchQuery("select (select count(gno) from tourGoal where tourId="+tourId+" and ttId="+rs.getInt("tid1")+" and mid="+mid+") as goal1,(select count(gno) from tourGoal where tourId="+tourId+" and ttId="+rs.getInt("tid2")+" and mid="+mid+") as goal2;");
					if(rs1.next())
					{
					if(rs1.getInt("goal1")>rs1.getInt("goal2"))
					{
						twon=rs.getInt("tid1");
					}
					else if(rs1.getInt("goal1")<rs1.getInt("goal2"))
					{
						twon=rs.getInt("tid2");
					}
					else
						twon=0;
					DB.insert("update print_match set teamWon="+twon+",tAscore="+rs1.getInt("goal1")+",tBscore="+rs1.getInt("goal2")+" where mid="+mid+";");
					}
					}
				}
		%>
		<script type="text/javascript">
			window.close();
		</script>
		<%
			} catch (Exception e) {
				System.out.println("UPdate Toss " + e);
				e.printStackTrace();
			}
		%>
	</form>
</body>
</html>