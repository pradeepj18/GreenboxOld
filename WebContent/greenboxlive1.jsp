<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href = "css/index.css"> 
<link href='https://fonts.googleapis.com/css?family=Roboto+Condensed:700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto:100' rel='stylesheet' type='text/css'>
<title>Green Box</title>
<style>
#summary {
    background-image: url(images/bg.png);
    background-size: 100% 100%;
    height: auto;
    float: right;
    margin-right: -9px;
	    padding: 1.3%;
}
</style>
</head>
<body>
<div class="container-fluid">
 <div class="row" style="background-color:aliceblue;">
	<div class="col-xs-2 col-md-4 col-lg-4">
		<img class="img-responsive pull-left" id="psLogo" src="images/PlaysoftechLogo.png">
	</div>
	<div class="col-xs-8 col-md-4 col-lg-4">
		<img class="img-responsive" id="tourLogo" src="images/GreenBox_logo.png">
	</div>
	<div class="col-xs-2 col-md-4 col-lg-4">
		<img class="img-responsive pull-right" id="gbLogo" src="images/logos_2.png">
	</div>
 </div>
 <div class="row">
 	<div class="col-md-6 col-lg-6">
 		<div class="score-container clearfix">
	 		<center>
	 		   <img class="img-responsive" src="images/auction.png" style="max-width: 100%; height: auto; display: inline-block; width: 100%; padding: 2%;">
	 		</center>
	 		<center>
	 			<div class="half-container clearfix">
	 				<span id="score-half-text">FIRST HALF</span>
	 			</div></center>
				<div class="row">
				  <div class="col-md-12" style="margin-top: 17%;">
					<img class="img-responsive pull-left team1" src="images/ScoreBoard_Logo/azetecs.png">
					<!-- <div class="score-number clearfix">
						<span id="first">0</span> <span id="second">9</span><span id="space">&nbsp;</span> <span id="third">2</span> <span id="fourth">3</span>
					</div> -->
					<img class="img-responsive pull-right team2" src="images/ScoreBoard_Logo/apaches.png">
				  </div>
				</div>
				<div class="row">
				<div class="col-md-5 col-xs-5">
					<span id="tname1">AZTECS</span>
				</div>
				<div class="col-md-2 col-xs-2" >
					<span id="vs">VS</span>
				</div>
				<div class="col-md-5 col-xs-5">
					<span id="tname2">APACHES</span>
				</div>
				</div>
				<div class="row" style="padding: 1% 2%;background-color: skyblue;margin-top: 17.2%;width: 102%;">
					<div class="col-md-12 col-lg-12">NEWS!!!!!</div>
				</div>
 		</div>
 	</div>
 	<div class="col-md-6 col-lg-6" id="summary">
   <img src="images/tittle result.png" class="img-responsive" id="result" alt="tittle">
   <div class="row" id="row">
<span id="day">  MATCHDAY 1 | 15th JANUARY SUNADAY</span>
   </div>
   <hr width="80%" style="border:3px solid white;" id="hr">
   
   <table width="70%" size="2" id="table" cellpadding="1" style="font-size: 16pt; background-color:rgba(0,39,80,0.80); ">
   <center>

    <tr class="pointable1 summary-table" height="50">
    <th width="35% " style="text-align:right;">BOLTS&nbsp;&nbsp;</th>
    <th width="10%" align="center" >  <img src="images/man-team-logo/apaches.png" width="30%" height="auto" class="img-responsive " alt="tittle" style="height: auto;width: 60%;"></th>
    <th width="10%" style="color: rgba(236,38,143,1);text-align:center;border-top: 4px solid rgba(0,39,80,0.80);border-bottom: 2px solid rgba(0,39,80,0.80);" bgcolor="#FFFFFF">18:12</th>
   <th width="10%" >  <img src="images/man-team-logo/apaches.png" width="30%" height="auto" class="img-responsive" alt="tittle" style="height: auto;float:right;width: 60%;"></th>
    <th width="35%" align="right">&nbsp;&nbsp;BOLTS</th> </tr></center>
    
     <center>

    <tr class="pointable1 summary-table" height="50">
    <th width="35% " style="text-align:right;">BOLTS&nbsp;&nbsp;</th>
    <th width="10%" align="center" >  <img src="images/man-team-logo/apaches.png" width="30%" height="auto" class="img-responsive " alt="tittle" style="height: auto;width: 60%;"></th>
    <th width="10%" style="color: rgba(236,38,143,1);text-align:center;border-top: 4px solid rgba(0,39,80,0.80);border-bottom: 2px solid rgba(0,39,80,0.80);" bgcolor="#FFFFFF">18:12</th>
   <th width="10%" >  <img src="images/man-team-logo/apaches.png" width="30%" height="auto" class="img-responsive" alt="tittle" style="height: auto;float:right;width: 60%;"></th>
    <th width="35%" align="right">&nbsp;&nbsp;BOLTS</th> </tr></center> <center>

    <tr class="pointable1 summary-table" height="50">
    <th width="35% " style="text-align:right;">BOLTS&nbsp;&nbsp;</th>
    <th width="10%" align="center" >  <img src="images/man-team-logo/apaches.png" width="30%" height="auto" class="img-responsive " alt="tittle" style="height: auto;width: 60%;"></th>
    <th width="10%" style="color: rgba(236,38,143,1);text-align:center;border-top: 4px solid rgba(0,39,80,0.80);border-bottom: 2px solid rgba(0,39,80,0.80);" bgcolor="#FFFFFF">18:12</th>
   <th width="10%" >  <img src="images/man-team-logo/apaches.png" width="30%" height="auto" class="img-responsive" alt="tittle" style="height: auto;float:right;width: 60%;"></th>
    <th width="35%" align="right">&nbsp;&nbsp;BOLTS</th> </tr></center> <center>

    <tr class="pointable1 summary-table" height="50">
    <th width="35% " style="text-align:right;">BOLTS&nbsp;&nbsp;</th>
    <th width="10%" align="center" >  <img src="images/man-team-logo/apaches.png" width="30%" height="auto" class="img-responsive " alt="tittle" style="height: auto;width: 60%;"></th>
    <th width="10%" style="color: rgba(236,38,143,1);text-align:center;border-top: 4px solid rgba(0,39,80,0.80);border-bottom: 2px solid rgba(0,39,80,0.80);" bgcolor="#FFFFFF">18:12</th>
   <th width="10%" >  <img src="images/man-team-logo/apaches.png" width="30%" height="auto" class="img-responsive" alt="tittle" style="height: auto;float:right;width: 60%;"></th>
    <th width="35%" align="right">&nbsp;&nbsp;BOLTS</th> </tr></center> <center>

    <tr class="pointable1 summary-table" height="50">
    <th width="35% " style="text-align:right;">BOLTS&nbsp;&nbsp;</th>
    <th width="10%" align="center" >  <img src="images/man-team-logo/apaches.png" width="30%" height="auto" class="img-responsive " alt="tittle" style="height: auto;width: 60%;"></th>
    <th width="10%" style="color: rgba(236,38,143,1);text-align:center;border-top: 4px solid rgba(0,39,80,0.80);border-bottom: 2px solid rgba(0,39,80,0.80);" bgcolor="#FFFFFF">18:12</th>
   <th width="10%" >  <img src="images/man-team-logo/apaches.png" width="30%" height="auto" class="img-responsive" alt="tittle" style="height: auto;float:right;width: 60%;"></th>
    <th width="35%" align="right">&nbsp;&nbsp;BOLTS</th> </tr></center> <center>

    <tr class="pointable1 summary-table" height="50">
    <th width="35% " style="text-align:right;">BOLTS&nbsp;&nbsp;</th>
    <th width="10%" align="center" >  <img src="images/man-team-logo/apaches.png" width="30%" height="auto" class="img-responsive " alt="tittle" style="height: auto;width: 60%;"></th>
    <th width="10%" style="color: rgba(236,38,143,1);text-align:center;border-top: 4px solid rgba(0,39,80,0.80);border-bottom: 2px solid rgba(0,39,80,0.80);" bgcolor="#FFFFFF">18:12</th>
   <th width="10%" >  <img src="images/man-team-logo/apaches.png" width="30%" height="auto" class="img-responsive" alt="tittle" style="height: auto;float:right;width: 60%;"></th>
    <th width="35%" align="right">&nbsp;&nbsp;BOLTS</th> </tr></center> <center>

    <tr class="pointable1 summary-table" height="50">
    <th width="35% " style="text-align:right;">BOLTS&nbsp;&nbsp;</th>
    <th width="10%" align="center" >  <img src="images/man-team-logo/apaches.png" width="30%" height="auto" class="img-responsive " alt="tittle" style="height: auto;width: 60%;"></th>
    <th width="10%" style="color: rgba(236,38,143,1);text-align:center;border-top: 4px solid rgba(0,39,80,0.80);border-bottom: 2px solid rgba(0,39,80,0.80);" bgcolor="#FFFFFF">18:12</th>
   <th width="10%" >  <img src="images/man-team-logo/apaches.png" width="30%" height="auto" class="img-responsive" alt="tittle" style="height: auto;float:right;width: 60%;"></th>
    <th width="35%" align="right">&nbsp;&nbsp;BOLTS</th> </tr></center> <center>

    <tr class="pointable1 summary-table" height="50">
    <th width="35% " style="text-align:right;">BOLTS&nbsp;&nbsp;</th>
    <th width="10%" align="center" >  <img src="images/man-team-logo/apaches.png" width="30%" height="auto" class="img-responsive " alt="tittle" style="height: auto;width: 60%;"></th>
    <th width="10%" style="color: rgba(236,38,143,1);text-align:center;border-top: 4px solid rgba(0,39,80,0.80);border-bottom: 2px solid rgba(0,39,80,0.80);" bgcolor="#FFFFFF">18:12</th>
   <th width="10%" >  <img src="images/man-team-logo/apaches.png" width="30%" height="auto" class="img-responsive" alt="tittle" style="height: auto;float:right;width: 60%;"></th>
    <th width="35%" align="right">&nbsp;&nbsp;BOLTS</th> </tr></center>
    </table>
    
   </div>
 </div></div>
 <br>
 <div class="row visible-on">
  <div class="col-md-1 col-xs-4">
  	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

  <!-- Wrapper for slides -->
 <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img class="img-responsive" src="images/TeamLogoSlider/aztecs.png">
    </div>
    <div class="item">
      <img class="img-responsive" src="images/TeamLogoSlider/apaches.png">
      <div class="carousel-caption">
      </div>
    </div>
  </div>
  </div>
  
  </div>
  <!-- SECOND CAROUSEL -->
 <div class="col-md-1 col-xs-4">
  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

  <!-- Wrapper for slides -->
 <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img class="img-responsive" src="images/TeamLogoSlider/aztecs.png">
    </div>
    <div class="item">
      <img src="images/TeamLogoSlider/apaches.png">
      <div class="img-responsive" class="carousel-caption">
      </div>
    </div>
  </div>
  </div>
  </div>
  
  <!-- THIRD CAROUSEL -->
 <div class="col-md-1 col-xs-4">
  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="images/TeamLogoSlider/aztecs.png">
    </div>
    <div class="item">
      <img src="images/TeamLogoSlider/apaches.png">
      <div class="carousel-caption">
      </div>
    </div>
  </div>
  </div>
  
  </div>
  
  <!-- FOURTH CAROUSEL -->
 <div class="col-md-1 hidden-xs">
  	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="images/TeamLogoSlider/aztecs.png">
    </div>
    <div class="item">
      <img src="images/TeamLogoSlider/apaches.png">
      <div class="carousel-caption">
      </div>
    </div>
  </div>
  </div>
  
  </div>
  
  <!-- FIFTH CAROUSEL -->
  <div class="col-md-1 hidden-xs">
  
  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

  <!-- Wrapper for slides -->
 <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="images/TeamLogoSlider/aztecs.png">
    </div>
    <div class="item">
      <img src="images/TeamLogoSlider/apaches.png">
      <div class="carousel-caption">
      </div>
    </div>
  </div>
  </div>
  
  </div>
  
  <!-- SIXTH CAROUSEL -->
 <div class="col-md-1 hidden-xs">
  	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="images/TeamLogoSlider/aztecs.png">
    </div>
    <div class="item">
      <img src="images/TeamLogoSlider/apaches.png">
      <div class="carousel-caption">
      </div>
    </div>
  </div>
  </div>
  
  </div>
  
  <!-- SEVENTH CAROUSEL -->
 <div class="col-md-1 hidden-xs">
  	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="images/TeamLogoSlider/aztecs.png">
    </div>
    <div class="item">
      <img src="images/TeamLogoSlider/apaches.png">
      <div class="carousel-caption">
      </div>
    </div>
  </div>
  </div>
  
  </div>
  
  <!-- EIGHTH CAROUSEL -->
  <div class="col-md-1 hidden-xs">
  	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="images/TeamLogoSlider/aztecs.png">
    </div>
    <div class="item">
      <img src="images/TeamLogoSlider/apaches.png">
      <div class="carousel-caption">
      </div>
    </div>
  </div>
  </div>
  
  </div>
  
  <!-- NINTH CAROUSEL -->
  <div class="col-md-1 hidden-xs">
  	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="images/TeamLogoSlider/aztecs.png">
    </div>
    <div class="item">
      <img src="images/TeamLogoSlider/apaches.png">
      <div class="carousel-caption">
      </div>
    </div>
  </div>
  </div>
  
  </div>
  
  <!-- TENTH CAROUSEL -->
  <div class="col-md-1 hidden-xs">
  	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="images/TeamLogoSlider/aztecs.png">
    </div>
    <div class="item">
      <img src="images/TeamLogoSlider/apaches.png">
      <div class="carousel-caption">
      </div>
    </div>
  </div>
  </div>
  
  </div>
  
  <!-- ELEVENTH CAROUSEL -->
  <div class="col-md-1 hidden-xs">
  	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

  <!-- Wrapper for slides -->
 <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="images/TeamLogoSlider/aztecs.png">
    </div>
    <div class="item">
      <img src="images/TeamLogoSlider/apaches.png">
      <div class="carousel-caption">
      </div>
    </div>
  </div>
  </div>
  
  </div>
  
  <!-- TWELVETH CAROUSEL -->
  <div class="col-md-1 hidden-xs">
  	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

  <!-- Wrapper for slides -->
 <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="images/TeamLogoSlider/aztecs.png">
    </div>
    <div class="item">
      <img src="images/TeamLogoSlider/apaches.png">
      <div class="carousel-caption">
      </div>
    </div>
  </div>
  </div>
  
  </div>
 </div><!-- END ROW -->

 

<!-- ______________JAVASCRIPT  JQUERY__________________________ -->
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	
</body>
</html>