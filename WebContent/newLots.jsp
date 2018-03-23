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
	try
{
	
	int tourId = 1;//Integer.parseInt(request.getParameter("tourId"));
	String gen="M";//request.getParameter("gen");
	
		DBManager.loadDriver();
		DBManager DB = new DBManager();
		ResultSet rs = null;
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
		rs=DBManager.fetchQuery("select count(pname) as pcount,pname from tourPool where tourId="+tourId+" and tpGender='"+gen+"' group by(pname);");
		while (rs.next()) {

			pname[pcount1] = rs.getString("pname");
			pcount[pcount1] = rs.getInt("pcount");
			pcount1 = pcount1 + 1;

		}
		int j = 0;
		int array[][] = new int[pcount1][10];
		int count[] = new int[10];
		for (int i = 0; i < pcount1; i++) {
			rs = DBManager.fetchQuery("select ttId from tourPool tp where tp.pname=" + (i + 1)
					+ " and tp.tpgender='M' and tourId=1");
			j = 0;
			while (rs.next()) {
				array[i][j++] = rs.getInt("ttId");
			}
			count[i] = j;
		}
		for (int pool = 0; pool < pcount1; pool++) {
			for (int k = 0; k < pcount1; k++) {
				for (int i = 0; i < count[k]; i++) {
					System.out.println(
							array[pool][i] + "-----" + array[pool + (pcount1 / 2)][(i + k) % count[k]]);//array[0]-POOL A,array[2]-POOL C
				}
			}
		}
		/*
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
		
		int poolno = 0;
		
		for (int k = 0; k < pcount1; k++) 
		{
			for(int i=0;i<pcount1;i++)
			{
					System.out.println(A[i] + "-----" + C[(i+k) % 4]);
					System.out.println(B[i] + "-----" + D[(i+k) % 4]);
					DB.insert("insert into wmatch values('"+ DBManager.getMaxId("wmatch", "mid") + "','"+mdate+"','" + A[i] + "','"+ C[(i+k) % 4] + "','" + (k+1) + "','"+mtime+"','"+gen+"','"+mtype+"',"+tourId+");");
					DB.insert("insert into wmatch values('"+ DBManager.getMaxId("wmatch", "mid") + "','"+mdate+"','" + B[i] + "','"+ D[(i+k) % 4] + "','" + (k+1) + "','"+mtime+"','"+gen+"','"+mtype+"',"+tourId+");");
			}
		}
		for (int k = 0; k < pcount1; k++) 
		{
			for(int i=0;i<pcount1;i++)
			{
					System.out.println(C[(i+k) % 4] + "-----" + A[i]);
					System.out.println(D[(i+k) % 4] + "-----" + B[i]);
					DB.insert("insert into wmatch values('"+ DBManager.getMaxId("wmatch", "mid") + "','"+mdate+"','" + C[(i+k) % 4] + "','"+ A[i] + "','" + (k+1) + "','"+mtime+"','"+gen+"','"+mtype+"',"+tourId+");");
					DB.insert("insert into wmatch values('"+ DBManager.getMaxId("wmatch", "mid") + "','"+mdate+"','" + D[(i+k) % 4] + "','"+ B[i] + "','" + (k+1) + "','"+mtime+"','"+gen+"','"+mtype+"',"+tourId+");");
			
			}
		}
		
		System.out.println("FINALLY");*/
	} catch (Exception e) {

	} finally {
		DBManager.close();
	}
%>

</body>
</html>