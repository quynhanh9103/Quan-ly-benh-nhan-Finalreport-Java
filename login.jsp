<%-- 
    Document   : login
    Created on : May 20, 2023, 3:48:50 PM
    Author     : Hanami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Login Form</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card">
        <div class="card-header">
          <h4>Login</h4>
        </div>
        <div class="card-body">
            <form action="login" method="post">
            <div class="form-group">
              <label for="username">Username:</label>
              <input name="username" type="text" class="form-control" id="username" placeholder="Enter your username">
            </div>
            <div class="form-group">
              <label for="password">Password:</label>
              <input name="password" type="password" class="form-control" id="password" placeholder="Enter your password">
            </div>
            <div class="form-group">
              <button type="submit" class="btn btn-primary">Login</button>              
<!--              <a href="#" class="btn btn-primary">Forgot Password?</a>-->
            </div>
                <p>${message}</p>
          </form>
            
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>

