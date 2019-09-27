<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%ResultSet resultSet = null;%>
<html>
    <head>
        <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>This Month</title>
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
							<li class="nav-item">
							  <a class="nav-link" href="addSupplierOrders.jsp">New Order </a>
							</li>
							<li class="nav-item ">
							  <a class="nav-link" href="viewSupplierOrders.jsp">Order History </a>
							</li>
							<li class="nav-item">
							  <a class="nav-link" href="manageSupplierOrders.jsp">Manage Orders</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="thisMonthSUpplierOrders.jsp">This Month <span class="sr-only">(current)</span></a>
                              </li>
							<li class="nav-item">
							  <a class="nav-link" href="reports.jsp">Reports</a>
							</li>

                                    
                                    
                                  </ul>
                                  
                                </div>
                        </nav>
                        

                        <h2 class="headings"> Upcoming Orders </h2>

                        <div class="addform" >
                                <table class="table table-dark" style="width:1250px">
                                       <thead>
									  <tr>
										<th scope="col" style="width: 100px">Order ID</th>
										<th scope="col"  style="width: 130px">Order Date</th>
										<th scope="col" style="width: 130px">Supplier ID</th>
                                        <th scope="col" style="width: 200px">Supplier Name</th>
                                        <th scope="col" style="width: 100px">Item ID</th>
										<th scope="col" style="width: 200px">Item Name</th>
										<th scope="col" style="width: 150px">No.of Units</th>
                                        <th scope="col" style="width: 130px">Arriving Date</th>
                                        <th scope="col" style="width: 100px">Unit Price</th>
                                        <th scope="col" style="width: 150px">Total Price</th>
									  </tr>
									</thead>
									
									
										<%
										try{
										Class.forName("com.mysql.jdbc.Driver");
								        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacy?useSSL=false","root","sliit@123");
								        
								        Statement statement = connection.createStatement();
								        
										String sql ="SELECT * FROM supplierorders WHERE status = 'not arrived'";
								
										resultSet = statement.executeQuery(sql);
										while(resultSet.next()){
										%>
									<tbody>
									  <tr>
										<th scope="row"><%=resultSet.getString("sOrderID") %></th>
                                        <td><%=resultSet.getDate("sOrderDate") %></td>
                                        <td><%=resultSet.getString("supplierID") %></td>
                                        <td><%=resultSet.getString("supplierName") %></td>
                                        <td><%=resultSet.getString("itemID") %></td>
                                        <td><%=resultSet.getString("itemName") %></td>
                                        <td><%=resultSet.getInt("NOSunits") %></td>
                                        <td><%=resultSet.getDate("arrivingDate") %></td>
                                        <td><%=resultSet.getFloat("unitPrice") %><td>
                                        <td><%=resultSet.getFloat("totalPrice") %></td>
                                        
									  </tr>
									  
									<% 
									}
							
									} catch (Exception e) {
									out.println(e);
									}
									
									
									%>
									</tbody>
								  </table>

                            <h2 class="headings"> Delayed Orders </h2>

                            <div class="addform" >
                                    <table class="table table-dark">
                                            <thead>
                                              <tr>
                                                <th scope="col">Order ID</th>
                                                <th scope="col">Order Date</th>
                                                <th scope="col" style="width: 200px">Supplier Name</th>
                                                <th scope="col">Item Name</th>
                                                <th scope="col">No.of Units</th>
                                                <th scope="col"  style="width: 200">Scheduled Arriving Date</th>
                                                <th scope="col">No.of delayed days</th>
                                              </tr>
                                            </thead>
                                            
                                            <%
										try{
										Class.forName("com.mysql.jdbc.Driver");
								        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacy?useSSL=false","root","sliit@123");
								        
								        Statement statement = connection.createStatement();
								        
								        java.sql.Date cDate = (java.sql.Date) new java.util.Date();
								        
										String sql ="SELECT * FROM supplierorders WHERE status = 'not arrived' AND arrivingDate <" +cDate;
								
										resultSet = statement.executeQuery(sql);
										while(resultSet.next()){
										%>
                                            <tbody>
                                              <tr>
                                                <th scope="row"><%=resultSet.getString("sOrderID") %></th>
                                        <td><%=resultSet.getDate("sOrderDate") %></td>
                                        <td><%=resultSet.getString("supplierName") %></td>
                                        <td><%=resultSet.getString("itemName") %></td>
                                        <td><%=resultSet.getInt("NOSunits") %></td>
                                        <td><%=resultSet.getDate("arrivingDate") %></td>
                                        <td><%=resultSet.getFloat("unitPrice") %><td>

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