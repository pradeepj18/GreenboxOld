<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete Goal Foul Card</title>
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">

  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
</head>
<body>
	<%
	
		String tname = "", pname = "";String jno1="";
		int uid=Integer.parseInt(request.getParameter("uid"));
		int tourId = Integer.parseInt(request.getParameter("tourId"));
		int tid=0 ;
		int mid= Integer.parseInt(request.getParameter("mid"));;
		int jno=0 ;
		int bid=0;
		int gno = Integer.parseInt(request.getParameter("gno"));
		
		
		try {
			DBManager.loadDriver();
			DBManager DB = new DBManager();
			if(uid==1)
			{
			
			System.out.println("delete from tourGoal where gno="+gno+" and mid="+mid+" and tourId="+tourId);
			int r=DB.insert("delete from tourGoal where gno="+gno+" and mid="+mid+" and tourId="+tourId);
			if(r>0)
			{
			gno=DBManager.getMaxId("tourGoal", "gno");
			gno=gno-1;
			
			}
			
			ResultSet rs = DBManager.fetchQuery("select * from tourGoal where gno="+gno+" and mid="+mid+" and tourId="+tourId);
			if(rs.next())
			{
				bid=rs.getInt("barcodeId");
				mid=rs.getInt("mid");
				tid=rs.getInt("ttId");
			}
			rs=null;
			rs=DBManager.fetchQuery("select tName from team where tid in(select tid from tourTeam where ttId=" + tid+ " and tourId=" + tourId + ");");
			if (rs.next()) {
				tname = rs.getString("tName");
			}
			rs = null;
			rs = DBManager.fetchQuery(
					"select m.fName,m.lName,tp.jerseyNo from tourPlayer tp,member m where tp.barcodeId=m.barcodeId and m.barcodeId="
							+ bid + ";");
			if (rs.next()) {
				jno=rs.getInt("jerseyNo");
				pname = rs.getString("fName") + " " + rs.getString("lName");
			}
				if(jno==0)
					jno1="";
				else
					jno1=jno+"";
	%>

	<div class="container-fluid">
		<div class="row">
			
			<div class="col-md-12" >
				<div class="row">
					<div class="col-md-1">
						<span style="float: left;" id="rg1"><%=jno1%></span>
					</div>
					<div class="col-md-5">
						<span style="float: left;" id="rg1"><%=pname%></span>
					</div>
					<div class="col-md-5">
						<span style="float: left;" id="rg1"><%=tname%></span>
					</div>
					<div class="col-md-1">
						<span style="float: right;background-color:#ff0000;" id="rg1"><!-- <button type="button" class="btn btn-danger" ><span class="glyphicon glyphicon-minus"></span></button> --></span>
					</div>
				</div>
				
			</div>
		</div>
	</div>

	<%
			}
			/* ---------------------------------------------------------------------------------------------- */
		
				
			else if(uid==2)
				{
			
				System.out.println("delete from tourFoul where fno="+gno+" and mid="+mid+" and tourId="+tourId);
				int r=DB.insert("delete from tourFoul where fno="+gno+" and mid="+mid+" and tourId="+tourId);
				if(r>0)
				{
					System.out.println("UID2");
				gno=DBManager.getMaxId("tourFoul", "fno");
				gno=gno-1;
				System.out.println("maxid -----------"+gno);
				
				}
				
				ResultSet rs = DBManager.fetchQuery("select * from tourFoul where fno="+gno+" and mid="+mid+" and tourId="+tourId);
				if(rs.next())
				{
					bid=rs.getInt("barcodeId");
					mid=rs.getInt("mid");
					tid=rs.getInt("ttId");
				}
				rs=null;
				rs=DBManager.fetchQuery("select tName from team where tid in(select tid from tourTeam where ttId=" + tid+ " and tourId=" + tourId + ");");
				if (rs.next()) {
					tname = rs.getString("tName");
				}
				rs = null;
				rs = DBManager.fetchQuery(
						"select m.fName,m.lName,tp.jerseyNo from tourPlayer tp,member m where tp.barcodeId=m.barcodeId and m.barcodeId="
								+ bid + ";");
				if (rs.next()) {
					jno=rs.getInt("jerseyNo");
					pname = rs.getString("fName") + " " + rs.getString("lName");
				}
					if(jno==0)
						jno1="";
					else
						jno1=jno+"";
		%>

		<div class="container-fluid">
			<div class="row">
				
				<div class="col-md-12" >
					<div class="row">
						<div class="col-md-1">
							<span style="float: left;" id="rg2"><%=jno1%></span>
						</div>
						<div class="col-md-5">
							<span style="float: left;" id="rg2"><%=pname%></span>
						</div>
						<div class="col-md-5">
							<span style="float: left;" id="rg2"><%=tname%></span>
						</div>
						<div class="col-md-1">
							<span style="float: right;background-color:#ff0000;" id="rg2"><!-- <button type="button" class="btn btn-danger" ><span class="glyphicon glyphicon-minus"></span></button> --></span>
						
						</div>
					</div>
				</div>
				
			</div>
		</div>

		<%
				}
			
			/*  -----------------------------------------------------------------------------*/
			
			else if(uid==3)
				{
				
				gno = Integer.parseInt(request.getParameter("gno"));
				int r=DB.insert("delete from tourCard where cno="+gno+" and mid="+mid+" and tourId="+tourId);
				if(r>0)
				{
				gno=DBManager.getMaxId("tourCard", "cno");
				gno=gno-1;
				System.out.println("maxid -----------"+gno);
				
				}
				
				ResultSet rs = DBManager.fetchQuery("select * from tourCard where cno="+gno+" and mid="+mid+" and tourId="+tourId);
				if(rs.next())
				{
					bid=rs.getInt("barcodeId");
					mid=rs.getInt("mid");
					tid=rs.getInt("ttId");
				}
				rs=null;
				rs=DBManager.fetchQuery("select tName from team where tid in(select tid from tourTeam where ttId=" + tid+ " and tourId=" + tourId + ");");
				if (rs.next()) {
					tname = rs.getString("tName");
				}
				rs = null;
				rs = DBManager.fetchQuery(
						"select m.fName,m.lName,tp.jerseyNo from tourPlayer tp,member m where tp.barcodeId=m.barcodeId and m.barcodeId="
								+ bid + ";");
				if (rs.next()) {
					jno=rs.getInt("jerseyNo");
					pname = rs.getString("fName") + " " + rs.getString("lName");
				}
					if(jno==0)
						jno1="";
					else
						jno1=jno+"";
		%>

		<div class="container-fluid">
			<div class="row">
				
				<div class="col-md-12" >
					<div class="row">
						<div class="col-md-1">
							<span style="float: left;" id="rg3"><%=jno1%></span>
						</div>
						<div class="col-md-5">
							<span style="float: left;" id="rg3"><%=pname%></span>
						</div>
						<div class="col-md-5">
							<span style="float: left;" id="rg3"><%=tname%></span>
						</div>
						<div class="col-md-1">
							<span style="float: right;background-color:#ff0000;" id="rg3"><!-- <button type="button" class="btn btn-danger" ><span class="glyphicon glyphicon-minus"></span></button> --></span>
						
						</div>
					</div>
				</div>
				
			</div>
		</div>

		<%
				}
		/* ------------------------------------------------------------------------------------ */
		
		else if(uid==4)
				{
			gno = Integer.parseInt(request.getParameter("gno"));
				
				int r=DB.insert("delete from tourCard where cno="+gno+" and mid="+mid+" and tourId="+tourId);
				if(r>0)
				{
				gno=DBManager.getMaxId("tourCard", "cno");
				gno=gno-1;
				System.out.println("maxid -----------"+gno);
				
				}
				
				ResultSet rs = DBManager.fetchQuery("select * from tourCard where cno="+gno+" and mid="+mid+" and tourId="+tourId);
				if(rs.next())
				{
					bid=rs.getInt("barcodeId");
					mid=rs.getInt("mid");
					tid=rs.getInt("ttId");
				}
				rs=null;
				rs=DBManager.fetchQuery("select tName from team where tid in(select tid from tourTeam where ttId=" + tid+ " and tourId=" + tourId + ");");
				if (rs.next()) {
					tname = rs.getString("tName");
				}
				rs = null;
				rs = DBManager.fetchQuery(
						"select m.fName,m.lName,tp.jerseyNo from tourPlayer tp,member m where tp.barcodeId=m.barcodeId and m.barcodeId="
								+ bid + ";");
				if (rs.next()) {
					jno=rs.getInt("jerseyNo");
					pname = rs.getString("fName") + " " + rs.getString("lName");
				}
					if(jno==0)
						jno1="";
					else
						jno1=jno+"";
		%>

		<div class="container-fluid">
			<div class="row">
				
				<div class="col-md-12" >
					<div class="row">
						<div class="col-md-1">
							<span style="float: left;" id="rg4"><%=jno1%></span>
						</div>
						<div class="col-md-5">
							<span style="float: left;" id="rg4"><%=pname%></span>
						</div>
						<div class="col-md-5">
							<span style="float: left;" id="rg4"><%=tname%></span>
						</div>
						<div class="col-md-1">
							<span style="float: right;background-color:#ff0000;" id="rg4"><!-- <button type="button" class="btn btn-danger" ><span class="glyphicon glyphicon-minus"></span></button> --></span>
						
						</div>
					</div>
				</div>
				
			</div>
		</div>

		<%
				}
		} catch (Exception e) {
			System.out.println("++Error in GBAddGFC" + e);
		}
	%>
	
</body>
<script>

</script>
</html>