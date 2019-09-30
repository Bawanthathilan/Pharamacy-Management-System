<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	String id = request.getParameter("id");
	int no = Integer.parseInt(id);
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/invoice1","root","maleesha1234");
	Statement stat = conn.createStatement();
	stat.executeUpdate("delete from neworder where invoicenum ='" +id+"'");
	
	out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
	out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
	out.println("<script>");
	out.println("$(document).ready(function(){");
	out.println("swal ( 'Deleted Successfully' ,  '' ,  'success' );");
	out.println("});");
	out.println("</script>"); 
	
	RequestDispatcher rd = request.getRequestDispatcher("ManageInvoice.jsp");
	rd.include(request, response);
	
	
	%>