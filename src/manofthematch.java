

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import DBManager.DBManager;
import java.sql.*;

/**
 * Servlet implementation class manofthematch
 */
@WebServlet("/manofthematch")
public class manofthematch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public manofthematch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			DBManager DB = new DBManager();
			DBManager.loadDriver();
			ResultSet rs=null;
			int ttId = Integer.parseInt(request.getParameter("ttId"));
			int barcodeId=Integer.parseInt(request.getParameter("barcodeId"));
			int mid = Integer.parseInt(request.getParameter("mid"));
			int tourId = 1;
			int mmid = DBManager.getMaxId("manofthematch", "mmid");
			System.out.println("insert into manofthematch values("+mmid+","+ttId+","+barcodeId+","+mid+","+tourId);
			DB.insert("insert into manofthematch values("+mmid+","+ttId+","+barcodeId+","+mid+","+tourId+")");
		}
		catch(Exception e){
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
