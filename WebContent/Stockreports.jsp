<!DOCTYPE html>
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
			/* Customize the label (the container) */
.container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 22px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
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
						<a href="dashboard.jsp">
							<span></span>
							<span>Dashboard </span>
						</a>
					</li>
					<li >
						<a href="add.jsp">
							<span></span>
							<span>Customer </span>
						</a>
					</li>
					<li  class="active">
						<a href="addStocks.jsp">

							
							<span>Stock </span>
						</a>
					</li>
					<li >
						<a href="#">
							
							<span>Item </span>
						</a>
					</li>
					<li>
						<a href="add.jsp">
							
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
								  <li class="nav-item ">
									<a class="nav-link" href="addStocks.jsp">Add Stocks </a>
								  </li>
								  <li class="nav-item">
									<a class="nav-link" href="viewStocks.jsp">View Stocks</a>
								  </li>
								  <li class="nav-item ">
									<a class="nav-link" href="ManageStocks.jsp">Manage Stocks</a>
								  </li>
								  <li class="nav-item active">
									<a class="nav-link" href="Stockreports.jsp">Generate Reports<span class="sr-only">(current)</span></a>
								  </li>
								  
								  
								</ul>
								
							  </div>
							</nav>
					  <!--Nav bar end-->
					  <br>

							<div class="addform" >
									<form>
										<label class="container">Stock code
											<input type="checkbox" checked="checked">
											<span class="checkmark"></span>
										  </label>
										  
										  <label class="container">Item code
											<input type="checkbox">
											<span class="checkmark"></span>
										  </label>
										  
										  <label class="container">Quantity
											<input type="checkbox">
											<span class="checkmark"></span>
										  </label>
										  
										  <label class="container">Manufacture Date
											<input type="checkbox">
											<span class="checkmark"></span>
										  </label>

										  <label class="container">Expire Date
											<input type="checkbox">
											<span class="checkmark"></span>
										  </label>

										  <label class="container">Recieved Date
											<input type="checkbox">
											<span class="checkmark"></span>
										  </label>

										  <label class="container">Stock Price
											<input type="checkbox">
											<span class="checkmark"></span>
										  </label>

										  <label class="container">Item Price
											<input type="checkbox">
											<span class="checkmark"></span>
										  </label>

										  
										  </form><br><br>
									
										<div class="form-group">
											&emsp;&emsp;&emsp;	<button type="submit" class="btn btn-primary">Download</button>
										</div>
										
									  </form> 
							  
					  </div>
					  
			
		</div>
	</body>
</html>