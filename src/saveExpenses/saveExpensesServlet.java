package saveExpenses;

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
 * Servlet implementation class saveExpensesServlet
 */
@WebServlet("/saveExpensesServlet")
public class saveExpensesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public saveExpensesServlet() {
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
			
			double tot=0,tot1=0,tot2=0;
				
			java.util.Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date1"));
			java.util.Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date2"));
			
			java.sql.Date sqlDate1 = new java.sql.Date(date1.getTime());
			java.sql.Date sqlDate2 = new java.sql.Date(date2.getTime());
					
			
			
			
			Connection conn = DatabaseConnection.initializeDatabase();
			
			
			Statement statement = conn.createStatement();
			String sql = "SELECT SUM(amount) FROM stockdetails WHERE date between '"+sqlDate1+"' and '"+sqlDate2+"'";
			
			String sql1 = "SELECT SUM(amount) FROM salarydetails WHERE date between '"+sqlDate1+"' and '"+sqlDate2+"'";
			
			String sql2 = "SELECT SUM(amount) FROM utilitydetails WHERE date between '"+sqlDate1+"' and '"+sqlDate2+"'";
			
			ResultSet resultset = statement.executeQuery(sql);
			if(resultset.next()) {
				tot = resultset.getDouble(1);
			}
			
			ResultSet resultset1 = statement.executeQuery(sql1);
			if(resultset1.next()) {
				tot1 = resultset1.getDouble(1);
			}
			
			ResultSet resultset2 = statement.executeQuery(sql2);
			if(resultset2.next()) {
				tot2 = resultset2.getDouble(1);
			}
			
			
			PreparedStatement st = conn.prepareStatement("insert into monthlyexpenses(stdate,endate,description,type,monthlytot) values(?,?,?,?,?)"); 


			st.setDate(1,sqlDate1); 
			st.setDate(2,sqlDate2);
			st.setString(3,String.valueOf(request.getParameter("des")));
			st.setString(4,"Stocks Payment");
			st.setDouble(5,tot);
			
			
			st.executeUpdate(); 


			st.close();
			
			
			PreparedStatement st1 = conn.prepareStatement("insert into monthlyexpenses(stdate,endate,description,type,monthlytot) values(?,?,?,?,?)"); 


			st1.setDate(1,sqlDate1); 
			st1.setDate(2,sqlDate2);
			st1.setString(3,String.valueOf(request.getParameter("des")));
			st1.setString(4,"Salary Payment");
			st1.setDouble(5,tot1);
			

			st1.executeUpdate(); 


			
			st1.close();
			PreparedStatement st2 = conn.prepareStatement("insert into monthlyexpenses(stdate,endate,description,type,monthlytot) values(?,?,?,?,?)"); 


			st2.setDate(1,sqlDate1); 
			st2.setDate(2,sqlDate2);
			st2.setString(3,String.valueOf(request.getParameter("des")));
			st2.setString(4,"Utility Payment");
			st2.setDouble(5,tot2);
			

			st2.executeUpdate(); 

			
			st2.close();
			conn.close(); 
		} 
		catch(Exception e) { 
			e.printStackTrace(); 
		}
			PrintWriter out = response.getWriter(); 

			
			
			RequestDispatcher rd = request.getRequestDispatcher("viewExpenses.jsp");
			rd.include(request, response);
			
			}

		
	}


