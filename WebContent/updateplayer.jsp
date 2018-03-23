<%@ page language="java" contentType="text/html; charset=UTF-8" import="DBManager.DBManager,java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tournament</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<script src="js/jquery.min.js"></script>
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/jquery.min.js"></script> -->
<script src="js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>

<!-- FOR Redirecting -->
<script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">

<!-- SELECT MEMBER -->
<link rel="stylesheet" type="text/css" href="css/listswap.css" />
<!-- <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css"> -->

<style>
.container {
	margin:150px auto 0 auto;
	max-width:960px;	
	margin-top:-1%;
}
body
{
	background:url("images/bg-footer.jpg");
 	
	background-position: center -50px;
	background-repeat: no-repeat;
	background-size:100% 38%;
	position:relative;
	width: 100%;
	height: 50%;
	max-width:100%;
	overflow-x:hidden;
	clear:both; 
}
img#mahaLagori
 {
    -webkit-filter: brightness(100%); /* Chrome, Safari, Opera */
    filter: brightness(100%);
    background-color: #cccccc;
    z-index:-2;
}
.navbar-default {
    background-color: #f8f8f8;
    border-color:#030825;
}

#logo
{
	float:left;
	margin-left:-4.2%;
	width:75%;
}
#topbar
{
	color:white;
}
#container-tour-image
{
	background-image:url("images/grnd.jpg");
	background-color: #333;
	background-position: center -10px;
	background-repeat: no-repeat;
	background-size: cover;
	width: 100%;
	float:left;
	margin-left:-3%;
	height:380%;
}
.tour-image-text
{
	color:white;
	float:right;
	margin-top:1%;
	margin-right:30%;
}
.design
{
	background-image:url("images/mahaLagori.png");
	background-color: #333;
	background-position: center 0px;
	background-repeat: no-repeat;
	background-size: 100% 100%;
	width: auto;
	height:280%;
}
#tour-tabs
{
	float:left;
	margin-left:4%;
	margin-top:-2.9%;
}
#presentation
{
	background-color:#050D3B;
	color:white;
	display: block;
    font-size: 12px;
    padding: 10px 30px;
    text-transform: uppercase;
    font-family: 'Open Sans', sans-serif;

}
#presentation1
{
	background-color:#fff;
	color: #030825;
	font-weight: bold;
	display: block;
    font-size: 12px;
    padding: 10px 30px;
    text-transform: uppercase;
 }
.venue
{
	float:left;
	margin-left:75%;
	margin-top:-15%;
}
.tour-date
{
	float:left;
	margin-left:75%;
	margin-top:-9%;
}
a
{
	font-weight:700;
	color:#333;
	text-decoration:none;
}
a:hover
{
	font-weight:700;
	color:#000;
	text-decoration:none;
}
.add{
	color:red;
}
.teamhead
{
	font-family: 'Open Sans', sans-serif;
	background:  #0E1957;
	color: #ffffff;
    border-left: 1px solid #e4e4e2;
    border-right: 1px solid #e4e4e2;
    border-top: 1px solid #e4e4e2;
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
    display: block;
    font-size: 16px;
    font-weight: bold;
    padding: 8px 0;
    text-align: center;
    margin-left:13%;
    margin-top: 10%;
}

.teamdropdown
{
	height: 385px;
	width: 87%;
	margin-left: 13%;
	overflow: hidden;
	overflow-y: scroll;
	border-radius: 5px;
	box-shadow: 1px 1px 6px #888888;
}
.teamdropdown::-webkit-scrollbar {
    width: 4px;
}
 
.teamdropdown::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
    border-radius: 10px;
}
 
.teamdropdown::-webkit-scrollbar-thumb {
    border-radius: 10px;
    -webkit-box-shadow: inset 0 0 6px #333; 
}
.list-group-item
{
	padding:0px 0px;
}
.player-name {
    font-size: 14px;
}
p
{	
	text-align: center;
    margin: 0px 0px 0px 0px;
    padding: 0px 0px 0px 0px;
    margin-top: -5%;
}
.teamdropdown .stats {
    margin: 5px auto 10px;
    overflow: auto;
    width: 100%;
}
ul
{
	list-style: none;
	padding: 0px 0px 0px 0px;
}
.teamdropdown .stats li {
    border-right: 1px solid #7a7a7a;
    float: left;
    overflow: hidden;
    text-align: center;
    width: 33.33%;
}
li {
    margin-bottom: 0px;
    list-style: none;
    margin: 0px 0px 0px 0px;
	padding: 0px 0px 0px 0px;
}
.teamdropdown .stats li .value {
    font-size: 16px;
    line-height: 16px;
}
.teamdropdown .stats li .value {
    display: block;
    vertical-align: top;
    width: 100%;
}

/*AJAX*/
.container
{
		background:#fff;
		float:left;
		width:80%;
		margin-left:10%;
}
#update-bar
	{
		background:#030825;
		width:99.7%;
		float:left;
		border-radius:5px;
	}
#update-text
{
		float:left;
		font-size:16pt;
		color:#ffffff;
		margin-left:40%;

}

/*END*/

</style>

</head>
<body onload="showteam();showplayer();">
<%
try
{
if(request.getParameter("tourId")!=null)
{
//out.println("++++"+request.getParameter("tourId"));
%>
<div class="container-fluid">
<div class="row" id="topbar">
<div class="col-xs-2 col-md-2">
<font size="2pt">PLAYSOFTECH</font>
</div>
<div class="col-xs-8 col-md-8">
<font color="#5191cd" size="2pt">
<%
	DBManager.loadDriver();
	ResultSet rs= DBManager.fetchQuery("select DATE_FORMAT(now(),'%d %M %x') as date");
	rs.next();
%>
<%=rs.getString("date")%>
</font>
</div>
<div class="col-xs-2 col-md-2">
FOLLOW US
<i class="fa fa-facebook fa-1x" aria-hidden="true"></i>

</div>
</div>
<div class="row">
		<nav class="navbar navbar-default" style="background-color:#2045a5;opacity:0.9;" >
			<div class="container-fluid" >
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myHeader" aria-expanded="false">
						<span class="sr-only"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<img src="images/lagori.png" alt="LAGORI" id="logo">
				</div>
				 <!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="myHeader" >
				<ul class="nav navbar-nav">
					<li class="nav-item dropdown active">
						<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="tournament.jsp" role="button" aria-haspopup="true" aria-expanded="false">TOURNAMENT<span class="sr-only">(current)</span></a>
					</li>
					
					<li><a href="#"><font color="white">TEAMS</font></a></li>
					<li><a href="#"><font color="white">UPDATE</font></a></li>
					<li><a href="selectMatch.jsp"><font color="white">SELECT MATCH</font></a></li>
					<li><a href="#"><font color="white">MATCH SUMMARY</font></a></li>
					<li><a href="#"><font color="white">STATISTICS</font></a></li>
				</ul>
				</div>
			</div>
		</nav>
	</div>
	<div class="container-fluid">
	<div class="row" id="container-tour-image">
		<div class="col-md-12 col-sm-12 col-lg-12">
		<div class="design">
			<div class="tour-image-text">
			<img src="images/2(1).png" width="1110" height="320" style="float:right;margin-top:-1.2%;margin-right:-41.6%;">
			<img src="images/mahaLagori.png" width="200" height="200" style="float:right;margin-right:-99%;">
			<img src="images/calli(1).png" width="140" height="140" style="float:right;margin-right:-55%;margin-top:1%;">
			<dl class="dl-horizontal venue">
				<dt>VENUE:</dt>
				<dd>Shiv Chatrapati Sports Complex,Balewadi,Pune</dd>
			</dl>
				<dl class="dl-horizontal tour-date">
				<dt>DATE:</dt><dd>27th Sept to 29th Sept 2016</dd>
			 </dl>		 
			
			</div>
		</div>
		</div>
	</div>
	</div>
	<div class="row">
	<ul class="nav nav-tabs" id="tour-tabs">
		<li class="active"><a href="tournamentnext.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation">OVERVIEW</a></li>
		<li class="active"><a href="addtour.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation">ADD</a></li>
		<li class="active"><a  href="selectMatch.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation">SELECT MATCH</a></li>
		<li class="active"><a  href="updateplayer.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation1">EDIT PLAYER</a></li>
		<li class="active"><a  href="viewList.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation">VIEW</a></li>
	</ul>
	</div>
	
<!-- 	UPDATE PLAYER---------------- -->
	<div class="row"><br></div>	
	<div class="row">
	   <div class="col-md-1"></div>
			<div class="col-md-2" id="gender">
				<div class="form-group row">
					<label for="gender"><font size="4px">Gender</font></label><br>
				      	<label class="radio-inline">
	    			    	<input type="radio" name="gen" id="male" checked onclick="showteam()"><font size="4px">Male</font>
	    				</label>
	    				<label class="radio-inline">
	   						<input type="radio" name="gen" id="female" onclick="showteam()"><font size="4px">Female</font>
	   					</label>	
				</div>
			</div>
			<div class="col-md-3">
			 <select id="memcategory" class="selectpicker" data-size="5" onchange="showplayer();" style="display: none;">
		      <option value="1">Player</option>
		      <option value="2">Coach</option>
		      <option value="3">Manager</option>
		      <option value="4">Official</option>
		      <option value="5">Team</option>
		     </select>
			</div>
			<div class="col-md-6">
			</div>
	</div>
	<div class="row">
		<div class="col-md-1"></div>
			<div class="col-md-5" id="team">
			</div>
			<div class="col-md-6"><div id="showplayer"></div></div>
	</div>
	
	<%}
}
catch(Exception e){System.out.println("Exception in updateplayer1.jsp"+e);}
	%>
<script>
function showteam()
{
	var tourId = getParameter("tourId");
	var gen = '';
	if(document.getElementById("male").checked)
	{
		gen = 'M';
	}
	else if(document.getElementById("female").checked)
	{
		gen = 'F';
	}
 	var xmlhttp = false;
	if(window.XMLHttpRequest)
	{
		xmlhttp= new XMLHttpRequest();
	}
	if(xmlhttp)
	{
		xmlhttp.onreadystatechange = function()
		{
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
			{
				document.getElementById("team").innerHTML=xmlhttp.responseText;
			  showplayer();
			}
		};
	}
	xmlhttp.open("GET","updateteamplayer.jsp?tourId="+tourId+"&ttGender="+gen,true);
	xmlhttp.send(null);

 }
function showplayer()
{
	var gen = '';
	if(document.getElementById("male").checked)
	{
		gen = 'M';
	}
	else if(document.getElementById("female").checked)
	{
		gen = 'F';
	}
	var cat = document.getElementById("memcategory").value;
	var tourId =getParameter("tourId");
	var ttId=document.getElementById("select-team").value;
	/* var ttId =  e.options[e.selectedIndex].value; */
	var xmlhttp = false;
	if(window.XMLHttpRequest)
	{
		xmlhttp = new XMLHttpRequest();
	}
	if(xmlhttp)
	{
		xmlhttp.onreadystatechange = function()
		{
			if(xmlhttp.readyState == 4 && xmlhttp.status ==200)
			{
				document.getElementById("showplayer").innerHTML=xmlhttp.responseText;
			}
		};
	}
	xmlhttp.open("GET","showplayer.jsp?tourId="+tourId+"&ttId="+ttId+"&memcategory="+cat+"&ttGender="+gen,true);
	xmlhttp.send(null);
}

function updateplayer(id,category)
{
	var fName='';
	if(category != 5){fName = document.getElementById("fName"+id).value;}
	var mName='';
	if(category != 1 && category != 5){mName = document.getElementById("mName"+id).value;}
	var lName='';
	if(category != 1 && category != 5){lName = document.getElementById("lName"+id).value;}
	var tName='';
	
	if(category == 5){tName = document.getElementById("tName"+id).value;}
	var jerseyNo='';
	if(category == 1){jerseyNo = document.getElementById("jerseyNo"+id).value;}
	
	var tourId = getParameter("tourId");
	var ttId=document.getElementById("select-team").value;
	var xmlhttp=false;
	if(window.XMLHttpRequest)
	{
		xmlhttp = new XMLHttpRequest();
	}
	if(xmlhttp)
	{
		xmlhttp.onreadystatechange = function()
		{
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
			{
				showplayer();
				showteam();
			}
		};
	};
	xmlhttp.open("GET","updatedeleteplayer?tourId="+tourId+"&ttId="+ttId+"&barcodeId="+id+"&fName="+fName+"&mName="+mName+"&lName="+lName+"&jerseyNo="+jerseyNo+"&tName="+tName+"&category="+category+"&flag=1",true);
	xmlhttp.send(null);
	
}

function updateConfirm(id,category)
{
    var x;
    if (confirm("Are You Sure To Update!") == true) 
    {
    	updateplayer(id,category);
    }
}
function deleteConfirm(id,category)
{
    var x;
    if (confirm("Are You Sure To Delete!") == true) 
    {
    	deleteplayer(id,category);
    }
}

function deleteplayer(id,category)
{
	var tourId=getParameter("tourId");
	var xmlhttp = false;
	if(window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	if(xmlhttp)
	{
		xmlhttp.onreadystatechange = function()
		{
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
			{
				showplayer();
				showteam();
			}
		};
	}
	xmlhttp.open("GET","updatedeleteplayer?tourId="+tourId+"&barcodeId="+id+"&category="+category+"&flag=2",true);
	xmlhttp.send(null);
	showplayer();
}
function getParameter(variable)
{
	var query = window.location.search.substring(1);
	var vars = query.split("&");
	for(var i = 0;i < vars.length;i++)
	{
		var pair = vars[i].split("=");
		if(pair[0] == variable){return pair[1];}
	}
	return (false);
}
</script>
<br>
</div>
</body>
</html>