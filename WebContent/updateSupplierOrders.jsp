<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<title>Update Supplier Orders</title>

	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
	
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

            .column {
			    float: left;
  				width: 50%;
				padding: 10px;	
			}

			.row:after {
 				content: "";
  				display: table;
  				clear: both;
			}
		</style>
		
		<script>
		function validateForm() {
			  var x1 = document.forms["supplierOrdersForm"]["sOrderID"].value;
			  if (x1 == "") {
			    alert("Order ID must be filled out");
			    return false;
			  }
			  var x1 = document.forms["supplierOrdersForm"]["sOrderDate"].value;
			  if (x1 == "") {
			    alert("Order Date must be filled out");
			    return false;
			  }
			  var x1 = document.forms["supplierOrdersForm"]["supplierID"].value;
			  if (x1 == "") {
			    alert("Supplier ID must be filled out");
			    return false;
			  }
			  var x1 = document.forms["supplierOrdersForm"]["supplierName"].value;
			  if (x1 == "") {
			    alert("Supplier Name must be filled out");
			    return false;
			  }
			  var x1 = document.forms["supplierOrdersForm"]["itemID"].value;
			  if (x1 == "") {
			    alert("Item ID must be filled out");
			    return false;
			  }
			  var x1 = document.forms["supplierOrdersForm"]["itemName"].value;
			  if (x1 == "") {
			    alert("Item Name must be filled out");
			    return false;
			  }
			  var x1 = document.forms["supplierOrdersForm"]["NOSunits"].value;
			  if (x1 == "") {
			    alert("No.of Units must be filled out");
			    return false;
			  }
			  var x1 = document.forms["supplierOrdersForm"]["arrivingDate"].value;
			  if (x1 == "") {
			    alert("Arriving Date must be filled out");
			    return false;
			  }
			  var x1 = document.forms["supplierOrdersForm"]["unitPrice"].value;
			  if (x1 == "") {
			    alert("unit Price must be filled out");
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
				
				<span>LuckyLand Pharamacy</span>
			</div>
			<nav>
				<ul>
					<li>
						<a href="add.html">
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
						<a href="#">
							
							<span>Supplier Order </span>
						</a>
					</li>
					<li>
						<a href="addSupplierOrders.jsp">
							
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
							<li class="nav-item">
								<a class="nav-link" href="addSupplierOrders.jsp">New Order </a>
							  </li>
							  <li class="nav-item">
								<a class="nav-link" href="viewSupplierOrders.jsp">Order History</a>
							  </li>
							  <li class="nav-item active">
								<a class="nav-link" href="manageSupplierOrders.jsp">Manage Orders <span class="sr-only">(current)</span></a>
							  </li>
							  <li class="nav-item">
								  <a class="nav-link disabled" href="thisMonthSupplies.jsp">This Month</a>
								</li>
							  <li class="nav-item">
								<a class="nav-link disabled" href="reports.jsp">Reports</a>
							  </li>
							
							
						  </ul>
						  
						</div>
					  </nav>
					  <!--Nav bar end-->
					  
					  <%


				          ResultSet resultSet = null;
				
					  	String sOrderID = request.getParameter("sOrderID");
				                
				          Class.forName("com.mysql.jdbc.Driver");
				          Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer?useSSL=false","root","bawwa");
				          
				          Statement statement = connection.createStatement();
				          String sql = "SELECT * FROM supplierorders WHERE sOrderID= +sOrderID";
				
				          resultSet = statement.executeQuery(sql);
				          if(resultSet.next()) {
				         %>
					 
									
						
					  <!--add form-->
					  
                      <div class="addform" >
							<form class="form-horizontal" name="supplierOrdersForm" onsubmit="return validateForm()" action="http://localhost:8080/SupplierOrderManagement/updateProcessSupplierOrders.jsp" method="post">
								<div class="row">
									<div class="column">
										<div class="form-group">
												<label class="control-label col-sm-2" style="max-width: 25%" >Order ID :</label>
												<div class="col-sm-10">
												 <input type="text" class="form-control" id="sOrderID" value="<%=resultSet.getString("sOrderID") %>">
												</div>	 
										</div>
								
									</div>

									<div class="column">
                                        <div class="form-group">
                                                <label class="control-label col-sm-2" style="max-width: 25%" >Order date :</label>
                                                <div class="col-sm-10">
                                                <input type="date" class="form-control" id="sOrderDate"  value="<%=resultSet.getDate("sOrderDate") %>" >
                                                </div>	 
                                        </div>	
									</div>
                                </div>
                                <div class="row">
                                        <div class="column">
                                            <div class="form-group">
                                                    <label class="control-label col-sm-2" style="max-width: 25%" >Supplier ID :</label>
                                                    <div class="col-sm-10">
                                                     <input type="text" class="form-control" id="supplierID" value="<%=resultSet.getString("supplierID") %>" >
                                                    </div>	 
                                            </div>
                                    
                                        </div>
    
                                        <div class="column">
                                            <div class="form-group">
                                                    <label class="control-label col-sm-2" style="max-width: 30%" >Supplier Name :</label>
                                                    <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="supplierName" value="<%=resultSet.getString("supplierName") %>" >
                                                    </div>	 
                                            </div>	
                                        </div>
                                    </div>
                                    
                                   
                                    <div class="row">
                                            <div class="column">
                                                <div class="form-group">
                                                        <label class="control-label col-sm-2" style="max-width: 25%" >Item ID :</label>
                                                        <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="itemID" value="<%=resultSet.getString("itemID") %>">
                                                        </div>	 
                                                </div>
                                        
                                            </div>
        
                                            <div class="column">
                                                <div class="form-group">
                                                        <label class="control-label col-sm-2" style="max-width: 25%" >Item Name :</label>
                                                        <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="itemName" value="<%=resultSet.getString("itemName") %>" >
                                                        </div>	 
                                                </div>	
                                            </div>
                                        </div>
                                        <div class="row">
                                                <div class="column">
                                                    <div class="form-group">
                                                            <label class="control-label col-sm-2" style="max-width: 25%" >No of Units :</label>
                                                            <div class="col-sm-10">
                                                             <input type="text" class="form-control" id="NOSunits" value="<%=resultSet.getInt("NOSunits") %>">
                                                            </div>	 
                                                    </div>
                                            
                                                </div>
            
                                                <div class="column">
                                                    <div class="form-group">
                                                            <label class="control-label col-sm-2" style="max-width: 30%" >Arriving date :</label>
                                                            <div class="col-sm-10">
                                                            <input type="date" class="form-control" id="arrivingDate" value="<%=resultSet.getDate("arrivingDate") %>" >
                                                            </div>	 
                                                    </div>	
                                                </div>
                                            </div>
                                            <div class="row">
                                                    <div class="column">
                                                        <div class="form-group">
                                                                <label class="control-label col-sm-2" style="max-width: 25%" >Unit Price :</label>
                                                                <div class="col-sm-10">
                                                                 <input type="text" class="form-control" id="unitPrice" value="<%=resultSet.getFloat("unitPrice") %>" >
                                                                </div>	 
                                                        </div>
                                                
                                                    </div>
                
                                                    
                                                </div>
                                                
                          
								
								<div class="form-group">
										<button type="submit" class="btn btn-primary">Submit</button>
								</div>
								
								      <% } %>
								
							  </form> 
					  </div>
			
		</div>
	</body>
</html>