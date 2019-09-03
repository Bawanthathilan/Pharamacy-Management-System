<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>

<%
	String incomeID = request.getParameter("incomeID");
	String driverName = "com.mysql.jdbc.Driver";
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


<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Income</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:700, 600,500,400,300' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
		<link rel="stylesheet" href="./style/main.css">

	    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
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
						<a href="dashboard.jsp">
							<span></span>
							<span>Dashboard </span>
						</a>
					</li>
					<li >
						<a href="add.jsp">
							<span></span>
							<span>Customer </span>
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
							<li class="nav-item">
							  <a class="nav-link" href="addUtility.jsp">Utility </a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="viewUtility.jsp">View Utility</a>
							  </li>
							<li class="nav-item">
							  <a class="nav-link" href="manageUtility.jsp">Manage Utility</a>
							</li>
							<li class="nav-item">
							  <a class="nav-link" href="viewExpenses.jsp">Expenses</a>
							</li>
							<li class="nav-item active">
							  <a class="nav-link " href="viewIncome.jsp">Income <span class="sr-only">(current)</span></a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="generateReports.jsp">Generate Reports</a>
							</li>
							
							
						  </ul>
						  
						</div>
					  </nav>
					  <!--Nav bar end-->
					  
					  <nav class="navbar navbar-light bg-light">
							<form class="form-inline" action="SearchIncome.jsp">
							  <label for="inputState">From : &nbsp</label> 
							  <input class="form-control mr-sm-2" type="date" name="search1" aria-label="Search">
							  <label for="inputState">To : &nbsp</label> 
							  <input class="form-control mr-sm-2" type="date" name="search2" aria-label="Search">
							  <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
							</form>
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
 								 Calculate Income
							</button>

							<!-- Modal -->
								<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
 									 <div class="modal-dialog modal-dialog-centered" role="document">
    									<div class="modal-content">
      										<div class="modal-header">
        										<h5 class="modal-title" id="exampleModalCenterTitle">Calculate Monthly Income</h5>
        										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          										<span aria-hidden="true">&times;</span>
        										</button>
      										</div>
     									 <div class="modal-body">
      									  <form method="post" action="saveIncomeServlet">
  											<div class="form-row">
    											<div class="col-md-6 mb-3">
     												 <label for="validationServer01">From Date</label>
     												 <input type="date" class="form-control is-valid" id="validationServer01" name="date1" value="Mark" required>

    											</div>
   												<div class="col-md-6 mb-3">
      												<label for="validationServer02">To Date</label>
      												<input type="date" class="form-control is-valid" id="validationServer02" name="date2" value="Otto" required>

    											</div>
 											</div>
  											<div class="form-row">
    											<div class="col-md-12 mb-3">
     												 <label for="validationServer03">Description</label>
      												 <input type="text" class="form-control is-valid" id="validationServer03" name="des" placeholder="Description" required>

    											</div>
  											</div>
  										</div>
     									 <div class="modal-footer">
       										 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
       										 <button type="submit" class="btn btn-primary">Calculate</button>
      									</div>
    								</div>
  .
 
										</form>
      								</div>
  								</div>
  							</nav>
							
						
						  
					<div class="ex1">
					  <div class="addform" >
							 <table class="table table-dark">
									<thead>
									  <tr>
										<th scope="col">Income No</th>
										<th scope="col">Starting Date</th>
										<th scope="col">Ending Date</th>
										<th scope="col">Description</th>
										<th scope="col">Total</th>
									  </tr>
									  
									
									<%
											try{
												connection = DriverManager.getConnection(ConnectionUrl+dbName,UserId,password);
												statement=connection.createStatement();
												String sql ="SELECT* from monthlyincome";
												
												resultset = statement.executeQuery(sql);
												while(resultset.next()){
													
												
											
										
									%>
									<tr>
									<td><%=resultset.getInt("incomeID") %></td>
									<td><%=resultset.getDate("stdate") %></td>
									<td><%=resultset.getDate("endate") %></td>
									<td><%=resultset.getString("description") %></td>
									<td><%=resultset.getDouble("monthlytot") %></td>

									
									</tr>
									<%
												}
											connection.close();	
											} catch(Exception e){
												e.printStackTrace();
											}
											
									%>
									
									
								  </table>

					  </div>
					</div>
					 
			
		</div>
	</body>
</html>
	
	
