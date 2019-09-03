<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Website Login Page</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"><link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.css'>
<link rel="stylesheet" href="style/loginStyle.css">
<link href="https://fonts.googleapis.com/css?family=Lexend+Deca&display=swap" rel="stylesheet">
</head>
<body>
<!-- partial:index.partial.html -->
<div id="login-page">
  <div class="login">
    <img src="loginPage/images/logo.png" alt="Your logo here" class="logo">
    <h2 class="login-title">Login</h2>
    <form class="form-login" action="dashboard.jsp" method="post">
      <label for="email">Username</label>
      
      <div class="input-email">
        <i class="fas fa-envelope icon"></i>
        <input type="Text" name="username" placeholder="UserName">
      </div>
      <label for="password">Password</label>
      <div class="input-password">
        <i class="fas fa-lock icon"></i>
        <input type="password" name="password" placeholder="password">
      </div>
      <input type="submit" value="Login">
      
    </form>
      <!--  <a href="#">Forgot your password?</a>-->
  </div>
  <div class="background">
    <h1>Luckyland Pharmacy Online System</h1> 
    <!--  <p>Vivamus vitae dolor nec dolor pellentesque euismod dignissim sed orci. Donec sodales lacinia suscipit. Fusce fringilla convallis sem, et porttitor mi ornare sit amet. Aliquam.</p>-->
    
  </div>
</div>
<!-- partial -->
 
</body>
</html>