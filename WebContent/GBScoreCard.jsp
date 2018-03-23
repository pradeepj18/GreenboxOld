<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Match Select</title>
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">

  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
   
  <style type="text/css">
  .decoration
  {
  font-size:12pt;
  color:black;
  padding:5px;
  width:60%;
  height:40px;
  }
  </style>

</head>


<body>
<div class="container">
<div class="row">
<div class="col-xs-3 col-md-3 col-sm-3"></div>
<div class="col-xs-6 col-md-6 col-sm-6 decoration">
<label >SELECT MATCH</label> 
<div id="livescore" ></div>
<select name="mid" id = "mid" onchange = "getMid();" class="form-control decoration">
<option value="">Select Match</option>

<%
int tourId=1;
try
{
	ResultSet rs=null;
	DBManager.loadDriver();
	rs=DBManager.fetchQuery("select mid,gender,pool,tid1,(select SUBSTRING_INDEX(tFlag,'/',-1) from team t,tourTeam tt where tt.tId = t.tId and w.tid1 = tt.ttId and tourId="+tourId+") as photo1,(select tname from team t,tourTeam tt where tt.tId = t.tId and w.tid1 = tt.ttId and tourId="+tourId+") as tname1,tid2,(select SUBSTRING_INDEX(tFlag,'/',-1) from team t,tourTeam tt where tt.tId = t.tId and w.tid2 = tt.ttId and tourId="+tourId+") as photo2,(select tname from team t,tourTeam tt where tt.tId = t.tId and w.tid2 = tt.ttId and tourId="+tourId+") as tname2 from wmatch w where Flag!='2'");
	while(rs.next())
	{
		if(rs.getString("gender").equalsIgnoreCase("M"))
	
		out.println("<option value="+rs.getInt("mid") + ">" + rs.getInt("mid")+ "  -  ("+ rs.getString("tname1")+","+ rs.getString("tname2")+")  -  MALE</option>");
		
		else
			out.println("<option value="+rs.getInt("mid") + ">" + rs.getInt("mid")+ "  -  ("+ rs.getString("tname1")+","+ rs.getString("tname2")+")  -  FEMALE</option>");
	}
}
catch(Exception e){}
%>
</select>
<span id="GBmid"></span>
<span id="GBsc"></span>

</div>
<div class="col-xs-3 col-md-3 col-sm-3"></div>
</div>
</div>
</body>
  <script type="text/javascript">
  var tourId=1;
  var toss;
  
  function inittoss(id){
	  
	  toss=id;
  }
  
  function getscorecard()
  {
   
  	var mid = document.getElementById("mid").value;
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
  				document.getElementById("GBsc").innerHTML = xmlhttp.responseText;
  			  
  			}
  		};
  	}
  	
  	xmlhttp.open("GET","GBScoreCard1.jsp?mid="+mid+"&tourId="+tourId,true);
  	xmlhttp.send(null);
  
  } 
  
  
   function getMid()
	{
	  
		var mid = document.getElementById("mid").value;
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
					
					document.getElementById("GBmid").innerHTML = xmlhttp.responseText;
					
				}
			};
		}
		
		xmlhttp.open("GET","GBGetToss.jsp?mid="+mid+"&tourId="+tourId,true);
		xmlhttp.send(null);
	}
   function addscore(mid,tourId,uid)
   {
	  // int toss=document.getElementById("toss").value;
//alert(toss+"+++++");
			
	 window.open("GBUpdateToss.jsp?mid="+mid+"&tourId="+tourId+"&toss="+toss+"&uid="+uid, "file","status=1,width=1366,height=768");
	 window.open("GBGoalFoulCard.jsp?mid="+mid+"&tourId="+tourId, "_self1","status=1,width=1366,height=768");
			
   }   

  
  </script>
</html>