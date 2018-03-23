package playsoftech.greenbox;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.Date;
import java.text.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

import DBManager.DBManager;
/**
 * Servlet implementation class wclots
 */
@WebServlet("/wclots")
public class NewLots extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewLots() {
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
		
		} catch (Exception e) {

		} finally {
			DBManager.close();
		}
	}

}
