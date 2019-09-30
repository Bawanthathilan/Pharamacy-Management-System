<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Time"%>
<%@page import="saveinvoice.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>GRN Report Preview</title>
	
	<link rel="stylesheet" href="style/Report.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script> -->
	
</head>
<body>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>

 		<%
	String driverName = "com.mysql.jdbc.Driver";
	String ConnectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "invoice1";
	String UserId="root";
	String password = "maleesha1234";
	
	try{
		Class.forName(driverName);
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
	
	Connection connection = null;
	Statement statement = null;
	ResultSet resultset = null;
	String rname = request.getParameter("invoicename");
%>
<div class="A4" style="border:1px solid black; padding:20px; height:39.7cm; ">
<img src="loginPage/images/letter.jpg" width="750px" heigth="1122px">
<br><br>

<center><h3 class="font-weight-bold"><%=rname %></h3></center>
<hr>
<%
try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invoice1","root","maleesha1234");
Statement st=con.createStatement();
String strQuery = "SELECT COUNT(*) FROM neworder";
ResultSet rs = st.executeQuery(strQuery);
String Countrow="";
while(rs.next()){
Countrow = rs.getString(1);
out.println("invoices  :" +Countrow);
}
}
catch (Exception e){
e.printStackTrace();
}
%>

         <table class="table table-striped" align="center">
									<thead>
									  <tr>
										<th scope="col">Invoice Number</th>
										<th scope="col">Name</th>
										<th scope="col">Mobile Number</th>
										<th scope="col">Medicine</th>
										<th scope="col">Amount</th>
									  </tr>
									  
									
										<%
											try{
												connection = DriverManager.getConnection(ConnectionUrl+dbName,UserId,password);
												statement=connection.createStatement();
												String sql ="SELECT * from neworder";
												
												resultset = statement.executeQuery(sql);
												while(resultset.next()){
													
												
											
										
									%>
									<tr>
									<td><%=resultset.getInt("invoicenum") %></td>
									<td><%=resultset.getString("customername") %></td>
									<td><%=resultset.getInt("mobilenumber") %></td>
									<td><%=resultset.getString("medname") %></td>
									<td><%=resultset.getDouble("amount") %></td>
									
									</tr>
									<%
												}
											connection.close();	
											} catch(Exception e){
												e.printStackTrace();
											}
											
									%>
									
									
								  </table>
								  <hr>
<%
try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invoice1","root","maleesha1234");
Statement st=con.createStatement();
String strQuery = "SELECT SUM(amount) FROM neworder";
ResultSet rs = st.executeQuery(strQuery);
String Countrow="";
while(rs.next()){
Countrow = rs.getString(1);
out.println("Total Amount:" +Countrow);
}
}
catch (Exception e){
e.printStackTrace();
}
%>
								  
								   

	
        
     
</div>

      <script>
        window.print();
      </script>


	
	
</body>
</html>