
package playsoftech.greenbox;
import java.awt.Font;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.onbarcode.barcode.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import DBManager.DBManager;
/**
 * Servlet implementation class AddMember
 */
@WebServlet("/AddMember")
public class AddMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doGet(request, response);
		try {
			DBManager.loadDriver();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		boolean flag=false;
		String date=String.valueOf((new Date().getYear()+1900));
		String year[]=date.split("20");
		String path[]={"/home/pradeep/Documents/workspaceSpring/GreenBox/WebContent/Member/","/home/pradeep/Documents/workspaceSpring/GreenBox/WebContent/Barcodeimg/"};
		String p[]=new String[5];
		Code39 barcode=null;
		String formValues[]=new String[50];
		String imgValues[]=new String[50];
		FileItem item=null;
		int cnt=0,cnt1=0;
		 String b=null,bcodeimg=null;	
		 int b1=DBManager.getMaxId("member", "barcodeId");
		 System.out.println("B1 : "+b1);
		 if(b1==1)
			b = "" + year[1] + 21001;
		 else
			 b = "" + b1;
		 
		 
			try {
				
				barcode =new Code39();
				barcode.setData(String.valueOf(b));
				//barcode.setAutoResize(true);

				//barcode.setI(3.0f);
				//barcode.setN(3.0f);
				
				barcode.setExtension(true);
				barcode.setLeftMargin(0f);
				barcode.setRightMargin(0f);

			    //barcode.setBarcodeWidth(300);
				//barcode.setBarcodeHeight(100);
				
				barcode.setX(2f); 	
				barcode.setY(50f);
				
				
				barcode.setTopMargin(5f);

			    barcode.setBottomMargin(0f);
				barcode.setShowText(true);

			    barcode.setTextFont(new Font("Arial", 0, 30));
				barcode.setTextMargin(3);
				 
				 System.out.println("Success Barcode");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		
		try 
		{
			@SuppressWarnings("unused")
			String ImageFile="";
			@SuppressWarnings("unused")
			String itemName = "";
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			if (!isMultipart)
			{
			}
			else
			{
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			@SuppressWarnings("rawtypes")
			List items = null;
			try
			{
			items = upload.parseRequest(request);
			}
			catch (FileUploadException e)
			{
			e.getMessage();
			}
			@SuppressWarnings("rawtypes")
			Iterator itr = items.iterator();
			while (itr.hasNext())
			{
			item = (FileItem) itr.next();
			if (item.isFormField())
			{
			String name = item.getFieldName();
			String value = item.getString();
			formValues[cnt++]=value;
			if(name.equals("photo"))
			{
			ImageFile=value;
			}
			}
			else
			{
			try
			{
			 imgValues[cnt1] = item.getName();
			 String str2[]=imgValues[cnt1].split("\\.");//getting image extension
			 String tempPath=((path[cnt1]+formValues[0].toUpperCase()+"_"+formValues[2].toUpperCase())+"."+str2[1]+"");//storing with extension
			 File savedFile = new File(tempPath);
			 p[cnt1]=tempPath;
			 item.write(savedFile);
			 System.out.println(imgValues[cnt1]);
			
			 if(!flag)
			 {
				 bcodeimg=path[1]+formValues[0].toUpperCase()+formValues[2].toUpperCase()+".png";
				 flag=barcode.drawBarcode(bcodeimg);
			 }
			 cnt1++;
			}
			catch (Exception e)
			{
			System.out.println("Error"+e.getMessage());
			}
			}
			}
		} 
		try
		{
			if(formValues[1].equals(null) || formValues[3].equals(null))
				{formValues[1]="";formValues[3]="0000-00-00";}
			System.out.println("insert into member values("+Integer.parseInt(b)+",'"+formValues[0]+"','"+formValues[1]+"','"+formValues[2]+"','"+formValues[3]+"','"+formValues[4]+"','"+p[0]+"','','')");
			DBManager DB=new DBManager();
			int r= DB.insert("insert into member values("+Integer.parseInt(b)+",'"+formValues[0]+"','"+formValues[1]+"','"+formValues[2]+"','"+formValues[3]+"','M','"+p[0]+"','','Player')");
			if(r>0)
			{
				PrintWriter out = response.getWriter();
				out.println("<script type='text/javascript'>alert('Data Added Successfully.');window.location.replace('GBInsertPlayer.jsp');</script>");
				
			}
			else
			{
				PrintWriter out = response.getWriter();
				out.println("<script type='text/javascript'>alert('Data Cannot Added');window.location.replace('GBInsertPlayer.jsp');</script>");
				
			}
		}
		catch(Exception e)
		{
			e.getMessage();
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('Data Cannot Added : '"+e+");window.location.replace('GBInsertPlayer.jsp');</script>");
			
		}
			//System.out.println(formValues[0]+" "+formValues[1]+" "+formValues[2]+" "+imgValues[0]+" "+imgValues[1]+" "+imgValues[2]);
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally{DBManager.close();}
	}

}
