<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
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
		<link rel="stylesheet" href="css/util.css">
		<link rel="stylesheet" href="css/mainn.css">
		

		<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/data.js"></script>
		<script src="main.js"></script>

		<style>
			.butt{
				
				padding-top: 10px;
				margin-left: 200px;
				padding-bottom: 0px;
				margin-right: 350px;
				
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
			.limiter {
  width: 100%;
  margin: 0 auto;
  height:460px;
 
  
}

.input_fields_container_part{
			width:500px;
			
			
			}
.container-table100 {
  width: 100%;
  min-height: 545px;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;
  padding: 33px 30px;
}

.wrap-table100 {
  width: 1190px;
  padding-left: 70px;
  padding-top: 150px;
}

table {
  border-spacing: 1;
  border-collapse: collapse;
  background: white;
  border-radius: 10px;
  overflow: hidden;
  width: 100%;
  margin: 0 auto;
  position: relative;
}
table * {
  position: relative;
}
table td, table th {
  padding-left: 8px;
}
table thead tr {
  height: 50px;
  background: #36304a;
}
table tbody tr {
  height: 40px;
}
table tbody tr:last-child {
  border: 0;
}
table td, table th {
  text-align: left;
}
table td.l, table th.l {
  text-align: right;
}
table td.c, table th.c {
  text-align: center;
}
table td.r, table th.r {
  text-align: center;
}


.table100-head th{
  font-family: OpenSans-Regular;
  font-size: 18px;
  color: #fff;
  line-height: 1.2;
  font-weight: unset;
}

tbody tr:nth-child(even) {
  background-color: #f5f5f5;
}

tbody tr {
  font-family: OpenSans-Regular;
  font-size: 15px;
  color: #808080;
  line-height: 1.2;
  font-weight: unset;
}

tbody tr:hover {
  color: #555555;
  background-color: #f5f5f5;
  cursor: pointer;
}

.column1 {
  width: 160px;
  padding-left: 30px;
}

.column2 {
  width: 160px;
}

.column3 {
  width: 85px;
}

.column4 {
  width: 90px;
  text-align: right;
}

.column5 {
  width: 100px;
  text-align: right;
}

.column6 {
  width: 100px;
  text-align: right;
  padding-right: 62px;
}
.column7{
	width: 35px;
}


@media screen and (max-width: 992px) {
  table {
    display: block;
  }
  table > *, table tr, table td, table th {
    display: block;
  }
  table thead {
    display: none;
  }
  table tbody tr {
    height: auto;
    padding: 37px 0;
  }
  table tbody tr td {
    padding-left: 40% !important;
    margin-bottom: 24px;
  }
  table tbody tr td:last-child {
    margin-bottom: 0;
  }
  table tbody tr td:before {
    font-family: OpenSans-Regular;
    font-size: 14px;
    color: #999999;
    line-height: 1.2;
    font-weight: unset;
    position: absolute;
    width: 40%;
    left: 30px;
    top: 0;
  }
  table tbody tr td:nth-child(1):before {
    content: "Date";
  }
  table tbody tr td:nth-child(2):before {
    content: "Order ID";
  }
  table tbody tr td:nth-child(3):before {
    content: "Name";
  }
  table tbody tr td:nth-child(4):before {
    content: "Price";
  }
  table tbody tr td:nth-child(5):before {
    content: "Quantity";
  }
  table tbody tr td:nth-child(6):before {
    content: "Total";
  }

  .column4,
  .column5,
  .column6 {
    text-align: left;
  }

  .column4,
  .column5,
  .column6,
  .column1,
  .column2,
  .column3 {
    width: 100%;
  }

  tbody tr {
    font-size: 14px;
  }
}

@media (max-width: 576px) {
  .container-table100 {
    padding-left: 15px;
    padding-right: 15px;
  }
}
		</style>
		
		
		

	</head>
		<script>
		function validateForm() {
			  var a = document.forms["addInvoice"]["date"].value;
			  if (a == "") {
			    alert("Date must be filled out");
			    return false;
			  }
			  var b = document.forms["addInvoice"]["customername"].value;
			  if (b == "") {
			    alert("Date must be filled out");
			    return false;
			  }
			  var c = document.forms["addInvoice"]["mobilenumber"].value;
			  if (c == "") {
			    alert("Date must be filled out");
			    return false;
			  }
			  var d = document.forms["addInvoice"]["medicinename"].value;
			  if (d == "") {
			    alert("Date must be filled out");
			    return false;
			  }
			  var e = document.forms["addInvoice"]["quantity"].value;
			  if (e == "") {
			    alert("Date must be filled out");
			    return false;
			  }
			  var f = document.forms["addInvoice"]["gram"].value;
			  if (f == "") {
			    alert("Date must be filled out");
			    return false;
			  }
		}
			   

		</script>
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
					<li class="active">
						<a href="add.jsp">
							<span></span>
							<span>Customer </span>
						</a>
					</li>
					<li>
						<a href="addStocks.jsp">

							
							<span>Stock </span>
						</a>
					</li>
					<li >
						<a href="addItem.jsp">
							
							<span>Item </span>
						</a>
					</li>
					<li>
						<a href="addSup.jsp">
							
							<span>Supplier </span>
						</a>
					</li>
					<li>
						<a href="addSupplierOrders.jsp">
							
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
					  
					  <div class="addform" >

                      	<form name="addInvoice" onsubmit="return validateForm()" class="form-horizontal" action="./Saveinvoiceservlet" method="post">
                      	
                      	
                      		<div class="form-group">
								  
								  
								  
								  
								  <label class="control-label col-sm-2" for="innum">Date:</label>
								  <div class="col-sm-10">
									<input type="date" name="date"class="form-control" id="idate">
								  </div>
								  
								<div class="form-group">
								  <label class="control-label col-sm-2" for="Cname">Customer Name:</label>
								  <div class="col-sm-10">
									<input type="text" name="customername" class="form-control" id="Cname" >
								  </div>
								</div>
								<div class="form-group">
								  <label class="control-label col-sm-2" for="Mnum">Mobile Number:</label>
								  <div class="col-sm-10">
									<input type="text" name="mobilenumber"class="form-control" id="Mnum">
								  </div>
								</div>
								
								<div class="form-group">
										<label class="control-label col-sm-2" for="Medname">Medicine Name:</label>
										<div class="col-sm-10">
										  <input type="text"name="medicinename" class="form-control" id="Medname"><br>
									  </div>
									  </div>
								
								<div class="form-group">
										<label class="control-label col-sm-2" for="Quan">Quantity:</label>
										<div class="col-sm-10">
										  <input type="text" name="quantity"class="form-control" id="Quan">
										</div>
									  </div>
								
								<div class="form-group">
										<label class="control-label col-sm-2" for="gram">Gram/Milligram:</label>
										<div class="col-sm-10">
										  <input type="text" name="gram"class="form-control" id="gram">
										</div>
									  </div>
									  
								<div class="butt">
			<button type="submit" data-toggle = "modal" data-target="#exampleModel"class="btn btn-primary btn-lg btn-block">Submit</button>
		</div>
									  
							
								
								
							  </form> 
							  
					  </div>
			
		</div>
		
		

	
	</body>
</html>