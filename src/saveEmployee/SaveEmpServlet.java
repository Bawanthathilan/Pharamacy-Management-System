package saveEmployee;

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


@WebServlet("/SaveEmpServlet") 
public class SaveEmpServlet extends HttpServlet { 
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request, 
HttpServletResponse response) 
		throws ServletException, IOException 
	{ 
		try { 
			java.util.Date  date =new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("EBdate"));
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			Connection con = DatabaseConnection.initializeDatabase(); 

		
			PreparedStatement st = con.prepareStatement("insert into register(Eid,Ename,Eaddress,EBdate,Enic,Egender,Etp) values(?,?,?,?,?,?,?)");
			
			st.setInt(1, Integer.valueOf(request.getParameter("Eid"))); 
			st.setString(2, String.valueOf(request.getParameter("Ename"))); 
			st.setString(3, String.valueOf(request.getParameter("Eaddress"))); 
			st.setDate(4,sqlDate);
		//st.setDate(4, java.sql.Date.valueOf(request.getParameter("dob"))); 
			st.setString(5, String.valueOf(request.getParameter("Enic"))); 	
			st.setString(6, String.valueOf(request.getParameter("Egender")));
			st.setInt(7, Integer.valueOf(request.getParameter("Etp"))); 

		
			st.executeUpdate(); 

			st.close(); 
			con.close(); 

		
			PrintWriter out = response.getWriter(); 

			out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal ( 'Employee Successfully Registered' ,  '' ,  'success' );");
			out.println("});");
			out.println("</script>"); 
			
			RequestDispatcher rd = request.getRequestDispatcher("Registration.jsp");
			rd.include(request, response);
		
		} 
		catch (Exception e) { 
			e.printStackTrace(); 
		} 
	} 
} 
