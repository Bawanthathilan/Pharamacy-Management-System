

<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>

<%
	String driverName ="com.mysql.cj.jdbc.Driver";
	String ConnectionUrl =  "jdbc:mysql://localhost:3306/";
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

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Responsive vertical menu navigation</title>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:700, 600,500,400,300' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
		<link rel="stylesheet" href="./style/main.css">
		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:700, 600,500,400,300' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
		<link rel="stylesheet" href="./style/main.css">
		<script src="https://kit.fontawesome.com/b7e89b71b3.js"></script>
		<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/data.js"></script>
		<script src="main.js"></script>
		<!--<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
		<script src="https://kit.fontawesome.com/b7e89b71b3.js"></script>-->
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/data.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
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
					</li >
					<li class="active">
						<a href="addStocks.jsp">

							
							<span>Stock </span>
						</a>
					</li>
					<li >
						<a href="#">
							
							<span>Item </span>
						</a>
					</li>
					<li>
						<a href="add.jsp">
							
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
					<li>
						<a href="addUtility.jsp">
							
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
								<a class="nav-link" href="addStocks.jsp">Add Stocks </a>
							  </li>
							  <li class="nav-item">
								<a class="nav-link" href="viewStocks.jsp">View Stocks</a>
							  </li>
							  <li class="nav-item active">
								<a class="nav-link" href="ManageStocks.jsp">Manage Stocks<span class="sr-only">(current)</span></a>
							  </li>
							  <li class="nav-item">
								<a class="nav-link" href="Stockreports.jsp">Genarate Reports</a>
							  </li>
							  
							  
							</ul>
							
						  </div>
						</nav>
						<!--Nav bar end-->
  
						<!--add form-->

					  <br>
					  
					  <div class="">
			  
							
							<table id="mytable" class="table table-bordred table-striped">
								 
								 <thead>
								 
								 
								 <th>Stock code</th>
								  <th>Item code</th>
								   <th>Quantity</th>
								   <th>Manufacture Date</th>
								   <th>Expiary Date</th>
								   <th>Recive Date</th>
								   <th>Stock Price</th>
								   <th>Item Price</th>
									<th>Edit</th>
									
									 <th>Delete</th>
								 </thead>
				  <tbody>
				  
				  <tr>
				  
				<%
											try{
												connection = DriverManager.getConnection(ConnectionUrl+dbName,UserId,password);
												statement=connection.createStatement();
												String sql ="SELECT * from stock";
												
												resultset = statement.executeQuery(sql);
												while(resultset.next()){
												%>
													
												
											
										
									
									<tr>
									<td><%=resultset.getInt("Snumber") %>  </td>
									<td><%=resultset.getInt("Inumber") %></td>
									<td><%=resultset.getInt("Qnumber") %></td>
									<td><%=resultset.getDate("Mdate") %></td>
									<td><%=resultset.getDate("Edate") %></td>
									<td><%=resultset.getDate("Rdate") %></td>
									<td><%=resultset.getDouble("SPrise") %></td>
									<td><%=resultset.getDouble("iPrise") %></td>
									 <td> <a href="updateStock.jsp?Snumber=<%=resultset.getString("Snumber")%>"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" >
									 <span class="fas fa-pencil-alt"></span>
									 </button>
									 </a>
									 </td>
									 <td>
									  <a href= "dltStock.jsp?Snumber=<%=resultset.getString("Snumber")%>"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" >
												   <span class="fas fa-trash-alt"></span>
												   </button>
												   </a>
												   </td>
									
									</tr>
									<%
												}
											connection.close();	
											} catch(Exception e){
												e.printStackTrace();
											}
											
									%>
				  				 
				  				 
				  </tr>
				
				  
				  
			   
				  
				 
				  
				 
				  
				  </tbody>
					  
			  </table>
			
			
		</div>
	</body>
</html>