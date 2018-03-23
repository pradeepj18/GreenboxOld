<%@ page language="java" contentType="text/html; charset=UTF-8" import="DBManager.DBManager,java.sql.*"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href = "css/index.css"> 
<link href='https://fonts.googleapis.com/css?family=Roboto+Condensed:700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto:100' rel='stylesheet' type='text/css'>
<title>Insert title here</title>
</head>

<body>
<div class="container">
	<br>
	<%
	DBManager.loadDriver();
	ResultSet rs= DBManager.fetchQuery("select mid,tid1,(select tName from team where tid=tid1) as tname1 ,tid2,(select tName  from team where tid=tid2) as tname2 from print_match where mid not in(select mid from manofthematch) order by mid;");
%>
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6 col-xs-12 col-sm-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<div class="panel-title"><span id="title"><center>MAN OF THE MATCH</center></span></div>
				</div>
				<div class="panel-body">
					
					<div class="row">
						<div class="col-md-12 col-xs-12 form-group">
							<label>SELECT MATCH</label>
								
									<select class="select-picker" id="match" name="mid" style="padding-right: 7%;margin-left: 7%;font-family: sans-sarif;">
										<option>Select Match</option>
									<%	while(rs.next())
										{
									%>
										
										<option value="<%=rs.getInt("mid")%>" onclick="showteam(<%=rs.getInt("mid")%>)"><%=rs.getInt("mid")%>&nbsp;&nbsp;<%=rs.getString("tname2") %> VS <%=rs.getString("tname1") %></option>
									<%} %>	
									</select>
						</div>
					</div>
					
					 <div class="row">
						<div class="col-md-12 col-xs-12 form-group">
							<div id="teamlist"></div>
							
						</div>
					</div>
					
					 <div class="row">
						<div class="col-md-12 col-xs-12 form-group">
							<div id="playerlist"></div>
							
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-12 col-xs-12 form-group">
							<center><input type="button" onclick="submit()" class="btn btn-danger" value="SUBMIT" name="submit"></center>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>

<script>
var tid;
var m;
function showteam(mid)
{
	m=mid;
	var tourId = 1;
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
				document.getElementById("teamlist").innerHTML=xmlhttp.responseText;
			}
		};
	}
	xmlhttp.open("GET","manofmatchteamlist.jsp?tourId="+tourId+"&mid="+mid,true);
	xmlhttp.send(null);

 }
function showplayer(tid)
{
	window.t = tid;
	var tourId = 1;
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
				document.getElementById("playerlist").innerHTML=xmlhttp.responseText;
			}
		};
	}
	xmlhttp.open("GET","manofmatchplayerlist.jsp?tourId="+tourId+"&tid="+tid,true);
	xmlhttp.send(null);
}
function showbarcode(barcode){
	window.bar = barcode;
	
}
function submit(){
	var xmlhttp = false;
	if(window.XMLHttpRequest)
	{
		xmlhttp = new XMLHttpRequest();
	}
	if(xmlhttp)
	{
		xmlhttp.onreadystatechange = function()
		{
			if(xmlhttp.readyState == 200 && xmlhttp.status == 4)
			{}
		};
	}
	alert("mid="+m+"&ttId="+t+"&barcodeId="+bar+"");
	xmlhttp.open("GET","addmanofthematch.jsp?mid="+m+"&ttId="+t+"&barcodeId="+bar,true);
	xmlhttp.send(null);
	
}
</script>

<!-- ______________JAVASCRIPT  JQUERY__________________________ -->
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	
</body>
</html>