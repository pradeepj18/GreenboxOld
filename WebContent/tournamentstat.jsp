<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*,DBManager.DBManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GreenBox | Tornament Stats</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="materialize/css/materialize.min.css" media="screen,projection" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/tourstat.css" rel="stylesheet">
<link href="css/tourtopper.css" rel="stylesheet">
<script src="js/jquery-3.1.1.min.js"></script>
</head>
<style>
.card .card-content {
	padding: 8px;
	border-radius: 0 0 2px 2px;
}
.design1
{
background-color:gray;
color:white;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
$("#team-color-effect6").hover(function(){
	 $("#team-color-effect6").removeClass("card-content red darken-2").addClass("card-content amber darken-3");
},
function(){
	$("#team-color-effect6").removeClass("card-content amber darken-3").addClass("card-content red darken-2");
});


/* $("#team-color-effect1").hover(function(){
	 $("#team-color-effect1").removeClass("card-content light-blue darken-4").addClass("card-content amber darken-3");
},
function(){
	$("#team-color-effect1").removeClass("card-content amber darken-3").addClass("card-content light-blue darken-4");
});


$("#team-color-effect2").hover(function(){
	 $("#team-color-effect2").removeClass("card-content pink darken-2").addClass("card-content amber darken-3");
},
function(){
	$("#team-color-effect2").removeClass("card-content amber darken-3").addClass("card-content pink darken-2");
}); */

});
$(document).ready(function(){
    $("#tourH").click(function(){
         $("#tourH").removeClass("card-panel blue darken-4 white-text").addClass("card-panel red darken-1 white-text");
         $("#teamH").removeClass("card-panel red darken-1 white-text").addClass("card-panel blue darken-4 white-text");
         $("#matchH").removeClass("card-panel red darken-1 white-text").addClass("card-panel blue darken-4 white-text");
         $("#dayH").removeClass("card-panel red darken-1 white-text").addClass("card-panel blue darken-4 white-text");
         $("#topperH").removeClass("card-panel red darken-1 white-text").addClass("card-panel blue darken-4 white-text");
         $("#tourhistory").show();
         $("#teamhistory").hide();
         $("#matchhistory").hide(); 
         $("#daywise").hide();
         $("#topperhistory").hide();
    });
    $("#teamH").click(function(){
        $("#tourH").removeClass("card-panel red darken-1 white-text").addClass("card-panel blue darken-4 white-text");
        $("#teamH").removeClass("card-panel blue darken-4 white-text").addClass("card-panel red darken-1 white-text");
        $("#matchH").removeClass("card-panel red darken-1 white-text").addClass("card-panel blue darken-4 white-text");
        $("#dayH").removeClass("card-panel red darken-1 white-text").addClass("card-panel blue darken-4 white-text");
        $("#topperH").removeClass("card-panel red darken-1 white-text").addClass("card-panel blue darken-4 white-text");
        $("#tourhistory").hide();
        $("#teamhistory").show();
     	$("#matchhistory").hide();
     	$("#daywise").hide();
     	$("#topperhistory").hide();
   });
    $("#matchH").click(function(){
        $("#tourH").removeClass("card-panel red darken-1 white-text").addClass("card-panel blue darken-4 white-text");
        $("#teamH").removeClass("card-panel red darken-1 white-text").addClass("card-panel blue darken-4 white-text");
        $("#matchH").removeClass("card-panel blue darken-4 white-text").addClass("card-panel red darken-1 white-text");
        $("#dayH").removeClass("card-panel red darken-1 white-text").addClass("card-panel blue darken-4 white-text");
        $("#topperH").removeClass("card-panel red darken-1 white-text").addClass("card-panel blue darken-4 white-text");
        $("#tourhistory").hide();
        $("#teamhistory").hide();
      	$("#matchhistory").show(); 
      	$("#daywise").hide();
      	$("#topperhistory").hide();
   });
    $("#dayH").click(function(){
        $("#tourH").removeClass("card-panel red darken-1 white-text").addClass("card-panel blue darken-4 white-text");
        $("#teamH").removeClass("card-panel red darken-1 white-text").addClass("card-panel blue darken-4 white-text");
        $("#matchH").removeClass("card-panel red darken-1 white-text").addClass("card-panel blue darken-4 white-text");
        $("#dayH").removeClass("card-panel blue darken-4 white-text").addClass("card-panel red darken-1 white-text");
        $("#topperH").removeClass("card-panel red darken-1 white-text").addClass("card-panel blue darken-4 white-text");
        $("#tourhistory").hide();
        $("#teamhistory").hide();
      	$("#matchhistory").hide(); 
      	$("#daywise").show();
      	$("#topperhistory").hide();
   });
    $("#topperH").click(function(){
        $("#tourH").removeClass("card-panel red darken-1 white-text").addClass("card-panel blue darken-4 white-text");
        $("#teamH").removeClass("card-panel red darken-1 white-text").addClass("card-panel blue darken-4 white-text");
        $("#matchH").removeClass("card-panel red darken-1 white-text").addClass("card-panel blue darken-4 white-text");
        $("#dayH").removeClass("card-panel red darken-1 white-text").addClass("card-panel blue darken-4 white-text");
        $("#topperH").removeClass("card-panel blue darken-4 white-text").addClass("card-panel red darken-1 white-text");
        $("#tourhistory").hide();
        $("#teamhistory").hide();
      	$("#matchhistory").hide(); 
    	$("#daywise").hide(); 
      	$("#topperhistory").show();
   });
});

$(document).ready(function(){
	$(".button-collapse").sideNav();

	$("#tourH1").click(function(){
         $("#tourhistory").show();
        $("#teamhistory").hide();
        $("#matchhistory").hide(); 
        $("#daywise").hide();
        $("#topperhistory").hide();
        $(".button-collapse").sideNav('hide');
   });

   $("#teamH1").click(function(){
      $("#tourhistory").hide();
       $("#teamhistory").show();
    	$("#matchhistory").hide();
    	$("#daywise").hide();
    	$("#topperhistory").hide();
    	 $(".button-collapse").sideNav('hide');
  });
   $("#matchH1").click(function(){
       $("#tourhistory").hide();
       $("#teamhistory").hide();
     	$("#matchhistory").show(); 
     	$("#daywise").hide();
     	$("#topperhistory").hide();
     	 $(".button-collapse").sideNav('hide');
  });
   $("#dayH1").click(function(){
       $("#tourhistory").hide();
       $("#teamhistory").hide();
     	$("#matchhistory").hide(); 
     	$("#daywise").show();
     	$("#topperhistory").hide();
     	 $(".button-collapse").sideNav('hide');
  });
	$("#topperH1").click(function(){
		$("#tourhistory").hide();
        $("#teamhistory").hide();
      	$("#matchhistory").hide(); 
    	$("#daywise").hide(); 
      	$("#topperhistory").show();
      	 $(".button-collapse").sideNav('hide');
      });
	
});

</script>
<body>
	<%
		ResultSet rs = null, rs1 = null;
		String winner = "";
		try {
			int tourId=1;
			DBManager.loadDriver();
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

	<div class="row">
		<a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons hide-on-large-only" style="margin-left: 5%;">menu</i></a>
		<div class="col s12 m12 l3 hide-on-med-and-down">
			<div class="card-panel blue darken-4 white-text" id="tourH" style="cursor:pointer;">
				<h4 class="card-panel-text">
					<a class="white-text" >Tournament History</a>
				</h4>
			</div>

			<div class="card-panel blue darken-4 white-text" id="teamH" style="cursor:pointer;">
				<h4 class="card-panel-text">
					<a class="white-text" >Team History</a>
				</h4>
			</div>
			<div class="card-panel blue darken-4 white-text" id="matchH" style="cursor:pointer;">
				<h4 class="card-panel-text">
					<a class="white-text" >Match History</a>
				</h4>
			</div>
			<div class="card-panel blue darken-4 white-text" id="dayH" style="cursor:pointer;">
				<h4 class="card-panel-text">
					<a class="white-text" >Day Wise Matches</a>
				</h4>
			</div>
			<div class="card-panel red darken-1 white-text" id="topperH" style="cursor:pointer;">
				<h4 class="card-panel-text">
					<a class="white-text" >Topper</a>
				</h4>
			</div>
		</div>
		<ul class="side-nav" id="mobile-demo">
			<div>
				<img class="responsive-img" id="gbLogoNav" src="images/GreenBox_logo.png" width=50>
			</div>
			<li><a id="tourH1" style="cursor:pointer;" class="design1">Tournament History</a></li>
			<li><a id="teamH1" style="cursor:pointer;" class="design1">Team History</a></li>
			<li><a id="matchH1" style="cursor:pointer;" class="design1">Match History</a></li>
			<li><a id="dayH1" style="cursor:pointer;" class="design1">Day Wise Matches</a></li>
			<li><a id="topperH1" style="cursor:pointer;" class="design1">Topper</a></li>
		</ul>
		<div class="col s12 m12 l9">
			<div id="tourhistory" style="display:none;">
				<div class="card-panel  light-blue darken-4 white-text"><span class="history-title-text">Tournament History</span></div>
				<div class="card-panel grey lighten-4">
					<div class="row">
						<div class="col l1"></div>
						<div class="col s12 m4 l4">
							<div class="card">
								<div
									class="card-image  green darken-3 white-text card-panel-title">
									<h4 class="center-align">GOAL</h4>

								</div>
								<div class="card-content">
									<%
										rs = null;
											rs = DBManager.fetchQuery("select count(*) as goal from tourGoal where tourId=1");
											rs.next();
									%>
									<p class="center-align result-text">
										<b><%=rs.getInt("goal")%></b>
									</p>
								</div>
							</div>
						</div>
						<div class="col l2"></div>
						<div class="col s12 m4 l4">
							<div class="card">
								<div
									class="card-image  blue darken-4 white-text card-panel-title">
									<h4 class="center-align ">FOUL</h4>

								</div>
								<div class="card-content">
									<%
										rs = null;
											rs = DBManager.fetchQuery("select count(*) as foul from tourFoul where tourId=1");
											rs.next();
									%>
									<p class="center-align result-text">
										<b><%=rs.getInt("foul")%></b>
								</div>
							</div>
						</div>
						<div class="col l1"></div>
					</div>
					<div class="row">
						<div class="col l1"></div>
						<div class="col s12 m4 l4">
							<div class="card">
								<div
									class="card-image amber darken-2 white-text card-panel-title">
									<h4 class="center-align">YELLOW</h4>

								</div>
								<div class="card-content">
									<%
										rs = null;
											rs = DBManager.fetchQuery("select (select count(*) as card from tourCard where tourId=1 and cname='Y') as y,(select count(*) as card from tourCard where tourId=1 and cname='R') as r;");
											rs.next();
									%>
									<p class="center-align result-text">
										<b><%=rs.getInt("y")%></b>
								</div>
							</div>
						</div>
						<div class="col l2"></div>
						<div class="col s12 m4 l4">
							<div class="card">
								<div class="card-image red darken-3 white-text card-panel-title">
									<h4 class="center-align">RED</h4>

								</div>
								<div class="card-content">
									<p class="center-align result-text">
										<b><%=rs.getInt("r")%></b>
								</div>
							</div>
						</div>
						<div class="col l1"></div>

					</div>
					<div class="row">
						<div class="col s12 m12 l12">
							<div class="card">
								<div id="columnchart"></div>
							</div>
						</div>
					</div>
				
				</div>
				
			</div>
			<!-- END TOURNAMENT HISTORY -->

			<!-- START TEAM HISTROY -->
			<div id="teamhistory" style="display:none;">
			<div class="card-panel  light-blue darken-4 white-text"><span class="history-title-text">Team History</span></div>
				<div class="card-panel grey lighten-4">
					<div class="row">
					<%
					boolean f=false;
					rs=null;rs1=null;
					rs=DBManager.fetchQuery("select ttId,(select tName from team where tid in(select tid from tourTeam where ttId=tt.ttId)) as tname,(select lcase(SUBSTRING_INDEX(tFlag,'/',-1)) from team where tid in(select tid from tourTeam where ttId=tt.ttId)) as flag from tourTeam tt where tourId="+tourId+";");
					while(rs.next())
					{
					
					if(rs.previous())
					{
						rs1=DBManager.fetchQuery("select (select count(ttId) from tourGoal where ttId="+rs.getInt("ttId")+" and tourId=1) as goal,(select count(ttId) from tourFoul where ttId="+rs.getInt("ttId")+" and tourId=1) as foul,(select count(ttId) from tourCard where tourId=1 and cname='Y' and ttId="+rs.getInt("ttId")+") as y,(select count(ttId) from tourCard where tourId=1 and cname='R' and ttId="+rs.getInt("ttId")+") as r;");
						rs1.next();
					%>
						<div class="col s12 m4 l4">
							<div class="card hoverable">
								<div class="card-image waves-effect waves-block waves-light">
									<center>
									<a href="teamhistory.jsp?tourId=1&ttId=<%=rs.getInt("ttId") %>" target="_blank">
										<img class="activator circle responsive-img"
											src="images/man-team-logo/<%=rs.getString("flag") %>"
											style="width: 200px; height: 200px;">
									</a>
									</center>
								</div>
								<div class="card-content red darken-2" id="team-color-effect<%=rs.getInt("ttId") %>">
									<center>
										<span class="card-title activator white-text text-darken-4" ><%=rs.getString("tname") %></span>
									</center>
								</div>
								<div class="card-reveal">
									<span class="card-title grey-text text-darken-4"><h5><%=rs.getString("tname") %></h5>
										<i class="material-icons right">close</i></span> <br>
									<div style="font-size: 20px; font-weight: 400;">
										GOAL <span style="margin-left: 16%;">: <%=rs1.getInt("goal") %></span>
									</div>
									<div style="font-size: 20px; font-weight: 400;">
										FOUL <span style="margin-left: 16%;">: <%=rs1.getInt("foul") %></span>
									</div>
									<div style="font-size: 20px; font-weight: 400;">
										YELLOW <span style="margin-left: 7%;">: <%=rs1.getInt("y") %></span>
									</div>
									<div style="font-size: 20px; font-weight: 400;">
										RED <span style="margin-left: 20%;">: <%=rs1.getInt("r") %></span>
									</div>
									<div class="fixed-action-btn vertical">
										<a href="teamhistory.jsp?tourId=1&ttId=<%=rs.getInt("ttId") %>" target="_blank" class="btn-floating btn-medium red darken-2"> <i
											class="medium material-icons">add</i></a>
									</div>
								</div>
							</div>
						</div>
						<%} 
					if(rs.next())
					{
						
						rs1=null;
						rs1=DBManager.fetchQuery("select (select count(ttId) from tourGoal where ttId="+rs.getInt("ttId")+" and tourId=1) as goal,(select count(ttId) from tourFoul where ttId="+rs.getInt("ttId")+" and tourId=1) as foul,(select count(ttId) from tourCard where tourId=1 and cname='Y' and ttId="+rs.getInt("ttId")+") as y,(select count(ttId) from tourCard where tourId=1 and cname='R' and ttId="+rs.getInt("ttId")+") as r;");
						rs1.next();
						%>
						
						<div class="col s12 m4 l4">
							<div class="card hoverable">
								<div class="card-image waves-effect waves-block waves-light">
									<center>
										<a href="teamhistory.jsp?tourId=1&ttId=<%=rs.getInt("ttId") %>" target="_blank">
										<img class="activator circle responsive-img"
											src="images/man-team-logo/<%=rs.getString("flag") %>"
											style="width: 200px; height: 200px;">
									</a>
									</center>
								</div>
								<div class="card-content light-blue darken-4" id="team-color-effect1">
									<center>
										<span class="card-title activator white-text text-darken-4"><%=rs.getString("tname") %></span>
									</center>
								</div>
								<div class="card-reveal">
									<span class="card-title grey-text text-darken-4"><h5><%=rs.getString("tname") %></h5>
										<i class="material-icons right">close</i></span> <br>
									<div style="font-size: 20px; font-weight: 400;">
										GOAL <span style="margin-left: 16%;">: <%=rs1.getInt("goal") %></span>
									</div>
									<div style="font-size: 20px; font-weight: 400;">
										FOUL <span style="margin-left: 16%;">: <%=rs1.getInt("foul") %></span>
									</div>
									<div style="font-size: 20px; font-weight: 400;">
										YELLOW <span style="margin-left: 7%;">: <%=rs1.getInt("y") %></span>
									</div>
									<div style="font-size: 20px; font-weight: 400;">
										RED <span style="margin-left: 20%;">: <%=rs1.getInt("r") %></span>
									</div>
									<div class="fixed-action-btn vertical">
										<a  href="teamhistory.jsp?tourId=1&ttId=<%=rs.getInt("ttId") %>" target="_blank" class="btn-floating btn-medium light-blue darken-4"> <i
											class="medium material-icons">add</i></a>
									</div>
								</div>
							</div>
						</div>
						<%}
					if(rs.next())
					{
						
						rs1=null;
						rs1=DBManager.fetchQuery("select (select count(ttId) from tourGoal where ttId="+rs.getInt("ttId")+" and tourId=1) as goal,(select count(ttId) from tourFoul where ttId="+rs.getInt("ttId")+" and tourId=1) as foul,(select count(ttId) from tourCard where tourId=1 and cname='Y' and ttId="+rs.getInt("ttId")+") as y,(select count(ttId) from tourCard where tourId=1 and cname='R' and ttId="+rs.getInt("ttId")+") as r;");
						rs1.next();
						%>
						
						<div class="col s12 m4 l4">
							<div class="card hoverable">
								<div class="card-image waves-effect waves-block waves-light">
									<center>
										<a href="teamhistory.jsp?tourId=1&ttId=<%=rs.getInt("ttId") %>" target="_blank">
										<img class="activator circle responsive-img"
											src="images/man-team-logo/<%=rs.getString("flag") %>"
											style="width: 200px; height: 200px;">
									</a>
									</center>
								</div>
								<div class="card-content pink darken-2" id="team-color-effect2">
									<center>
										<span class="card-title activator white-text text-darken-4"><%=rs.getString("tname") %></span>
									</center>
								</div>
								<div class="card-reveal">
									<span class="card-title grey-text text-darken-4"><h5><%=rs.getString("tname") %></h5>
										<i class="material-icons right">close</i></span> <br>
									<div style="font-size: 20px; font-weight: 400;">
										GOAL <span style="margin-left: 16%;">: <%=rs1.getInt("goal") %></span>
									</div>
									<div style="font-size: 20px; font-weight: 400;">
										FOUL <span style="margin-left: 16%;">: <%=rs1.getInt("foul") %></span>
									</div>
									<div style="font-size: 20px; font-weight: 400;">
										YELLOW <span style="margin-left: 7%;">: <%=rs1.getInt("y") %></span>
									</div>
									<div style="font-size: 20px; font-weight: 400;">
										RED <span style="margin-left: 20%;">: <%=rs1.getInt("r") %></span>
									</div>
									<div class="fixed-action-btn vertical">
										<a  href="teamhistory.jsp?tourId=1&ttId=<%=rs.getInt("ttId") %>" target="_blank" class="btn-floating btn-medium pink darken-2"> <i
											class="medium material-icons">add</i></a>
									</div>
								</div>
							</div>
						</div>
						<%}
					rs.next();
					}
					
					
						%>
					</div>

				</div>
			</div>
			<!-- END TEAM HISTORY -->

			<%
				rs = null;
					rs = DBManager.fetchQuery(
							"select mid,tid1,(select tName from team where tid in(select tid from tourTeam where ttId=m.tid1)) as tname1,(select lcase(SUBSTRING_INDEX(tFlag,'/',-1)) from team where tid in(select tid from tourTeam where ttId=m.tid1 )) as flag1,tid2,(select tName from team where tid in(select tid from tourTeam where ttId=m.tid2)) as tname2,(select lcase(SUBSTRING_INDEX(tFlag,'/',-1)) from team where tid in(select tid from tourTeam where ttId=m.tid2 )) as flag2,UCASE(DATE_FORMAT(mdate,'%W %d %M %Y')) as mdate,TIME_FORMAT(mtime,'%H:%i') as time from wmatch m where mid in(select mid from print_match where tourId=1) and tourId=1 order by mid desc;");
			%>

			<!-- START MATCH HISTORY -->
			 <div id="matchhistory" style="display:none;">
			 <div class="card-panel  light-blue darken-4 white-text"><span class="history-title-text">Match History</span></div>
 	<div class="card-panel grey lighten-4">
 		<div class="row">
 		<% while(rs.next()){
 			/* if(rs.previous()){ */
 		%>
 		
 			<div class="col s12 m6 l4">
 			<%
 				rs1=DBManager.fetchQuery("select (select count(gno) from tourGoal where ttId="+rs.getInt("tid1")+" and mid="+rs.getInt("mid")+") as goal1,(select count(gno) from tourGoal where ttId="+rs.getInt("tid2")+" and mid="+rs.getInt("mid")+") as goal2 ;");
 				if(rs1.next())
 				{
 				if(rs1.getInt("goal1")>rs1.getInt("goal2"))
 					winner=rs.getString("tname1");
 				else if(rs1.getInt("goal1")<rs1.getInt("goal2"))
 					winner=rs.getString("tname2");
 				else if(rs1.getInt("goal1")==rs1.getInt("goal2"))
 					winner="DRAW";
 				%>
 				<div class="card hoverable">
				<div class="card-image waves-effect waves-block waves-light">
					<div class="row">
					
						<div class="col s12 m5 l5">
							<img class="activator teama" src="images/man-team-logo/<%=rs.getString("flag1")%>">
						</div>
						<div class="col s12 m2 l2">
							<span class="vs hide-on-med-and-up">VS</span>
						</div>
						<div class="col s12 m5 l5">
							<img class="activator teamb" src="images/man-team-logo/<%=rs.getString("flag2")%>" >
						</div>
						<div class="m12 l12 hide-on-small-only">
							<span class="vs">VS</span>
						</div>
						
					</div>
				</div>
				<div class="card-content light-blue darken-4">
				   <center>
						<span class="card-title activator white-text text-darken-4">MATCH NO &nbsp;&nbsp;<%=rs.getInt("mid") %></span>
					</center>
				</div>
				<div class="card-reveal">
					<span class="card-title grey-text text-darken-4"><h6><%=rs.getString("mdate") %> &nbsp;<%=rs.getString("time") %></h6><i class="material-icons right">close</i></span>
					<span class="card-title grey-text text-darken-4"><h5>FINAL SCORE </h5><h6></h6>[ <%=rs1.getInt("goal1") %> &nbsp;-&nbsp; <%=rs1.getInt("goal2") %> ]</h6></span>
					<br>
						<div style="font-size: 20px; font-weight: 400;">WINNER : <%=winner %></div>
			
						
				  <div class="fixed-action-btn vertical">
					 <a href="matchhistory.jsp?tourId=1&mid=<%=rs.getInt("mid") %>" target="_blank" class="btn-floating btn-medium light-blue darken-4"> <i	class="medium material-icons">add</i></a>
				  </div>
				</div>
		  </div>
		  <%}%>
 		</div>
 		
 		<% 
 		/* 	} */
 		if(rs.next()){
 		%>
 		
 			<div class="col s12 m6 l4">
 			<%
 				rs1=DBManager.fetchQuery("select (select count(gno) from tourGoal where ttId="+rs.getInt("tid1")+" and mid="+rs.getInt("mid")+") as goal1,(select count(gno) from tourGoal where ttId="+rs.getInt("tid2")+" and mid="+rs.getInt("mid")+") as goal2 ;");
 				if(rs1.next())
 				{
 				if(rs1.getInt("goal1")>rs1.getInt("goal2"))
 					winner=rs.getString("tname1");
 				else if(rs1.getInt("goal1")<rs1.getInt("goal2"))
 					winner=rs.getString("tname2");
 				else if(rs1.getInt("goal1")==rs1.getInt("goal2"))
 					winner="DRAW";
 				%>
 				<div class="card hoverable">
				<div class="card-image waves-effect waves-block waves-light">
					<div class="row">
					
						<div class="col s12 m5 l5">
							<img class="activator teama" src="images/man-team-logo/<%=rs.getString("flag1")%>">
						</div>
						<div class="col s12 m2 l2">
							<span class="vs hide-on-med-and-up">VS</span>
						</div>
						<div class="col s12 m5 l5">
							<img class="activator teamb" src="images/man-team-logo/<%=rs.getString("flag2")%>" >
						</div>
						<div class="m12 l12 hide-on-small-only">
							<span class="vs">VS</span>
						</div>
						
					</div>
				</div>
				<div class="card-content pink darken-2">
				   <center>
						<span class="card-title activator white-text text-darken-4">MATCH NO &nbsp;&nbsp;<%=rs.getInt("mid") %></span>
					</center>
				</div>
				<div class="card-reveal">
					<span class="card-title grey-text text-darken-4"><h6><%=rs.getString("mdate") %> &nbsp;<%=rs.getString("time") %></h6><i class="material-icons right">close</i></span>
					<span class="card-title grey-text text-darken-4"><h5>FINAL SCORE </h5><h6></h6>[ <%=rs1.getInt("goal1") %> &nbsp;-&nbsp; <%=rs1.getInt("goal2") %> ]</h6></span>
					<br>
						<div style="font-size: 20px; font-weight: 400;">WINNER : <%=winner %></div>
			
						
				  <div class="fixed-action-btn vertical">
					 <a href="matchhistory.jsp?tourId=1&mid=<%=rs.getInt("mid") %>" target="_blank" class="btn-floating btn-medium pink darken-2"> <i	class="medium material-icons">add</i></a>
				  </div>
				</div>
		  </div>
		  <%}%>
 		</div>
 		<%} %>
 		<% 
 		if(rs.next()){
 		%>
 		
 			<div class="col s12 m6 l4">
 			<%
 				rs1=DBManager.fetchQuery("select (select count(gno) from tourGoal where ttId="+rs.getInt("tid1")+" and mid="+rs.getInt("mid")+") as goal1,(select count(gno) from tourGoal where ttId="+rs.getInt("tid2")+" and mid="+rs.getInt("mid")+") as goal2 ;");
 				if(rs1.next())
 				{
 				if(rs1.getInt("goal1")>rs1.getInt("goal2"))
 					winner=rs.getString("tname1");
 				else if(rs1.getInt("goal1")<rs1.getInt("goal2"))
 					winner=rs.getString("tname2");
 				else if(rs1.getInt("goal1")==rs1.getInt("goal2"))
 					winner="DRAW";
 				%>
 				<div class="card hoverable">
				<div class="card-image waves-effect waves-block waves-light">
					<div class="row">
					
						<div class="col s12 m5 l5">
							<img class="activator teama" src="images/man-team-logo/<%=rs.getString("flag1")%>">
						</div>
						<div class="col s12 m2 l2">
							<span class="vs hide-on-med-and-up">VS</span>
						</div>
						<div class="col s12 m5 l5">
							<img class="activator teamb" src="images/man-team-logo/<%=rs.getString("flag2")%>" >
						</div>
						<div class="m12 l12 hide-on-small-only">
							<span class="vs">VS</span>
						</div>
						
					</div>
				</div>
				<div class="card-content red darken-2">
				   <center>
						<span class="card-title activator white-text text-darken-4">MATCH NO &nbsp;&nbsp;<%=rs.getInt("mid") %></span>
					</center>
				</div>
				<div class="card-reveal">
					<span class="card-title grey-text text-darken-4"><h6><%=rs.getString("mdate") %> &nbsp;<%=rs.getString("time") %></h6><i class="material-icons right">close</i></span>
					<span class="card-title grey-text text-darken-4"><h5>FINAL SCORE </h5><h6></h6>[ <%=rs1.getInt("goal1") %> &nbsp;-&nbsp; <%=rs1.getInt("goal2") %> ]</h6></span>
					<br>
						<div style="font-size: 20px; font-weight: 400;">WINNER : <%=winner %></div>
			
						
				  <div class="fixed-action-btn vertical">
					 <a href="matchhistory.jsp?tourId=1&mid=<%=rs.getInt("mid") %>" target="_blank" class="btn-floating btn-medium red darken-2"> <i	class="medium material-icons">add</i></a>
				  </div>
				</div>
		  </div>
		  <%}%>
 		</div>
 		<%} %>
 	<%
 		/* rs.next(); */
 			}%>
 			
 		</div>
	</div>
 	
 	</div> 
 	
 	<!-- START DAY WISE -->
 	<div id="daywise" style="display:none;">
 	<div class="card-panel  light-blue darken-4 white-text"><span class="history-title-text">Day Wise Matches</span></div>
 	 <div class="card-panel grey lighten-4">
 	<%
 	rs=null;rs1=null;
 	int count=1;
 	rs=DBManager.fetchQuery("select mdate,HOUR(mtime) as h,MINUTE(mtime) as m,datediff(mdate,'2017-01-14') countday,UCASE(DATE_FORMAT(mdate,'%a %d %b %X')) as dayfor from print_match where mdate != curdate() and tourId="+tourId+" group by mdate");
 	/* rs.next(); */
 	while(rs.next())
 	{%>
 		<div class="row">
 		
 			<div class="col s12 m6 l4">
 		<%
 	/* 	if(rs.previous())
 		{
 		 */
 		%>
 				<div class="card  hoverable">
				<div class="card-image waves-effect waves-block waves-light">
					<center>
				    	<span style="font-size: 49px; line-height: 309%;">DAY <%=count %></span>
				    	<span><%=rs.getString("dayfor") %></span>
					</center>
				</div>
				<div class="card-content light-blue darken-4">
				<a href="daywisematch.jsp?mdate=<%=rs.getString("mdate") %>&day=<%=count++ %>" target="_blank">
				   <center>
						<span class="card-title activator white-text text-darken-4">VIEW MATCHES</span>
					</center>
				</a>
				</div>
			</div>
			<%/* }  */%>
			</div>
			<div class="col s12 m6 l4">
 			<%if(rs.next()){ %>
			
 				<div class="card  hoverable">
				<div class="card-image waves-effect waves-block waves-light">
					<center>
				    	<span style="font-size: 49px; line-height: 309%;">DAY <%=count %></span>
				    	<span><%=rs.getString("dayfor") %></span>
					</center>
				</div>
				<div class="card-content pink darken-2">
				<a href="daywisematch.jsp?mdate=<%=rs.getString("mdate") %>&day=<%=count++ %>" target="_blank">
				   <center>
						<span class="card-title activator white-text text-darken-4">VIEW MATCHES</span>
					</center>
				</a>
				</div>
			</div>
			
			<%} %></div>
			
			<div class="col s12 m6 l4">
 			<%if(rs.next()){ %>
 				<div class="card  hoverable">
				<div class="card-image waves-effect waves-block waves-light">
					<center>
				    	<span style="font-size: 49px; line-height: 309%;">DAY <%=count %></span>
				    	<span><%=rs.getString("dayfor") %></span>
					</center>
				</div>
				<div class="card-content red darken-2">
				<a href="daywisematch.jsp?mdate=<%=rs.getString("mdate") %>&day=<%=count++ %>" target="_blank">
				   <center>
						<span class="card-title activator white-text text-darken-4">VIEW MATCHES</span>
					</center>
				</a>
				</div>
			</div>
			<%} %>
			</div>
 		</div>
	<% }%>
	</div>

	 </div>
 	<!-- END DAY WISE -->
 	
 	
 	<!-- TOP SCORER -->
 	<div id="topperhistory">
 	<div class="card-panel  light-blue darken-4 white-text"><span class="history-title-text">Rank Holders</span></div>
 		<div class="row">
		<div class="col s12 m4 l4">
			<div class="card amber darken-3 card-image winner-team-logo">
				<center><img src="images/man-team-logo/razorbacks.png" class="responsive-img"></center>
			</div>
		</div>
		<div class="col s12 m8 l8">
			<div class="card">
				<center><img src="images/winner.JPG" class="responsive-img winner-team"></center>
			</div>
		</div>
	</div>
	<div class="row">
	<%
	rs=null;rs1=null;
	rs=DBManager.fetchQuery("select ttId,barcodeId,count(barcodeId) gcount from tourGoal where tourId="+tourId+" group by barcodeId order by gcount desc limit 5;");
	  if(rs.next())
	  {

	  	
	  rs1=DBManager.fetchQuery("select (select t.tName from team t where tid in (select tid from tourTeam where ttId="+rs.getInt("ttId")+" and tourId="+tourId+")) as tname,(select m.fName from member m where barcodeId="+rs.getInt("barcodeId")+") as fname,(select m.lName from member m where barcodeId="+rs.getInt("barcodeId")+") as lname,(select m.photo from member m where barcodeId="+rs.getInt("barcodeId")+") as photo,(select count(barcodeId) from tourGoal where barcodeId="+rs.getInt("barcodeId")+") as goal,(select count(barcodeId) from tourFoul where barcodeId="+rs.getInt("barcodeId")+") as foul,(select count(barcodeId) from tourCard where cname='Y' and barcodeId="+rs.getInt("barcodeId")+") as y,(select count(barcodeId) from tourCard where cname='R' and barcodeId="+rs.getInt("barcodeId")+") as r;");	
	  if(rs1.next())
	  {
	%>
		<div class="col s12 m6 l4">
			<div class="card  hoverable">
				<div class="card-image waves-effect waves-block waves-light">
				<span class="goal-first-player-name"><%= rs1.getString("fName")%></span> 
				<span class="goal-last-player-name"><%= rs1.getString("lName")%></span>
					<center>
				    	<img class="activator circle responsive-img" src="images/Member/<%=rs1.getString("photo") %>" style="width: 200px; height: 200px;">
					</center>
					
				</div>
				<div class="card-content light-blue darken-4">
				   <center>
						<span class="card-title activator white-text text-darken-4">TOP GOAL SCORER</span>
					</center>
				</div>
				<div class="card-reveal">
					<span class="card-title grey-text text-darken-4"><h5><%=rs1.getString("tname") %></h5><i class="material-icons right">close</i></span>
					<br>
						<div style="font-size: 20px; font-weight: 400;">GOAL   <span style="margin-left: 16%;">: <%=rs1.getInt("goal") %></span></div>
						<div style="font-size: 20px; font-weight: 400;">FOUL   <span style="margin-left: 16%;">: <%=rs1.getInt("foul") %></span></div>
						<div style="font-size: 20px; font-weight: 400;">YELLOW <span style="margin-left: 7%;">: <%=rs1.getInt("y") %></span></div>
						<div style="font-size: 20px; font-weight: 400;">RED    <span style="margin-left: 20%;">: <%=rs1.getInt("r") %></span></div>
				  <div class="fixed-action-btn horizontal">
					 <a class="btn-floating btn-medium light-blue darken-4"> <i	class="medium material-icons">add</i></a>
				  </div>
				</div>
		  </div>
		</div>
		<%}} 
	  rs=null;rs1=null;
	 count=1;
	   rs=DBManager.fetchQuery("select mid,count(*) as goal from tourGoal group by mid having goal>=3;");
	   while(rs.next())
	   {
		   rs1=DBManager.fetchQuery("select mid,barcodeId,(select tName from team where tid in (select tid from tourTeam where ttId=tg.ttId)) as tname,(select fName from member m where m.barcodeId=tg.barcodeId) as fname,(select lName from member m where m.barcodeId=tg.barcodeId) as lname,(select m.photo from member m where barcodeId=tg.barcodeId) as photo,(select count(barcodeId) from tourGoal where barcodeId=tg.barcodeId) as goal,(select count(barcodeId) from tourFoul where barcodeId=tg.barcodeId) as foul,(select count(barcodeId) from tourCard where cname='Y' and barcodeId=tg.barcodeId) as y,(select count(barcodeId) from tourCard where cname='R' and barcodeId=tg.barcodeId) as r,count(barcodeId) as goal1  from tourGoal tg where tg.mid="+rs.getInt("mid")+" and tourId="+tourId+" group by barcodeId having goal1>=3;");
		   while(rs1.next())
		   {
		
		%>
		
		<div class="col s12 m6 l4">
		<div class="card  hoverable">
				<div class="card-image waves-effect waves-block waves-light">
				<span class="goal-first-player-name"><%=rs1.getString("fname") %></span> 
				<span class="goal-last-player-name"><%=rs1.getString("lname") %></span>
					<center>
				    	<img class="activator circle responsive-img" src="images/Member/<%=rs1.getString("photo") %>" style="width: 200px; height: 200px;">
					</center>
					
				</div>
				<div class="card-content pink darken-2">
				   <center>
						<span class="card-title activator white-text text-darken-4">GOAL HATRICK NO <%=count++ %></span>
					</center>
				</div>
				<div class="card-reveal">
					<span class="card-title grey-text text-darken-4"><h5><%=rs1.getString("tname") %></h5><i class="material-icons right">close</i></span>
					<br>
						<div style="font-size: 20px; font-weight: 400;">GOAL   <span style="margin-left: 16%;">: <%=rs1.getInt("goal") %></span></div>
						<div style="font-size: 20px; font-weight: 400;">FOUL   <span style="margin-left: 16%;">: <%=rs1.getInt("foul") %></span></div>
						<div style="font-size: 20px; font-weight: 400;">YELLOW <span style="margin-left: 7%;">: <%=rs1.getInt("y") %></span></div>
						<div style="font-size: 20px; font-weight: 400;">RED    <span style="margin-left: 20%;">: <%=rs1.getInt("r") %></span></div>
				  <div class="fixed-action-btn horizontal">
					 <!-- <a class="btn-floating btn-medium pink darken-2"> <i	class="medium material-icons">add</i></a> -->
				  </div>
				</div>
		  </div>
		</div>
		   <% 
		  
	   }
   }
   %>
		</div>
	</div>
 	<!-- END TOP SCORER -->
		
	</div>
	</div>
	<%
		} catch (Exception e) {
			System.out.println("Error : " + e);
		}
	%>
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="materialize/js/materialize.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 <script type="text/javascript" src="https://www.google.com/jsapi"></script>
 <script type="text/javascript">
 google.load("visualization", "1", {packages:["corechart"]});
 google.setOnLoadCallback(drawChart);
 function drawChart() {
 var data = google.visualization.arrayToDataTable([

 ['Name', 'Score'],
 <%
 	DBManager.loadDriver();
	/* ResultSet rs= DBManager.fetchQuery("select (select tName from tourTeam tt,team t where t.tId=tt.tId and tt.ttId=tg.ttId) as tName,count(gno) as goal from tourGoal tg group by ttId;;"); */
	rs=null;
	rs = DBManager.fetchQuery("select (select count(gno) from tourGoal where tourId=1) as goal,(select count(fno) from tourFoul where tourId=1) as foul,(select count(cno) from tourCard where cname='Y' and tourId=1) as yellow,(select count(cno) from tourCard where cname ='R' and tourId=1) as red;");
 	 if(rs.next()){
		 /* out.println("['"+rs.getString("tName")+"',"+rs.getString("goal")+"],"); */
		 out.println("['FOUL',"+rs.getString("foul")+"],['RED CARD',"+rs.getString("red")+"],['YELLOW CARD',"+rs.getString("yellow")+"],['GOAL',"+rs.getString("goal")+"],");
	 }
 %>
 
 ]);

 var options = {
	 title: 'TOURNAMENT STATISTICS',
	 pieHole: 0.4,
				 
 };
 var chart = new google.visualization.PieChart(document.getElementById("columnchart"));
 chart.draw(data, options);
 }
 </script>

</body>
</html>