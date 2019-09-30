package saveinvoice;

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
import saveinvoice.DatabaseConnection; 

// Servlet Name 
@WebServlet("/Saveinvoiceservlet") 
public class Saveinvoiceservlet extends HttpServlet { 
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request, 
HttpServletResponse response) 
		throws ServletException, IOException 
	{ 
		try { 
			Double unitprice = Double.valueOf(request.getParameter("unit"));
			Integer quantity = Integer.valueOf(request.getParameter("quantity"));
			Double amount = (Double) unitprice*quantity;
			// Initialize the database 
			Connection con = DatabaseConnection.initializeDatabase(); 
			// Create a SQL query to insert data into demo table 
			// demo table consists of two columns, so two '?' is used
			//Double unitprice = Double.valueOf(request.getParameter("unitprice"));
			//Integer quantity = Integer.valueOf(request.getParameter("quan"));
			//Double totalprice = (Double) unitprice * quantity;
			PreparedStatement st = con 
				.prepareStatement("insert into neworder(customername,mobilenumber,medname,quan,gram,date,unitprice,amount)values(?,?,?,?,?,?,?,?)"); 

			// For the first parameter, 
			// get the data using request object 
			// sets the data to st pointer
			st.setString(1, String.valueOf(request.getParameter("customername"))); 
			st.setInt(2, Integer.valueOf(request.getParameter("mobilenumber"))); 
			st.setString(3, String.valueOf(request.getParameter("medicinename"))); 
			st.setInt(4, quantity ); 
			st.setString(5, String.valueOf(request.getParameter("gram"))); 
			st.setDate(6, java.sql.Date.valueOf(request.getParameter("date"))); 
			st.setDouble(7,unitprice);
			st.setDouble(8,amount);

			// Execute the insert command using executeUpdate() 
			// to make changes in database 
			st.executeUpdate(); 

			// Close all the connections 
			st.close(); 
			con.close(); 

			// Get a writer pointer 
			// to display the successful result 
			PrintWriter out = response.getWriter(); 

			out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal ( 'Added Successfully' ,  '' ,  'success' );");
			out.println("});");
			out.println("</script>"); 
			
			RequestDispatcher rd = request.getRequestDispatcher("viewinginvoice.jsp");
			rd.include(request, response);
		
		} 
		catch (Exception e) { 
			e.printStackTrace(); 
		} 
	} 
} 
