<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	String id = request.getParameter("Snumber");
	Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"customer","root","bawwa");
	Statement stat = conn.createStatement();
	stat.executeUpdate("delete from stock where Snumber ='" +id+"'");
	response.sendRedirect("ManageStocks.jsp");
	%>