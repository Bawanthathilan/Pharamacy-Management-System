<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="java.util.Date"%>

<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.text.SimpleDateFormat" %>

<%
	
	String driverName = "com.mysql.cj.jdbc.Driver";
	String ConnectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "customer";
	String UserId="root";
	String password = "bawwa";
	
	try{
		Class.forName(driverName);
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
	
	Connection connection = null;
	Statement statement = null;
	ResultSet resultset = null;

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Search Income</title>
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
				
				<span>LuckyLand Pharmacy</span>
			</div>
			<nav>
				<ul>
					<li>
						<a href="#">
						
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
					<li>
						<a href="#">
							
							<span>Supplier Order </span>
						</a>
					</li>
					<li>
						<a href="#">
							
							<span>Customer Order</span>
						</a>
					</li>
					<li>
						<a href="#">
							
							<span>Employee </span>
						</a>
					</li>
					<li class="active">
							<a href="#">
								<span></span>
							<span>Finance </span>
						</a>
					</li>
				</ul>
			</nav>
		</div>
		<div class="main-content">
			<!--Nav bar-->
				<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
						
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
						  <span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarNav">
						  <ul class="navbar-nav">
							<li class="nav-item active">
							  <a class="nav-link" href="addUtility.jsp">Utility </a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="viewUtility.jsp">View Utility</a>
							  </li>
							<li class="nav-item">
							  <a class="nav-link" href="manageUtility.jsp">Manage Utility<span class="sr-only">(current)</span></a>
							</li>
							<li class="nav-item">
							  <a class="nav-link" href="viewExpenses.jsp">Expenses</a>
							</li>
							<li class="nav-item">
							  <a class="nav-link " href="viewIncome.jsp">Income</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="generateReports.jsp">Generate Reports</a>
							</li>
							
							
						  </ul>
						  
						</div>
					  </nav>
					 <br>
					 
					 <nav class="navbar navbar-light bg-light">
							<form class="form-inline" action="searchResultServlet">
							  <label for="inputState">From : &nbsp</label> 
							  <input class="form-control mr-sm-2" type="date" name="search1" aria-label="Search">
							  <label for="inputState">To : &nbsp</label> 
							  <input class="form-control mr-sm-2" type="date" name="search2" aria-label="Search">
							  <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
							</form>
					</nav>
					  
					 <div class="">
					 <h1>Search Results</h1>
							<table id="mytable" class="table table-bordred table-striped">
								 
								<thead>
								
								 	<th>Income No</th>
								  	<th>Starting Date</th>
								  	<th>Ending Date</th>
								   	<th>Description</th>
								   	<th>Total</th>
									<th>Details</th>
									<th>Delete</th>
								 </thead>
					<%-- <%
						try{
							
							connection = DriverManager.getConnection(ConnectionUrl+dbName, UserId, password);
							statement=connection.createStatement();
							String sql ="select * from monthlyincome where stdate='"+sqlDate1+"' and endate='"+sqlDate2+"' ";
							resultset = statement.executeQuery(sql);
							int i=0;
							while(resultset.next()){
					%> --%>
					
				  <tbody>
				  
				  <tr>
				  
				    <td><%=resultset.getInt("incomeID") %></td>
					<td><%=resultset.getDate("stdate") %></td>
					<td><%=resultset.getDate("endate") %></td>
					<td><%=resultset.getString("description") %></td>
					<td><%=resultset.getDouble("monthlytot") %></td>
									
				  <td><a href="updateUtility.jsp"><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="fas fa-pencil-alt"></span></button></p></a></td>
				  
				  <td><a href="deleteIncome.jsp?id=<%=resultset.getInt("incomeID") %>"><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="fas fa-trash-alt"></span></button></p></a></td>
				  
				  </tr>
				  
				  
				  <%-- <%
						i++;
						}
						connection.close();
						} catch (Exception e) {
						e.printStackTrace();
						}
				  %> --%>
			   				 				 		
				  
				  </tbody>
					  
			  </table>
			
			
		</div>
	</body>
</html>