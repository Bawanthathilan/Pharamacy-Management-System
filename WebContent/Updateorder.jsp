<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "invoice1";
String userid = "root";
String password = "maleesha1234";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from neworder where invoicenum='"+id+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>UpdateOrders</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:700, 600,500,400,300' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
		<link rel="stylesheet" href="./style/main.css">

		<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/data.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
		<script src="main.js"></script>

		<style>
		
			.button34{
				margin-left:300px;
				padding-top:10px;
				}
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
					<li class="active">
						<a href="#">
							<span></span>
							<span>Customer Order </span>
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
			<!--Nav bar-->
					<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
						
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
						  <span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarNav">
						  <ul class="navbar-nav">
							<li class="nav-item active">
							  <a class="nav-link" href="AddInvoice.jsp">New Order <span class="sr-only">(current)</span></a>
							</li>
							<li class="nav-item">
							  <a class="nav-link" href="ViewInvoice.jsp">View Orders</a>
							</li>
							<li class="nav-item">
							  <a class="nav-link" href="ManageInvoice.jsp">Manage Orders</a>
							</li>
							<li class="nav-item">
							  <a class="nav-link disabled" href="InvoiceReports.jsp">View Reports</a>
							</li>
							
							
						  </ul>
						  
						</div>
					  </nav>
					  <!--Nav bar end-->

					  <!--add form-->
					  
					    		<div class="form-group">
					    		<form class="form-horizontal"  method="post" action="Updateprocess.jsp">
								  
								  <input name="id" value="<%=id %>" type="hidden">
								  
								  
								  <label class="control-label col-sm-2" for="innum">Date:</label>
								  <div class="form-group col-md-6">
									<input type="date" name="udate"class="form-control" id="idate" value ="<%=resultSet.getDate("date") %>"required>
								  </div>
								  
								<div class="form-group">
								  <label class="control-label col-sm-2" for="Cname">Customer Name:</label>
								  <div class="form-group col-md-6">
									<input type="text" name="ucustomername" class="form-control" id="Cname"value ="<%=resultSet.getString("customername") %>"required>
								  </div>
								</div>
								<div class="form-group">
								  <label class="control-label col-sm-2" for="Mnum">Mobile Number:</label>
								  <div class="form-group col-md-6">
									<input type="text" name="umobilenumber"class="form-control" id="Mnum" value ="<%=resultSet.getInt("mobilenumber") %>"required>
								  </div>
								</div>
								
								<div class="form-group">
										<label class="control-label col-sm-2" for="Medname">Medicine Name:</label>
										<div class="form-group col-md-6">
										  <input type="text" name="umedicinename"class="form-control" id="Medname" value="<%=resultSet.getString("medname") %>"required><br>

										   </div>
									  </div>
								
								<div class="form-group">
										<label class="control-label col-sm-2" for="Quan">Quantity:</label>
										<div class="form-group col-md-6">
										  <input type="text" name="uquantity"class="form-control" id="Quan" value="<%=resultSet.getString("Quan") %>"required>
										</div>
									  </div>
								
								<div class="form-group">
										<label class="control-label col-sm-2" for="gram">Gram/Milligram:</label>
										<div class="form-group col-md-6">
										  <input type="text" name="ugram"class="form-control" id="gram"value="<%=resultSet.getString("gram") %>" required>
										</div>
									  </div>
									  
								<div class="form-group">
										<label class="control-label col-sm-2" for="unit">Unit Price:</label>
										<div class="form-group col-md-6">
										  <input type="text" name="uunit"class="form-control" id="unit"value="<%=resultSet.getString("unitprice") %>">
										</div>
									  </div>
									  
								<div class="form-group">
										<label class="control-label col-sm-2" for="amount">Amount:</label>
										<div class="form-group col-md-6">
										  <input type="text" name="amount"class="form-control" id="amount"value="<%=resultSet.getString("amount") %>"readonly>
										</div>
									  </div>
									  
								<div class="button34">
									<button type="submit" data-toggle = "modal" data-target="#exampleModel"class="btn btn-primary">Submit</button>
								</div>
										  
							
								
								
							  </form> 
							  <%  %>
							  <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
					  </div>
			
		</div>
	</body>
</html>