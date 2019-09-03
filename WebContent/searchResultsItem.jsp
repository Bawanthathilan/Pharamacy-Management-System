<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@page import="saveItem.DatabaseConnection"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>

<% 
	String search= request.getParameter("search" );
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="navbar.jsp" />
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
							<li class="nav-item">
							  <a class="nav-link active" href="view.html">View Items</a>
							</li>
							<li class="nav-item">
							  <a class="nav-link" href="manageItem.jsp">Manage Item</a>
							</li>
							<li class="nav-item">
							  <a class="nav-link disabled" href="reports.html">Reports</a>
							</li>
							
							
						  </ul>
						  
						</div>
					  </nav>
					  <!--Nav bar end-->
					  <nav class="navbar navbar-light bg-light">
							<form class="form-inline" action="SearchResultsItem.jsp">
							  <input class="form-control mr-sm-2" type="search" name="searchitem" placeholder="Search item" aria-label="Search">
							  <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
							</form>
						  </nav>
					  <div class="addform" >
					  <h1>Search Results <span class="badge badge-secondary">New</span></h1>
			<div class="">
			<table id="mytable" class="table table-bordred table-striped">
					 <thead>		 
								 <th>ItemID</th>
								 <th>Name</th>
								 <th>Category</th>
								 <th>Sub-Category</th>
								 <th>Generic Name</th>
								 <th>Unit</th>
								 <th>Price</th>
								 <th>Quantity</th>
								 <th>Manufacturer</th>
								 <th>Edit</th>
								 <th>Delete</th>
					</thead>
																
									<%
									try{
									connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"customer","root","bawwa");
									statement=connection.createStatement();
									String sql ="select * from item WHERE name ='"+search+"'";
									resultSet = statement.executeQuery(sql);
									while(resultSet.next()){
									%>
									<tr>
									<td><%=resultSet.getInt("itemid") %></td>
									<td><%=resultSet.getString("name") %></td>
									<td><%=resultSet.getString("category") %></td>
									<td><%=resultSet.getString("subcategory") %></td>
									<td><%=resultSet.getString("genericname") %></td>
									<td><%=resultSet.getString("unit") %></td>
									<td><%=resultSet.getDouble("price") %></td>
									<td><%=resultSet.getInt("quantity") %></td>
									<td><%=resultSet.getString("manufacturer") %></td>
									<td><a href="UpdateItem.jsp?id=<%=resultSet.getString("itemid") %>"><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="fas fa-pencil-alt"></a></span></button></p></td>
				  
				  <td><a href="deleteItem.jsp?id=<%=resultSet.getString("itemid") %>"><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="fas fa-trash-alt"></span></button></p></a></td>
				 
				  </tr>
							</tr>
							
							<%
							}
							connection.close();
							} catch (Exception e) {
							e.printStackTrace();
							}
							%>
							</table>
					  

</body>
</html>