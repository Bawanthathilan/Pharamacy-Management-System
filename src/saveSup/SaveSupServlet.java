package saveSup;

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
import saveSup.DbConnection; 

// Servlet Name 
@WebServlet("/SaveSupServlet") 
public class SaveSupServlet extends HttpServlet { 
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request, 
HttpServletResponse response) 
		throws ServletException, IOException 
	{ 
		try { 

			
			Connection con = DbConnection.initializeDatabase(); 

			
			PreparedStatement st = con 
				.prepareStatement("insert into newsupplier values(?,?,?,?,?,?)"); 

			 
			st.setString(1, String.valueOf(request.getParameter("sid"))); 
			st.setString(2, String.valueOf(request.getParameter("sname"))); 
			st.setString(3, String.valueOf(request.getParameter("cname"))); 
			st.setString(4, String.valueOf(request.getParameter("caddress"))); 
			st.setInt(5, Integer.valueOf(request.getParameter("ctelno"))); 
			st.setString(6, String.valueOf(request.getParameter("cemail"))); 
			
			
			st.executeUpdate(); 

			
			st.close(); 
			con.close(); 

			 
			PrintWriter out = response.getWriter(); 

			out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal ( 'Supplier Added Successfully' ,  '' ,  'success' );");
			out.println("});");
			out.println("</script>"); 
			
			RequestDispatcher rd = request.getRequestDispatcher("addSup.jsp");
			rd.include(request, response);
		
		} 
		catch (Exception e) { 
			e.printStackTrace(); 
		} 
	} 
} 
