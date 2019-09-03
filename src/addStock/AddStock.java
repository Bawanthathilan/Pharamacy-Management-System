package addStock;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import addStock.DatabaseConnection;

//Servlet Name 
@WebServlet("/AddStock") 
public class AddStock extends HttpServlet { 
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request,HttpServletResponse response) 
		throws ServletException, IOException 
	{ 
		try { 

			// Initialize the database 
			Connection con = DatabaseConnection.initializeDatabase(); 
			// Create a SQL query to insert data into demo table 
			// demo table consists of two columns, so two '?' is used 
			PreparedStatement st = con 
				.prepareStatement("insert into stock(Snumber,Inumber,Qnumber,Mdate,Edate,Rdate,SPrise,iPrise) values(?,?,?,?,?,?,?,?)"); 

			// For the first parameter, 
			// get the data using request object 
			// sets the data to st pointer 
			st.setInt(1, Integer.valueOf(request.getParameter("Snumber"))); 
			st.setInt(2, Integer.valueOf(request.getParameter("Inumber"))); 
			st.setInt(3, Integer.valueOf(request.getParameter("Qnumber"))); 
			st.setDate(4, java.sql.Date.valueOf(request.getParameter("Mdate"))); 
			st.setDate(5,  java.sql.Date.valueOf(request.getParameter("Edate")));
			st.setDate(6,  java.sql.Date.valueOf(request.getParameter("Rdate")));
			st.setDouble(7, Double.valueOf(request.getParameter("SPrise")));
			st.setDouble(8, Double.valueOf(request.getParameter("iPrise")));
			// Same for second parameter 

			// Execute the insert command using executeUpdate() 
			// to make changes in database 
			st.executeUpdate(); 

			// Close all the connections 
			st.close(); 
			con.close(); 

			// Get a writer pointer 
			// to display the successful result 
			PrintWriter out = response.getWriter(); 

			out.println("<script language='JavaScript'>alert('Data Successfully Inserted!');</script>");
			
			RequestDispatcher rd = request.getRequestDispatcher("viewStocks.jsp");
			rd.include(request, response);
		
		} 
		catch (Exception e) { 
			e.printStackTrace(); 
		} 
	} 
} 