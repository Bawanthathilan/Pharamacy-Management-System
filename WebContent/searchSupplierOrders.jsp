<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "pharmacy";
String userid = "root";
String password = "sliit@123";
String search=request.getParameter("search");
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>View Search Results</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:700, 600,500,400,300' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
		<link rel="stylesheet" href="./style/main.css">

		<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/data.js"></script>
		<script src="main.js"></script>

		<style>
			.ad {
				position: absolute;
				width: 300px;
				height: 250px;
				border: 1px solid #ddd;
				left: 50%;
				transform: translateX(-50%);
				top: 250px;
				z-index: 10;
			}
			.ad .close {
				position: absolute;
				font-family: 'ionicons';
				width: 20px;
				height: 20px;
				color: #fff;
				background-color: #999;
				font-size: 20px;
				left: -20px;
				top: -1px;
				display: table-cell;
				vertical-align: middle;
				cursor: pointer;
				text-align: center;
			}
		</style>
		

	</head>
	<body>
		<div class="header">
			<div class="logo">
				
				<span>Brand</span>
			</div>
			<a href="#" class="nav-trigger"><span></span></a>
		</div>
		<div class="side-nav">
			<div class="logo">
				
				<span>LuckyLand Pharamacy</span>
			</div>
			<nav>
				<ul>
				<li>
						<a href="dashboard.jsp">
							<span></span>
							<span>Dashboard </span>
						</a>
					</li>
					<li>
						<a href="#">
							<span></span>
							<span>Customer </span>
						</a>
					</li>
					<li>
						<a href="#">

							
							<span>Stock </span>
						</a>
					</li>
					<li >
						<a href="#">
							
							<span>Item </span>
						</a>
					</li>
					<li>
						<a href="#">
							
							<span>Supplier </span>
						</a>
					</li>
					<li class="active">
						<a href="supplierOrders.jsp">
							
							<span>Supplier Order </span>
						</a>
					</li>
					<li  >
						<a href="#">
							
							<span>Customer Order</span>
						</a>
					</li>
					<li>
						<a href="#">
							
							<span>Employee </span>
						</a>
					</li>
					<li>
						<a href="#">
							
							<span>Finance </span>
						</a>
					</li>
				</ul>
			</nav>
		</div>
		<div class="main-content">
				<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
						
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
						  <span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarNav">
						  <ul class="navbar-nav">
							<li class="nav-item ">
								<a class="nav-link" href="addSupplierOrders.jsp">New Order </a>
							  </li>
							  <li class="nav-item active">
								<a class="nav-link" href="viewSupplierOrders.jsp">Order History <span class="sr-only">(current)</span></a>
							  </li>
							  <li class="nav-item">
								<a class="nav-link" href="manageSupplierOrders.jsp">Manage Orders</a>
							  </li>
							  <li class="nav-item">
								  <a class="nav-link disabled" href="thisMonthSupplies.jsp">This Month</a>
								</li>
							  <li class="nav-item">
								<a class="nav-link disabled" href="supplierOrdersReports.jsp">Reports</a>
							  </li>
							

							
							
						  </ul>
						  
						</div>
					  </nav>
					  <nav class="navbar navbar-light bg-light">
							<form class="form-inline" action="searchSupplierOrders.jsp">
							  <input class="form-control mr-sm-2" type="search" name="search" placeholder="Search Supplier OrderID" aria-label="Search">
							  <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
							</form>
						  </nav>
					  <div class="addform" >
					  <h1>Search Results <span class="badge badge-secondary">New</span></h1>
							 <table class="table table-dark" style="width:1250px">
									<thead>
									  <tr>
										<th scope="col" style="width: 100px">Order ID</th>
										<th scope="col"  style="width: 130px">Order Date</th>
										<th scope="col" style="width: 130px">Supplier ID</th>
                                        <th scope="col" style="width: 200px">Supplier Name</th>
                                        <th scope="col" style="width: 100px">Item ID</th>
										<th scope="col" style="width: 200px">Item Name</th>
										<th scope="col" style="width: 150px">No.of Units</th>
                                        <th scope="col" style="width: 130px">Arriving Date</th>
                                        <th scope="col" style="width: 100px">Unit Price</th>
                                        <th scope="col" style="width: 150px">Total Price</th>
									  </tr>
							
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from supplierorders where sOrderID='"+search+"' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
									
										<td style="background:red"><%=resultSet.getString("sOrderID") %></td>
                                        <td><%=resultSet.getDate("sOrderDate") %></td>
                                        <td><%=resultSet.getString("supplierID") %></td>
                                        <td bgcolour="#FF0000"><%=resultSet.getString("supplierName") %></td>
                                        <td><%=resultSet.getString("itemID") %></td>
                                        <td><%=resultSet.getString("itemName") %></td>
                                        <td><%=resultSet.getInt("NOSunits") %></td>
                                        <td><%=resultSet.getDate("arrivingDate") %></td>
                                        <td><%=resultSet.getFloat("unitPrice") %><td>
                                        <td><%=resultSet.getFloat("totalPrice") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>