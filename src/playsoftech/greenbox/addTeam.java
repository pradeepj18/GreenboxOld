
package playsoftech.greenbox;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.util.Iterator;
import java.util.List;

import DBManager.DBManager;

import java.io.*;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;

/**
 * Servlet implementation class addTeam
 */
@WebServlet("/addTeam")
public class addTeam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addTeam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		FileItem item=null;
		String str[]=new String[100];//for form values
		int cnt=0;
		String str1[]=new String[100];//for browse values
		int cnt1=0;
		String f=null;
	try
	{
		DBManager.loadDriver();
		DBManager DB=new DBManager();
		
		String ImageFile="";
		String itemName = "";

		
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (!isMultipart)
		{
		}
		else
		{
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = null;
		try
		{
		items = upload.parseRequest(request);
		}
		catch (FileUploadException e)
		{
		e.getMessage();
		}

		Iterator itr = items.iterator();
		while (itr.hasNext())
		{
		item = (FileItem) itr.next();
		if (item.isFormField())
		{
		String name = item.getFieldName();
		String value = item.getString();
		str[cnt++]=value;
		if(name.equals("tflag"))
		{
		ImageFile=value;
		}
		
		}
		else
		{
		try
		{

			int ii=0;//for extension
		 str1[cnt1] = item.getName();
		// System.out.println("*****"+str1[cnt1]);
		 String s2[]=str1[cnt1].split("\\.");
		
		 String s[]=str[0].split(" ");
		 String s1="";
		 for(int i=0;i<s.length;i++)
			 s1+=s[i];
				f="/home/pradeep/Documents/workspaceSpring/GreenBox/WebContent/Flags/"+s1.toUpperCase()+"."+s2[s2.length-1]+"";
				//System.out.println(f);
		 
	// System.out.println("+++++++++++++++++++++++"+"/home/pradeep/workspace/LagoriWorld/WebContent/Flags/"+str1[cnt1]+"");//str[1] for storing according to name
			
		 cnt1++;
		}
		catch (Exception e)
		{
		System.out.println("Error :- "+e.getMessage());
		e.printStackTrace();
		}
		}
		}
		
try
{
	boolean flag=true;
	ResultSet rs=null;
	rs=DBManager.fetchQuery("select * from team;");
	while(rs.next())
	{
	if(str[0].equalsIgnoreCase(rs.getString("tName")))
		flag=false;
	}
	if(flag)
	{
	int tId=DBManager.getMaxId("team", "tId");
	String d[]=str[1].split("/");
	int r=DB.insert("insert into team values("+tId+",'"+str[0].toUpperCase()+"','"+d[2]+"/"+d[0]+"/"+d[1]+"','"+"active"+"','"+f+"','')");
	//System.out.println("insert into team values("+tId+",'"+str[0].toUpperCase()+"','"+d[2]+"/"+d[1]+"/"+d[0]+"','"+str[2]+"','"+f+"','')");
	if(r>0)
	{
	File savedFile = new File(f);
	item.write(savedFile);
	
	PrintWriter out = response.getWriter();
	out.println("<script type='text/javascript'>alert('Team Added Successfully.');window.location.replace('GBHome.jsp');</script>");
	}
	}
	else
	{
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>alert('Team Already Added..!');window.location.replace('GBHome.jsp');</script>");

		/*response.setContentType("text/html");
		out.println("<script type=text/javascript>");
		out.println("alert('Team Already Added..!');");
		out.println("</script>");

		RequestDispatcher rd =request.getRequestDispatcher("addTeam.jsp");
		rd.forward(request, response);
	*/	
	}
}
catch(Exception e)
{
	PrintWriter out = response.getWriter();
	out.println("<script type='text/javascript'>alert('"+e.getMessage()+"');window.location.replace('GBHome.jsp');</script>");
	
}
finally
{
	DBManager.close();	
}
		
		
		}
	}

	catch(Exception e)
	{
		System.out.println("Error in servlet addTeam.."+e);
		DBManager.close();
	}
	finally
	{
		DBManager.close();
	}
	}

}
