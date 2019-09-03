package saveItem;

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

@WebServlet("/SaveItemServlet")
public class SaveItemServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			PreparedStatement ps = con.prepareStatement("insert into item(name,category,subcategory,genericname,unit,price,manufacturer) values(?,?,?,?,?,?,?)");
			
			ps.setString(1, String.valueOf(request.getParameter("itemname")));
			ps.setString(2, String.valueOf(request.getParameter("select11")));
			ps.setString(3, String.valueOf(request.getParameter("select22")));
			ps.setString(4, String.valueOf(request.getParameter("genname")));
			ps.setString(5, String.valueOf(request.getParameter("unit")));
			ps.setDouble(6, Double.valueOf(request.getParameter("price")));
			ps.setString(7, String.valueOf(request.getParameter("manufac")));
			
			int i=ps.executeUpdate();
			ps.close();
			con.close();
			PrintWriter out = response.getWriter();
			if(i > 0)
			{
				
				out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
				out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
				out.println("<script>");
				out.println("$(document).ready(function(){");
				out.println("swal ( 'Added Successfully' ,  '' ,  'success' );");
				out.println("});");
				out.println("</script>"); 
			RequestDispatcher rd = request.getRequestDispatcher("addItem.jsp");
			rd.include(request, response);
			}
			else
			{
			out.print("There is a problem in updating Record.");

			}
			

			
			
			//RequestDispatcher rd = request.getRequestDispatcher("addItem.jsp");
			//rd.include(request,response);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
