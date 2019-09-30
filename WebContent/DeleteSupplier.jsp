<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	String supplierID = request.getParameter("supplierID");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/supplier1","root","yasiya");
	Statement stat = conn.createStatement();
	stat.executeUpdate("delete from newsupplier where supplierID ='" +supplierID+"'");
	
	out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
	out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
	out.println("<script>");
	out.println("$(document).ready(function(){");
	out.println("swal ( 'Deleted!' ,  'Record has been deleted succssfully!!!' ,  'warning' );");
	out.println("});");
	out.println("</script>"); 
RequestDispatcher rd = request.getRequestDispatcher("supProfile.jsp");
rd.include(request, response);

	conn.close();
	
	%>