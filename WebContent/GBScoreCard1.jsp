<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Get Score </title>
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">

  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
<style>
.cls
{
width:20%;
font-size:15pt;
}
</style>
</head>
<body>
<%
int tourId=Integer.parseInt(request.getParameter("tourId"));
int mid=Integer.parseInt(request.getParameter("mid"));
%>
<div class="container">

<div class="row">
<div class="col-xs-6 col-sm-6 col-md-6">

</div>
</div>

<div class="row">
<div class="col-xs-6 col-sm-6 col-md-6">
<h2 style="color:red;">Click Below Button to Start Match</h2><br>
		<!-- <input type="text" size="5" id="timer" name="timer" value="10:00" class="form-control"><br>
		<button id="start" onclick="start();updateTimer();" class="btn btn-success cls">START</button>&nbsp;&nbsp;&nbsp;&nbsp;
		<button id = "stop" onclick="stop();updateTimer();" disabled class="btn btn-warning cls">STOP</button>&nbsp;&nbsp;&nbsp;&nbsp;
		<button id = "reset" onclick="reset()" disabled class="btn btn-danger cls">RESET</button>&nbsp;&nbsp;&nbsp;&nbsp;
 -->	
 	<button id = "addscore" onclick="addscore(<%=mid %>,<%=tourId %>,1);" class="btn btn-primary" style="font-size:15pt;">START MATCH</button>
</div>
<div class="col-xs-6 col-sm-6 col-md-6" >

</div>

</div>
</div>
</body>

<script>

	
</script>


</html>