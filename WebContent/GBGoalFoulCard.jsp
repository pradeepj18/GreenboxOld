<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Goal Foul Card</title>
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">

  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  
  <style>
  body{overflow-y: scroll;}
  .GB-label
	{
	border-radius:3px;
	overflow-x:hidden;
	box-shadow: 0px 1px 1px 1px #888888;
	padding:5px;
	font-size:15pt;
	border-color:#030825;
	cursor:pointer;
	
	text-align:center;
	}

	.GB-title-txt
	{
		font-size:13pt;
		color:#ffffff;
		text-align:center;
	}
	.GB-title-bar
	{
		background:#030825;
		overflow-x:hidden;
		border-radius:5px;
		padding:5px;
		
	}
	.cls
{
width:20%;
font-size:15pt;
}
  .decoration
  {
  font-size:12pt;
  color:black;
  padding:5px;
  width:60%;
  }
  </style>
  
  <script>
  var id=document.getElementById("drop").value();
  alert(id);
$(document).ready(function(){
    $(".dd1").on({  
        mouseleave: function(){
            $(this).hide(1000);
        }, 
        click: function(){
            $(this).show(1000);
        }  
    });
});
</script>
<script type="text/javascript">

var tourId=getParameter("tourId");
var mid=getParameter("mid");

function showgoal(flag)
{
	
$('#refscore'+flag).load('GBRefreshScore.jsp?tourId='+tourId+'&mid='+mid+'&flag='+flag).fadeIn("slow");
} // refresh every 10000 milliseconds

function getParameter(variable)
{
       var query = window.location.search.substring(1);
       var vars = query.split("&");
       for (var i=0;i<vars.length;i++) {
               var pair = vars[i].split("=");
               if(pair[0] == variable){return pair[1];}
       }
       return(false);
}
</script>

</head>
<body onload="showgoal(1);showgoal(2);">
<div class="container-fluid">
<div class="row">
<div class="col-md-4" >
<div class="row">
<div class="col-md-12 col-xs-12">
<%
int uid=1;
try
{
	int tAscore=0,tBscore=0;
DBManager.loadDriver();
ResultSet rs=null;
int tid1=0,tid2=0;
String tname1="",tname2="";
rs=DBManager.fetchQuery("select gender,tid1,(select tname from team t,tourTeam tt where tt.tId = t.tId and w.tid1 = tt.ttId and tourId="+request.getParameter("tourId")+") as tname1,tid2,(select tname from team t,tourTeam tt where tt.tId = t.tId and w.tid2 = tt.ttId and tourId="+request.getParameter("tourId")+") as tname2 from wmatch w where mid="+request.getParameter("mid")+";");
if(rs.next())
{
tid1=rs.getInt("tid1");
tid2=rs.getInt("tid2");
tname1=rs.getString("tname1");
tname2=rs.getString("tname2");
}
/* rs=null;
rs=DBManager.fetchQuery("select count(gno) as tAscore from tourGoal where tourId="+request.getParameter("tourId")+" and mid="+request.getParameter("mid")+" and ttId="+tid1+";");
if(rs.next())
	tAscore=rs.getInt("tAscore"); */
%>
<center><h1><%=tname1 %>&nbsp;&nbsp;(&nbsp;<span id="refscore1"></span>&nbsp;)</h1></center><br>
</div>
	</div>
<%

rs=null;
rs=DBManager.fetchQuery("select m.barcodeId,m.fName,m.mName,m.lName,tp.jerseyNo,ttId from tourPlayer tp,member m where tp.barcodeId=m.barcodeId and tp.ttId="+ tid1 + " and tp.tourId=" + request.getParameter("tourId")+ ";");
if(rs.next())
{
	%>
	<div class="row GB-title-bar GB-title-txt">
	<div class="col-md-2 ">
	<span>JNO</span>
	</div>
	<div class="col-md-10 ">
	<span>PLAYER NAME</span>
	</div>
	</div>
	<% rs.beforeFirst();
	while(rs.next())
	{
%>
<div class="row  GB-label dd" id="drop<%=rs.getInt("jerseyNo")%>">


<div class="col-md-2">
<a data-toggle="collapse" data-target="#demo<%=rs.getInt("jerseyNo")%>"><span ><%=rs.getInt("jerseyNo") %></span></a>
    
</div>

<div class="col-md-10">
<a data-toggle="collapse" data-target="#demo<%=rs.getInt("jerseyNo")%>"><span><%=rs.getString("fName")+" "+rs.getString("lName") %></span></a>
 <%--    <div id="demo1<%=rs.getInt("jerseyNo")%>" class="collapse">
      <center>
      <button style="width:100%;"type="button" class="btn btn-primary" onclick="addGoal(<%=rs.getInt("jerseyNo")%>,<%=rs.getInt("ttId")%>,<%=request.getParameter("tourId")%>,<%=request.getParameter("mid")%>)">GOAL</button>
      <button style="width:100%;"type="button" class="btn btn-primary" onclick="addFoul(<%=rs.getInt("jerseyNo")%>,<%=rs.getInt("ttId")%>,<%=request.getParameter("tourId")%>,<%=request.getParameter("mid")%>)">FOUL</button>
      <button style="width:100%;"type="button" class="btn btn-warning" onclick="addCardY(<%=rs.getInt("jerseyNo")%>,<%=rs.getInt("ttId")%>,<%=request.getParameter("tourId")%>,<%=request.getParameter("mid")%>)">CARD Y</button><br>
      <button style="width:100%;"type="button" class="btn btn-danger" onclick="addCardR(<%=rs.getInt("jerseyNo")%>,<%=rs.getInt("ttId")%>,<%=request.getParameter("tourId")%>,<%=request.getParameter("mid")%>)">CARD R</button>
    </center>
    </div> --%>
<div id="demo<%=rs.getInt("jerseyNo")%>" class="collapse">
      <center>
      <button style="width:100%;"type="button" class="btn btn-primary" onclick="GBAddA(1,<%=rs.getInt("jerseyNo")%>,<%=tid1%>,<%=request.getParameter("tourId")%>,<%=request.getParameter("mid")%>,<%=rs.getInt("barcodeId")%>,1)">GOAL</button>
      <button style="width:100%;"type="button" class="btn btn-primary" onclick="GBAddA(2,<%=rs.getInt("jerseyNo")%>,<%=tid1%>,<%=request.getParameter("tourId")%>,<%=request.getParameter("mid")%>,<%=rs.getInt("barcodeId")%>)">FOUL</button>
      <button style="width:100%;"type="button" class="btn btn-warning" onclick="GBAddA(3,<%=rs.getInt("jerseyNo")%>,<%=tid1%>,<%=request.getParameter("tourId")%>,<%=request.getParameter("mid")%>,<%=rs.getInt("barcodeId")%>)">CARD Y</button><br>
      <button style="width:100%;"type="button" class="btn btn-danger" onclick="GBAddA(4,<%=rs.getInt("jerseyNo")%>,<%=tid1%>,<%=request.getParameter("tourId")%>,<%=request.getParameter("mid")%>,<%=rs.getInt("barcodeId")%>)">CARD R</button>
    </center>
    </div>
</div>

</div>
<%} 
}
%>


</div>


<div class="col-md-4">

<center><h2>COUNTDOWN TIMER</h2><br><br>
<select id="gtype" name="gtype" style="color:red;" class="form-control decoration ">
		 <option value='1'>FIRST HALF</option>
		 <option value='2'>SECOND HALF</option>
		 <option value='G'>GOLDEN GOAL</option> 
		 <option value='P'>PENALTY</option>
		
		 </select><br>
		<input style="color:red;width:42%;font-size:40pt;height:20%;" class=" form-control input-lg " type="text" id="timer" name="timer" value="0:10" class="form-control"><br>
		<button id="start" onclick="start();updateTimer();" class="btn btn-success cls" style="background-color:green;">START</button>&nbsp;&nbsp;&nbsp;&nbsp;
		<button id = "stop" onclick="stop();updateTimer();" disabled class="btn btn-warning cls" style="background-color:orange;">STOP</button>&nbsp;&nbsp;&nbsp;&nbsp;
		<button id = "reset" onclick="reset()" disabled class="btn btn-danger cls" style="background-color:red;">RESET</button>&nbsp;&nbsp;&nbsp;&nbsp;
	<%-- 	<button id = "addscore" onclick="addscore(<%=request.getParameter("mid") %>)" class="btn btn-primary" style="font-size:15pt;">ADD SCORE</button> --%>
<br>
<br>
</center>

 <center> <button style="font-size: 15pt;width:100%;"type="button" class="btn btn-info " data-toggle="collapse" data-target="#recent">RECENT CONTENT</button>
  </center>
  <div id="recent" class="collapse">
  <div class="panel-group">
    <div class="panel panel-info" >
      <div class="panel-heading">
        <h5 class="panel-title">
        <div class="row" style="font-size:10pt;">
        <div class="col-md-1">
        <span style="float:left;">JNO</span>
        </div>
        <div class="col-md-5">
        <span style="float:left;">PLAYER NAME&nbsp;<span style="color:red">(GOAL)</span></span>
        </div>
        <div class="col-md-5">
        <span style="float:left;">TEAM NAME</span>
        </div>
        <div class="col-md-1">
        <span style="float:right;">D</span>
        </div>
        </div>
         </h5>
      </div>
      	<div  class="panel-body" >
        <span id="rg1"></span>
      </div>
    </div>
  </div>
  
  
  <div class="panel-group">
    <div class="panel panel-info" >
      <div class="panel-heading">
        <h5 class="panel-title">
        <div class="row" style="font-size:10pt;">
        <div class="col-md-1">
        <span style="float:left;">JNO</span>
        </div>
        <div class="col-md-5">
        <span style="float:left;">PLAYER NAME&nbsp;<span style="color:red">(FOUL)</span></span>
        </div>
        <div class="col-md-5">
        <span style="float:left;">TEAM NAME</span>
        </div>
        <div class="col-md-1">
        <span style="float:right;">D</span>
        </div>
        </div>
         </h5>
      </div>
      	<div  class="panel-body" >
        <span id="rg2"></span>
      </div>
    </div>
  </div>
  
  <div class="panel-group">
    <div class="panel panel-info" >
      <div class="panel-heading">
        <h5 class="panel-title">
        <div class="row" style="font-size:10pt;">
        <div class="col-md-1">
        <span style="float:left;">JNO</span>
        </div>
        <div class="col-md-5">
        <span style="float:left;">PLAYER NAME&nbsp;<span style="color:red;">(Y)</span></span>
        </div>
        <div class="col-md-5">
        <span style="float:left;">TEAM NAME</span>
        </div>
        <div class="col-md-1">
        <span style="float:right;">D</span>
        </div>
        </div>
         </h5>
      </div>
      	<div  class="panel-body" >
        <span id="rg3"></span>
      </div>
    </div>
  </div>
  <div class="panel-group">
    <div class="panel panel-info" >
      <div class="panel-heading">
        <h5 class="panel-title">
        <div class="row" style="font-size:10pt;">
        <div class="col-md-1">
        <span style="float:left;">JNO</span>
        </div>
        <div class="col-md-5">
        <span style="float:left;">PLAYER NAME&nbsp;<span style="color:red;">(R)</span></span>
        </div>
        <div class="col-md-5">
        <span style="float:left;">TEAM NAME</span>
        </div>
        <div class="col-md-1">
        <span style="float:right;">D</span>
        </div>
        </div>
         </h5>
      </div>
      	<div  class="panel-body" >
        <span id="rg4"></span>
      </div>
    </div>
  </div>
</div>

</div>

<div class="col-md-4" >
<div class="row">
<div class="col-md-12 col-xs-12">
<%
rs=null;
rs=DBManager.fetchQuery("select count(gno) as tBscore from tourGoal where tourId="+request.getParameter("tourId")+" and mid="+request.getParameter("mid")+" and ttId="+tid2+";");
if(rs.next())
	tBscore=rs.getInt("tBscore");
%>
<center><h1>(&nbsp;<span id="refscore2"></span>&nbsp;)&nbsp;&nbsp;<%=tname2 %></h1></center><br>
</div>
	</div>
<%
rs=null;
rs=DBManager.fetchQuery("select m.barcodeId,m.fName,m.mName,m.lName,tp.jerseyNo,ttId from tourPlayer tp,member m where tp.barcodeId=m.barcodeId and tp.ttId="+ tid2 + " and tp.tourId=" + request.getParameter("tourId")+ ";");
if(rs.next())
{
	%>
	<div class="row GB-title-bar GB-title-txt">
	<div class="col-md-2 ">
	<span>JNO</span>
	</div>
	<div class="col-md-10 ">
	<span>PLAYER NAME</span>
	</div>
	</div>
	<% rs.beforeFirst();
	while(rs.next())
	{
%>
<div class="row  GB-label dd" id="drop<%=rs.getInt("jerseyNo")%>">


<div class="col-md-2">
<a data-toggle="collapse" data-target="#demoB<%=rs.getInt("jerseyNo")%>"><span ><%=rs.getInt("jerseyNo") %></span></a>
    
</div>

<div class="col-md-10">
<a data-toggle="collapse" data-target="#demoB<%=rs.getInt("jerseyNo")%>"><span><%=rs.getString("fName")+" "+rs.getString("lName") %></span></a>
 <%--    <div id="demo1<%=rs.getInt("jerseyNo")%>" class="collapse">
      <center>
      <button style="width:100%;"type="button" class="btn btn-primary" onclick="addGoal(<%=rs.getInt("jerseyNo")%>,<%=rs.getInt("ttId")%>,<%=request.getParameter("tourId")%>,<%=request.getParameter("mid")%>)">GOAL</button>
      <button style="width:100%;"type="button" class="btn btn-primary" onclick="addFoul(<%=rs.getInt("jerseyNo")%>,<%=rs.getInt("ttId")%>,<%=request.getParameter("tourId")%>,<%=request.getParameter("mid")%>)">FOUL</button>
      <button style="width:100%;"type="button" class="btn btn-warning" onclick="addCardY(<%=rs.getInt("jerseyNo")%>,<%=rs.getInt("ttId")%>,<%=request.getParameter("tourId")%>,<%=request.getParameter("mid")%>)">CARD Y</button><br>
      <button style="width:100%;"type="button" class="btn btn-danger" onclick="addCardR(<%=rs.getInt("jerseyNo")%>,<%=rs.getInt("ttId")%>,<%=request.getParameter("tourId")%>,<%=request.getParameter("mid")%>)">CARD R</button>
    </center>
    </div> --%>
<div id="demoB<%=rs.getInt("jerseyNo")%>" class="collapse">
      <center>
      <button style="width:100%;"type="button" class="btn btn-primary" onclick="GBAddA(1,<%=rs.getInt("jerseyNo")%>,<%=tid2%>,<%=request.getParameter("tourId")%>,<%=request.getParameter("mid")%>,<%=rs.getInt("barcodeId")%>,2)">GOAL</button>
      <button style="width:100%;"type="button" class="btn btn-primary" onclick="GBAddA(2,<%=rs.getInt("jerseyNo")%>,<%=tid2%>,<%=request.getParameter("tourId")%>,<%=request.getParameter("mid")%>,<%=rs.getInt("barcodeId")%>)">FOUL</button>
      <button style="width:100%;"type="button" class="btn btn-warning" onclick="GBAddA(3,<%=rs.getInt("jerseyNo")%>,<%=tid2%>,<%=request.getParameter("tourId")%>,<%=request.getParameter("mid")%>,<%=rs.getInt("barcodeId")%>)">CARD Y</button><br>
      <button style="width:100%;"type="button" class="btn btn-danger" onclick="GBAddA(4,<%=rs.getInt("jerseyNo")%>,<%=tid2%>,<%=request.getParameter("tourId")%>,<%=request.getParameter("mid")%>,<%=rs.getInt("barcodeId")%>)">CARD R</button>
    </center>
    </div>
</div>

</div>
<%} 
}
}
catch(Exception e){System.out.println("Error in GBGoalFoulCard"+e);}
%>


</div>
</div>
<div class="row">
<div class="col-md-4"></div>

<div class="col-md-4">
<br><br>
<div class="row">
<div class="col-md-2"></div>
<div class="col-md-8">
<center><button style="width:100%;"type="button" id="generateprint" class="btn btn-danger gen" disabled="disabled" onclick="generate(<%=request.getParameter("tourId")%>,<%=request.getParameter("mid")%>)">GENERATE SCORESHEET</button></center>
</div>
<div class="col-md-2"></div>
</div>
</div>
</div>
</div>
<script type="text/javascript">

var duration = 0;

var minutes,seconds,min,refreshInterval,timer;
function startTimer()
{
	timer = duration-1;
	
	refreshInterval = setInterval(refreshTimer,1000);
}
function refreshTimer()
{
	minutes = parseInt(timer/60,10);
	seconds = parseInt(timer%60,10);

	minutes = minutes < 10?"0"+minutes:minutes;
	seconds = seconds < 10?"0"+seconds:seconds;
	if(--timer < 0)
	{
		timer = 0;
		duration = 0;
		document.getElementById("timer").value = "00:00";
		clearTimeout(refreshInterval);
	}
	document.getElementById("timer").value = minutes+":"+seconds;
	
	if($("#gtype").val()!=1 && minutes==0 && seconds==1)
		{
	
		//document.getElementById("generateprint").disabled=false;
		$('.gen').prop('disabled',false);
		}
}
function start()
{

	var btn = document.getElementById("start");
	btn.disabled = true;
	var stop = document.getElementById("stop");
	stop.disabled = false;
	var reset = document.getElementById("reset");
	reset.disabled = false;

	var timertxt = document.getElementById("timer");
	timertxt.disabled = true;
	
	var	m = document.getElementById("timer").value;
	
	var timearr = m.split(":");
	
	min = (parseInt(timearr[0]*60,10))+parseInt(timearr[1],10);
	
	duration = min;
	
	startTimer();
}
function stop()
{
	var btn = document.getElementById("start");
	btn.disabled = false;
	
	var stop = document.getElementById("stop");
	stop.disabled = true;
	
	
	clearTimeout(refreshInterval);
}
function reset()
{
	clearTimeout(refreshInterval);
	var btn = document.getElementById("start");
	btn.disabled = false;
	var stop = document.getElementById("stop");
	stop.disabled = true;
	var stop = document.getElementById("reset");
	stop.disabled = true;
	var timertxt = document.getElementById("timer");
	timertxt.disabled = false;
	
	document.getElementById("timer").value = "00:00";
}
function setCookie(value)
{
	d = window.location.hostname;
	document.cookie = "timer=" + value + ";domain="+ d +";path=/";
	return true;
}
function updateTimer()
{
	var t = document.getElementById("timer").value;
	
	setCookie(t);
	setTimeout(updateTimer,1000);
	
}

function GBAddA(uid,jno,tid,tourId,mid,bid,flag)
{

	 var btn = document.getElementById("start");
	if(btn.disabled==false)
		{
		alert("TIME IS STOPED..!");
		}
	else
		{
	
var timer=document.getElementById("timer").value;

var gtype=document.getElementById("gtype").value;
var xmlhttp = false;
	if(window.XMLHttpRequest)
	{
		xmlhttp = new XMLHttpRequest();
	}
	
	if(xmlhttp)
	{
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
			{
				document.getElementById("rg"+uid).innerHTML = xmlhttp.responseText;
			}
		};
	}
	
	xmlhttp.open("GET","GBAddGFC.jsp?jno="+jno+"&tid="+tid+"&tourId="+tourId+"&mid="+mid+"&time="+timer+"&gtype="+gtype+"&bid="+bid+"&uid="+uid,true);
	xmlhttp.send(null);
	showgoal(flag);	 
/* alert("Data Added"); */
}
}

function delgoal(gno,uid,tourId,mid,flag)
{
alert("UID"+uid+"flag "+flag);
var xmlhttp = false;
	if(window.XMLHttpRequest)
	{
		xmlhttp = new XMLHttpRequest();
	}
	
	if(xmlhttp)
	{
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
			{
				document.getElementById("rg"+uid).innerHTML = xmlhttp.responseText;
			}
		};
	}
	
	xmlhttp.open("GET","GBDelGFC.jsp?gno="+gno+"&uid="+uid+"&tourId="+tourId+"&mid="+mid,true);
	xmlhttp.send(null);
	showgoal(1);
	showgoal(2);
/* alert("Data Added"); */
}
function generate(tourId,mid)
{
	var uid=2;
window.open("GBUpdateToss.jsp?mid="+mid+"&tourId="+tourId+"&uid="+uid, "file","status=1,width=1366,height=768");
window.open("GBScoreSheet.jsp?mid="+mid+"&tourId="+tourId,"Score Sheet");
}
</script>
</body>
</html>