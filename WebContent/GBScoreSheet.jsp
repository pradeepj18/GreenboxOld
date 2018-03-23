<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.* " import="DBManager.DBManager" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Score</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<style>
tr.border_bottom td {
  border-bottom:1pt solid black;
}
*
	{
		box-sizing:border-box;
	}
#date
{
	margin-top:0px;
}

@media print 
{
 * {
    color: #000 !important;
    text-shadow: none !important;
    background: transparent !important;
    box-shadow: none !important;
    
  }
  	
	#date
	{
		margin-top:2%;
	}

	
  html, body 
  {
    height:100%; 
    background: #FFF; 
    font-size: 11pt;
    font-family:Arial, Helvetica, sans-serif;
       
   }
  @page
  {
 	size:A4;
 	margin:0cm 0.8cm 0.0cm -0.5cm;  
  }

}

</style>
<style>
.c 
{
text-align:left;
padding-left:15%;

}
.b 
{
text-align:left;
padding-left:50px;

}

</style>
</head>

<%!int srno; %>

 <%
 	try
  {
 		String tNameA="";
 		String tNameB="";
int tourId=Integer.parseInt(request.getParameter("tourId"));
      DBManager.loadDriver();
 		String mtype="";
  			ResultSet leg=null,rsa1,rs1,rs2,rs2x,rs3,rs4,rs5,rs6, rsba1,rsb1,rsb2,rsb2x,rsb3,rsb4,rsb5,rsb6,rs7,rs0,rs11,rs12,rs13,rs14,rr1,rr2;;
  			
  			
  			//String mid1 = request.getParameter("mid1");
 		String mid = request.getParameter("mid");
 		//System.out.println("MID "+mid);
 		int court = 1;
 		
  				//	int mid= Integer.parseInt(request.getParameter("mid"));
  					/* System.out.println("mid"+mid); */
  			
  					rs13 = null;
  					String gender=null;
  					rs13 = DBManager.fetchQuery("select gender from wmatch m,tourTeam t where t.ttId=m.tid1 and mid="+mid+";");
  					
  					rs13.next();
  				
  					if(rs13.getString(1).equals("F"))
  					{
  						gender = "GIRLS";
  					}
  					else
  						gender = "BOYS";
  					
  					 leg=DBManager.fetchQuery("select * from wmatch w,print_match p where w.mid=p.mid and p.mid="+mid+";");
  					if(leg.next())
  					{
  						if(leg.getString("mtype").equals("league"))
  							mtype="League";
  						else if(leg.getString("mtype").equals("pqtr"))
  						mtype="PRE Quarter FINAL";
  						else if(leg.getString("mtype").equals("qtr"))
  	 						mtype="Quarter FINAL";
  						else if(leg.getString("mtype").equals("semi"))
  	 						mtype="SEMI FINAL";
  						else if(leg.getString("mtype").equals("3rdPlace"))
  	 						mtype="3rdPlace";
  						else
  							mtype="FINAL";
  						court = leg.getInt("court");	
  						srno = leg.getInt("srno");
  					}
  					rs13 = DBManager.fetchQuery("select * from print_match where mid="+mid);
  					
  					rs13.next();
  					
  				/* 	String cname=request.getParameter("cname");
  					String venue=request.getParameter("venue");
  					nameString org=request.getParameter("org"); */
  				
  					String tdate = rs13.getString("mdate").substring(8,10)+"/"+rs13.getString("mdate").substring(5,7)+"/"+rs13.getString("mdate").substring(0,4);

  					String ttime=rs13.getString("mtime");
  					String ato1="";
  					/* String ato1=rs13.getString(5);
  					String ato2=rs13.getString(6);
  					String bto1=rs13.getString(7);
  					String bto2=rs13.getString(8);
  					String oto1=rs13.getString(9);
  					String oto2=rs13.getString(10);
  					String oto3=rs13.getString(11);
  					String oto4=rs13.getString(12);
   */
  					String teamwin=null;
  					int twin1[] = new int[2];
  					String twin11[] = new String[2];
  					int ii=0;
  					
  					String win="select count(tg.gno) as goal,(select tName from team t where tid in(select tid from tourTeam tt where tt.ttId=tg.ttId)) as tname from tourGoal tg where mid="+mid+" and tourId="+tourId+" group by (tg.ttId) order by goal desc;";
 			rs11 = DBManager.fetchQuery(win);
 			
 		
 			while(rs11.next())
 			{
 				twin11[ii] = rs11.getString("tname");
 				twin1[ii]=rs11.getInt("goal");
 				ii++;
 			}
 			if(twin1[0] == twin1[1])
 			{
 				
 				teamwin = "DRAW";
 			}
 			else if(twin1[0] > twin1[1])
 			{
 				teamwin = twin11[0];
 			}
 			else
 				teamwin = twin11[1];
  				

  				//	String tname=request.getParameter("tname");
  			session.getAttribute("tname");
  			
  			response.setContentType("text/html");
 	        		   
  					String q0="select gender,tid1,(select tname from team t,tourTeam tt where tt.tId = t.tId and w.tid1 = tt.ttId and tourId="+request.getParameter("tourId")+") as tname1,tid2,(select tname from team t,tourTeam tt where tt.tId = t.tId and w.tid2 = tt.ttId and tourId="+request.getParameter("tourId")+") as tname2 from wmatch w where mid="+request.getParameter("mid")+"";
  					rs0=DBManager.fetchQuery(q0);
  					rs0.next();
  					tNameA=rs0.getString("tname1");
  					tNameB=rs0.getString("tname2");
  					int tid1=rs0.getInt("tid1");
  					int tid2=rs0.getInt("tid2");
  					int htsa = 0;
  					int htsb = 0;
  					rs0 = DBManager.fetchQuery("select count(gno) as tAscore from tourGoal where tourId="+tourId+" and mid="+mid+" and ttId="+tid1+" and gtype='1';");
  					if(rs0.next())
  					{	htsa = rs0.getInt("tAscore");}
  					rs0 = DBManager.fetchQuery("select count(gno) as tAscore from tourGoal where tourId="+tourId+" and mid="+mid+" and ttId="+tid2+" and gtype='1';");
  					if(rs0.next())
  					{	htsb = rs0.getInt("tAscore");}
  				 	int extra1 = 0;
  					int extra2 = 0;
  					rs0 = DBManager.fetchQuery("select count(gno) as tAscore from tourGoal where tourId="+tourId+" and mid="+mid+" and ttId="+tid1+" and gtype='P';");
  					if(rs0.next())
  					{	extra1 = rs0.getInt("tAscore");}
  					rs0 = DBManager.fetchQuery("select count(gno) as tAscore from tourGoal where tourId="+tourId+" and mid="+mid+" and ttId="+tid2+" and gtype='P';");
  					if(rs0.next())
  					{	extra2 = rs0.getInt("tAscore");} 
  				
  					int ftsa = 0;
  					int ftsb = 0;
  					rs0 = DBManager.fetchQuery("select count(gno) as tAscore from tourGoal where tourId="+tourId+" and mid="+mid+" and ttId="+tid1+" and gtype='2';");
  					if(rs0.next())
  					{	ftsa = rs0.getInt("tAscore");}
  					rs0 = DBManager.fetchQuery("select count(gno) as tAscore from tourGoal where tourId="+tourId+" and mid="+mid+" and ttId="+tid2+" and gtype='2';");
  					if(rs0.next())
  					{	ftsb = rs0.getInt("tAscore");}
  					
  					
         			//TOSS WIN
         			
         			/* String tw=rs13.getString(4);
         			 System.out.println("ANAN"+tw); 
         			String twin = "select tname from team where tname="+tw;
         			rs12 = DBManager.fetchQuery(twin);
         			rs12.next();
         			 */
         			String twon = rs13.getString(4);
         			
         			//for table 1
         			
         		
         			 //String q6="SELECT tname from team where tid="+tid1;
         			 //String q1="SELECT pname,jno from player p,team t where t.tid=p.tid and p.tid="+tid1;
         		  // String q2="SELECT jno,gtime,gtype from team t,goal g,wmatch m,player p where t.tid = g.tid and m.mid = g.mid and g.rbfid = p.rbfid and g.tid="+tid1 + " and m.mid="+mid;
         		//	 String q3="SELECT jno,gtime from team t,goal g,wmatch m,player p where t.tid = g.tid and m.mid = g.mid and g.rbfid = p.rbfid and g.tid="+tid1 + " and m.mid="+mid;
         			// String q4="SELECT jno,ftime from team t,foul g,wmatch m,player p where t.tid = g.tid and m.mid = g.mid and g.rbfid = p.rbfid and g.tid="+tid1 + " and m.mid="+mid;
         			// String q5="SELECT jno,cname,ctime from card c,wmatch m,team t,player p where c.tid=t.tid and c.mid=m.mid and p.rbfid=c.rbfid and c.tid="+tid1 + " and c.mid="+mid;         			 
         			 //String q13="SELECT cname from coach c,team t where c.tid=t.tid and c.tid="+tid1; 
         			// String q14="SELECT mname from manager m,team t where m.tid=t.tid and m.tid="+tid1;
         			 
         			
         			 rsa1=DBManager.fetchQuery("select tName from team where tid in(select tid from tourTeam where ttId="+tid1+")"); 
         			 rs1=DBManager.fetchQuery("select m.barcodeId,m.fName,m.mName,m.lName,tp.jerseyNo,ttId from tourPlayer tp,member m where tp.barcodeId=m.barcodeId and tp.ttId="+tid1+" and tp.tourId="+tourId+";");
         			
         			 rs2=DBManager.fetchQuery("select tg.gtime,tg.gtype,(select jerseyNo from tourPlayer tp where tp.barcodeId=tg.barcodeId and tourId="+tourId+" and mid="+mid+" and ttId="+tid1+") as jno from tourGoal tg where tourId="+tourId+" and mid="+mid+" and ttId="+tid1+";");
         			 rs2x=DBManager.fetchQuery("select tg.gtime,(select jerseyNo from tourPlayer tp where tp.barcodeId=tg.barcodeId and tourId="+tourId+" and mid="+mid+" and ttId="+tid1+") as jno from tourGoal tg where tourId="+tourId+" and mid="+mid+" and ttId="+tid1+";");
         			 rs3=DBManager.fetchQuery("select tg.ftime,(select jerseyNo from tourPlayer tp where tp.barcodeId=tg.barcodeId and tourId="+tourId+" and mid="+mid+" and ttId="+tid1+") as jno from tourFoul tg where tourId="+tourId+" and mid="+mid+" and ttId="+tid1+";");
         			 rs4=DBManager.fetchQuery("select tg.cname,tg.ctime,tg.ctype,(select jerseyNo from tourPlayer tp where tp.barcodeId=tg.barcodeId and tourId="+tourId+" and mid="+mid+" and ttId="+tid1+") as jno from tourCard tg where tourId="+tourId+" and mid="+mid+" and ttId="+tid1+";");
         			 rs5=DBManager.fetchQuery("select fName,lName from member where barcodeId in(select barcodeId from tourCoach where tourId="+tourId+" and ttId="+tid1+" and pStatus='active');");
         			 rs6=DBManager.fetchQuery("select fName,lName from member where barcodeId in(select barcodeId from tourManager where tourId="+tourId+" and ttId="+tid1+" and pStatus='active');");
         			 
         			 

         			 String to1="-";
         			 String to2="-";
         			 String mr1="-";
         			 String mr2="-";
         			 String mr="-";
   					ResultSet tmr1=DBManager.fetchQuery("select m.fName,m.lName from member m where barcodeId in(select barcodeId from tourmatchrefoff tmo where m.barcodeId=tmo.tmr1 and tourId="+tourId+");");
         			if(tmr1.next())
   					to1= tmr1.getString("fName")+" "+tmr1.getString("lName");
         			
         			tmr1=null;
         			tmr1=DBManager.fetchQuery("select m.fName,m.lName from member m where barcodeId in(select barcodeId from tourmatchrefoff tmo where m.barcodeId=tmo.tmr2 and tourId="+tourId+");");
         			if(tmr1.next())
   					to2= tmr1.getString("fName")+" "+tmr1.getString("lName");
         			
         			tmr1=null;
         			tmr1=DBManager.fetchQuery("select m.fName,m.lName from member m where barcodeId in(select barcodeId from tourmatchrefoff tmo where m.barcodeId=tmo.tmo1 and tourId="+tourId+");");
         			if(tmr1.next())
   					mr1= tmr1.getString("fName")+" "+tmr1.getString("lName");
         			
         			tmr1=null;
         			tmr1=DBManager.fetchQuery("select m.fName,m.lName from member m where barcodeId in(select barcodeId from tourmatchrefoff tmo where m.barcodeId=tmo.tmo2 and tourId="+tourId+");");
         			if(tmr1.next())
   					mr2= tmr1.getString("fName")+" "+tmr1.getString("lName");
         			tmr1=null;
         			tmr1=DBManager.fetchQuery("select m.fName,m.lName from member m where barcodeId in(select barcodeId from tourmatchrefoff tmo where m.barcodeId=tmo.tourRefree and tourId="+tourId+");");
         			if(tmr1.next())
   					mr= tmr1.getString("fName")+" "+tmr1.getString("lName");
         			
         			/*  rs14=DBManager.fetchQuery("select taboff1,taboff2 from tourMatchOfficial where mid="+mid+" and tourId="+tourId+";");
   					if(rs14.next())
   					{
   						to1= rs14.getString("taboff1");
   						to2= rs14.getString("taboff2");	
   					}
   					
   					
   					rs14 = null;
   					rs14=DBManager.fetchQuery("select referee1,referee2 from tourMatchOfficial where mid="+mid+" and tourId="+tourId+";");
   					if(rs14.next())
   					{
   						mr1=rs14.getString("referee1");
   						mr2=rs14.getString("referee2");
   						
   					} */
   					
         			 //table 1 end
   					
   					//for table 2
         			 //String q12="SELECT tname from team where tid="+tid2;
         			// String q7="SELECT pname,jno from player p,team t where t.tid = p.tid and p.tid="+tid2;
         			// String q8="SELECT jno,gtime from team t,goal g,wmatch m,player p where t.tid = g.tid and m.mid = g.mid and g.rbfid = p.rbfid and g.tid="+tid2 + " and m.mid="+mid;
         			// String q9="SELECT jno,gtime from team t,goal g,wmatch m,player p where t.tid = g.tid and m.mid = g.mid and g.rbfid = p.rbfid and g.tid="+tid2 + " and m.mid="+mid;
         			// String q10="SELECT jno,ftime from team t,foul g,wmatch m,player p where t.tid = g.tid and m.mid = g.mid and g.rbfid = p.rbfid and g.tid="+tid2 + " and m.mid="+mid;
         			// String q11="SELECT jno,cname,ctime from card c,wmatch m,team t,player p where c.tid=t.tid and c.mid=m.mid and p.rbfid=c.rbfid and c.tid="+tid2 + " and c.mid="+mid;
         		//	 String q15="SELECT cname from coach c,team t where c.tid=t.tid and c.tid="+tid2; 
         		//	 String q16="SELECT mname from manager m,team t where m.tid=t.tid and m.tid="+tid2; 
         		     //String q98="select count(gno) from goal where tid="+tid1+" and mid="+mid;
         		     //String q99="select count(gno) from goal where tid="+tid2+" and mid="+mid;
         		    
         		     
         		     rr1=DBManager.fetchQuery("select count(gno) as tAscore from tourGoal where tourId="+request.getParameter("tourId")+" and mid="+request.getParameter("mid")+" and ttId="+tid1+";");
         		     rr2=DBManager.fetchQuery("select count(gno) as tBscore from tourGoal where tourId="+request.getParameter("tourId")+" and mid="+request.getParameter("mid")+" and ttId="+tid2+";");
         			 
         			 rsb1=DBManager.fetchQuery("select m.barcodeId,m.fName,m.mName,m.lName,tp.jerseyNo,ttId from tourPlayer tp,member m where tp.barcodeId=m.barcodeId and tp.ttId="+tid2+" and tp.tourId="+tourId+";");
         			 rsba1=DBManager.fetchQuery("select tName from team where tid in(select tid from tourTeam where ttId="+tid2+")");
         			 rsb2=DBManager.fetchQuery("select tg.gtime,tg.gtype,(select jerseyNo from tourPlayer tp where tp.barcodeId=tg.barcodeId and tourId="+tourId+" and mid="+mid+" and ttId="+tid2+") as jno from tourGoal tg where tourId="+tourId+" and mid="+mid+" and ttId="+tid2+";");
         			 rsb2x=DBManager.fetchQuery("select tg.gtime,(select jerseyNo from tourPlayer tp where tp.barcodeId=tg.barcodeId and tourId="+tourId+" and mid="+mid+" and ttId="+tid2+") as jno from tourGoal tg where tourId="+tourId+" and mid="+mid+" and ttId="+tid2+";");
         			 rsb3=DBManager.fetchQuery("select tg.ftime,(select jerseyNo from tourPlayer tp where tp.barcodeId=tg.barcodeId and tourId="+tourId+" and mid="+mid+" and ttId="+tid2+") as jno from tourFoul tg where tourId="+tourId+" and mid="+mid+" and ttId="+tid2+";");
         			 rsb4=DBManager.fetchQuery("select tg.cname,tg.ctime,tg.ctype,(select jerseyNo from tourPlayer tp where tp.barcodeId=tg.barcodeId and tourId="+tourId+" and mid="+mid+" and ttId="+tid2+") as jno from tourCard tg where tourId="+tourId+" and mid="+mid+" and ttId="+tid2+";");
         			 rsb5=DBManager.fetchQuery("select fName,lName from member where barcodeId in(select barcodeId from tourCoach where tourId="+tourId+" and ttId="+tid2+" and pStatus='active');");
         			 rsb6=DBManager.fetchQuery("select fName,lName from member where barcodeId in(select barcodeId from tourManager where tourId="+tourId+" and ttId="+tid2+" and pStatus='active');");
         			 
   					//table 2 end
   					
   					rr1.next();
   					rr2.next();
         			rsba1.next();
         			rsa1.next();
 %>
 
</head>
<body align="center">
<font size="2">

 <div class="container-fluid">
<div class="row">
		<div class="col-md-2 col-xs-2"></div>
		<div class="col-md-8 col-xs-8">
		<%
			 ResultSet rs1top = DBManager.fetchQuery("select tourName,tourOrgBy,tourVenue from tournament where tourId="+request.getParameter("tourId"));
			if(rs1top.next()){
		%>
			<center><b><u>GREEN BOX SCORE SHEET</u></b></center>
			<center><b>Event:</b><%=rs1top.getString("tourName") %><br>
			<b>Org.By:</b><%=rs1top.getString("tourOrgBy") %><br>
			<b>Venue:</b><%=rs1top.getString("tourVenue") %><br>
			<%} %>
			</center>
			<b>Teams:</b>&nbsp;&nbsp;<%=tNameA %><b>&nbsp;&nbsp;VS</b>&nbsp;&nbsp;<%=tNameB %>
			<b style="margin-left:20px;">TOSS &nbsp;:-&nbsp;<span><%=twon %></span></b>
			
			<b style="margin-left:20px;">
			Time :-&nbsp;
			<%
				ResultSet rstime = DBManager.fetchQuery("select TIME_FORMAT(now(),'%h:%i:%s') as time;");
				if(rstime.next())
				{
				%>
				<%=rstime.getString("time") %>
				<%} %>
			</b>
		</div>
		<div class="col-md-2 col-xs-2" id="date">
			<b>Date:</b><%=tdate %><br>
		
			<b>Court:</b><%=court %><br>
			<b><%=mtype %></b><br>
			<b>Match No:</b><%=mid %>
		</div>
		

 </div>
 

 <%-- <div align:center><center><font type="fontawesome-webfont.ttf"  size="3"> <b> GREEN BOX SCORE SHEET</b></font></center></a></div> 
 <font type="fontawesome-webfont.ttf"  size="3"><div align="center">  <%
  	for(int i =0 ;i < 30;i++)out.println("&nbsp;");
  %>11th Sub-Junior Roll Ball State Championship 2016-17(Boys & Girls)<%
  	for(int i =0 ;i < 30;i++)out.println("&nbsp;");
  %>Court No.: <font type="fontawesome-webfont.ttf"  size="5"> <b><%=court%></b></font></font><br>              
<b>Venue:-</b><font type="fontawesome-webfont.ttf"  size="3">Shrimant Chatrapatti Shau Jilha Krida Sankul,Satara.Date: - 1st & 2nd Oct 2016.</font>  <%
  	for(int i =0 ;i < 30;i++)out.println("&nbsp;");
  %><font type="fontawesome-webfont.ttf"  size="5"><B><%=mtype%></B><br> </font>
<b>Org. By:-</b><font type="fontawesome-webfont.ttf"  size="3">Maharashtra state Roll Ball Association & Satara District Roll Ball Association. </b></font> <br>
<span style="padding-right:40px"> <b>Date:- &nbsp;&nbsp;&nbsp;</b> <font type="fontawesome-webfont.ttf"  size="3">  <%=tdate%></b></font></span> <span style="padding-right:40px"><b> Time:- &nbsp;&nbsp;&nbsp; </b><font type="fontawesome-webfont.ttf"  size="3">  <%=ttime%></b></font></span>  <span style="padding-right:40px"><b>Match No.:- &nbsp;&nbsp;&nbsp;</b> <font type="fontawesome-webfont.ttf"  size="5"> <b> <%=srno+" ("+gender+")"%></b> </b></font></span><b> Toss Won By:-&nbsp;&nbsp;&nbsp; </b><font type="fontawesome-webfont.ttf"  size="3">   <%=twon%></b></font>
</div>
 <br> --%>
 <div style="float:left">Name Of Team A: <b>
 <%
 	out.println(rsa1.getString("tname"));
 %></b></div>
     <!-- <div style="float:right"> <table border="0" cellspacing="0"><tr><td><b>Time Outs:-</b></td><td style="border:1px solid #000;" width="20" align="center">1</td><td style="border:1px solid #000;" width="50"align="center"></td><td style="border:1px solid #000;" width="20" align="center">2</td><td style="border:1px solid #000;" width="50" align="center"></td></tr></table></div> -->
<br>

<table border="1" style="border-collapse:collapse;border:1px solid #FFFFF;color:#000000;width:100%" size="2" cellpadding="1" >
	<tr>
		<td width=3% align="center"> <font size="2" "><i>Sr. No.</i></td>
		<td width=25% align="center"><font size="2"><i>Player Name</i></td>
		
		<td width=3% align="center"> <font size="2" "><i>J. No.</i></td>
		<td width=3% align="center"><font size="2"><i>G No.</i></td>
		
		<!-- <td width=3% align="center"><font size="2"><i></i></td> -->
		<td width=3% align="center"><font size="2"><i>P. No</i></font></td>
		<td width=3% align="center"><font size="2"><i>Time</i></td>
		<td width=3% align="center"><font size="2"><i>G. No.</i></td>
		<td width=3% align="center"><font size="2"><i>P. No.</i></td>
		<td width=% align="center"><font size="2"><i>Time</i></td>
		<td width=3% align="center"><font size="2"><i>F. No.</i></td>
		<td width=3% align="center"><font size="2"><i>P. No.</i></td>
		<td width=5% align="center"><font size="2"><i>Time</i></td>
		<td width=3% align="center" ><font size="2"><i>P. No.</i></td>
		<td width=6% align="center"><font size="2"><i>cname (Y/R)</i></td>
		<td width=% align="center"><font size="2"><i>Time</i></td>
	</tr>
<%
	int cnt=0;
	
		int gno=0;
	int pgn=14;
	//ResultSet rsvp=(ResultSet) session.getAttribute("rs1");
	int rs2row = 0,rs1row = 0,rs2xrow = 0, rs3row = 0,rs4row = 0 ;
	while(rs4.next()) rs4row++;
	while(rs3.next()) rs3row++;
	while(rs2.next()) rs2row++;
	while(rs1.next()) rs1row++;
	rs2xrow = rs2row;
	rs1.beforeFirst();
	rs2.beforeFirst();
	rs3.beforeFirst();
	rs4.beforeFirst();
	
	if(rs1row>0) rs1.next();
	if(rs2row>0) rs2.next();
	if(rs2xrow>12) rs2x.absolute(13);
	if(rs3row>0) rs3.next();
	if(rs4row>0) rs4.next();
	

//	System.out.println("row:"+rs4row);
	int i,gno2=12;
	
	for(i=1;i<=12;i++)
	{
	

		out.println("<tr>");
		cnt=cnt+1;
		out.println("<td width=3% align=center > <i> <font size='2'>");
		//if(rs1row!=0) out.println(rs1.getString("cnt"));
		
		out.println("</font>"+i+" </i></td>");
		
		out.println("<td width=3%  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		if(rs1row!=0) out.println(rs1.getString("fName")+" "+rs1.getString("lName"));
		out.println("</b>");
		out.println("</font></td>"); 

		out.println("<td width=3% align=center  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		/* out.println(i); */
		if(rs1row!=0) out.println(rs1.getString("jerseyNo"));
		out.println("</b>");
		out.println("</font></td>"); 

		
		gno=gno+1;
		out.println("<i>");
		out.println("<td width=3% align=center  > <i> <font size='2'>"+i+"</font><i></td>");
		out.println("</i>");
		
		out.println("<td width=3% align=center  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		if(rs2row!=0)
		{
	 out.println(rs2.getString("jno")); 
	 if(rs2.getString("gtype").equals("P"))
	 out.println("<font color='RED'>P</font>");
	 if(rs2.getString("gtype").equals("G"))
		 out.println("<font color='RED'>G</font>");
		
		}
		out.println("</b>");
		out.println("</font></td>"); 
		 
		out.println("<td width=3% align=center  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		if(rs2row!=0) out.println(rs2.getString("gtime"));
		out.println("<b>");
		out.println("</font></td>"); 
		
		gno2=gno2+1;
		out.println("<i>");
		out.println("<td width=3% align=center  > <i> <font size='2'>"+ gno2 +"</font></i></td>");
		out.println("</i>");
		
		out.println("<td width=3% align=center  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		if(rs2xrow > 12) out.println(rs2x.getString("jno"));
		out.println("<b>");
		out.println("</font></td>"); 
		 
		out.println("<td width=3% align=center  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		if(rs2xrow > 12) out.println(rs2x.getString("gtime"));
		out.println("</b>");
		out.println("</font></td>"); 
		
		
		out.println("<i>");
		out.println("<td width=3% align=center  > <i> <font size='2'>"+cnt+"</font></i></td>");
		out.println("</i>");
		
		out.println("<td width=3% align=center  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		if(rs3row!=0) out.println(rs3.getString("jno"));
		out.println("</b>");
		out.println("</font></td>"); 

		out.println("<td width=3% align=center  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		if(rs3row!=0) out.println(rs3.getString("ftime"));
		out.println("</font></td>"); 
		out.println("</b>");
		
		out.println("<td width=3% align=center  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		if(rs4row!=0) out.println(rs4.getString("jno"));
		out.println("</font></td>"); 
		out.println("</b>");
		
		out.println("<td width=3% align=center  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		if(rs4row!=0) out.println(rs4.getString("cname"));
		out.println("</font></td>");
		out.println("</b>");
		
		out.println("<td width=3% align=center  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		if(rs4row!=0) out.println(rs4.getString("ctime"));
		out.println("</font></td>"); 
		out.println("</b>");		
		
		out.println("</tr>");
		
		if(rs1row!=0)
		{
	rs1.next();
	rs1row--;
		}
		
		if(rs2row!=0){
	rs2.next();
	rs2row--;
		}
		
		if(rs2xrow>12){
	rs2x.next();
	rs2xrow--;
		}
		
		if(rs3row!=0){
	rs3.next();
	rs3row--;
		}
		
		if(rs4row!=0){
	rs4.next();
	rs4row--;
		}
		
		
	}
%>

<tr>
		<td width=3%> <font size="2">C</td>
		<%
			out.println("<td width=3%  ><font size='2'>");
				out.println("<b>");
				out.println("<font face='Copperplate Gothic'>");
				if(rs5.next())
				{
			out.println(rs5.getString("fName")+" "+rs5.getString("lName"));
				}
				else
			out.println("----");
				out.println("</font></td>");
				out.println("</b>");
		%>
		<td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		  <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 
		 </tr>
		 <tr>
		<td width=3%> <font size="2">M</td>
		<%
			out.println("<td width=3%  ><font size='2'>");
				out.println("<b>");
				out.println("<font face='Copperplate Gothic'>");
				if(rs6.next())
				{
			out.println(rs6.getString("fName")+" "+rs6.getString("lName"));
				}
				else
			out.println("----");
				out.println("</b>");
				out.println("</font></td>");
		%>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		  <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 
		 </tr>
</table>
<br>

<div style="float:left">Name Of Team B: <b></u>
<%
	out.println(rsba1.getString("tName"));
%> </b></u></div>
     <!--  <div style="float:right"> <table border="0" cellspacing="0"><tr><td><b>Time Outs:-</b></td><td style="border:1px solid #000;" width="20" align="center">A</td><td style="border:1px solid #000;" width="50" align="center" ></td><td style="border:1px solid #000;" width="20" align="center" >B</td><td style="border:1px solid #000;" width="50" align="center" > </b></td></tr></table></div> -->


<table border="1" style="border-collapse:collapse;border:1px solid #FFFFF;color:#000000;width:100%" size="2" cellpadding="1" >
		<tr>
		<td width=3% align="center"> <font size="2" "><i>Sr. No.</i></td>
		<td width=25% align="center"><font size="2"><i>Player Name</i></td>
		<td width=3% align="center"> <font size="2" "><i>J No.</i></td>
		<td width=3% align="center"><font size="2"><i>G No.</i></td>
		<!-- <td width=3% align="center"><font size="2"><i></i></td> -->
		<td width=3% align="center"><font size="2"><i>P. No</i></td>
		<td width=% align="center"><font size="2"><i>Time</i></td>
		<td width=3% align="center"><font size="2"><i>G. No.</i></td>
		<td width=3% align="center"><font size="2"><i>P. No.</i></td>
		<td width=% align="center"><font size="2"><i>Time</i></td>
		<td width=3% align="center"><font size="2"><i>F. No.</i></td>
		<td width=3% align="center"><font size="2"><i>P. No.</i></td>
		<td width=5% align="center"><font size="2"><i>Time</i></td>
		<td width=3% align="center" ><font size="2"><i>P. No.</i></td>
		<td width=6% align="center"><font size="2"><i>cname (Y/R)</i></td>
		<td width=% align="center"><font size="2"><i>Time</i></td>
	</tr>
<%
	int cnt1=0;
	
		int gno1=0;
	int pgn1=14;
	//ResultSet rsvp=(ResultSet) session.getAttribute("rs1");
	int rsb2row = 0,rsb1row = 0,rsb2xrow = 0, rsb3row = 0,rsb4row = 0 ;
	while(rsb4.next()) rsb4row++;
	while(rsb3.next()) rsb3row++;
	while(rsb2.next()) rsb2row++;
	while(rsb1.next()) rsb1row++;
	rsb2xrow = rsb2row;
	rsb1.beforeFirst();
	rsb2.beforeFirst();
	rsb3.beforeFirst();
	rsb4.beforeFirst();
	
	if(rsb1row>0) rsb1.next();
	if(rsb2row>0) rsb2.next();
	if(rsb2xrow>12) rsb2x.absolute(13);
	if(rsb3row>0) rsb3.next();
	if(rsb4row>0) rsb4.next();
	

//	System.out.println("row:"+rs4row);
	int j,gno12=12;
	
	for(j=1;j<=12;j++){
	

		out.println("<tr>");
		cnt1=cnt1+1;
		out.println("<td width=3% align=center  > <i> <font size='2'>");
		out.println(j);
		/* if(rsb1row!=0) out.println(rsb1.getString("jno")); */
		out.println("</font></i></td>");
		
		out.println("<td width=3%  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		if(rsb1row!=0) out.println(rsb1.getString("fName")+" "+rsb1.getString("lName"));
		out.println("</b>");
		out.println("</font></td>"); 

		out.println("<td width=3% align=center  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		if(rsb1row!=0) out.println(rsb1.getString("jerseyNo"));
		//out.println(j);
		out.println("</b>");
		out.println("</font></td>"); 

		
		gno1=gno1+1;
		out.println("<td width=3% align=center  > <i> <font size='2'>"+j+"</font></i></td>");
		
		out.println("<td width=3% align=center  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		if(rsb2row!=0) out.println(rsb2.getString("jno"));
		out.println("</b>");
		out.println("</font></td>"); 
		 
		out.println("<td width=3% align=center  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		if(rsb2row!=0) out.println(rsb2.getString("gtime"));
		out.println("</b>");
		out.println("</font></td>"); 
		
		gno12=gno12+1;
		
		out.println("<td width=3% align=center  ><i> <font size='2'>"+ gno12 +"</font></i></td>");
		
		out.println("<td width=3% align=center  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		if(rsb2xrow > 12) out.println(rsb2x.getString("jno"));
		out.println("</b>");
		out.println("</font></td>"); 
		 
		out.println("<td width=3% align=center  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		if(rsb2xrow > 12) out.println(rsb2x.getString("gtime"));
		out.println("</b>");
		out.println("</font></td>"); 
		

		out.println("<td width=3% align=center  > <font size='2'>"+cnt1+"</font></td>");
		
		out.println("<td width=3% align=center  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		if(rsb3row!=0) out.println(rsb3.getString("jno"));
		out.println("</b>");
		out.println("</font></td>"); 

		out.println("<td width=3% align=center  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		if(rsb3row!=0) out.println(rsb3.getString("ftime"));
		out.println("</b>");
		out.println("</font></td>"); 
		
		out.println("<td width=3% align=center  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		if(rsb4row!=0) out.println(rsb4.getString("jno"));
		out.println("</b>");
		out.println("</font></td>"); 
	
		out.println("<td width=3% align=center  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		if(rsb4row!=0) out.println(rsb4.getString("cname"));
		out.println("</b>");
		out.println("</font></td>"); 
		
		out.println("<td width=3% align=center  ><font size='2'>");
		out.println("<b>");
		out.println("<font face='Copperplate Gothic'>");
		if(rsb4row!=0) out.println(rsb4.getString("ctime"));
		out.println("</b>");
		out.println("</font></td>"); 
		
		out.println("</tr>");
		
		if(rsb1row!=0){
	rsb1.next();
	rsb1row--;
		}
		
		if(rsb2row!=0){
	rsb2.next();
	rsb2row--;
		}
		
		if(rsb2xrow>12){
	rsb2x.next();
	rsb2xrow--;
		}
		
		if(rsb3row!=0){
	rsb3.next();
	rsb3row--;
		}
		
		if(rsb4row!=0){
	rsb4.next();
	rsb4row--;
		}
		
		
	}
%>

<tr>
		<td width=3%> <font size="2">C</td>
		<%
			out.println("<td width=3%  ><font size='2'>");
				out.println("<b>");
				out.println("<font face='Copperplate Gothic'>");
				if(rsb5.next())
				{
			out.println(rsb5.getString("fName")+" "+rsb5.getString("lName"));
				}
				else
			out.println("----");
				out.println("</b>");
				out.println("</font></td>");
		%>
		<td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		  <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 
		 </tr>
		 <tr>
		<td width=3%> <font size="2">M</td>
		<%
			out.println("<td width=3%  ><font size='2'>");
				out.println("<b>");
				out.println("<font face='Copperplate Gothic'>");
				if(rsb6.next())
				{
			out.println(rsb6.getString("fName")+" "+rsb6.getString("lName"));
				}
				else
			out.println("----");
				out.println("</b>");
				out.println("</font></td>"); 
				
				rsb6 = null;
				int tot1 = 0,tot2=0;
				//rsb6 = DBManager.fetchQuery(" select count(gno) from goal where mid="+mid+" and tid="+tid1);
				//if(rr1.next())
				 tot1 = rr1.getInt("tAscore");
				System.out.println("tAscore : "+tot1);
				rsb6 = null;
				//rsb6 = DBManager.fetchQuery(" select count(gno) from goal where mid="+mid+" and tid="+tid2);
				
				
				//if(rr2.next())
				 tot2 = rr2.getInt("tBscore");
		%>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		  <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 <td width=3%> <font size="2"></td>
		 
		 </tr>
</table>



  <!--    <div style="float:center"> <table border="0" cellspacing="0"><tr><td><b>Official Time Outs:-</td><td style="border:1px solid #000;" width="20"><b>1</b></td><td style="border:1px solid #000;"  width="40"><%-- <%= oto1 %> --%></td><td style="border:1px solid #000;"  width="20"><b>2</b><%-- <%= oto1 %> --%></td><td style="border:1px solid #000;"  width="40"><%--  <%= oto2 %> --%></b></td><td style="border:1px solid #000;" width="20"><b>3</b></td><td style="border:1px solid #000;"  width="40"><%-- <%= oto3 %> --%></td><td style="border:1px solid #000;"  width="20"><b>4</b></td><td style="border:1px solid #000;"  width="40"> <%-- <%= oto4 %> --%></td></tr></table></div></div>-->
<!--  <div style="float:center""> <table border="0" cellspacing="0"><tr><td>Official Time Outs:-</td>
    <td style="border:1px solid #000;" width="20" align="center">1</td><td style="border:1px solid #000;"  width="40" align="center"><b>   </b></td>
    <td style="border:1px solid #000;"  width="20" align="center">2</td><td style="border:1px solid #000;"  width="40" align="center"><b>  </b></td>
    <td style="border:1px solid #000;" width="20" align="center">3</td><td style="border:1px solid #000;"  width="40" align="center"> <b>  </b></td>
    <td style="border:1px solid #000;"  width="20" align="center">4</td><td style="border:1px solid #000;"  width="40" align="center"><b> </b></td></table>
 -->
    
    <br>
     <div style="float:left"> <table border="0" cellspacing="0"><tr><td>1st H S.:-</td>
     <td style="border:1px solid #000;" width="60" align="center">T A.</td>
     <td style="border:1px solid #000;"  width="40" align="center"><font type="fontawesome-webfont.ttf"  size="3" align="center">   <%= htsa %></b></font></td>
     <td style="border:1px solid #000;"  width="60" align="center">T B.</td>
     <td style="border:1px solid #000;"  width="40" align="center"><font type="fontawesome-webfont.ttf"  size="3" align="center"><%= htsb %></b></font></td>
     <div style="float:right"> <td> <%for(i=0;i < 1;i++)out.print("&nbsp"); %>2nd H S:</td><td style="border:1px solid #000;" width="60" align="center">T A</td><td style="border:1px solid #000;" width="40" align="center"><font type="fontawesome-webfont.ttf"  size="3" > <%=ftsa %> </b></font></td><td style="border:1px solid #000;" width="60" align="center">T B</td><td style="border:1px solid #000;" width="40" align="center"><font type="fontawesome-webfont.ttf"  size="3">  <%= ftsb %> </b></font></td></tr></table></div></div>
    <table border="0" cellspacing="0"><tr><td> <%for(i=0;i < 1;i++)out.print("&nbsp"); %>Extra T S:-</td><td style="border:1px solid #000;" width="60" align="center">T A</td><td style="border:1px solid #000;" width="40" align="center"><font type="fontawesome-webfont.ttf"  size="3" > <%= extra1%> </b></font></td><td style="border:1px solid #000;" width="60" align="center">T B</td><td style="border:1px solid #000;" width="40" align="center"><font type="fontawesome-webfont.ttf"  size="3"> <%=extra2%></b></font></td></tr></table>
    
   
    <br> <div style="float:left"> <table border="0" cellspacing="0"><tr><td><b>Total Score:-</b></td><td style="border:1px solid #000;" width="20" align="center">A</td><td style="border:1px solid #000;" width="50"align="center"><%= tot1 %></td><td style="border:1px solid #000;" width="20" align="center">B</td><td style="border:1px solid #000;" width="50" align="center"> <%= tot2 %></b></td></tr></table></div>
<%for(i=0;i < 10;i++)out.print("&nbsp"); %>
Winner: <b><font size="2"><%=teamwin%></b></div></font>
    
    <br>
  <!-- 
   <br>Half Time Score:-T.A. :- <font type="fontawesome-webfont.ttf"  size="3">  <%= htsa %></b></font>,T.B.:-<font type="fontawesome-webfont.ttf"  size="3">  <%= htsb %></b></font>, Full Time Score:- T.A.<font type="fontawesome-webfont.ttf"  size="3">  <%= ftsa %></b></font>,T.B.<font type="fontawesome-webfont.ttf"  size="3">  <%= ftsb %></b></font> -->
<br>   Captain Sign.:-Team A __________________________________, Team B :-  __________________________________ 
<BR><br><b>TABLE OFFICIAL(Name & Sign)</b><%for(i=0;i < 30;i++)out.println("&nbsp"); %><b>REFEREE (Name & Sign)</b>
<br><BR>1):<font type="fontawesome-webfont.ttf"  size="3">  <%= to1 %></b></font>&nbsp;________ <%for(i=0;i < 30;i++)out.println("&nbsp"); %>1):<font type="fontawesome-webfont.ttf"  size="3">  <%=mr1 %></b></font>&nbsp;________
<BR><br>2):<font type="fontawesome-webfont.ttf"  size="3">  <%= to2 %></b></font>&nbsp;________<%for(i=0;i < 30;i++)out.println("&nbsp"); %>2):<font type="fontawesome-webfont.ttf"  size="3">  <%=mr2 %></b></font>&nbsp;________
<BR><BR><%for(i=0;i < 30;i++)out.println("&nbsp"); %>MATCH REFEREE :-<b><%=mr %></b>&nbsp;&nbsp;__________________________


<%
 }
 catch(Exception e)
 {
	System.out.println("MESSAGE FOR U "+e);	 
	 
 }
%>
</body>
</html>