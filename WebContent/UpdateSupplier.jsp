<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String supplierID = request.getParameter("supplierID");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "supplier1";
String userid = "root";
String password = "yasiya";
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
String sql ="select * from newsupplier where supplierID='"+supplierID+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
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
		
		<script>
function validateForm() {
  var a = document.forms["addSup"]["sid"].value;
  if (a == "") {
    alert("Supplier ID cannot be Empty!!");
    return false;
   
  }
  var b = document.forms["addSup"]["sname"].value;
  if (b == "") {
	    alert("Supplier Name cannot be Empty!!");
	    return false;
	  }
  
  
  var c = document.forms["addSup"]["cname"].value;
  if (c == "") {
	    alert("Company Name cannot be Empty!!");
	    return false;
	  }
  
  var d= document.forms["addSup"]["caddress"].value;
  if (d == "") {
	    alert("Company Address cannot be Empty!!");
	    return false;
	  }
  
  var e = document.forms["addSup"]["ctelno"].value;
  if (e == "") {
	    alert("Company Contact Number cannot be Empty!!");
	    return false;
	  }
  
  var f = document.forms["addSup"]["cemail"].value;
  if (f == "") {
	    alert("Company Email cannot be Empty!!");
	    return false;
	  }
  
 }
 
</script>
		

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
					<li class="active">
						<a href="#">
							<span></span>
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
							  <a class="nav-link" href="addSup.jsp">Add Supplier <span class="sr-only">(current)</span></a>
							</li>
							<li class="nav-item">
							  <a class="nav-link" href="supProfile.jsp">Supplier Profile</a>
							</li>
							<li class="nav-item">
							  <a class="nav-link" href="viewSup.jsp">View Supplier</a>
							</li>
							<li class="nav-item">
							  <a class="nav-link disabled" href="SupReport.jsp">Reports</a>
							</li>
							
							
						  </ul>
						  
						</div>
					  </nav>
					  <!--Nav bar end-->

					  <!--add form-->
					  
					  <div class="addform" >
							<form name="addSup" class="form-horizontal"  onsubmit="return validateForm()" action="UpdateProcessSup.jsp" method="POST">
								<div class="form-group">
								  <label class="control-label col-sm-2" for="email">Supplier ID :</label>
								  <div class="col-sm-8">
									<input type="text" name ="sid" class="form-control" id="sid" value="<%=resultSet.getString("supplierID") %>">
								  </div>
								</div>  
								<div class="form-group">
								  <label class="control-label col-sm-2" for="pwd">Supplier Name:</label>
								  <div class="col-sm-8">
									<input type="text" name ="sname" class="form-control" id="sname" value="<%=resultSet.getString("supplierName") %>">
								  </div>
								</div>
								<!--div class="form-group col-md-4">
										<label for="inputState">Customer Type:</label>
										<select id="inputState" class="form-control">
										  <option selected>Choose...</option>
										  <option>Regular</option>
										  <option>Bulk</option>
										</select>
									  </div-->
									 <label class="control-label col-sm-4" for="pwd"><b><u><font size="+2">Company Details</b></u></font></label>
									 <div class="form-group">
										<label class="control-label col-sm-2" for="pwd">Company Name:</label>
										<div class="col-sm-8">
										  <input type="text" name="cname" class="form-control" id="cname" value="<%=resultSet.getString("companyName") %>">
										</div>
									  </div>
									 <div class="form-group">
										<label class="control-label col-sm-4" for="pwd">Company Address:</label>
										<div class="col-sm-8">
										  <input type="text" name="caddress" class="form-control" id="caddress" value="<%=resultSet.getString("companyAddress") %>">
										</div>
									  </div>
								<div class="form-group">
										<label class="control-label col-sm-4" for="pwd">Company Telephone No:</label>
										<div class="col-sm-8">
										  <input type="text" name="ctelno" class="form-control" id="telno" value="<%=resultSet.getInt("companyTelNo") %>">
										</div>
									  </div>
									  <div class="form-group">
											<label class="control-label col-sm-4" for="pwd">Company Email:</label>
											<div class="col-sm-8">
											  <input type="text" name="cemail" class="form-control" id="cemail" value="<%=resultSet.getString("companyEmail") %>">
											</div>
										  </div>
							
								<div class="form-group">
										<button type="submit" data-toggle="modal" data-target="#exampleModal" class="btn btn-primary">Submit</button>
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