<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="saveItem.DatabaseConnection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	ResultSet resultSet1 = null;

%>	
	<%
    try{
		 Class.forName("com.mysql.jdbc.Driver").newInstance();
		 connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"customer","root","bawwa");

       	statement = connection.createStatement() ;

         
         
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="navbar.jsp" />
	<script src= "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<!-- Axios -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	
<!-- modal js -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.8/js/mdb.min.js"></script>

<!-- modal css -->
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->

<!-- Material Design Bootstrap -->

  
  		<script>
		function validateItemForm() {
			  var b = document.forms["addItem"]["itemname"].value;
			  if (b == "") {
			    alert("Item name must be filled out.");
			    return false;
			  }

			  var e = document.forms["addItem"]["price"].value;
			  if (e == "") {
			    alert("Price must be filled out.");
			    return false;
			  }
			  
			  var f = document.forms["addItem"]["manufac"].value;
			  if (e == "") {
			    alert("Manufacturer must be filled out.");
			    return false;
			  }
			  
		}
		</script>
  
</head>
<body>
		<div class="main-content">
			<!--Nav bar-->
				<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
						
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
						  <span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarNav">
						  <ul class="navbar-nav">
							<li class="nav-item active">
							  <a class="nav-link" href="addItem.jsp">Add Item <span class="sr-only">(current)</span></a>
							</li>

							<li class="nav-item">
							  <a class="nav-link" href="manageItem.jsp">Manage Item</a>
							</li>
							<li class="nav-item">
							  <a class="nav-link disabled" href="ItemReports.jsp">Reports</a>
							</li>
							
							
						  </ul>
						  
						</div>
					  </nav>
					  <!--Nav bar end-->

					  <!--add new item form-->
					  <div class="col-xs-6">
					  <div class="addform" >
							<form class="form-horizontal" action="./SaveItemServlet" method="post" name="addItem" onsubmit="return validateItemForm()">
							
								<div class="form-group">
								  <label class="control-label col-sm-2" for="email">Item Name :</label>
								  <div class="col-sm-10">
									<input type="text" class="form-control" id="email" name="itemname">
								  </div>
								</div>
								
								<div class="form-group col-md-4">
										<label for="inputState">Category :</label>
										<select class="form-control" name="select11" id="select11" required>
										<option value="">Choose...</option>
									        <% resultSet =statement.executeQuery("select * from category") ; 
									        while(resultSet.next()){ %>
									            <option value="<%= resultSet.getString(2)%>"><%= resultSet.getString(2)%></option>
									        <% } %>
									        
										</select>
									  </div>
									  
								<div class="form-group col-md-4">
										<label for="inputState">Sub-Category :</label>
										<select  class="form-control" name="select22" id="select22">
										  	<option value="0">Choose...</option>
										  	 <% resultSet1 =statement.executeQuery("select * from subcategory"); 
										  	 while(resultSet1.next()){ %>
									            <option value="<%= resultSet1.getString(2)%>"><%= resultSet1.getString(2)%></option>
									        <% } %>

										</select>
									  </div>
									  
								<div class="form-group col-md-4">
									  <p style="color:#007bff;cursor:pointer" data-target="#modalCategoryForm" data-toggle="modal"><i class="fa fa-plus"></i>Add New Category/Sub-Category</p>
								</div>	
									  							  
								<div class="form-group">
								  <label class="control-label col-sm-2" for="pwd">Generic Name :</label>
								  <div class="col-sm-10">
									<input type="text" class="form-control" id="pwd" name="genname">
								  </div>
								</div>

								<div class="form-group col-md-4">
										<label for="inputState">Unit :</label>
										<select id="inputState" class="form-control" name="unit" required>
										  <option value="" selected>Choose...</option>
										  <option>Box</option>
										  <option>Piece (Pc)</option>
										  <option>Milli Gram (mg)</option>
										  <option>Milli Liter (ml)</option>
										  <option>Gram (g)</option>
										  <option>KiloGram (Kg)</option>
										</select>
									  </div>
									  
									  <div class="form-group">
											<label class="control-label col-sm-2" for="pwd">Selling Price :</label>
											<div class="col-sm-10">
											  <input type="text" class="form-control" id="pwd" name="price">
											</div>
										  </div>

									  <div class="form-group">
											<label class="control-label col-sm-2" for="pwd">Manufacturer :</label>
											<div class="col-sm-10">
											  <input type="text" class="form-control" id="pwd" name="manufac">
											</div>
										  </div>
							
								<div class="form-group">
										<button type="submit" class="btn btn-primary">Submit</button>
								</div>
								
							</form> 
					  </div>
			
		</div>	
		
		<!-- modal -->
		<div class="modal fade" id="modalCategoryForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		  aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header text-center">
		        <h4 class="modal-title w-100 font-weight-bold">Add Category/Sub-Category</h4>
		        <button id="model-colse-btn" type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <form action="./savecategory"  method="post">
		      <div class="modal-body mx-3">
		        <div class="md-form mb-5">
		          <label>New category</label>
		          <input type="text" id="newCat" class="form-control validate" name="select1">  
		        </div>
		
		        <div class="md-form mb-4">
		          <label>New sub category</label>
		          <input type="text" id="newSubCat" class="form-control validate" name="select2">    
		        </div>
				
		      </div>
		      <div class="modal-footer d-flex justify-content-center">
		        <button class="btn btn-default" type="submit"style="background-color:#007bff;cursor:pointer;color:white;">Save</button>
		      </div>
		    </div>
		  </div>
		</div>
		</form>	 
		

	  
 	
	</body>
	
	</html>
	
	<%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
		