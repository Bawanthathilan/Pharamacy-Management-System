<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
		String id = request.getParameter("sOrderID");
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacy?useSSL=false","root","sliit@123");
		Statement st = connection.createStatement();
		st.executeUpdate("delete from supplierorders where sOrderID = '"+id+"'");
		

		out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
		out.println("<script>");
		out.println("$(document).ready(function(){");
		out.println("swal ( 'Deleted!' ,  'Record has been deleted succssfully!' ,  'warning' );");
		out.println("});");

		out.println("</script>"); 
	RequestDispatcher rd = request.getRequestDispatcher("manageSupplierOrders.jsp");
	rd.include(request, response);
		
		connection.close();
%>