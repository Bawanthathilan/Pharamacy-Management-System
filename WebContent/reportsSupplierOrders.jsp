<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Time"%>

<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
		
<meta charset="ISO-8859-1">
	<title>GRN Report Preview</title>
	<link rel="stylesheet" href="./style/main.css">
	<link rel="stylesheet" href="./style/report.css">
	
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script> -->
		
		<%
		ResultSet resultSet = null;

		String Rname = request.getParameter("rName");
		%>

<%@page import="com.servelts.SupplierOrders.CommonConstraints"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Generate Supplier Orders</title>
	<link rel="stylesheet" href="../../css/sb-admin-2.min.css">
	<link rel="stylesheet" href="../../css/report.css">
	
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script> -->
	
</head>
<body>


<div class="A4" style="border:1px solid black; padding:20px; height:39.7cm; ">
<img src="loginPage/images/letter.jpg" width="750px" heigth="1122px">
        
                     
        <br/><br/>
        <center><h2 class="font-weight-bold">Supplier Orders</h2></center>
        <br/>
		<center><h2 class="font-weight-bold"><%=Rname %></h2></center>
        <br/>
		        
		<br/>
		<div class = "row mt-5">
		
					<%
			try
			{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacy","root","sliit@123");
			Statement st=con.createStatement();
			String strQuery = "SELECT COUNT(*) FROM supplierorders";
			ResultSet rs = st.executeQuery(strQuery);
			String Countrow="";
			while(rs.next()){
			Countrow = rs.getString(1);
			out.println("Supplier Orders  :" +Countrow);
			}
			}
			catch (Exception e){
			e.printStackTrace();
			}
			%>
					
        <table class="table table-striped" align="center">
		<thead class="thead-dark">
		
		<tr>
										<th scope="col" style="width: 10%">Order ID</th>
										<th scope="col"  style="width: 15%">Order Date</th>
										
                                        <th scope="col" style="width: 15%">Supplier Name</th>
                                        
										<th scope="col" style="width: 15%">Item Name</th>
										<th scope="col" style="width: 10%">No.of Units</th>
                                        <th scope="col" style="width: 15%">Arriving Date</th>
                                        
                                        <th scope="col" style="width: 10%">Total Price</th>
                                        <th scope="col" style="width: 15%">Status</th>
									  </tr>
									</thead>
									
									
										<%
										try{
										Class.forName("com.mysql.jdbc.Driver");
								        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacy?useSSL=false","root","sliit@123");
								        
								        Statement statement = connection.createStatement();
								        
										String sql ="SELECT * FROM supplierorders";
								
										resultSet = statement.executeQuery(sql);
										while(resultSet.next()){
										%>
									<tbody>
									  <tr>
										<th scope="row"  style="width: 100px"><%=resultSet.getString("sOrderID") %></th>
                                        <td ><%=resultSet.getDate("sOrderDate") %></td>
                                       
                                        <td ><%=resultSet.getString("supplierName") %></td>
                                        
                                        <td  ><%=resultSet.getString("itemName") %></td>
                                        <td  ><%=resultSet.getInt("NOSunits") %></td>
                                        <td  ><%=resultSet.getDate("arrivingDate") %></td>
                                        
                                        <td  ><%=resultSet.getFloat("totalPrice") %></td>
                                        <td  ><%=resultSet.getString("status") %></td>
									  </tr>
									  
									<% 
									}
							
									} catch (Exception e) {
									out.println(e);
									}
									%>		  
		</tbody>
	  </table>
   </div>

	<br/><br/>
	<br/>
	<hr>
	
		<div class="d-flex justify-content-between ml-4 mr-4 mt-5">
			<br/><br/>
	<br/>
			<span>..............................................</span>
			<span>..............................................</span>
		</div>

		<div class="d-flex justify-content-between ml-5 mr-5">
			<span style="margin-left:5%">Prepaired By</span>
			<span style="margin-left:20%">Authorized By</span>
		</div>

</div>


      <script>
        window.print();
      </script>


	
	
</body>
</html>