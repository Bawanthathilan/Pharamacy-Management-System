 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("Snumber");
String driverName ="com.mysql.cj.jdbc.Driver";
String ConnectionUrl =  "jdbc:mysql://localhost:3306/";
String dbName = "customer";
String UserId="root";
String password = "bawwa";
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(ConnectionUrl+dbName, UserId, password);
statement=connection.createStatement();
String sql ="select * from stock where Snumber="+id;
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

<script>
function validateForm() {
  var a = document.forms["addstocks"]["Snumber"].value;
  if (a == "") {
    alert("stock code cannot be Empty!!");
    return false;
   
  }
  var b = document.forms["addstocks"]["Inumber"].value;
  if (b == "") {
	    alert("item number cannot be Empty!!");
	    return false;
	  }
  
  
  var c = document.forms["addstocks"]["Qnumber"].value;
  if (c == "") {
	    alert("Quantity cannot be Empty!!");
	    return false;
	  }
  
  var d= document.forms["addstocks"]["Mdate"].value;
  if (d == "") {
	    alert("manufacture date cannot be Empty!!");
	    return false;
	  }

  var e= document.forms["addstocks"]["Edate"].value;
  if (d == "") {
	    alert("expire date cannot be Empty!!");
	    return false;
	  }  

  var f= document.forms["addstocks"]["Rdate"].value;
  if (d == "") {
	    alert("recieve date cannot be Empty!!");
	    return false;
	  }
  

  var d= document.forms["addstocks"]["SPrise"].value;
  if (d == "") {
	    alert("Stock price cannot be Empty!!");
	    return false;
	  }
  var d= document.forms["addstocks"]["iPrise"].value;
  if (d == "") {
	    alert("Item Price cannot be Empty!!");
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
				
				<span>LuckyLand Pharamacy</span>
			</div>
			<nav>
				<ul>
					<li >
						<a href="#">
							<span></span>
							<span>Customer </span>
						</a>
					</li>
					<li class="active">
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
							  <a class="nav-link" href="addStocks.jsp">Add Stocks <span class="sr-only">(current)</span></a>
							</li>
							<li class="nav-item">
							  <a class="nav-link" href="viewStocks.jsp">View Stocks</a>
							</li>
							<li class="nav-item">
							  <a class="nav-link" href="ManageStocks.jsp">Manage Stocks</a>
							</li>
							<li class="nav-item">
							  <a class="nav-link" href="Stockreports.jsp">Genarate Reports</a>
							</li>
							
							
						  </ul>
						  
						</div>
					  </nav>
					  <!--Nav bar end-->

					  <!--add form-->
					  <div class="ex1">
					  <div >
							<form name="addstocks" onsubmit="return validateForm()" class="form-horizontal" action="UpdateStockProcess.jsp" method="post">
								<div class="form-group">
								  <label class="control-label col-sm-2" for="Snumber">Stock code :</label>
								  <div class="col-sm-10">
									<input type="number" class="form-control" name="Snumber" id="Snumber"  value="<%=resultSet.getString("Snumber") %>">
								  </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="Inumber">Item code :</label>
                                    <div class="col-sm-10">
                                      <input type="number" class="form-control" name="Inumber" id="Inumber" value="<%=resultSet.getString("Inumber") %>" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="Qnumber">Quantity:</label>
                                    <div class="col-sm-10">
                                      <input type="number" class="form-control" name="Qnumber" id="Qnumber" value="<%=resultSet.getString("Qnumber") %>" >
                                    </div>
                                </div>
								<div class="form-group">
								  <label class="control-label col-sm-4" for="Mdate">Manufacture Date:</label>
								  <div class="col-sm-10">
									<input type="date" class="form-control" name="Mdate"id="Mdate" value="<%=resultSet.getString("Mdate") %>">
								  </div>
								</div>
								<div class="form-group">
								  <label class="control-label col-sm-2" for="Edate">Expiary Date:</label>
								  <div class="col-sm-10">
									<input type="date" class="form-control" name="Edate" id="Edate" value="<%=resultSet.getString("Edate") %>">
								  </div><br>
								  <div class="form-group">
									<label class="control-label col-sm-2" for="Rdate">Recive Date:</label>
									<div class="col-sm-10">
									  <input type="date" class="form-control" name="Rdate" id="Rdate" value="<%=resultSet.getString("Rdate") %>">
									</div><br>
									<div class="form-group">
										<label class="control-label col-sm-2" for="SPrise">Stock Price:</label>
										<div class="col-sm-10">
										  <input type="number" class="form-control" placeholder="Rs :" name="SPrise" id="SPrise" value="<%=resultSet.getString("SPrise") %>">
										</div><br>
										<div class="form-group">
											<label class="control-label col-sm-2" for="i
											Prise">Item Price:</label>
											<div class="col-sm-10">
											  <input type="number" class="form-control" placeholder="Rs :" name="iPrise" id="iPrise" value="<%=resultSet.getString("iPrise") %>">
											</div>
								</div>
								
							<br>
								<div class="form-group">
									&emsp;&emsp;<button type="submit" class="btn btn-primary">Submit</button>
								</div>
								
							  </form> 
							   <%
							   }connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
					  </div>
			
		</div>
		</div>
	</body>
</html>