<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

		<%
			String utilityID = request.getParameter("utilityID");
			String driver = "com.mysql.jdbc.Driver";
			String connectionUrl = "jdbc:mysql://localhost:3306/";
			String database = "customer";
			String userid = "root";
			String password = "bawwa";
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
				String sql ="select * from utilitydetails where utilityID="+utilityID;
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
		%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Utilities</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:700, 600,500,400,300' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
		<link rel="stylesheet" href="./style/main.css">

		<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/data.js"></script>
		<script src="main.js"></script>
		
		<script>
		function validateForm() {
			  var b = document.forms["utilityForm"]["description"].value;
			  if (b == "") {
			    alert("Discription must be filled out.");
			    return false;
			  }
			  var c = document.forms["utilityForm"]["date"].value;
			  if (c == "") {
			    alert("Date must be filled out.");
			    return false;
			  }

			  var e = document.forms["utilityForm"]["amount"].value;
			  if (e == "") {
			    alert("Amount must be filled out.");
			    return false;
			  }
		}
		</script>

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
							  <a class="nav-link" href="utility.jsp">Utility <span class="sr-only">(current)</span></a>
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
							<li class="nav-item">
							  <a class="nav-link " href="viewIncome.jsp">Income</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="generateReports.jsp">Generate Reports</a>
							</li>
							
							
						  </ul>
						  
						</div>
					  </nav>
					  <!--Nav bar end-->

					  <!--add form-->
					  
					  <div class="addform" >
							<form class="form-horizontal" name="utilityForm" onsubmit="return validateForm()" action="updateProcessUtility.jsp" method="post">
								<div class="form-group">
								  <label class="control-label col-sm-2" for="pwd">Utility ID:</label>
								  <div class="col-sm-10">
									<input type="text" name="utilityID" readonly class="form-control" id="id" value="<%=resultSet.getInt("utilityID") %>" >
								  </div>
								</div>
								<div class="form-group col-md-4">
									<label for="inputState">Utility Type:</label>
									<select id="uType" name="utype" class="form-control"  value="<%=resultSet.getString("utype") %>" required>
									<option selected value="">Choose...</option>
									  <option value="Electricity">Electricity</option>
									  <option value="Water Supply">Water Supply</option>
									  <option value="Telephone">Telephone</option>
									  <option value="WiFi">WiFi</option>
									  <option value="Maintenance">Maintenance</option>
									</select>
								  </div>
								<div class="form-group">
								  <label class="control-label col-sm-2" for="pwd">Description:</label>
								  <div class="col-sm-10">
									<input type="text" name="description" class="form-control" id="udescription"  value="<%=resultSet.getString("description") %>">
								  </div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="pwd">Date :</label>
									<div class="col-sm-10">
									  <input type="date" name="date" class="form-control" id="udate"  value="<%=resultSet.getDate("date") %>">
									</div>
								  </div>
								
								<div class="form-group col-md-4">
									<label for="inputState">Payment Method:</label>
										<select id="umethod" name="method" class="form-control"  value="<%=resultSet.getString("method") %>" required>
										<option selected value="">Choose...</option>
										  <option value="Cash">Cash</option>
										  <option value="Credit Card">Credit Card</option>
										</select>
								</div>
								<div class="form-group">
										<label class="control-label col-sm-2" for="pwd">Payment Amount:</label>
										<div class="col-sm-10">
										  <input type="text" name="amount" class="form-control" id="uamount"  value="<%=resultSet.getDouble("amount")%>">
										</div>
								</div>
							
							
								<div class="form-group">
										<button type="submit" class="btn btn-primary">Submit</button>
								</div>
								
							  </form> 
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