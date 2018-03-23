<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Goal Foul Card</title>
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">

  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
</head>
<body>

	<%
	int gno=0;
		String tname = "", pname = "";
		int uid=Integer.parseInt(request.getParameter("uid"));
		System.out.println("UID++"+uid);
		int tourId = Integer.parseInt(request.getParameter("tourId"));
		int tid = Integer.parseInt(request.getParameter("tid"));
		int mid = Integer.parseInt(request.getParameter("mid"));
		int jno = Integer.parseInt(request.getParameter("jno"));
		String timer = request.getParameter("time");
		String gtype = request.getParameter("gtype");
		String bid = request.getParameter("bid");
		try {
			DBManager.loadDriver();
			DBManager DB = new DBManager();
			if(uid==1)
			{
			gno=DBManager.getMaxId("tourGoal", "gno");
			//System.out.println(tourId + "  " + tid + "  " + mid + "  " + jno + "  " + timer + "  " + gtype + "  " + bid+" UID "+uid);
			
			int r=DB.insert("insert into tourGoal values("+gno+",'"+timer+"',"+bid+","+tourId+","+mid+","+tid+",'"+gtype+"')");
			
			ResultSet rs = DBManager.fetchQuery("select tName from team where tid in(select tid from tourTeam where ttId=" + tid+ " and tourId=" + tourId + ");");
			if (rs.next()) {
				tname = rs.getString("tName");
			}
			rs = null;
			rs = DBManager.fetchQuery(
					"select m.fName,m.lName,tp.jerseyNo from tourPlayer tp,member m where tp.barcodeId=m.barcodeId and m.barcodeId="
							+ bid + ";");
			if (rs.next()) {
				pname = rs.getString("fName") + " " + rs.getString("lName");
			}
	%>

	<div class="container-fluid">
		<div class="row">
			
			<div class="col-md-12" >
				<div class="row">
					<div class="col-md-1">
						<span style="float: left;" id="rg1"><%=jno%></span>
					</div>
					<div class="col-md-5">
						<span style="float: left;" id="rg1"><%=pname%></span>
					</div>
					<div class="col-md-5">
						<span style="float: left;" id="rg1"><%=tname%></span>
					</div>
					<div class="col-md-1">
						<span style="float: right;background-color:#ff0000;" id="rg1"><button type="button" class="btn btn-danger" onclick="delgoal(<%=gno%>,1,<%=tourId%>,<%=mid%>,1);"><span class="glyphicon glyphicon-minus"></span></button></span>
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
				int fno=DBManager.getMaxId("tourFoul", "fno");
				System.out.println(
						tourId + "  " + tid + "  " + mid + "  " + jno + "  " + timer + "  " + gtype + "  " + bid);
				
				int r=DB.insert("insert into tourFoul values("+fno+",'"+timer+"',"+bid+","+tourId+","+mid+","+tid+",'"+gtype+"')");
				ResultSet rs = DBManager
						.fetchQuery("select tName from team where tid in(select tid from tourTeam where ttId=" + tid
								+ " and tourId=" + tourId + ");");
				if (rs.next()) {
					tname = rs.getString("tName");
				}
				rs = null;
				rs = DBManager.fetchQuery(
						"select m.fName,m.lName,tp.jerseyNo from tourPlayer tp,member m where tp.barcodeId=m.barcodeId and m.barcodeId="
								+ bid + ";");
				if (rs.next()) {
					pname = rs.getString("fName") + " " + rs.getString("lName");
				}
		%>

		<div class="container-fluid">
			<div class="row">
				
				<div class="col-md-12" >
					<div class="row">
						<div class="col-md-1">
							<span style="float: left;" id="rg2"><%=jno%></span>
						</div>
						<div class="col-md-5">
							<span style="float: left;" id="rg2"><%=pname%></span>
						</div>
						<div class="col-md-5">
							<span style="float: left;" id="rg2"><%=tname%></span>
						</div>
						<div class="col-md-1">
							<span style="float: right;background-color:#ff0000;" id="rg2"><button type="button" class="btn btn-danger" onclick="delgoal(<%=fno%>,2,<%=tourId%>,<%=mid%>);"><span class="glyphicon glyphicon-minus"></span></button></span>
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
				int cno=DBManager.getMaxId("tourCard", "cno");
				System.out.println(
						tourId + "  " + tid + "  " + mid + "  " + jno + "  " + timer + "  " + gtype + "  " + bid);
				
				int r=DB.insert("insert into tourCard values("+cno+",'"+timer+"',"+bid+","+tourId+","+mid+","+tid+",'"+gtype+"','Y')");
				ResultSet rs = DBManager
						.fetchQuery("select tName from team where tid in(select tid from tourTeam where ttId=" + tid
								+ " and tourId=" + tourId + ");");
				if (rs.next()) {
					tname = rs.getString("tName");
				}
				rs = null;
				rs = DBManager.fetchQuery(
						"select m.fName,m.lName,tp.jerseyNo from tourPlayer tp,member m where tp.barcodeId=m.barcodeId and m.barcodeId="
								+ bid + ";");
				if (rs.next()) {
					pname = rs.getString("fName") + " " + rs.getString("lName");
				}
		%>

		<div class="container-fluid">
			<div class="row">
				
				<div class="col-md-12" >
					<div class="row">
						<div class="col-md-1">
							<span style="float: left;" id="rg3"><%=jno%></span>
						</div>
						<div class="col-md-5">
							<span style="float: left;" id="rg3"><%=pname%></span>
						</div>
						<div class="col-md-5">
							<span style="float: left;" id="rg3"><%=tname%></span>
						</div>
						<div class="col-md-1">
							<span style="float: right;background-color:#ff0000;" id="rg3"><button type="button" class="btn btn-danger" onclick="delgoal(<%=cno%>,3,<%=tourId%>,<%=mid%>);"><span class="glyphicon glyphicon-minus"></span></button></span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%
				
			}
			/*  --------------------------------------------------------------------------------*/
			else if(uid==4)
			{
				int cno=DBManager.getMaxId("tourCard", "cno");
				System.out.println(
						tourId + "  " + tid + "  " + mid + "  " + jno + "  " + timer + "  " + gtype + "  " + bid);
				
				int r=DB.insert("insert into tourCard values("+cno+",'"+timer+"',"+bid+","+tourId+","+mid+","+tid+",'"+gtype+"','R')");
				ResultSet rs = DBManager
						.fetchQuery("select tName from team where tid in(select tid from tourTeam where ttId=" + tid
								+ " and tourId=" + tourId + ");");
				if (rs.next()) {
					tname = rs.getString("tName");
				}
				rs = null;
				rs = DBManager.fetchQuery(
						"select m.fName,m.lName,tp.jerseyNo from tourPlayer tp,member m where tp.barcodeId=m.barcodeId and m.barcodeId="
								+ bid + ";");
				if (rs.next()) {
					pname = rs.getString("fName") + " " + rs.getString("lName");
				}
		%>

		<div class="container-fluid">
			<div class="row">
				
				<div class="col-md-12" >
					<div class="row">
						<div class="col-md-1">
							<span style="float: left;" id="rg4"><%=jno%></span>
						</div>
						<div class="col-md-5">
							<span style="float: left;" id="rg4"><%=pname%></span>
						</div>
						<div class="col-md-5">
							<span style="float: left;" id="rg4"><%=tname%></span>
						</div>
						<div class="col-md-1">
							<span style="float: right;background-color:#ff0000;" id="rg4"><button type="button" class="btn btn-danger" onclick="delgoal(<%=cno%>,4,<%=tourId%>,<%=mid%>);"><span class="glyphicon glyphicon-minus"></span></button></span>
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