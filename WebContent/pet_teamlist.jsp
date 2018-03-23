<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Team List</title>

<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet" href="materialize/css/materialize.min.css"  media="screen,projection"/>
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

<style>
@media (min-width:320px){
.secondary-content {
    color: #e53935;
    margin-top:-1%;
}

}

.team-card{
	width:6%;
}
#team-image{
	width: 100px;
	margin-left: 21%;
	max-width: 100%;
	height: auto;
}
  body {
    display: flex;
    min-height: 100vh;
    flex-direction: column;
  }

  main {
    flex: 1 0 auto;
  }
 @media (min-width:480px){
.secondary-content {
    color: #e53935;
     margin-top:0%;
}
}
.team-collapse{
	padding: 1% 1% 1%;
}
</style>

</head>
<body>

<div class="container">
	<div class="row">
		<div class="col s12 m12 l12">
			<ul class="collection">
				<li class="collection-item avatar grey-text text-lighten-5 blue darken-4">
					<h5 class="center-align"><b style="margin-left: -17%;">TEAMS</b></h5>
					
				</li>
			</ul>
		</div>
	</div>
	
	
	<div class="row">
		<div class="col s12 m12 l12">
			<ul class="collapsible" data-collapsible="accordion">
				<!-- SINGLE -->
				<li  style="margin-top: 0.8%;">
					<div class="collapsible-header active team-collapse">
					  <i class="small material-icons secondary-content">star</i>
					  <h5 style="margin-top: 1%;font-family:Times New Roman, Times, serif;">SINGLE</h5>
					</div>
					<div class="collapsible-body">
					<ul class="tabs">
				        <li class="tab col s3 m6 l6"><a class="active" href="#male"><b>MALE</b></a></li>
				        <li class="tab col s3 m6 l6"><a href="#female"><b>FEMALE</b></a></li>
				    </ul>
				    <div id="male">
					<div class="row">
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/apaches.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content light-blue darken-4">
							      <center><span class="card-title activator white-text text-darken-4">APACHES</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">APACHES<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							      <div class="fixed-action-btn vertical">
								    <a class="btn-floating btn-large light-blue darken-4">
								      <i class="medium material-icons">add</i>
								    </a>
								    <ul>
								      <li><a class="btn-floating red"><i class="material-icons">local_parking</i></a></li>
								      <li><a class="btn-floating yellow darken-1"><i class="material-icons">local_bar</i></a></li>
								      <li><a class="btn-floating green"><i class="material-icons">info</i></a></li>
								     
								    </ul>
								  </div>
							      
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/aztecs.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content  pink darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">AZTECS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							      
							      <div class="fixed-action-btn vertical">
								    <a class="btn-floating btn-large pink darken-2">
								      <i class="medium material-icons">add</i>
								    </a>
								    <ul>
								      <li><a class="btn-floating red"><i class="material-icons">P</i></a></li>
								      <li><a class="btn-floating yellow darken-1"><i class="material-icons">format_quote</i></a></li>
								      <li><a class="btn-floating green"><i class="material-icons">publish</i></a></li>
								     
								    </ul>
								  </div>
							      
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/bisons.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content red darken-2">
							      <center><span class="card-title activator grey-text text-lighten-5">BISONS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							      <div class="fixed-action-btn vertical">
								    <a class="btn-floating btn-large red darken-2">
								      <i class="medium material-icons">add</i>
								    </a>
								    <ul>
								      <li><a class="btn-floating red"><i class="material-icons">P</i></a></li>
								      <li><a class="btn-floating yellow darken-1"><i class="material-icons">format_quote</i></a></li>
								      <li><a class="btn-floating green"><i class="material-icons">publish</i></a></li>
								     
								    </ul>
								  </div>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/razorbacks.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content   blue darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">RAZORBACKS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							       <div class="fixed-action-btn vertical">
								    <a class="btn-floating btn-large blue darken-2">
								      <i class="medium material-icons">add</i>
								    </a>
								    <ul>
								      <li><a class="btn-floating red"><i class="material-icons">P</i></a></li>
								      <li><a class="btn-floating yellow darken-1"><i class="material-icons">format_quote</i></a></li>
								      <li><a class="btn-floating green"><i class="material-icons">publish</i></a></li>
								     
								    </ul>
								  </div>
							    </div>
							  </div>
							
						</div>
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/paladians.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content light-blue darken-4">
							      <center><span class="card-title activator white-text text-darken-4">PALADIANS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/vikings.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content  pink darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">VIKINGS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/spartans.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content red darken-2">
							      <center><span class="card-title activator grey-text text-lighten-5">SPARTANS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/raiders.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content   blue darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">RAIDERS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
					</div>
					</div> <!-- END MALE-->
					
					<!-- START FEMALE -->
					<div id="female">
					<div class="row">
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/knights.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content light-blue darken-4">
							      <center><span class="card-title activator white-text text-darken-4">KNIGHTS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/aztecs.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content  pink darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">AZTECS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/gladiators.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content red darken-2">
							      <center><span class="card-title activator grey-text text-lighten-5">GLADIATORS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/firebirds.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content   blue darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">FIREBIRDS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/gunners.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content light-blue darken-4">
							      <center><span class="card-title activator white-text text-darken-4">GUNNERS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/paladians.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content  pink darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">PALADIANS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/spartans.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content red darken-2">
							      <center><span class="card-title activator grey-text text-lighten-5">SPARTANS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/raiders.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content   blue darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">RAIDERS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
					</div>
					</div> <!-- END FEMALE-->
					
					</div>
				</li>
				<!-- END SINGLE -->
				
				<!-- DOUBLE -->
				<li style="margin-top: 0.5%;">
					<div class="collapsible-header team-collapse">
						<i class="small material-icons secondary-content">star</i>
						<h5 style="margin-top: 1%;font-family:Times New Roman, Times, serif;">DOUBLE</h5>
					</div>
					<div class="collapsible-body">
						
						<div class="row">
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator responsive-img" src="images/man-team-logo/apaches.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content light-blue darken-4">
							      <center><span class="card-title activator white-text text-darken-4">APACHES</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">APACHES<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/aztecs.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content  pink darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">AZTECS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/bisons.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content red darken-2">
							      <center><span class="card-title activator grey-text text-lighten-5">BISONS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/razorbacks.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content   blue darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">RAZORBACKS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/paladians.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content light-blue darken-4">
							      <center><span class="card-title activator white-text text-darken-4">PALADIANS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/vikings.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content  pink darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">VIKINGS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/spartans.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content red darken-2">
							      <center><span class="card-title activator grey-text text-lighten-5">SPARTANS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/raiders.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content   blue darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">RAIDERS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
					</div>
						
					</div>
				</li>
				<!-- END DOUBLE -->
				
				<!-- MIX-DOUBLE -->
				<li style="margin-top: 0.5%;">
					<div class="collapsible-header team-collapse">
						<i class="small material-icons secondary-content">star</i>
						<h5 style="margin-top: 1%;font-family:Times New Roman, Times, serif;">MIX DOUBLE</h5>
					</div>
					<div class="collapsible-body">
					<div class="row">
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/apaches.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content light-blue darken-4">
							      <center><span class="card-title activator white-text text-darken-4">APACHES</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/aztecs.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content  pink darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">AZTECS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/bisons.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content red darken-2">
							      <center><span class="card-title activator grey-text text-lighten-5">BISONS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/razorbacks.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content   blue darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">RAZORBACKS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/paladians.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content light-blue darken-4">
							      <center><span class="card-title activator white-text text-darken-4">PALADIANS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/vikings.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content  pink darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">VIKINGS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/spartans.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content red darken-2">
							      <center><span class="card-title activator grey-text text-lighten-5">SPARTANS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/raiders.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content   blue darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">RAIDERS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
					</div>
					</div>
				</li>
				<!-- END MIX-DOUBLE -->
				
				<!-- TRIPLE -->
				<li style="margin-top: 0.5%;">
					<div class="collapsible-header team-collapse">
					  <i class="small material-icons secondary-content">star</i>
					  <h5 style="margin-top: 1%;font-family:Times New Roman, Times, serif;">TRIPLE</h5>
					</div>
					<div class="collapsible-body">
					<ul class="tabs">
				        <li class="tab col s3 m6 l6"><a class="active" href="#triple_male"><b>MALE</b></a></li>
				        <li class="tab col s3 m6 l6"><a href="#triple_female"><b>FEMALE</b></a></li>
				    </ul>
				    <div id="triple_male">
					<div class="row">
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/apaches.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content light-blue darken-4">
							      <center><span class="card-title activator white-text text-darken-4">APACHES</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">APACHES<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/aztecs.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content  pink darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">AZTECS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/bisons.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content red darken-2">
							      <center><span class="card-title activator grey-text text-lighten-5">BISONS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/razorbacks.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content   blue darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">RAZORBACKS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/paladians.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content light-blue darken-4">
							      <center><span class="card-title activator white-text text-darken-4">PALADIANS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/vikings.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content  pink darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">VIKINGS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/spartans.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content red darken-2">
							      <center><span class="card-title activator grey-text text-lighten-5">SPARTANS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/raiders.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content   blue darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">RAIDERS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
					</div>
					</div> <!-- END MALE-->
					
					<!-- START FEMALE -->
					<div id="triple_female">
					<div class="row">
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/knights.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content light-blue darken-4">
							      <center><span class="card-title activator white-text text-darken-4">KNIGHTS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/aztecs.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content  pink darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">AZTECS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/gladiators.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content red darken-2">
							      <center><span class="card-title activator grey-text text-lighten-5">GLADIATORS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/firebirds.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content   blue darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">FIREBIRDS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/gunners.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content light-blue darken-4">
							      <center><span class="card-title activator white-text text-darken-4">GUNNERS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/paladians.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content  pink darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">PALADIANS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/spartans.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content red darken-2">
							      <center><span class="card-title activator grey-text text-lighten-5">SPARTANS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/raiders.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content   blue darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">RAIDERS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
					</div>
					</div> <!-- END FEMALE-->
					
					</div>
				</li>
				<!-- END TRIPLE -->
				
				<!-- SHOOTING -->

				<li style="margin-top: 0.5%;">
					<div class="collapsible-header team-collapse">
					  <i class="small material-icons secondary-content">star</i>
					  <h5  style="margin-top: 1%;font-family:Times New Roman, Times, serif;">SHOOTING</h5>
					</div>
					<div class="collapsible-body">
					<ul class="tabs">
				        <li class="tab col s3 m6 l6"><a class="active" href="#shooting_male"><b>MALE</b></a></li>
				        <li class="tab col s3 m6 l6"><a href="#shooting_female"><b>FEMALE</b></a></li>
				    </ul>
				    <div id="shooting_male">
					<div class="row">
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/apaches.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content light-blue darken-4">
							      <center><span class="card-title activator white-text text-darken-4">APACHES</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">APACHES<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/aztecs.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content  pink darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">AZTECS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/bisons.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content red darken-2">
							      <center><span class="card-title activator grey-text text-lighten-5">BISONS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/razorbacks.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content   blue darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">RAZORBACKS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/paladians.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content light-blue darken-4">
							      <center><span class="card-title activator white-text text-darken-4">PALADIANS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/vikings.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content  pink darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">VIKINGS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/spartans.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content red darken-2">
							      <center><span class="card-title activator grey-text text-lighten-5">SPARTANS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/raiders.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content   blue darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">RAIDERS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
					</div>
					</div> <!-- END MALE-->
					
					<!-- START FEMALE -->
					<div id="shooting_female">
					<div class="row">
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/knights.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content light-blue darken-4">
							      <center><span class="card-title activator white-text text-darken-4">KNIGHTS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/aztecs.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content  pink darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">AZTECS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/gladiators.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content red darken-2">
							      <center><span class="card-title activator grey-text text-lighten-5">GLADIATORS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/firebirds.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content   blue darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">FIREBIRDS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/gunners.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content light-blue darken-4">
							      <center><span class="card-title activator white-text text-darken-4">GUNNERS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/paladians.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content  pink darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">PALADIANS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
						
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator" src="images/man-team-logo/spartans.png" style="width:200px;height:200px;"></center>
							    </div>
							    <div class="card-content red darken-2">
							      <center><span class="card-title activator grey-text text-lighten-5">SPARTANS</span></center>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
						<div class="col s12 m4 l3">
							
							<!-- FIRST TEAM -->
							 <div class="card">
							    <div class="card-image waves-effect waves-block waves-light">
							      <center><img class="activator circle responsive-img" src="images/man-team-logo/raiders.png" style="width: 200px;height:200px;"></center>
							    </div>
							    <div class="card-content   blue darken-2">
							     <center><span class="card-title activator grey-text text-lighten-5">RAIDERS</span></center> 
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
							      <p>Here is some more information about this product that is only revealed once clicked on.</p>
							    </div>
							  </div>
							
						</div>
						
					</div>
					</div> <!-- END FEMALE-->
					
					</div>
				</li>
				
				<!-- END SHOOTING -->
				
			</ul>
		</div>
	</div>
	
</div>
<!-- FOOTER -->
	<footer class="page-footer">
          <div class="container">
            <div class="row">
              <div class="col l6 s12">
                <h5 class="white-text">Footer Content</h5>
                <p class="grey-text text-lighten-4">You can use rows and columns here to organize your footer content.</p>
              </div>
              <div class="col l4 offset-l2 s12">
                <h5 class="white-text">Links</h5>
                <ul>
                  <li><a class="grey-text text-lighten-3" href="#!">Link 1</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">Link 2</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">Link 3</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">Link 4</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="footer-copyright">
            <div class="container">
            © 2017 PlaySoftech
            <a class="grey-text text-lighten-4 right" href="#!">More Links</a>
            </div>
          </div>
        </footer>
	<!-- END FOOTER -->

 <!--Import jQuery before materialize.js-->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="materialize/js/materialize.min.js"></script>
<script>

$('.carousel.carousel-slider').carousel({full_width: true});
      
</script>

</body>
</html>