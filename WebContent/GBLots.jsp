<%@ page language="java" import="java.sql.*"
	import="DBManager.DBManager" import="java.util.Date" import="java.text.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Generate Lots</title>
</head>
<body>
<%
	final int MAX=500;
int mcount=0;
int mpool[]=new int[MAX];
int mmid[]=new int[MAX];
String mmdate[]=new String[MAX],mmtid1[]=new String[MAX],mmtid2[]=new String[MAX],mmtime[]=new String[MAX];


try
{
	
	int tourId = 1;//Integer.parseInt(request.getParameter("tourId"));
	String gen="M";//request.getParameter("gen");
	
		DBManager.loadDriver();
		DBManager DB = new DBManager();
		ResultSet rs = null,rs1 = null,rs2=null;
		String pname[] = new String[10];
		//String gen = "M";
		String mtype="league";
		
		Date dnow=new Date();
		SimpleDateFormat yy=new SimpleDateFormat("yyyy-MM-dd");
		String mdate=yy.format(dnow);
		String mtime="00:00:00";
		int year=2020;
		int pcount[] = new int[64];
		int pcount1=0;
		ResultSet rsd[]=new ResultSet[100];
		//rs = DBManager.fetchQuery("select count(pname) as pcount,pname from tourPool tp,tourTeam tt where tp.ttid=tt.tId and tp.tpgender='"+gen+"' and tt.tourId="+tourId+" group by(pname);");
		rs=DBManager.fetchQuery("select count(pname) as pcount,pname from tourPool where tourId="+tourId+" and tpGender='"+gen+"' group by(pname);");
		
		
		while(rs.next())
		{
	
	pname[pcount1] = rs.getString("pname");
	pcount[pcount1] = rs.getInt("pcount");
	pcount1 = pcount1+1;	
		
		}
		int A[]=new int[20];
		int B[]=new int[20];
		int C[]=new int[20];
		int D[]=new int[20];
		rs1=null;
		int cnt=0;
		for (int i = 0; i < 4; i++) {
			cnt=0;
			rs=null;
			rs = DBManager.fetchQuery("select ttId from tourPool tp where tp.pname=" + (i + 1)+ " and tp.tpgender='M' and tourId=1");
			if (i == 0) {
				while (rs.next()) {
					A[cnt++] = rs.getInt("ttId");
				}
			}
			if(i==1)
			{
				while (rs.next()) {
					B[cnt++] = rs.getInt("ttId");
				}
			}
			if(i==2)
			{
				while (rs.next()) {
					C[cnt++] = rs.getInt("ttId");
				}
			}
			if(i==3)
			{
				while (rs.next()) {
					D[cnt++] = rs.getInt("ttId");
				}
			}
		}
		/*for(int i=0;i<pcount1;i++)
		{
			if(rsd[i].next())
			{
				for(int j=0;j<4;j++)
				System.out.println("++"+rsd[j].getInt("ttId"));	
			}
			
		} */

		int poolno = 0;
		/*while(poolno<(pcount1/2))
		{
				rs = null;
				rs = DBManager.fetchQuery("select ttId from tourPool tp where tp.pname="+(poolno+1)+" and tp.tpgender='M' and tourId=1");
				rs2 = null;
				int [] ttId = new int[20];
				int pooltemp = ((pcount1+(poolno*2))/2);
				System.out.println("select ttId from tourPool tp where tp.pname="+(pooltemp+1)+" and tp.tpgender='M' and tourId=1");
				rs2 = DBManager.fetchQuery("select ttId from tourPool tp where tp.pname="+(pooltemp+1)+" and tp.tpgender='M' and tourId=1");
				int i = 0;
				//Storing opposite team in array
				 while(rs2.next())
				 {
					ttId[i] = rs2.getInt("ttId");
					System.out.println("team "+ttId[i]);
					i += 1;
				 }
				
				//Inserting the match
				 while(rs.next())	
				 {
					 System.out.println("++++++GETTING MATCH++++++"+rs.getInt("ttId"));
					 System.out.println("III "+i);
					 for(int j = 0;j < i;j++)
					 {
						 System.out.println(rs.getInt("ttId")+ " VS " +ttId[j]);
						 DB.insert("insert into wmatch1 values('"+ DBManager.getMaxId("wmatch1", "mid") + "','"+mdate+"','" + rs.getInt("ttId") + "','"+ ttId[j] + "','" + 0 + "','"+mtime+"','"+gen+"','"+mtype+"',"+tourId+");");
					 }
					 
				 }
				 poolno += 1;
				
		}*/
		for (int k = 0; k < pcount1; k++) 
		{
			for(int i=0;i<pcount1;i++)
			{
					System.out.println(A[i] + "-----" + C[(i+k) % 4]);
					System.out.println(B[i] + "-----" + D[(i+k) % 4]);
					DB.insert("insert into wmatch values('"+ DBManager.getMaxId("wmatch", "mid") + "','"+mdate+"','" + A[i] + "','"+ C[(i+k) % 4] + "','" + (k+1) + "','"+mtime+"','"+gen+"','"+mtype+"',"+tourId+",'0');");
					DB.insert("insert into wmatch values('"+ DBManager.getMaxId("wmatch", "mid") + "','"+mdate+"','" + B[i] + "','"+ D[(i+k) % 4] + "','" + (k+1) + "','"+mtime+"','"+gen+"','"+mtype+"',"+tourId+",'0');");
			}
		}
		for (int k = 0; k < pcount1; k++) 
		{
			for(int i=0;i<pcount1;i++)
			{
					System.out.println(C[(i+k) % 4] + "-----" + A[i]);
					System.out.println(D[(i+k) % 4] + "-----" + B[i]);
					DB.insert("insert into wmatch values('"+ DBManager.getMaxId("wmatch", "mid") + "','"+mdate+"','" + C[(i+k) % 4] + "','"+ A[i] + "','" + (k+1) + "','"+mtime+"','"+gen+"','"+mtype+"',"+tourId+",'0');");
					DB.insert("insert into wmatch values('"+ DBManager.getMaxId("wmatch", "mid") + "','"+mdate+"','" + D[(i+k) % 4] + "','"+ B[i] + "','" + (k+1) + "','"+mtime+"','"+gen+"','"+mtype+"',"+tourId+",'0');");
			
			}
		}

		System.out.println("FINALLY");
	} catch (Exception e) {

	} finally {
		DBManager.close();
	}
%>

</body>
</html>