<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="navbar.jsp" />
<meta charset="ISO-8859-1">

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
							<li class="nav-item ">
							  <a class="nav-link" href="addItem.jsp">Add Item <span class="sr-only">(current)</span></a>
							</li>
							<li class="nav-item">
							  <a class="nav-link" href="manageItem.jsp">Manage Item</a>
							</li>
							<li class="nav-item active">
							  <a class="nav-link disabled" href="reports.html">Reports</a>
							</li>
							
							
						  </ul>
						  
						</div>
					  </nav>
					  <!--Nav bar end-->
					  				<br>
					  				<div class="itemreportform" >
									<form class="form-horizontal" action="#">
										<div class="form-group">
										  <label class="control-label col-sm-2" for="email">Report name :</label>
										  <div class="col-sm-10">
											<input type="text" class="form-control" id="email" >
										  </div>
										</div>
										<div class="form-group">
										<label class="control-label col-sm-2" for="email">Report :</label>
										
										  <div class="col-sm-10">
										  <select class="form-control" name="itemreport" id="ireport">
											<option value="0">Choose...</option>
											<option> Newly introduced items </option>
											<option> Newly introduced categories </option>
											</select>
										  </div>
										</div>
										
										<div class="form-group">
										<div class="col-sm-10">
										 <label for="inputState">Report Type:</label>
										  </div>
										  </div>
									  
									  <div class="form-group">
									  <div class="col-sm-10">
										<div class="btn-group" role="group" aria-label="First group">
    											<button type="button" class="btn btn-secondary">Monthly</button>
    											<button type="button" class="btn btn-primary">Annual</button>
											</div>
											</div>
									  </div>
									  
										<div class="form-group">
										<div class="col-sm-10">
												<button type="submit" class="btn btn-primary">Download</button>
												</div>
										</div>
										
									  </form> 
							  
					  </div>
					  </div>
					 
</body>
</html>