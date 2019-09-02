<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

	<%
			String id = request.getParameter("id");
			Class.forName ("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"luckylandsystem","root","uzpb877f");
			Statement stat = conn.createStatement();
			stat.executeUpdate("delete from monthlyincome where incomeID ='" +id+"'");
			response.sendRedirect("viewIncome.jsp");
	%>
