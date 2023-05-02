<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense |Signup </title>
</head>
<body>
  <form action="saveuser" method="post" >
			FirstName:<input type="text" name="firstName"><br><br>
			LastName:<input type="text" name="lastName"><br><br>
			Email:<input type="email" name="email"><br><br>
			Password:<input type="password" name="password"><br><br>
			Confirm Password : <input type="password" name="confirmPassword">
			<input type="submit" value="Signup"><br><br>
  </form>
  <br> <br>	

	<a href="login">LogIn</a>
</body>
</html> -->




<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Expense |Signup</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">



<style type="text/css">
        .error {
            color: red;
        }
    </style>








</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
     <b>Expense</b>Manager
  </div>

  <div class="card">
    <div class="card-body register-card-body">
      <p class="login-box-msg">Register a new membership</p>

      <form action="saveuser" method="post" id="myform">
        
        <label>First Name:- </label>
        <div class="input-group mb-3">
        
          <input type="text" class="form-control" placeholder="firstName" name="firstName" id="firstName"><br>
       	 
       
        
          
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
          <span id="firstNameError" class="error"></span>
        </div>
        
        
        
        
         <label>Last Name:- </label>
        <div class="input-group mb-3">
        
       
          <input type="text" class="form-control" placeholder="lastName" name="lastName" id="lastName">
          
          
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <span id ="lastNameError" class="error"></span>
        
       
        
        <label>Email:- </label>
        <div class="input-group mb-3">
        
          <input type="email" class="form-control" placeholder="Email"name="email" id="email">
           
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
       
        </div>
   <span id="emailError" class="error"></span>
      
        <div style="color: red;">${error}</div>
        
        <label>Password:-</label>
        <div class="input-group mb-3">
         
          <input type="password" class="form-control" placeholder="Password"name="password" id="password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
       <span id ="passwordError" class="error"></span>
     
     
       <b>Confirm Passord:-</b>
        <div class="input-group mb-3">
          <input type="password" class="form-control" id="cpassword" placeholder="Retype password" name="confirmPassword">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
     <span id ="cpasswordError" class="error"></span>
        
        <label>Mobile No:- </label>
         <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Mobile No" name="mobileno">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        
        <label>DOB:-</label>
         <div class="input-group mb-3">
         
          <input type="date" class="form-control" placeholder="DOB" name="dob">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        
        <label>Select Gender:</label>
         <div class="input-group mb-3">
          
			<input type="radio" name="gender" value="Male" />Male
			&nbsp
			<input type="radio" name="gender" value="Female" />Female
          <div class="input-group-append">
           
            </div>
          </div>
        </div>
        
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="agreeTerms" name="terms" value="agree" style="margin-left: 50px">
              <label for="agreeTerms">
                I agree to the <a href="#">terms</a>
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4" >
          <!--  <button type="submit" class="btn btn-primary btn-block" value ="Signup" onclick="validation()">Register</button>  -->
        	 <input type="button" class="btn btn-primary float-right" value="Signup" onclick="validation()"><br><br> 
          </div>
          <!-- /.col -->
        </div>
      </form>

    <!--   <div class="social-auth-links text-center">
        <p>- OR -</p>
        <a href="#" class="btn btn-block btn-primary">
          <i class="fab fa-facebook mr-2"></i>
          Sign up using Facebook
        </a>
        <a href="#" class="btn btn-block btn-danger">
          <i class="fab fa-google-plus mr-2"></i>
          Sign up using Google+
        </a>
      </div>  -->

      <a href="login" class="text-center">I already have a membership</a>
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->




<script type="text/javascript">

function  validation(){
	console.log("validation is not correct");
	isError = false;
	
	
	firstName = document.getElementById("firstName");
	firstNameError = document.getElementById("firstNameError");
	firstNameRegex = /^[a-zA-Z]+$/;
	
	lastName =  document.getElementById("lastName");
	lastNamError = document.getElementById("lastNameError");
	lastNameRegex = /^[a-zA-Z]+$/;
	
	
	
	
	
	email = document.getElementById("email");
	emailError = document.getElementById("emailError");
	emailRegex = /^[a-zA-z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9-]{2,3}$/;
	
	password = document.getElementById("password");
	passwordError = document.getElementById("passwordError");
	
	cpassword = document.getElementById("cpassword");
	cpasswordError = document.getElementById("cpasswordError");
		
	
	
	
	 if (firstName.value == '') {
         firstNameError.innerHTML = "Please Enter FirstName"
		isError =true;	     
	 } 
	 else {
         if (firstNameRegex.test(firstName.value) == false) {
             firstNameError.innerHTML = "Please Enter Valid FirstName";
             isError =true;
         } else {
             firstNameError.innerHTML = "";

         }
	 }
	 
	 

	 if (lastName.value == '') {
         lastNameError.innerHTML = "Please Enter LastName"
         isError =true;
	 	
	 } 
	 else {
         if (lastNameRegex.test(lastName.value) == false) {
             lastNameError.innerHTML = "Please Enter Valid LastName";
             isError =true;	
         } else {
             lastNameError.innerHTML = "";

         }
     }
	 
	 
	 
	 if(password.value != cpassword.value){
		 cpasswordError.innerHtml = "Please Enter Same Password ";
		 isError =true;
		 
		 
	 }
	 
	 
	 

     if (email.value == '') {
         emailError.innerHTML = "Please Enter Email"
         isError =true;
     
     } else {
         if (emailRegex.test(email.value) == false) {
             emailError.innerHTML = "Please Enter Valid Email";
             isError =true;         
         
         } else {
             emailError.innerHTML = "";
         }
     }
 
 		if(isError == false){
 			
 			myform = document.getElementById("myform");		
 			myform.submit();
 			
 		}

 
 }
	
	




</script>


<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
</body>
</html>