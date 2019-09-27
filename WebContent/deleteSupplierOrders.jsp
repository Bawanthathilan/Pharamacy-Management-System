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
		response.sendRedirect("manageSupplierOrders.jsp");
		
		connection.close();
%>