 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.cj.jdbc.Driver";
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
ResultSet resultSet1 = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from item where itemid="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="navbar.jsp" />
<title>Insert title here</title>
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
							<li class="nav-item">
							  <a class="nav-link" href="addItem.jsp">Add Item <span class="sr-only">(current)</span></a>
							</li>
							<li class="nav-item active">
							  <a class="nav-link" href="manageCustomer.jsp">Manage Items</a>
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
							<form class="form-horizontal" action="UpdateProcessItem.jsp" method="post">
							<input type="hidden" name="id" value="<%=resultSet.getString("itemid") %>">
								<div class="form-group">
								  <label class="control-label col-sm-2" for="email">Item Name :</label>
								  <div class="col-sm-10">
									<input type="text" class="form-control" id="email" name="itemname" value="<%=resultSet.getString("name") %>">
								  </div>
								</div>
								
								<div class="form-group col-md-4">
										<label for="inputState">Category :</label>
										<select class="form-control" name="select11" id="select11" >
										<option>Choose...</option>
									        <% resultSet =statement.executeQuery("select * from category") ; 
									        while(resultSet.next()){ %>
									            <option value="<%= resultSet.getString(2)%>"><%= resultSet.getString(2)%></option>
									        <% } %>
									        
										</select>
									  </div>
									  
								<div class="form-group col-md-4">
										<label for="inputState">Sub-Category :</label>
										<select  class="form-control" name="select22" id="select22">
										  	<option >Choose...</option>
										  	 <% resultSet1 =statement.executeQuery("select * from subcategory"); 
										  	 while(resultSet1.next()){ %>
									            <option value="<%= resultSet1.getString(2)%>"><%= resultSet1.getString(2)%></option>
									        <% } %>

										</select>
									  </div>
									<% resultSet = statement.executeQuery(sql);
										while(resultSet.next()){
									%>  
								<div class="form-group col-md-4">
									  <p style="color:#007bff;cursor:pointer" data-target="#modalCategoryForm" data-toggle="modal"><i class="fa fa-plus"></i>Add New Category/Sub-Category</p>
								</div>	
									 							  
								<div class="form-group">
								  <label class="control-label col-sm-2" for="pwd">Generic Name :</label>
								  <div class="col-sm-10">
									<input type="text" class="form-control" id="pwd" name="genname" value="<%=resultSet.getString("genericname") %>">
								  </div>
								</div>

								<div class="form-group col-md-4">
										<label for="inputState">Unit :</label>
										<select id="inputState" class="form-control" name="unit" value="<%=resultSet.getString("unit") %>">
										  <option selected>Choose...</option>
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
											  <input type="text" class="form-control" id="" name="price" value="<%=resultSet.getString("price") %>">
											</div>
										  </div>

										
									  <div class="form-group">
											<label class="control-label col-sm-2" for="pwd">Manufacturer :</label>
											<div class="col-sm-10">
											  <input type="text" class="form-control" id="pwd" name="manufac" value="<%=resultSet.getString("manufacturer") %>">
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
		</form>	 <%} %>
		


<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>