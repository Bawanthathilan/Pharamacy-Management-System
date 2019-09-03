<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
    <%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>
	
	<%
	ResultSet resultSet = null;
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Supplier Orders</title>
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

            .headings {
                padding : 30px;
                font-size: 25px;

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
                            <li>
                                <a href=#>
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
                                    <li class="nav-item ">
                                        <a class="nav-link" href="addSupplierOrders.jsp">New Order </a>
                                      </li>
                                      <li class="nav-item">
                                        <a class="nav-link" href="viewSupplierOrders.jsp">Order History</a>
                                      </li>
                                      <li class="nav-item active">
                                        <a class="nav-link disabled" href="manageSupplierOrders.jsp">Manage Orders <span class="sr-only">(current)</span></a>
                                      </li>
                                      <li class="nav-item ">
                                          <a class="nav-link " href="thisMonthSupplierOrders.jsp">This Month </a>
                                        </li>
                                      <li class="nav-item">
                                        <a class="nav-link " href="reports.html">Reports</a>
                                      </li>
                                    
                                    
                                  </ul>
                                  
                                </div>
                        </nav>
					<div class="">
			  
							
							<table id="mytable" class="table table-bordred table-striped">
								 
								 <thead>
                                    <th>Order ID</th>
                                    <th>Order Date</th>
                                    <th>Supplier ID</th>
                                    <th style="width: 200px">Supplier Name</th>
                                    <th>Item ID</th>
                                    <th>Item Name</th>
                                    <th>No.of Units</th>
                                    <th>Arriving Date</th>
                                    <th>Unit Price</th>
                                    <th>Total Price</th>
									<th>Edit</th>
									<th>Delete</th>
									<th>Arrived</th>
								 </thead>   
       <%
		try{

			Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer?useSSL=false","root","bawwa");
            
            Statement statement = connection.createStatement();
        
			String sql ="SELECT * FROM supplierorders";

			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
		%>
                 <tbody>
                 <tr>
                    <td><%=resultSet.getString("sOrderID")%></td>
                    <td><%=resultSet.getString("sOrderDate") %></td>
                    <td><%=resultSet.getString("supplierID") %></td>
                    <td><%=resultSet.getString("supplierName") %></td>
                    <td><%=resultSet.getString("itemID") %></td>
                    <td><%=resultSet.getString("itemName") %></td>
                    <td><%=resultSet.getInt("NOSunits") %></td>
                    <td><%=resultSet.getString("arrivingDate") %></td>
                    <td><%=resultSet.getFloat("unitPrice") %></td>
                    <td><%=resultSet.getFloat("totalPrice") %></td>
				  <td><p data-placement="top" data-toggle="tooltip" title="Edit"><a href="updateSupplierOrders.jsp?sOrderID=<%=resultSet.getString("sOrderID") %>"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="fas fa-pencil-alt"></span></button></a></p></td>
				  <td><p data-placement="top" data-toggle="tooltip" title="Delete"><a href="deleteSupplierOrders.jsp?sOrderID=<%=resultSet.getString("sOrderID") %>"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="fas fa-trash-alt"></span></button></a></p></td>
				  <td><p data-placement="top" data-toggle="tooltip" title="Arrived"><a href="arrivedStatusUpdateSupplierOrders.jsp?sOrderID=<%=resultSet.getString("sOrderID") %>"><button class="btn btn-success btn-xs" data-title="Arrived" data-toggle="modal" data-target="#delete" ><span class="fas fa-check-alt"></span></button></p></td>
				</tr>
                </tbody>
        <% 
		}

		} catch (Exception e) {
		out.println(e);
		}
		%>
             </table>
        	 </div>

                            


</body>
</html>