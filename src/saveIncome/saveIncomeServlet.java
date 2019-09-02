package saveIncome;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commonUtil.DatabaseConnection;

import java.sql.Statement;

/**
 * Servlet implementation class saveIncomeServlet
 * @param <E>
 */
@WebServlet("/saveIncomeServlet")
public class saveIncomeServlet<E> extends HttpServlet{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public saveIncomeServlet() {
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
			
		double tot=0;
			
		java.util.Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date1"));
		java.util.Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date2"));
		
		java.sql.Date sqlDate1 = new java.sql.Date(date1.getTime());
		java.sql.Date sqlDate2 = new java.sql.Date(date2.getTime());
				
		
		
		Connection conn = DatabaseConnection.initializeDatabase();
		
		
		Statement statement = conn.createStatement();
		String sql = "SELECT SUM(total) FROM neworder WHERE date between '"+sqlDate1+"' and '"+sqlDate2+"'";
		
		ResultSet resultset = statement.executeQuery(sql);
		if(resultset.next()) {
			tot = resultset.getDouble(1);
		}
		
		
		

		
		PreparedStatement st = conn.prepareStatement("insert into monthlyincome(stdate,endate,description,monthlytot) values(?,?,?,?)"); 


		st.setDate(1,sqlDate1); 
		st.setDate(2,sqlDate2);
		st.setString(3,String.valueOf(request.getParameter("des")));
		st.setDouble(4,tot);
		

		st.executeUpdate(); 


		st.close(); 
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
