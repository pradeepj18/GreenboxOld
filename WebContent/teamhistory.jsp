<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*,DBManager.DBManager"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GreenBox | Team History</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="materialize/css/materialize.min.css" media="screen,projection" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,user-scalable=no" />
<link href="css/teamhistory.css" rel="stylesheet">
</head>
<body>
	<%
		try {
			ResultSet rs = null, rs1 = null;
			DBManager.loadDriver();
			int ttId = Integer.parseInt(request.getParameter("ttId"));
			int tourId = Integer.parseInt(request.getParameter("tourId"));
	%>
	<div class="container-fluid">
		<div class="row" style="background-color: aliceblue;">
			<div class="col s4 m4 l4">
				<img class="img-responsive pull-left" id="psLogo"
					src="images/PlaysoftechLogo.png">
			</div>
			<div class="col s4 m4 l4">
				<img class="img-responsive" id="tourLogo"
					src="images/GreenBox_logo.png">
			</div>
			<div class="col s4 m4 l4">
				<img class="img-responsive right" id="gbLogo"
					src="images/logos_2.png">
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<%
			rs = DBManager.fetchQuery(
						"select ttId,(select count(tid1) from print_match pm where pm.tid1 = tp.ttId or pm.tid2 = tp.ttId) as p,(select count(tid1) from print_match pm where pm.tid1 = tp.ttId and pm.tAScore > tBScore ) as win1,(select count(tid2) from print_match pm where pm.tid2 = tp.ttId and pm.tAScore < tBScore ) as win2,(select count(tid1) from print_match pm where pm.tid1 = tp.ttId and pm.tAScore < tBScore ) as loss1,(select count(tid2) from print_match pm where pm.tid2 = tp.ttId and pm.tAScore > tBScore ) as loss2,(select count(tid1) from print_match pm where (pm.tid2=tp.ttId or pm.tid1 = tp.ttId) and pm.tAScore = tBScore ) as draw,(select tName from team t,tourTeam tt where  t.tId=tt.tId and tt.ttId=tp.ttId) as tName,(select count(gno) from tourGoal tg where tg.ttId = tp.ttId) as score,(select lcase(SUBSTRING_INDEX(tFlag,'/',-1)) from team where tid in(select tid from tourTeam where ttId=tp.ttId)) as flag,(select count(ttId) from tourFoul where ttId=tp.ttId) as foul,(select count(ttId) from tourCard where cname='Y' and ttId=tp.ttId) as y,(select count(ttId) from tourCard where cname='R' and ttId=tp.ttId) as r from tourTeam tp where tourId="
								+ tourId + " and ttId =" + ttId + ";");
				if (rs.next()) {
		%>
		<div class="row">
			<div class="col s12  m4 l4">
				<div class="card amber darken-3 card-image">
					<center>
						<img src="images/man-team-logo/<%=rs.getString("flag")%>"
							class="responsive-img">
					</center>
				</div>
			</div>
			<div class="col s12 m8 l8">
				<div class="card-panel">
					<span class="team-detail">Total Matches</span> <span
						class="team-score" style="margin-left: 68px;">: <%=rs.getInt("p")%></span><br>
					<span class="team-detail">Won </span><span class="team-score-align">:
						<%=rs.getInt("win1") + rs.getInt("win2")%></span><br> <span
						class="team-detail">Loss&nbsp;</span><span
						class="team-score-align">: <%=rs.getInt("loss1") + rs.getInt("loss2")%></span><br>
					<span class="team-detail">Goal&nbsp;</span><span
						class="team-score-align">: <%=rs.getInt("score")%></span><br>
					<span class="team-detail">Foul&nbsp;</span><span
						class="team-score-align">: <%=rs.getInt("foul")%></span><br>
					<span class="team-detail">Yellow Card&nbsp;</span><span
						class="team-score-align" style="margin-left: 91px;">: <%=rs.getInt("y")%></span><br>
					<span class="team-detail">Red Card&nbsp;</span><span
						class="team-score-align" style="margin-left: 120px;">: <%=rs.getInt("r")%></span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col s12">
				<ul id="tabs-swipe-demo" class="tabs" style="overflow-x: hidden;">
					<li class="tab col s6 m6 l6"><a
						class="active black-text tabs-text" href="#squad">SQUAD</a></li>
					<li class="tab col s6 m6 l6"><a class="black-text tabs-text"
						href="#matches">MATCHES PLAYED</a></li>
				</ul>

				<!-- START SQUAD -->
				<div class="col s12">

					<div id="squad">
						<%
							rs1 = DBManager.fetchQuery(
											"select tp.barcodeId,(select fName from member where barcodeId=tp.barcodeId) as fname,(select lName from member where barcodeId=tp.barcodeId) as lname,(select (SUBSTRING_INDEX(photo,'/',-1)) from member where barcodeId=tp.barcodeId) as photo,(select count(barcodeId) from tourGoal where barcodeId=tp.barcodeId) as goal,(select count(barcodeId) from tourFoul where barcodeId=tp.barcodeId) as foul,(select count(barcodeId) from tourCard where cname='Y' and barcodeId=tp.barcodeId) as y,(select count(barcodeId) from tourCard where cname='R' and barcodeId=tp.barcodeId) as r from tourPlayer tp where tourId="
													+ tourId + " and ttId=" + ttId + ";");
									while (rs1.next()) {
						%>
						<div class="card-panel" style="padding: 1% 2% 0%;">
							<div class="row">
								<div class="col s2 m2 l2">
									<img src="images/Member/<%=rs1.getString("photo")%>"
										class=" resposive-img" style="width: 100px; height: 100px;">
								</div>
								<div class="col s10 m6 l4">
									<span class="player-name"><%=rs1.getString("fname")%></span>&nbsp;&nbsp;<span
										class="player-name-surname"><%=rs1.getString("lname")%></span>
									<div class="hide-on-large-only">
										<span style="margin-left: 24%;">Goal : <b><%=rs1.getInt("goal")%></b></span>&nbsp;&nbsp;<span>Foul
											: <b><%=rs1.getInt("foul")%></b>
										</span><br> <span style="margin-left: 24%;">Y Card : <b><%=rs1.getInt("y")%></b></span>&nbsp;&nbsp;<span>R
											Card : <b><%=rs1.getInt("r")%></b>
										</span>
									</div>
								</div>
								<div class="col  m6 l1 hide-on-med-and-down">
									<span class="score-title" style="margin-left: -30px;">GOAL:</span><span
										class="score"> <%=rs1.getInt("goal")%></span>
								</div>
								<div class="col l1 hide-on-med-and-down">
									<span class="score-title">FOUL:</span><span class="score">
										<%=rs1.getInt("foul")%></span>
								</div>
								<div class="col l2 hide-on-med-and-down">
									<span class="score-title">Y CARD:</span><span class="score">
										<%=rs1.getInt("y")%></span>
								</div>
								<div class="col l2 hide-on-med-and-down">
									<span class="score-title">R CARD:</span><span class="score">
										<%=rs1.getInt("r")%></span>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>

				</div>
				<!-- END SQAD -->

				<!-- START MATCHES -->
				<div class="col s12">
					<div id="matches">

						<%
							int count = 1;
									rs1 = null;
									rs1 = DBManager.fetchQuery(
											"select mid,twon,tid1,(select tName from team where tid in (select tid from tourTeam where ttId=pm.tid1)) as tname1,(select lcase(SUBSTRING_INDEX(tFlag,'/',-1)) from team where tid in(select tid from tourTeam where ttId=pm.tid1)) as flag1,tid2,(select tName from team where tid in (select tid from tourTeam where ttId=pm.tid2)) as tname2,(select lcase(SUBSTRING_INDEX(tFlag,'/',-1)) from team where tid in(select tid from tourTeam where ttId=pm.tid2)) as flag2,UCASE(DATE_FORMAT(mdate,'%a %d %b %Y')) as mdate,TIME_FORMAT(mtime,'%H:%i') as time from print_match pm where tid1="
													+ ttId + " or tid2=" + ttId + " and tourId=" + tourId + ";");
									while (rs1.next()) {
						%>
						<a href="matchhistory.jsp?tourId=1&mid=<%=rs1.getInt("mid")%>"
							target="_blank" style="color: black;">
							<div class="card" style="padding: 1% 1% 0.1%;">

								<div class="row">
									<div class="col s2 m2 l2">
										<span class="match">MATCH NO <%=rs1.getInt("mid")%></span>
									</div>
									<div class="col s6 m6 l6">
										<span class="teama"><%=rs1.getString("tname1")%></span> <span
											class="vs">VS</span> <span class="teamb"><%=rs1.getString("tname2")%></span>
									</div>
									<div class="col s4 m4 l4">
										<span class="match"><%=rs1.getString("mdate")%>&nbsp;<%=rs1.getString("time")%></span>
									</div>

								</div>

							</div> <%
 	}
 %>
						</a>
					</div>
				</div>
				<!-- END MATCHES -->
			</div>
		</div>
		<%
			}
		%>
	</div>
	<%
		} catch (Exception e) {
			System.out.println("Error in teamhistory : " + e);
		}
	%>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="materialize/js/materialize.min.js"></script>

</body>
</html>