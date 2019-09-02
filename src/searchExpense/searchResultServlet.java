package searchExpense;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commonUtil.DatabaseConnection;

/**
 * Servlet implementation class searchResultServlet
 */
@WebServlet("/searchResultServlet")
public class searchResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchResultServlet() {
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
		// TODO Auto-generated method stub
		
		try {
			
		
			
		java.util.Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date1"));
		java.util.Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date2"));
		
		java.sql.Date sqlDate1 = new java.sql.Date(date1.getTime());
		java.sql.Date sqlDate2 = new java.sql.Date(date2.getTime());
				
		
		
		Connection conn = DatabaseConnection.initializeDatabase();
		
		
		Statement statement = conn.createStatement();
		String sql = "SELECT * FROM monthlyincome WHERE stdate='"+sqlDate1+"' and endate='"+sqlDate2+"'";
		
		ResultSet resultset = statement.executeQuery(sql);
 
		conn.close(); 
	} 
	catch(Exception e) { 
		e.printStackTrace(); 
	}
		PrintWriter out = response.getWriter(); 

		
		
		RequestDispatcher rd = request.getRequestDispatcher("viewIncome.jsp");
		rd.include(request, response);
		
		
	}

}
