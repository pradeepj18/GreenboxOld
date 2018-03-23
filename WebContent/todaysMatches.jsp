<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="DBManager.DBManager,java.sql.*,java.util.Date,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Player Record</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1,user-scalable=no">

<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style>
body {
	font-family: ROBOTO;
}

.player {
	font-size: 15pt;
	color: black;
}

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td { {
	padding: 0px;
	line-height: 3.429;
	vertical-align: top;
	border-top: 1px solid #ddd;
}

.table-fixed thead {
	width: 97%;
	margin-left: 2%;
	color: #ffffff;
}

.table-fixed tbody {
	height: 350px;
	overflow-y: auto;
	width: 97%;
	margin-left: 2%;
}

.table-fixed thead, .table-fixed tbody, .table-fixed tr, .table-fixed td,
	.table-fixed th {
	display: block;
}

.table-fixed tbody td, .table-fixed thead>tr>th {
	float: left;
	border-bottom-width: 0;
}

.table-hover tbody tr:hover td, .table-hover thead tr:hover th {
	background-color: #0E1957;
	color: #eeeeee;
}

.mscore {
	font-size: 20pt;
}
</style>
</head>
<body>
	<%
	int tAscore=0,tBscore=0,tid=0;
	String status="";
		int tourId = 1;
		Date dnow = new Date();
		SimpleDateFormat yy = new SimpleDateFormat("yyyy-MM-dd");
		String mdate = "2017-01-15";//yy.format(dnow);
		DBManager.loadDriver();
		ResultSet rs = null, rs1 = null, rs2 = null;
		int i;
	%>
	<br>
	<br>
	<br>
	<h1>
		<center>TODAY'S MATCHES</center>
	</h1>

	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="panel-group" id="accordion">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h2 class="panel-title">
								<span>#MATCH NO &nbsp;</span><span style="margin-left: 60px;">TEAM
									A&nbsp; VS &nbsp;TEAM B</span><span
									style="margin-left: 50px; margin-left: 140px;">POOL&nbsp;/&nbsp;SCORE</span>
								<span style="float: right;"><b>MATCH STATUS</b></span>
							</h2>
						</div>
					</div>

					<%
						System.out.println(
								"select mid,tid1,(select tName from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tid1 and tourId="
										+ request.getParameter("tourId")
										+ ") as tname1,tid2,(select tName from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tid2 and tourId="
										+ request.getParameter("tourId")
										+ ") as tname2,UCASE(DATE_FORMAT(mdate,'%d %M %Y')) as mdate,gender,pool,TIME_FORMAT(mtime,'%H:%i') as time from wmatch w where mid not in(select mid from print_match pw where pw.gender=w.gender and w.tourId=pw.tourId) and tourId="
										+ request.getParameter("tourId") + " and mdate='" + mdate + "'");
						rs = DBManager.fetchQuery(
								"select mid,tid1,(select tName from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tid1 and tourId="
										+ request.getParameter("tourId")
										+ ") as tname1,tid2,(select tName from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tid2 and tourId="
										+ request.getParameter("tourId")
										+ ") as tname2,UCASE(DATE_FORMAT(mdate,'%d %M %Y')) as mdate,gender,pool,tourId,TIME_FORMAT(mtime,'%H:%i') as time,w.Flag from wmatch w where tourId="
										+ request.getParameter("tourId") + " and mdate='" + mdate + "'");

						i = 0;
						while (rs.next()) {
					%>

					<div class="panel panel-danger">
						<%
							if (rs.getString("Flag").equals("0")) {
						%>
						<!-- top bar -->


						<div class="panel-heading">
							<h2 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse<%=i%>"><span>#MATCH NO &nbsp;<%=i + 1%></span><span
									style="margin-left: 50px;"><%=rs.getString("tname1")%>&nbsp;
										VS &nbsp;<%=rs.getString("tname2")%></span><span
									style="margin-right: 390px; float: right;">&#<%=rs.getInt("pool") + 64%></span>
									<span style="float: right; margin-right: -400px;"><b>MATCH
											NOT PLAYED</b></span></a>
							</h2>
						</div>
					</div>


					<%
						}

							else if (rs.getString("Flag").equals("1")) {
					%>
					<!-- all panel heading -->
					<div class="panel-heading ">
						<h2 class="panel-title " style="color: orange">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapse<%=i%>"><span>#MATCH NO &nbsp;<%=i + 1%></span><span
								style="margin-left: 50px;"><%=rs.getString("tname1")%>&nbsp;
									VS &nbsp;<%=rs.getString("tname2")%></span><span
								style="margin-right: 390px; float: right;">&#<%=rs.getInt("pool") + 64%></span>
								<span style="float: right; margin-right: -375px;"><b>ONGOING
										MATCH</b></span></a>
						</h2>
					</div>

					<div id="collapse<%=i%>" class="panel-collapse collapse in">
						<div class="panel-body">
							<div class="row mscore">
								<div class="col-md-12">
									<center>
										<span style="color: #1a8cff; font-size: 15pt;">CURRENT
											MATCH SCORE</span>
									</center>
								</div>
							</div>
							<!-- panel Score start -->
							<div class="row mscore">
								<div class="col-md-4">
									<center>
										<span style="float: right; font-size: 25pt; color: black;"><%=rs.getString("tname1")%></span>
									</center>
								</div>
								<div class="col-md-4">
									<%
										rs1 = null;
												rs1 = DBManager.fetchQuery("select (select count(gno) from tourGoal where tourId=" + tourId
														+ " and ttId=" + rs.getInt("tid1") + " and mid=" + rs.getInt("mid")
														+ ") as tAscore,(select count(gno) from tourGoal where tourId=" + tourId + " and ttId="
														+ rs.getInt("tid2") + " and mid=" + rs.getInt("mid") + ") as tBscore;");
												rs1.next();
									%>
									<center>
										<span style="font-size: 40pt; color: black;"><%=rs1.getInt("tAscore")%>&nbsp;-&nbsp;<%=rs1.getInt("tBscore")%></span>
									</center>
								</div>
								<div class="col-md-4">
									<center>
										<span style="float: left; font-size: 25pt; color: black;"><%=rs.getString("tname2")%></span>
									</center>
								</div>
								<!-- end -->
							</div>
							<hr>
							<div class="row">
								<div class="col-md-12">
									<center>
										<span style="font-size: 20pt; color: black; color: #1a8cff"><%=rs.getString("tname1")%></span>
									</center>
								</div>
							</div>
							<div class="row gfc">
								<!-- first team goal foul card -->
								<div class="col-md-12"
									style="font-size: 15pt; color: black; margin-left: -15px;">

									<div class="col-md-4">
										<%
											rs1 = null;
													rs1 = DBManager.fetchQuery("select (select count(gno) from tourGoal where tourId=" + tourId
															+ " and ttId=" + rs.getInt("tid1") + " and mid=" + rs.getInt("mid") + ") as tAscore");
													rs1.next();
										%>
										<center>
											<span>GOAL&nbsp;(<%=rs1.getInt("tAscore")%>)
											</span>
										</center>

									</div>
									<div class="col-md-4">
										<%
											rs1 = null;
													rs1 = DBManager.fetchQuery("select (select count(fno) from tourFoul where tourId=" + tourId
															+ " and ttId=" + rs.getInt("tid1") + " and mid=" + rs.getInt("mid") + ") as tAscore");
													rs1.next();
										%>
										<center>
											<span>FOUL&nbsp;(<%=rs1.getInt("tAscore")%>)
											</span>
										</center>

									</div>
									<div class="col-md-4">
										<%
											rs1 = null;
													rs1 = DBManager.fetchQuery("select (select count(cno) from tourCard where tourId=" + tourId
															+ " and ttId=" + rs.getInt("tid1") + " and mid=" + rs.getInt("mid")
															+ " and cname='Y') as tAscore,(select count(cno) from tourCard where tourId=" + tourId
															+ " and ttId=" + rs.getInt("tid1") + " and mid=" + rs.getInt("mid")
															+ " and cname='R') as tBscore");
													rs1.next();
										%>
										<center>
											<span>CARD&nbsp;(<%=rs1.getInt("tAscore")%>Y/<%=rs1.getInt("tBscore")%>R)
											</span>
										</center>

									</div>
								</div>
								<div class="row ">
									<div class="col-md-12 player">
										<!------------------------------ First half 1st team players  --------------------------->
										<div class="col-md-4">
											<%
												rs1 = null;
														rs1 = DBManager.fetchQuery(
																"select barcodeId,count(*) as goal,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourGoal tg where tourId="
																		+ rs.getInt("tourId") + " and mid=" + rs.getInt("mid") + " and ttId="
																		+ rs.getInt("tid1") + " group by barcodeId;");
														if (rs1.next()) {
															rs1.beforeFirst();
															while (rs1.next()) {
											%>
											<span><%=rs1.getString("fname") + " " + rs1.getString("lname") + " "%>(&nbsp;<%=rs1.getInt("goal")%>&nbsp;)</span><br>
											<%
												}
														} else {
											%>
											<span>&nbsp;&nbsp;</span>
											<%
												}
											%>
										</div>
										<!-- 1st half 1st team player foul -->
										<div class="col-md-4">
											<%
												rs1 = null;
														rs1 = DBManager.fetchQuery(
																"select barcodeId,count(*) as foul,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourFoul tg where tourId="
																		+ rs.getInt("tourId") + " and mid=" + rs.getInt("mid") + " and ttId="
																		+ rs.getInt("tid1") + " group by barcodeId;");
														if (rs1.next()) {
															rs1.beforeFirst();
															while (rs1.next()) {
											%>
											<span><%=rs1.getString("fname") + " " + rs1.getString("lname") + " "%>(&nbsp;<%=rs1.getInt("foul")%>&nbsp;)</span><br>
											<%
												}
														} else {
											%>
											<span>&nbsp;&nbsp;</span>
											<%
												}
											%>
										</div>
										<!-- 1st half 1st team player card -->
										<div class="col-md-4">
											<%
												rs1 = null;
														rs2 = null;
														rs1 = DBManager.fetchQuery(
																"select barcodeId,count(*) as ycard,cname,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourCard tg where tourId="
																		+ rs.getInt("tourId") + " and mid=" + rs.getInt("mid") + " and ttId="
																		+ rs.getInt("tid1") + " and cname='Y' group by barcodeId;");
														rs2 = DBManager.fetchQuery(
																"select barcodeId,count(*) as rcard,cname,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourCard tg where tourId="
																		+ rs.getInt("tourId") + " and mid=" + rs.getInt("mid") + " and ttId="
																		+ rs.getInt("tid1") + " and cname='R' group by barcodeId;");
														if (rs1.next() || rs2.next()) {
															rs1.beforeFirst();
															rs2.beforeFirst();
															while (rs1.next()) {
											%>
											<span><%=rs1.getString("fname") + " " + rs1.getString("lname") + " "%>(&nbsp;<%=rs1.getInt("ycard")%>&nbsp;<%=rs1.getString("cname")%>)</span><br>

											<%
												}
															while (rs2.next()) {
											%>
											<span><%=rs2.getString("fname") + " " + rs2.getString("lname") + " "%>(&nbsp;<%=rs2.getInt("rcard")%>&nbsp;<%=rs2.getString("cname")%>)</span><br>
											<%
												}
														}
											%>
										</div>
									</div>
								</div>

								<hr>
								<!-- end -->
								<!-- Second team gola foul card -->
								<div class="row">
									<div class="col-md-12">
										<center>
											<span style="font-size: 20pt; color: black; color: #1a8cff"><%=rs.getString("tname2")%></span>
										</center>
									</div>
								</div>
								<div class="row">

									<div class="col-md-12"
										style="font-size: 15pt; color: black; margin-left: -15px;">
										<div class="col-md-4">
											<%
												rs1 = null;
														rs1 = DBManager.fetchQuery("select (select count(gno) from tourGoal where tourId=" + tourId
																+ " and ttId=" + rs.getInt("tid2") + " and mid=" + rs.getInt("mid") + ") as tAscore");
														rs1.next();
											%>
											<center>
												<span>GOAL&nbsp;(<%=rs1.getInt("tAscore")%>)
												</span>
											</center>

										</div>
										<div class="col-md-4">
											<%
												rs1 = null;
														rs1 = DBManager.fetchQuery("select (select count(fno) from tourFoul where tourId=" + tourId
																+ " and ttId=" + rs.getInt("tid2") + " and mid=" + rs.getInt("mid") + ") as tAscore");
														rs1.next();
											%>
											<center>
												<span>FOUL&nbsp;(<%=rs1.getInt("tAscore")%>)
												</span>
											</center>

										</div>
										<div class="col-md-4">
											<%
												rs1 = null;
														rs1 = DBManager.fetchQuery("select (select count(cno) from tourCard where tourId=" + tourId
																+ " and ttId=" + rs.getInt("tid2") + " and mid=" + rs.getInt("mid")
																+ " and cname='Y') as tAscore,(select count(cno) from tourCard where tourId=" + tourId
																+ " and ttId=" + rs.getInt("tid2") + " and mid=" + rs.getInt("mid")
																+ " and cname='R') as tBscore");
														rs1.next();
											%>
											<center>
												<span>CARD&nbsp;(<%=rs1.getInt("tAscore")%>Y/<%=rs1.getInt("tBscore")%>R)
												</span>
											</center>


										</div>
									</div>
									<div class="row ">
										<div class="col-md-12 player">
											<!------------------------------ First half 1st team players  --------------------------->
											<div class="col-md-4" style="float: left;">
												<%
													rs1 = null;
															rs1 = DBManager.fetchQuery(
																	"select barcodeId,count(*) as goal,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourGoal tg where tourId="
																			+ rs.getInt("tourId") + " and mid=" + rs.getInt("mid") + " and ttId="
																			+ rs.getInt("tid2") + " group by barcodeId;");
															if (rs1.next()) {
																rs1.beforeFirst();
																while (rs1.next()) {
												%>
												<span><%=rs1.getString("fname") + " " + rs1.getString("lname") + " "%>(&nbsp;<%=rs1.getInt("goal")%>&nbsp;)</span><br>
												<%
													}
															} else {
												%>
												<span>&nbsp;&nbsp;</span>
												<%
													}
												%>
											</div>
											<!-- 1st half 1st team player foul -->
											<div class="col-md-4">
												<%
													rs1 = null;
															rs1 = DBManager.fetchQuery(
																	"select barcodeId,count(*) as foul,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourFoul tg where tourId="
																			+ rs.getInt("tourId") + " and mid=" + rs.getInt("mid") + " and ttId="
																			+ rs.getInt("tid2") + " group by barcodeId;");
															if (rs1.next()) {
																rs1.beforeFirst();
																while (rs1.next()) {
												%>
												<span><%=rs1.getString("fname") + " " + rs1.getString("lname") + " "%>(&nbsp;<%=rs1.getInt("foul")%>&nbsp;)</span><br>
												<%
													}
															} else {
												%>
												<span>&nbsp;&nbsp;</span>
												<%
													}
												%>
											</div>
											<!-- 1st half 1st team player card -->
											<div class="col-md-4" style="float: right;">
												<%
													rs1 = null;
															rs2 = null;
															rs1 = DBManager.fetchQuery(
																	"select barcodeId,count(*) as ycard,cname,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourCard tg where tourId="
																			+ rs.getInt("tourId") + " and mid=" + rs.getInt("mid") + " and ttId="
																			+ rs.getInt("tid2") + " and cname='Y' group by barcodeId;");
															rs2 = DBManager.fetchQuery(
																	"select barcodeId,count(*) as rcard,cname,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourCard tg where tourId="
																			+ rs.getInt("tourId") + " and mid=" + rs.getInt("mid") + " and ttId="
																			+ rs.getInt("tid2") + " and cname='R' group by barcodeId;");
															if (rs1.next() || rs2.next()) {
																rs1.beforeFirst();
																rs2.beforeFirst();
																while (rs1.next()) {
												%>
												<span><%=rs1.getString("fname") + " " + rs1.getString("lname") + " "%>(&nbsp;<%=rs1.getInt("ycard")%>&nbsp;<%=rs1.getString("cname")%>)</span><br>

												<%
													}
																while (rs2.next()) {
												%>
												<span><%=rs2.getString("fname") + " " + rs2.getString("lname") + " "%>(&nbsp;<%=rs2.getInt("rcard")%>&nbsp;<%=rs2.getString("cname")%>)</span><br>
												<%
													}
															}
												%>
											</div>
										</div>
									</div>
									<!--  end-->
								</div>
							</div>
							<hr>
							<div class="panel-footer"
								style="background-color: #80ffaa; color: black; font-size: 13pt;">
								<%
									rs1 = null;
											rs1 = DBManager.fetchQuery("select twon from print_match where mid=" + rs.getInt("mid") + ";");
											rs1.next();
								%>
								<span class="blink" style="text-decoration: blink;">TOS
									WON BY &nbsp;<b><%=rs1.getString("twon")%></b>
								</span>
							</div>
						</div>
					</div>
					<%
						} else if (rs.getString("Flag").equals("2")) {

								rs1 = null;
								rs1 = DBManager.fetchQuery("select (select count(gno) from tourGoal where tourId=" + tourId
										+ " and ttId=" + rs.getInt("tid1") + " and mid=" + rs.getInt("mid")
										+ ") as tAscore,(select count(gno) from tourGoal where tourId=" + tourId + " and ttId="
										+ rs.getInt("tid2") + " and mid=" + rs.getInt("mid") + ") as tBscore;");
								rs1.next();
					%>
					<div class="panel-heading ">
						<h2 class="panel-title" style="color: green">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapse<%=i%>"><span>#MATCH NO &nbsp;<%=i + 1%></span><span
								style="margin-left: 50px;"><%=rs.getString("tname1")%>&nbsp;
									VS &nbsp;<%=rs.getString("tname2")%></span><span
								style="margin-right: 340px; float: right;">&#<%=rs.getInt("pool") + 64%>&nbsp;/&nbsp;<%=rs1.getInt("tAscore")%>&nbsp;-&nbsp;<%=rs1.getInt("tBscore")%></span>
								<span style="float: right; margin-right: -350px;"><b>MATCH
										PLAYED</b></span></a>
						</h2>
					</div>
					<div id="collapse<%=i%>" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="row mscore">
								<div class="col-md-12">
									<center>
										<span style="color: #1a8cff; font-size: 15pt;">CURRENT
											MATCH SCORE</span>
									</center>
								</div>
							</div>
							<!-- panel Score start -->
							<div class="row mscore">
								<div class="col-md-4">
									<center>
										<span style="float: right; font-size: 25pt; color: black;"><%=rs.getString("tname1")%></span>
									</center>
								</div>
								<div class="col-md-4">
									<%
										rs1 = null;
												rs1 = DBManager.fetchQuery("select (select count(gno) from tourGoal where tourId=" + tourId
														+ " and ttId=" + rs.getInt("tid1") + " and mid=" + rs.getInt("mid")
														+ ") as tAscore,(select count(gno) from tourGoal where tourId=" + tourId + " and ttId="
														+ rs.getInt("tid2") + " and mid=" + rs.getInt("mid") + ") as tBscore;");
												
												rs1.next();
									%>
									<center>
										<span style="font-size: 40pt; color: black;"><%=rs1.getInt("tAscore")%>&nbsp;-&nbsp;<%=rs1.getInt("tBscore")%></span>
									</center>
								</div>
								<div class="col-md-4">
									<center>
										<span style="float: left; font-size: 25pt; color: black;"><%=rs.getString("tname2")%></span>
									</center>
								</div>
								<!-- end -->
							</div>
							<hr>
							<div class="row">
								<div class="col-md-12">
									<center>
										<span style="font-size: 20pt; color: black; color: #1a8cff"><%=rs.getString("tname1")%></span>
									</center>
								</div>
							</div>
							<div class="row gfc">
								<!-- first team goal foul card -->
								<div class="col-md-12"
									style="font-size: 15pt; color: black; margin-left: -15px;">

									<div class="col-md-4">
										<%
											rs1 = null;
													rs1 = DBManager.fetchQuery("select (select count(gno) from tourGoal where tourId=" + tourId
															+ " and ttId=" + rs.getInt("tid1") + " and mid=" + rs.getInt("mid") + ") as tAscore");
													rs1.next();
										%>
										<center>
											<span>GOAL&nbsp;(<%=rs1.getInt("tAscore")%>)
											</span>
										</center>

									</div>
									<div class="col-md-4">
										<%
											rs1 = null;
													rs1 = DBManager.fetchQuery("select (select count(fno) from tourFoul where tourId=" + tourId
															+ " and ttId=" + rs.getInt("tid1") + " and mid=" + rs.getInt("mid") + ") as tAscore");
													rs1.next();
										%>
										<center>
											<span>FOUL&nbsp;(<%=rs1.getInt("tAscore")%>)
											</span>
										</center>

									</div>
									<div class="col-md-4">
										<%
											rs1 = null;
													rs1 = DBManager.fetchQuery("select (select count(cno) from tourCard where tourId=" + tourId
															+ " and ttId=" + rs.getInt("tid1") + " and mid=" + rs.getInt("mid")
															+ " and cname='Y') as tAscore,(select count(cno) from tourCard where tourId=" + tourId
															+ " and ttId=" + rs.getInt("tid1") + " and mid=" + rs.getInt("mid")
															+ " and cname='R') as tBscore");
													rs1.next();
										%>
										<center>
											<span>CARD&nbsp;(<%=rs1.getInt("tAscore")%>Y/<%=rs1.getInt("tBscore")%>R)
											</span>
										</center>

									</div>
								</div>
								<div class="row ">
									<div class="col-md-12 player">
										<!------------------------------ First half 1st team players  --------------------------->
										<div class="col-md-4">
											<%
												rs1 = null;
														rs1 = DBManager.fetchQuery(
																"select barcodeId,count(*) as goal,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourGoal tg where tourId="
																		+ rs.getInt("tourId") + " and mid=" + rs.getInt("mid") + " and ttId="
																		+ rs.getInt("tid1") + " group by barcodeId;");
														if (rs1.next()) {
															rs1.beforeFirst();
															while (rs1.next()) {
											%>
											<span><%=rs1.getString("fname") + " " + rs1.getString("lname") + " "%>(&nbsp;<%=rs1.getInt("goal")%>&nbsp;)</span><br>
											<%
												}
														} else {
											%>
											<span>&nbsp;&nbsp;</span>
											<%
												}
											%>
										</div>
										<!-- 1st half 1st team player foul -->
										<div class="col-md-4">
											<%
												rs1 = null;
														rs1 = DBManager.fetchQuery(
																"select barcodeId,count(*) as foul,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourFoul tg where tourId="
																		+ rs.getInt("tourId") + " and mid=" + rs.getInt("mid") + " and ttId="
																		+ rs.getInt("tid1") + " group by barcodeId;");
														if (rs1.next()) {
															rs1.beforeFirst();
															while (rs1.next()) {
											%>
											<span><%=rs1.getString("fname") + " " + rs1.getString("lname") + " "%>(&nbsp;<%=rs1.getInt("foul")%>&nbsp;)</span><br>
											<%
												}
														} else {
											%>
											<span>&nbsp;&nbsp;</span>
											<%
												}
											%>
										</div>
										<!-- 1st half 1st team player card -->
										<div class="col-md-4">
											<%
												rs1 = null;
														rs2 = null;
														rs1 = DBManager.fetchQuery(
																"select barcodeId,count(*) as ycard,cname,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourCard tg where tourId="
																		+ rs.getInt("tourId") + " and mid=" + rs.getInt("mid") + " and ttId="
																		+ rs.getInt("tid1") + " and cname='Y' group by barcodeId;");
														rs2 = DBManager.fetchQuery(
																"select barcodeId,count(*) as rcard,cname,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourCard tg where tourId="
																		+ rs.getInt("tourId") + " and mid=" + rs.getInt("mid") + " and ttId="
																		+ rs.getInt("tid1") + " and cname='R' group by barcodeId;");
														if (rs1.next() || rs2.next()) {
															rs1.beforeFirst();
															rs2.beforeFirst();
															while (rs1.next()) {
											%>
											<span><%=rs1.getString("fname") + " " + rs1.getString("lname") + " "%>(&nbsp;<%=rs1.getInt("ycard")%>&nbsp;<%=rs1.getString("cname")%>)</span><br>

											<%
												}
															while (rs2.next()) {
											%>
											<span><%=rs2.getString("fname") + " " + rs2.getString("lname") + " "%>(&nbsp;<%=rs2.getInt("rcard")%>&nbsp;<%=rs2.getString("cname")%>)</span><br>
											<%
												}
														}
											%>
										</div>
									</div>
								</div>

								<hr>
								<!-- end -->
								<!-- Second team gola foul card -->
								<div class="row">
									<div class="col-md-12">
										<center>
											<span style="font-size: 20pt; color: black; color: #1a8cff"><%=rs.getString("tname2")%></span>
										</center>
									</div>
								</div>
								<div class="row">

									<div class="col-md-12"
										style="font-size: 15pt; color: black; margin-left: -15px;">
										<div class="col-md-4">
											<%
												rs1 = null;
														rs1 = DBManager.fetchQuery("select (select count(gno) from tourGoal where tourId=" + tourId
																+ " and ttId=" + rs.getInt("tid2") + " and mid=" + rs.getInt("mid") + ") as tAscore");
														rs1.next();
											%>
											<center>
												<span>GOAL&nbsp;(<%=rs1.getInt("tAscore")%>)
												</span>
											</center>

										</div>
										<div class="col-md-4">
											<%
												rs1 = null;
														rs1 = DBManager.fetchQuery("select (select count(fno) from tourFoul where tourId=" + tourId
																+ " and ttId=" + rs.getInt("tid2") + " and mid=" + rs.getInt("mid") + ") as tAscore");
														rs1.next();
											%>
											<center>
												<span>FOUL&nbsp;(<%=rs1.getInt("tAscore")%>)
												</span>
											</center>

										</div>
										<div class="col-md-4">
											<%
												rs1 = null;
														rs1 = DBManager.fetchQuery("select (select count(cno) from tourCard where tourId=" + tourId
																+ " and ttId=" + rs.getInt("tid2") + " and mid=" + rs.getInt("mid")
																+ " and cname='Y') as tAscore,(select count(cno) from tourCard where tourId=" + tourId
																+ " and ttId=" + rs.getInt("tid2") + " and mid=" + rs.getInt("mid")
																+ " and cname='R') as tBscore");
														rs1.next();
											%>
											<center>
												<span>CARD&nbsp;(<%=rs1.getInt("tAscore")%>Y/<%=rs1.getInt("tBscore")%>R)
												</span>
											</center>


										</div>
									</div>
									<div class="row ">
										<div class="col-md-12 player">
											<!------------------------------ First half 1st team players  --------------------------->
											<div class="col-md-4" style="float: left;">
												<%
													rs1 = null;
															rs1 = DBManager.fetchQuery(
																	"select barcodeId,count(*) as goal,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourGoal tg where tourId="
																			+ rs.getInt("tourId") + " and mid=" + rs.getInt("mid") + " and ttId="
																			+ rs.getInt("tid2") + " group by barcodeId;");
															if (rs1.next()) {
																rs1.beforeFirst();
																while (rs1.next()) {
												%>
												<span><%=rs1.getString("fname") + " " + rs1.getString("lname") + " "%>(&nbsp;<%=rs1.getInt("goal")%>&nbsp;)</span><br>
												<%
													}
															} else {
												%>
												<span>&nbsp;&nbsp;</span>
												<%
													}
												%>
											</div>
											<!-- 1st half 1st team player foul -->
											<div class="col-md-4">
												<%
													rs1 = null;
															rs1 = DBManager.fetchQuery(
																	"select barcodeId,count(*) as foul,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourFoul tg where tourId="
																			+ rs.getInt("tourId") + " and mid=" + rs.getInt("mid") + " and ttId="
																			+ rs.getInt("tid2") + " group by barcodeId;");
															if (rs1.next()) {
																rs1.beforeFirst();
																while (rs1.next()) {
												%>
												<span><%=rs1.getString("fname") + " " + rs1.getString("lname") + " "%>(&nbsp;<%=rs1.getInt("foul")%>&nbsp;)</span><br>
												<%
													}
															} else {
												%>
												<span>&nbsp;&nbsp;</span>
												<%
													}
												%>
											</div>
											<!-- 1st half 1st team player card -->
											<div class="col-md-4" style="float: right;">
												<%
													rs1 = null;
															rs2 = null;
															rs1 = DBManager.fetchQuery(
																	"select barcodeId,count(*) as ycard,cname,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourCard tg where tourId="
																			+ rs.getInt("tourId") + " and mid=" + rs.getInt("mid") + " and ttId="
																			+ rs.getInt("tid2") + " and cname='Y' group by barcodeId;");
															rs2 = DBManager.fetchQuery(
																	"select barcodeId,count(*) as rcard,cname,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname from tourCard tg where tourId="
																			+ rs.getInt("tourId") + " and mid=" + rs.getInt("mid") + " and ttId="
																			+ rs.getInt("tid2") + " and cname='R' group by barcodeId;");
															if (rs1.next() || rs2.next()) {
																rs1.beforeFirst();
																rs2.beforeFirst();
																while (rs1.next()) {
												%>
												<span><%=rs1.getString("fname") + " " + rs1.getString("lname") + " "%>(&nbsp;<%=rs1.getInt("ycard")%>&nbsp;<%=rs1.getString("cname")%>)</span><br>

												<%
													}
																while (rs2.next()) {
												%>
												<span><%=rs2.getString("fname") + " " + rs2.getString("lname") + " "%>(&nbsp;<%=rs2.getInt("rcard")%>&nbsp;<%=rs2.getString("cname")%>)</span><br>
												<%
													}
															}
												%>
											</div>
										</div>
									</div>
									<!--  end-->
								</div>
							</div>
							<hr>
							<div class="panel-footer"
								style="background-color: #80ffaa; color: black; font-size: 13pt;">
								<%
									rs1 = null;
											rs1 = DBManager.fetchQuery("select twon from print_match where mid=" + rs.getInt("mid") + ";");
											rs1.next();
								%>
								<span>TOS
									WON BY &nbsp;<b><%=rs1.getString("twon")%></b>
								</span>
								<%
								rs1=null;
								rs1=DBManager.fetchQuery("select (select count(gno)  from tourGoal where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid1")+") as tAscore,(select count(gno)  from tourGoal where tourId="+rs.getInt("tourId")+" and mid="+rs.getInt("mid")+" and ttId="+rs.getInt("tid2")+") as tBscore;");
								if(rs1.next())
								{
									tAscore=rs1.getInt("tAscore");
									tBscore=rs1.getInt("tBscore");
									if(tAscore==tBscore)
										status="MATCH DRAW";
									else if(tAscore<tBscore)
									{
									status=""+rs.getString("tname2")+" WON THE MATCH";
									}
									else
									{
										status=""+rs.getString("tname1")+" WON THE MATCH";	
									}
								%>
								<span style="float:right;"><b><%=status%></b>
								</span>
								<%} %>
							</div>
						</div>
					</div>

					<%
						}
							i++;
						}
					%>

				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>

</body>
</html>