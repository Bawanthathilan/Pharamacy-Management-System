package saveUtility;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commonUtil.DatabaseConnection;

/**
 * Servlet implementation class saveUtilityServelet
 */
@WebServlet("/saveUtilityServelet")
public class saveUtilityServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public saveUtilityServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try { 

			
			java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			
			
			
			
			Connection con = DatabaseConnection.initializeDatabase(); 


			PreparedStatement st = con 
				.prepareStatement("insert into utilitydetails(utype,description,date,method,amount) values(?,?,?,?,?)"); 


			st.setString(1, String.valueOf(request.getParameter("utype"))); 
			st.setString(2, String.valueOf(request.getParameter("description")));
			st.setDate(3,sqlDate); 
			st.setString(4,String.valueOf(request.getParameter("method")));
			st.setDouble(5,Double.valueOf(request.getParameter("amount")));
			

			st.executeUpdate(); 


			st.close(); 
			con.close(); 
		} 
		catch (Exception e) { 
			e.printStackTrace(); 
		}
			PrintWriter out = response.getWriter(); 

			
			
			RequestDispatcher rd = request.getRequestDispatcher("addUtility.jsp");
			rd.include(request, response);
		
		 
	}

}
