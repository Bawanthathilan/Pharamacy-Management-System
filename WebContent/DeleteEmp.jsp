<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	String Eid = request.getParameter("Eid");
	int no = Integer.parseInt(Eid);
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer","root","bawwa");
	Statement stat = conn.createStatement();
	stat.executeUpdate("delete from register where Eid ='" +Eid+"'");
	response.sendRedirect("Details.jsp");
	%>