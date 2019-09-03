package EPayment;

import java.io.IOException; 
import java.io.PrintWriter; 
import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 

// Import Database Connection Class file 
import saveEmployee.DatabaseConnection; 


@WebServlet("/addPayServlet") 
public class addPayServlet extends HttpServlet { 
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request, 
HttpServletResponse response) 
		throws ServletException, IOException 
	{ 
		try { 
			java.util.Date  date =new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("EpayDay"));
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			Connection con = DatabaseConnection.initializeDatabase(); 

		
			PreparedStatement st = con.prepareStatement("insert into payments(Eid,Ename,EpayDay,EmonthlySalary) values(?,?,?,?)");
			
			st.setInt(1, Integer.valueOf(request.getParameter("Eid"))); 
			st.setString(2, String.valueOf(request.getParameter("Ename")));	
			st.setDate(3,sqlDate);
			st.setDouble(4, Double.valueOf(request.getParameter("EmonthlySalary"))); 
			st.executeUpdate(); 

			st.close(); 
			con.close(); 

		
			PrintWriter out = response.getWriter(); 

			out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal ( 'Payment Record  Successfully Inserted' ,  '' ,  'success' );");
			out.println("});");
			out.println("</script>"); 
			
			RequestDispatcher rd = request.getRequestDispatcher("addPayDetails.jsp");
			rd.include(request, response);
		
		} 
		catch (Exception e) { 
			e.printStackTrace(); 
		} 
	} 
} 