package saveCustomer;

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

// Import Database Connection Class file 
import saveCustomer.DatabaseConnection; 

// Servlet Name 
@WebServlet("/SaveServlet") 
public class SaveServlet extends HttpServlet { 
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request, 
HttpServletResponse response) 
		throws ServletException, IOException 
	{ 
		try { 

			// Initialize the database 
			Connection con = DatabaseConnection.initializeDatabase(); 

			// Create a SQL query to insert data into demo table 
			// demo table consists of two columns, so two '?' is used 
			PreparedStatement st = con 
				.prepareStatement("insert into customerdetails values(?, ?,?,?,?)"); 

			// For the first parameter, 
			// get the data using request object 
			// sets the data to st pointer 
			st.setInt(1, Integer.valueOf(request.getParameter("id"))); 
			st.setString(2, String.valueOf(request.getParameter("cname"))); 
			st.setString(3, String.valueOf(request.getParameter("ctype"))); 
			st.setInt(4, Integer.valueOf(request.getParameter("tp"))); 

			// Same for second parameter 
			st.setString(5, request.getParameter("email")); 

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
			
			RequestDispatcher rd = request.getRequestDispatcher("add.jsp");
			rd.include(request, response);
		
		} 
		catch (Exception e) { 
			e.printStackTrace(); 
		} 
	} 
} 
