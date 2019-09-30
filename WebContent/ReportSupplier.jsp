<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Time"%>
<%@page import="saveCustomer.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>GRN Report Preview</title>
	
	<link rel="stylesheet" href="style/Report.css">
	
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script> -->
		
<style>
    tab1 { padding-left: 16em; }
    </style>
    
</head>
<body>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>

 		<%
	String sid = request.getParameter("sid");
	String driverName = "com.mysql.jdbc.Driver";
	String ConnectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "supplier1";
	String UserId="root";
	String password = "yasiya";
	
	try{
		Class.forName(driverName);
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
	
	Connection connection = null;
	Statement statement = null;
	ResultSet resultset = null;
	
	String Rid = request.getParameter("rID");
	String Rname = request.getParameter("rName");

%>

<div class="A4" style="border:1px solid black; padding:20px; height:39.7cm; ">

	<div class="content">
	<table width="100%">
<tr>
<td><img src="loginPage/images/letter.jpg" width="750px" heigth="1122px"></td>


</tr>
	</div>
	</table>
<hr>
<br>
<p><tab1><b><u><font size="+2" color="886C65">SUPPLIER REPORT</b></u></font></tab1></p>

<center><h1 class="font-weight-bold"><%=Rname%> </h1></center>
<left><p class="font-weight"><%=Rid%> </p></left>
<%
try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/supplier1","root","yasiya");
Statement st=con.createStatement();
String strQuery = "SELECT COUNT(*) FROM newsupplier";
ResultSet rs = st.executeQuery(strQuery);
String Countrow="";
while(rs.next()){
Countrow = rs.getString(1);
out.println("Suppliers  :" +Countrow);
}
}
catch (Exception e){
e.printStackTrace();
}
%>

  		<table class="table table-striped" cellspacing="18" align="center">
									<thead>
									  <tr>
										<th scope="col">ID</th>
										<th scope="col">Name</th>
										<th scope="col">CompanyName</th>
										<th scope="col">CompanyAddress</th>
										<th scope="col">MobileNo</th>
									  </tr>
									  
									
										<%
											try{
												connection = DriverManager.getConnection(ConnectionUrl+dbName,UserId,password);
												statement=connection.createStatement();
												String sql ="SELECT * from newsupplier";
												
												resultset = statement.executeQuery(sql);
												while(resultset.next()){
													
												
											
										
									%>
									<tr>
									<td><%=resultset.getString("supplierID") %></td>
									<td><%=resultset.getString("supplierName") %></td>
									<td><%=resultset.getString("companyName") %></td>
									<td><%=resultset.getString("companyAddress") %></td>
									<td><%=resultset.getInt("companyTelNo") %></td>
									
									</tr>
									<%
												}
											connection.close();	
											} catch(Exception e){
												e.printStackTrace();
											}
											
									%>
									
									
								  </table>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
								  
<footer>
<p align="center"><b>PAGE NO:: 01<b></p>
<p align="center"><i><b>----------------------------CREATED BY:: LuckyLand Pharmacy----------------------------</i><b></p>
</footer>

</div>

        
     


      <script>
        window.print();
      </script>



	
	
</body>
</html>