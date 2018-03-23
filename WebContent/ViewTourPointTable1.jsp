<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="DBManager.DBManager,java.sql.*,java.util.Date,java.text.*"%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="css/page-2.css">
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:700" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Roboto:100" rel="stylesheet" type="text/css">
<title>Green Box</title>
<style>

#left
{
	 margin-left: 70px;
}

#center
{
	 margin-left: 90px;
	 margin-top:2px;
}

</style>
</head>
<body>
<%
int tourId=1;
ResultSet rs=null,rs1=null,rs2=null; %>
<div class="container-fluid page-2-container">
  <div class="row">
    <div class="col-md-7 col-xs-12 pointable-background " style="color:#FFFFFF;"> 
    
      
<table size="2" class="table-responsive" style="float:right;margin-right: 4%;margin-top: 28%;font-size: 16pt; " cellpadding="1" width="70%">
<tbody><tr class="pointable-header "><th width="8%">&nbsp;&nbsp;Pos</th>
	<th width="22%">GROUP A</th>
    <th width="5%">P</th>
    <th width="5%">W</th>
    <th width="5%">D</th>
    <th width="5%">L</th>
    <th class="hidden-xs" width="5%">GF</th>
    <th class="hidden-xs" width="5%">GA</th>
    <th class="hidden-xs" width="5%">GD</th>
    <th width="5%">Pts</th>
 </tr>
 
	 <tr class="pointable tr" height="50">
	 
	 <th width="8%">&nbsp;&nbsp;1</th>
	 
	 <th width="22%">BOLTS</th>
	
	
	
    <th width="5%">8</th>
    <th width="5%">7</th>
    <th width="5%">1</th>
    <th width="5%">0</th>
    <th class="hidden-xs" width="5%">22</th>
    <th class="hidden-xs" width="5%">5</th>
    <th class="hidden-xs" width="5%">17</th>
    <th width="5%">22</th>
    </tr>
     
     <tr class="pointable tr1" height="50">
	 	
	 <th width="8%">&nbsp;&nbsp;3</th>
	 
	 <th width="22%">PALADINS</th>
	
	
	
    <th width="5%">8</th>
    <th width="5%">5</th>
    <th width="5%">1</th>
    <th width="5%">2</th>
    <th class="hidden-xs" width="5%">16</th>
    <th class="hidden-xs" width="5%">11</th>
    <th class="hidden-xs" width="5%">5</th>
    <th width="5%">16</th>
    </tr>
	 	<tr class="pointable1 tr2" height="50">
	 
	 <th width="8%">&nbsp;&nbsp;2</th>
	 
	 <th width="22%">CENTURIONS</th>
	
	
	
    <th width="5%">8</th>
    <th width="5%">5</th>
    <th width="5%">1</th>
    <th width="5%">2</th>
    <th class="hidden-xs" width="5%">12</th>
    <th class="hidden-xs" width="5%">14</th>
    <th class="hidden-xs" width="5%">-2</th>
    <th width="5%">16</th>
    </tr>
     
	 	
     
	 	  <tr class="pointable1 " height="50">
	 
	 <th width="8%">&nbsp;&nbsp;4</th>
	 
	 <th width="22%">GLADIATORS</th>
	
	
	
    <th width="5%">8</th>
    <th width="5%">3</th>
    <th width="5%">0</th>
    <th width="5%">5</th>
    <th class="hidden-xs" width="5%">11</th>
    <th class="hidden-xs" width="5%">12</th>
    <th class="hidden-xs" width="5%">-1</th>
    <th width="5%">9</th>
    </tr>
     
     
 </tbody></table>
  
<table size="2" class="table-responsive" style="float:right;margin-right: 4%;margin-top: 5%;font-size: 16pt; " cellpadding="1" width="70%">
<tbody><tr class="pointable-header "><th width="8%">&nbsp;&nbsp;Pos</th>
	<th width="22%">GROUP B</th>
    <th width="5%">P</th>
    <th width="5%">W</th>
    <th width="5%">D</th>
    <th width="5%">L</th>
    <th class="hidden-xs" width="5%">GF</th>
    <th class="hidden-xs" width="5%">GA</th>
    <th class="hidden-xs" width="5%">GD</th>
    <th width="5%">Pts</th>
 </tr>

	 <tr class="pointable tr" height="50">
	 
	 <th width="8%">&nbsp;&nbsp;1</th>
	 
	 <th width="22%">RAZORBACKS</th>
	
	
	
    <th width="5%">8</th>
    <th width="5%">5</th>
    <th width="5%">1</th>
    <th width="5%">2</th>
    <th class="hidden-xs" width="5%">16</th>
    <th class="hidden-xs" width="5%">4</th>
    <th class="hidden-xs" width="5%">12</th>
    <th width="5%">16</th>
    </tr>
     
	 	<tr class="pointable tr1" height="50">
	 
	 <th width="8%">&nbsp;&nbsp;2</th>
	 
	 <th width="22%">APACHES</th>
	
	
	
    <th width="5%">8</th>
    <th width="5%">3</th>
    <th width="5%">1</th>
    <th width="5%">4</th>
    <th class="hidden-xs" width="5%">11</th>
    <th class="hidden-xs" width="5%">12</th>
    <th class="hidden-xs" width="5%">-1</th>
    <th width="5%">10</th>
    </tr>
     
	 	<tr class="pointable1 tr2" height="50">
	 	
	 <th width="8%">&nbsp;&nbsp;3</th>
	 
	 <th width="22%">RAIDERS</th>
	
	
	
    <th width="5%">8</th>
    <th width="5%">1</th>
    <th width="5%">1</th>
    <th width="5%">6</th>
    <th class="hidden-xs" width="5%">8</th>
    <th class="hidden-xs" width="5%">18</th>
    <th class="hidden-xs" width="5%">-10</th>
    <th width="5%">4</th>
    </tr>
     
	 	  <tr class="pointable1 " height="50">
	 
	 <th width="8%">&nbsp;&nbsp;4</th>
	 
	 <th width="22%">AZTECS</th>
	
	
	
    <th width="5%">8</th>
    <th width="5%">1</th>
    <th width="5%">0</th>
    <th width="5%">7</th>
    <th class="hidden-xs" width="5%">10</th>
    <th class="hidden-xs" width="5%">22</th>
    <th class="hidden-xs" width="5%">-12</th>
    <th width="5%">3</th>
    </tr>
     
     
 </tbody></table>
  
<table size="2" class="table-responsive" style="float:right;margin-right: 4%;margin-top: 5%;font-size: 16pt; " cellpadding="1" width="70%">
<tbody><tr class="pointable-header "><th width="8%">&nbsp;&nbsp;Pos</th>
	<th width="22%">GROUP C</th>
    <th width="5%">P</th>
    <th width="5%">W</th>
    <th width="5%">D</th>
    <th width="5%">L</th>
    <th class="hidden-xs" width="5%">GF</th>
    <th class="hidden-xs" width="5%">GA</th>
    <th class="hidden-xs" width="5%">GD</th>
    <th width="5%">Pts</th>
 </tr>

	 <tr class="pointable tr" height="50">
	 
	 <th width="8%">&nbsp;&nbsp;1</th>
	 
	 <th width="22%">RANGERS</th>
	
		
		
    <th width="5%">8</th>
    <th width="5%">4</th>
    <th width="5%">1</th>
   <th width="5%">3</th>
    <th class="hidden-xs" width="5%">10</th>
    <th class="hidden-xs" width="5%">11</th>
    <th class="hidden-xs" width="5%">-1</th>
    <th width="5%">13</th>
    </tr>
	
	 	<tr class="pointable tr1" height="50">
	 
	 <th width="8%">&nbsp;&nbsp;2</th>
	 
	 <th width="22%">KNIGHTS</th>
	
		
		
    <th width="5%">8</th>
    <th width="5%">3</th>
    <th width="5%">1</th>
   <th width="5%">4</th>
    <th class="hidden-xs" width="5%">20</th>
    <th class="hidden-xs" width="5%">16</th>
    <th class="hidden-xs" width="5%">4</th>
    <th width="5%">10</th>
    </tr>
	
	 	<tr class="pointable1 tr2" height="50">
	 	
	 <th width="8%">&nbsp;&nbsp;3</th>
	 
	 <th width="22%">BISONS</th>
	
		
		
    <th width="5%">8</th>
    <th width="5%">2</th>
    <th width="5%">1</th>
   <th width="5%">5</th>
    <th class="hidden-xs" width="5%">8</th>
    <th class="hidden-xs" width="5%">14</th>
    <th class="hidden-xs" width="5%">-6</th>
    <th width="5%">7</th>
    </tr>
	
	 	  <tr class="pointable1 " height="50">
	 
	 <th width="8%">&nbsp;&nbsp;4</th>
	 
	 <th width="22%">SAMURAIS</th>
	
		
		
    <th width="5%">8</th>
    <th width="5%">0</th>
    <th width="5%">0</th>
   <th width="5%">8</th>
    <th class="hidden-xs" width="5%">4</th>
    <th class="hidden-xs" width="5%">20</th>
    <th class="hidden-xs" width="5%">-16</th>
    <th width="5%">0</th>
    </tr>
	
     
 </tbody></table>
  
<table size="2" class="table-responsive" style="float:right;margin-right: 4%;margin-top: 5%;font-size: 16pt; " cellpadding="1" width="70%">
<tbody><tr class="pointable-header "><th width="8%">&nbsp;&nbsp;Pos</th>
	<th width="22%">GROUP D</th>
    <th width="5%">P</th>
    <th width="5%">W</th>
    <th width="5%">D</th>
    <th width="5%">L</th>
    <th class="hidden-xs" width="5%">GF</th>
    <th class="hidden-xs" width="5%">GA</th>
    <th class="hidden-xs" width="5%">GD</th>
    <th width="5%">Pts</th>
 </tr>

	 <tr class="pointable tr" height="50">
	 
	 <th width="8%">&nbsp;&nbsp;1</th>
	 
	 <th width="22%">SPARTANS</th>
	
		
		
    <th width="5%">8</th>
    <th width="5%">6</th>
    <th width="5%">0</th>
   <th width="5%">2</th>
    <th class="hidden-xs" width="5%">12</th>
    <th class="hidden-xs" width="5%">8</th>
    <th class="hidden-xs" width="5%">4</th>
    <th width="5%">18</th>
    </tr>
	
	 	<tr class="pointable tr1" height="50">
	 
	 <th width="8%">&nbsp;&nbsp;2</th>
	 
	 <th width="22%">FIREBIRDS</th>
	
		
		
    <th width="5%">8</th>
    <th width="5%">5</th>
    <th width="5%">2</th>
   <th width="5%">1</th>
    <th class="hidden-xs" width="5%">16</th>
    <th class="hidden-xs" width="5%">7</th>
    <th class="hidden-xs" width="5%">9</th>
    <th width="5%">17</th>
    </tr>
	
	 	<tr class="pointable1 tr2" height="50">
	 	
	 <th width="8%">&nbsp;&nbsp;3</th>
	 
	 <th width="22%">GUNNERS</th>
	
		
		
    <th width="5%">8</th>
    <th width="5%">5</th>
    <th width="5%">1</th>
   <th width="5%">2</th>
    <th class="hidden-xs" width="5%">14</th>
    <th class="hidden-xs" width="5%">7</th>
    <th class="hidden-xs" width="5%">7</th>
    <th width="5%">16</th>
    </tr>
	
	 	  <tr class="pointable1 " height="50">
	 
	 <th width="8%">&nbsp;&nbsp;4</th>
	 
	 <th width="22%">VIKINGS</th>
	
		
		
    <th width="5%">8</th>
    <th width="5%">3</th>
    <th width="5%">0</th>
   <th width="5%">5</th>
    <th class="hidden-xs" width="5%">14</th>
    <th class="hidden-xs" width="5%">23</th>
    <th class="hidden-xs" width="5%">-9</th>
    <th width="5%">9</th>
    </tr>
	
     
 </tbody></table>

</div>


<div class="col-md-5 col-xs-12 ">
<div class="container1 man-match-container" style="height:400px;overflow: hidden;overflow-y: scroll;">      
      <center>
        <button type="button" class="silver-button">MAN OF THE MATCH</button>
      </center>
    
 <%
 try
 {
 	rs2 = null;
 	rs2 = DBManager.fetchQuery("select (select lcase(SUBSTRING_INDEX(tFlag,'/',-1)) as flag from team where tid in(select tid from tourTeam where ttId=mm.ttId and tourId="+tourId+")) as flag,(select fName from member where barcodeId=mm.barcodeId) as fname,(select lName from member where barcodeId=mm.barcodeId) as lname,mid from manofthematch mm where tourId="+tourId+" order by mid desc;");
 	//System.out.println("select (select lcase(SUBSTRING_INDEX(tFlag,'/',-1)) as flag from team where tid in(select tid from tourTeam where ttId=mm.ttId and tourId="+tourId+")) as tName,(select fName from member where barcodeId=mm.barcodeId) as fname,(select lName from member where barcodeId=mm.barcodeId) as lname,mid from manofthematch mm where tourId="+tourId+" order by mid desc limit 5;");
 	if(rs2.next()){
 %>
 	  <div class="row" style="margin-top:25px;">
      <div class="col-md-2  "></div>
      <div class="col-md-8 btn-btn col-xs-12">
        <button type="button" class="small-logo">
       
        <img class="img-responsive" src="images/man-team-logo/<%=rs2.getString("flag") %>" style="max-width: 100%; height: auto; display: inline-block; width: 100%; padding: 2%;"></button>
        <button type="button" class="man-name-container"><span style="color:#FFFFFF" class="pull-left"><%=rs2.getString("fname") %>&nbsp;<%=rs2.getString("lname") %></span></button>
        <button type="button" class="score-man"><span style="color:#FFFFFF"><%=rs2.getInt("mid") %></span></button>
      </div>
      <div class="col-md-2 "></div>
      </div>
 <%	
 	}
 	while(rs2.next()){
 %>     
      
      <div class="row">
      <div class="col-md-2 "></div>
      <div class="col-md-8 btn-btn col-xs-12">
        <button type="button" class="small-logo">
        <img class="img-responsive" src="images/man-team-logo/<%=rs2.getString("flag") %>" style="max-width: 100%; height: auto; display: inline-block; width: 100%; padding: 2%;"></button>
        <button type="button" class="man-name-container"><span style="color:#FFFFFF" class="pull-left"><%=rs2.getString("fname") %>&nbsp;<%=rs2.getString("lname") %></span></button>
        <button type="button" class="score-man"><span style="color:#FFFFFF"><%=rs2.getInt("mid") %></span></button>
      </div>
     <div class="col-md-2 "></div>
    </div>
   <%}
 	%>
    
    </div>
    </div>
    <br><br><br><br>
    <div class="col-md-5 col-xs-12 " >
    <div class="container1 top-match-container" style="height:800px;overflow: hidden;overflow-y: scroll;">
      <center>
        <button type="button" class="silver-button1">TOP SCORER</button>
      </center> 
       <div class="row">
    <div class="col-md-8 btn-btn col-xs-12">
        <button type="button" class="top-score-title ">
        <span style="color:#FFFFFF" class="pull-left" id="left" >PLAYER</span>
        <span style="color:#FFFFFF" class="center-block">TEAM</span>
        <span style="color:#FFFFFF"  class="right" id="right">G</span></button>
        
                <%


rs=null;rs1=null;
int i=1;
rs=DBManager.fetchQuery("select ttId,barcodeId,count(barcodeId) gcount from tourGoal where tourId="+tourId+" group by barcodeId order by gcount desc;");
while(rs.next())
{

	
rs1=DBManager.fetchQuery("select (select t.tName from team t where tid in (select tid from tourTeam where ttId="+rs.getInt("ttId")+" and tourId="+tourId+")) as tname,(select m.fName from member m where barcodeId="+rs.getInt("barcodeId")+") as fname,(select m.lName from member m where barcodeId="+rs.getInt("barcodeId")+") as lname,(select m.photo from member m where barcodeId="+rs.getInt("barcodeId")+") as photo;");	
if(rs1.next())
{
	%>
        
        
        <button type="button" class="top-player">
        <span class="green-patch" style="color:#FFFFFF"> <%=i %></span>
        <span class="player-name"><%= rs1.getString("fName")%>&nbsp;<%= rs1.getString("lName")%></span>
        <span class="center-block" id="center"><%= rs1.getString("tname")%></span>
        <span  class="right" id="right-goal"><%=rs.getInt("gcount") %></span>
         </button>
 <%}
	
	i = i+1;
}
    }catch(Exception e){
    	System.out.println(e);
    }
%>        

      </div>
       </div>
     
      <br>
      <br> <br>
      <br> <br>
      <br>
      <br>
    </div>
    </div>

  </div>
</div>

<!-- ______________JAVASCRIPT  JQUERY__________________________ --> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
<!-- Latest compiled and minified JavaScript --> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</body></html>