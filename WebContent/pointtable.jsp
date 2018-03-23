<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="DBManager.DBManager,java.sql.*,java.util.Date,java.text.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href = "css/page-2.css">
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


<div class="container-fluid page-2-container">
  <div class="row">
    <div class="col-md-7 col-xs-12 pointable-background " style="color:#FFFFFF;"> 
    
    <%
    try{
int tourId=1;
int i=0,cnt=0;
int p=0,w=0,d=0,l=0,gf=0,ga=0,gd=0,pts=0,loose=0,won=0,k=0;
String tname[][]=new String[20][20];
int total[][]=new int[20][20];
int win[][]=new int[20][20];
int draw[][]=new int[20][20];
int GF[][]=new int[20][20];
int GA[][]=new int[20][20];
int GD[][]=new int[20][20];
int pts1[][]=new int[20][20];
int Loose[][]=new int[20][20];
int temp;
DBManager.loadDriver();
ResultSet rs=null,rs1=null,rs2=null,rs3=null,rs4=null;
rs=DBManager.fetchQuery("select count(*),pname from tourPool where tourId="+tourId+" and tpgender='M' group by pname;");
if(rs.next())
{
%>  
<table width="70%" size="2" cellpadding="1" style="float:right;margin-right: 4%;margin-top: 28%;font-size: 16pt; ">
<tr class="pointable-header "><th width="8%" >&nbsp;&nbsp;Pos</th>
	<th width="22%">GROUP &#<%=(i+65) %></th>
    <th width="5%" >P</th>
    <th width="5%" >W</th>
    <th width="5%" >D</th>
    <th width="5%" >L</th>
    <th width="5%" >GF</th>
    <th width="5%" >GA</th>
    <th width="5%" >GD</th>
    <th width="5%">Pts</th>
 </tr>

	 <%
	 	int j = 0;
      rs1=DBManager.fetchQuery("select *,(select tName from team t where t.tId in(select tId from tourTeam tt where tt.ttId=tp.ttId)) as tName from tourPool tp where  tourId="+tourId+" and tpgender='M' and pname="+rs.getInt("pname"));
      while(rs1.next())
      {
    
    	  
	
	
      //rs2 = DBManager.fetchQuery("select count(tid1) as total,(select count(twon) from print_match where teamWon="+rs1.getInt("ttId")+" and tourId="+tourId+") as win,(select count(teamWon) from print_match where teamWon=0 and (tid1="+rs1.getInt("ttId")+" or tid2 ="+rs1.getInt("ttId")+") and tourId="+tourId+") as draw,(select sum(tAscore) from print_match where tourId="+tourId+" and tid1="+rs1.getInt("ttId")+") as ta1,(select sum(tBscore) from print_match where tourId="+tourId+" and tid2="+rs1.getInt("ttId")+") as ta2,(select sum(tAscore) from print_match where tourId="+tourId+" and tid1!="+rs1.getInt("ttId")+" and tid2="+rs1.getInt("ttId")+") as tb1,( select sum(tBscore) from print_match where tourId="+tourId+" and tid1="+rs1.getInt("ttId")+" and tid2!="+rs1.getInt("ttId")+") as tb2 from print_match where tid1="+rs1.getInt("ttId")+" or tid2="+rs1.getInt("ttId")+" and tourId="+tourId );  
	rs2 = DBManager.fetchQuery("select count(tid1) as total,(select count(twon) from print_match where teamWon="+rs1.getInt("ttId")+" and tourId="+tourId+" and mid in(select mid from wmatch where Flag='2')) as win,(select count(teamWon) from print_match where teamWon=0 and (tid1="+rs1.getInt("ttId")+" or tid2 ="+rs1.getInt("ttId")+") and tourId="+tourId+" and mid in(select mid from wmatch where Flag='2')) as draw,(select sum(tAscore) from print_match where tourId="+tourId+" and tid1="+rs1.getInt("ttId")+" and mid in(select mid from wmatch where Flag='2')) as ta1,(select sum(tBscore) from print_match where tourId="+tourId+" and tid2="+rs1.getInt("ttId")+" and mid in(select mid from wmatch where Flag='2')) as ta2,(select sum(tAscore) from print_match where tourId="+tourId+" and tid1!="+rs1.getInt("ttId")+" and tid2="+rs1.getInt("ttId")+" and mid in(select mid from wmatch where Flag='2')) as tb1,( select sum(tBscore) from print_match where tourId="+tourId+" and tid1="+rs1.getInt("ttId")+" and tid2!="+rs1.getInt("ttId")+" and mid in(select mid from wmatch where Flag='2')) as tb2 from print_match where tid1="+rs1.getInt("ttId")+" or tid2="+rs1.getInt("ttId")+" and tourId="+tourId+" and mid in(select mid from wmatch where Flag='2')");
	//System.out.println("select count(tid1) as total,(select count(twon) from print_match where teamWon="+rs1.getInt("ttId")+" and tourId="+tourId+" and mid in(select mid from wmatch where Flag='2')) as win,(select count(teamWon) from print_match where teamWon=0 and (tid1="+rs1.getInt("ttId")+" or tid2 ="+rs1.getInt("ttId")+") and tourId="+tourId+" and mid in(select mid from wmatch where Flag='2')) as draw,(select sum(tAscore) from print_match where tourId="+tourId+" and tid1="+rs1.getInt("ttId")+" and mid in(select mid from wmatch where Flag='2')) as ta1,(select sum(tBscore) from print_match where tourId="+tourId+" and tid2="+rs1.getInt("ttId")+" and mid in(select mid from wmatch where Flag='2')) as ta2,(select sum(tAscore) from print_match where tourId="+tourId+" and tid1!="+rs1.getInt("ttId")+" and tid2="+rs1.getInt("ttId")+" and mid in(select mid from wmatch where Flag='2')) as tb1,( select sum(tBscore) from print_match where tourId="+tourId+" and tid1="+rs1.getInt("ttId")+" and tid2!="+rs1.getInt("ttId")+" and mid in(select mid from wmatch where Flag='2')) as tb2 from print_match where tid1="+rs1.getInt("ttId")+" or tid2="+rs1.getInt("ttId")+" and tourId="+tourId+" and mid in(select mid from wmatch where Flag='2')");
      if(rs2.next())
      {
    	  p=rs2.getInt("total");
      	  won=rs2.getInt("win");
      	  d=rs2.getInt("draw");
      	  
      	  tname[k][cnt++]=rs1.getString("tName");
      	  total[k][cnt++]=p;
      	  win[k][cnt++]=won;
      	  draw[k][cnt++]=d;
      	  Loose[k][cnt++]=(p-(d+won));
      	  GF[k][cnt++]=rs2.getInt("ta1")+rs2.getInt("ta2");
      	  GA[k][cnt++]=rs2.getInt("tb1")+rs2.getInt("tb2");
      	GD[k][cnt++]=(rs2.getInt("ta1")+rs2.getInt("ta2"))-(rs2.getInt("tb1")+rs2.getInt("tb2"));
    	pts1[k][cnt++]=won*3 + (d*1);
      }
      cnt=0;
      %>
	
     <%
     k++;
      }
      
      for(i=0;i<k;i++)
      {
    	  for(j=0;j<k-i;j++)
    	  {
    		  if(pts1[j][8]<pts1[j+1][8])
    		  {
    			 
    			  temp=pts1[j][8];
    			  pts1[j+1][8]=pts1[j][8];
    			  pts1[j][8]=temp;
    			  
    			  /* String temp1=tname[j][8];
    			  tname[j+1][8]=tname[j][8];
    			  tname[j][8]=temp1; */
    		  }
    		  
    	  }
    	  
      }
     
     for(int k1=0;k1<k;k1++)
{
	j=0;	
//for(int k2=0;k2<8;k2++)
{

if(j == 0){
  %>
 <tr class="pointable tr" height="50">
 <%}else if(j ==1){ %>
 	<tr class="pointable tr1" height="50">
 <%} else if(j == 2){%>
 	<tr class="pointable1 tr2" height="50">
 	<%}else {%>
 	  <tr class="pointable1 " height="50">
 <%} %>
 <th width="8%" >&nbsp;&nbsp;<%=j+1 %></th>
 
 <th width="22%"><%=tname[k1][0] %></th>
<th width="5%" ><%=total[k1][1] %></th>
<th width="5%" ><%=win[k1][2] %></th>
<th width="5%" ><%=draw[k1][3] %></th>
<th width="5%" ><%=Loose[k1][4] %></th>
<th width="5%" ><%=GF[k1][5] %></th>
<th width="5%" ><%=GA[k1][6] %></th>
<th width="5%" ><%=GD[k1][7] %></th>
<th width="5%"><%=pts1[k1][8]%></th>
</tr>
 <%
 j = j+1;
}} 
     
     %>
 </table>
<%i++;} 


    }
    catch(Exception e){System.out.println(""+e);}
%>

</div>
</div>
</div>
</body>
</html>