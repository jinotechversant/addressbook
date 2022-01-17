<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="dist/style.css" rel="stylesheet">
    <link href="dist/font-awesome.min.css" rel="stylesheet">
    <title>Coldfusion</title>
    <style>
      #errorDisplay{
        color: red;
      }

      .required{
        color:  red;
      }
    </style>
    <script src="dist/script.js"></script>
  </head>
  <body style="background-color: #fff">
    
	<cfinclude template="templates/menu.cfm">
	
	<div class="container">
		<div class="row align-items-center mt-5">
			<div class="col-md-6">
				<img src="images/contacts.webp" style="width:320px;"/>
			</div>
			<div class="col-md-6 mx-auto" style="background: #faf9fa;">

				<form class="mt-5 mb-5 w-75" name="signup-form" onsubmit="return formSubmit()" method="post" action="submit/signup.cfm">
				  <div class="mb-3">
				  	<div class="form-text text-danger"></div>
				  </div>
				  <div class="mb-3">
				    <input type="text" placeholder="Full Name" class="form-control" id="text-name" name="text-name">
				    <div id="name-error" class="form-text text-danger"></div>
				  </div>
				  <div class="mb-3">
				    <input type="email" placeholder="Email address" class="form-control" id="text-email" name="text-email">
				    <div id="email-error" class="form-text text-danger"></div>
				  </div>
				  <div class="mb-3">
				    <input type="text" placeholder="Username" class="form-control" id="text-username" name="text-username">
				    <div id="username-error" class="form-text text-danger"></div>
				  </div>
				  <div class="mb-3">
				    <input type="password" placeholder="Password" class="form-control" id="text-password" name="text-password">
				    <div id="password-error" class="form-text text-danger"></div>
				  </div>
				  <div class="mb-3">
				    <input type="password" placeholder="Confirm Password" class="form-control" id="text-confirm-password" name="text-confirm-password">
				    <div id="confirm-password-error" class="form-text text-danger"></div>
				  </div>
				  <button type="submit" name="register-submit" class="btn btn-primary">Register</button>
				  -or-
				  <a href="#" class="btn btn-primary">Signup with Google</a>
				  <a href="#" class="btn btn-primary">Signup with Facebook</a>
				</form>
			</div>	
		</div>
	</div>

    <script src="dist/js/bootstrap.bundle.min.js" ></script>
  </body>
</html>
