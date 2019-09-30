<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

 <%
ResultSet resultSet = null;
				
String ID = request.getParameter("sOrderID");
				                
Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacy?useSSL=false","root","sliit@123");
				          
Statement statement = connection.createStatement();
String sql = "SELECT * FROM supplierorders WHERE sOrderID= '"+ID + "'";
				
 resultSet = statement.executeQuery(sql);
if(resultSet.next()) {
 %>

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
			  var a1 = document.forms["updateSupplierOrders"]["sOrderID"].value;
			  if (a1 == "") {
				  swal ( 'Order ID must be filled out' ,  '' ,  'warning' );
			    return false;
			  }
			  var b1 = document.forms["updateSupplierOrders"]["sOrderDate"].value;
			  if (b1 == "") {
				  swal ( 'Order Date must be filled out' ,  '' ,  'warning' );
			    return false;
			  }
			  var c1 = document.forms["updateSupplierOrders"]["supplierID"].value;
			  if (c1 == "") {
				  swal ( 'Supplier ID must be filled out' ,  '' ,  'warning' );
			    return false;
			  }
			  var d1 = document.forms["updateSupplierOrders"]["supplierName"].value;
			  if (d1 == "") {
				  swal ( 'Supplier Name must be filled out' ,  '' ,  'warning' );
			    return false;
			  }
			  var e1 = document.forms["updateSupplierOrders"]["itemID"].value;
			  if (e1 == "") {
				  swal ( 'Item ID must be filled out' ,  '' ,  'waring' );
			    return false;
			  }
			  var f1 = document.forms["updateSupplierOrders"]["itemName"].value;
			  if (f1 == "") {
				  swal ( 'Item Name must be filled out' ,  '' ,  'warning' );
			    return false;
			  }
			  var g1 = document.forms["updateSupplierOrders"]["NOSunits"].value;
			  if (g1 == "") {
				  swal ( 'No. of Units must be filled out' ,  '' ,  'warning' );
			    return false;
			  }
			  var h1 = document.forms["updateSupplierOrders"]["arrivingDate"].value;
			  if (h1 == "") {
				  swal ( 'Arriving Date must be filled out' ,  '' ,  'warning' );
			    return false;
			  }
			  var i1 = document.forms["updateSupplierOrders"]["unitPrice"].value;
			  if (i1 == "") {
				  swal ( 'Unit Price must be filled out' ,  '' ,  'warning' );
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
								<a class="nav-link disabled" href="supplierOrdersReports.jsp">Reports</a>
							  </li>
							
							
						  </ul>
						  
						</div>
					  </nav>
					  <!--Nav bar end-->
					  
					 
					 
									
						
					  <!--add form-->
					  
                      <div class="addform" >
							<form name="updateSupplierOrders" onsubmit="return validateForm()" class="form-horizontal" action="./updateProcessSupplierOrders.jsp" method="POST">
								<div class="row">
									<div class="column">
										<div class="form-group">
												<label class="control-label col-sm-2" style="max-width: 25%" >Order ID :</label>
												<div class="col-sm-10">
												 <input type="text" class="form-control" id="sOrderID" name="sOrderID" value="<%=resultSet.getString("sOrderID") %>" required>
												</div>	 
										</div>
								
									</div>

									<div class="column">
                                        <div class="form-group">
                                                <label class="control-label col-sm-2" style="max-width: 25%" >Order date :</label>
                                                <div class="col-sm-10">
                                                <input type="date" class="form-control" id="sOrderDate"  name="sOrderDate" value="<%=resultSet.getDate("sOrderDate") %>"  >
                                                </div>	 
                                        </div>	
									</div>
                                </div>
                                <div class="row">
                                        <div class="column">
                                            <div class="form-group">
                                                    <label class="control-label col-sm-2" style="max-width: 25%" >Supplier ID :</label>
                                                    <div class="col-sm-10">
                                                     <input type="text" class="form-control" id="supplierID" name="supplierID" value="<%=resultSet.getString("supplierID") %>" required >
                                                    </div>	 
                                            </div>
                                    
                                        </div>
    
                                        <div class="column">
                                            <div class="form-group">
                                                    <label class="control-label col-sm-2" style="max-width: 30%" >Supplier Name :</label>
                                                    <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="supplierName" name="supplierName" value="<%=resultSet.getString("supplierName") %>"  required>
                                                    </div>	 
                                            </div>	
                                        </div>
                                    </div>
                                    
                                   
                                    <div class="row">
                                            <div class="column">
                                                <div class="form-group">
                                                        <label class="control-label col-sm-2" style="max-width: 25%" >Item ID :</label>
                                                        <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="itemID" name="itemID" value="<%=resultSet.getString("itemID") %>" required>
                                                        </div>	 
                                                </div>
                                        
                                            </div>
        
                                            <div class="column">
                                                <div class="form-group">
                                                        <label class="control-label col-sm-2" style="max-width: 25%" >Item Name :</label>
                                                        <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="itemName" name="itemName" value="<%=resultSet.getString("itemName") %>" required >
                                                        </div>	 
                                                </div>	
                                            </div>
                                        </div>
                                        <div class="row">
                                                <div class="column">
                                                    <div class="form-group">
                                                            <label class="control-label col-sm-2" style="max-width: 25%" >No of Units :</label>
                                                            <div class="col-sm-10">
                                                             <input type="text" class="form-control" id="NOSunits" name="NOSunits" value="<%=resultSet.getInt("NOSunits") %>" required>
                                                            </div>	 
                                                    </div>
                                            
                                                </div>
            
                                                <div class="column">
                                                    <div class="form-group">
                                                            <label class="control-label col-sm-2" style="max-width: 30%" >Arriving date :</label>
                                                            <div class="col-sm-10">
                                                            <input type="date" class="form-control" id="arrivingDate" name="arrivingDate" value="<%=resultSet.getDate("arrivingDate") %>" required>
                                                            </div>	 
                                                    </div>	
                                                </div>
                                            </div>
                                            <div class="row">
                                                    <div class="column">
                                                        <div class="form-group">
                                                                <label class="control-label col-sm-2" style="max-width: 25%" >Unit Price :</label>
                                                                <div class="col-sm-10">
                                                                 <input type="text" class="form-control" id="unitPrice" name="unitPrice" value="<%=resultSet.getFloat("unitPrice") %>" required>
                                                                </div>	 
                                                        </div>
                                                
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="column">
                                                        <div class="form-group">
                                                                <label class="control-label col-sm-2" style="max-width: 25%" >Total Price :</label>
                                                                <div class="col-sm-10">
                                                                 <input type="text" class="form-control" id="totalPrice" name="totalPrice" value="<%=resultSet.getFloat("totalPrice") %>" disabled>
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