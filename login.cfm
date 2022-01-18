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
				<form class="mt-5 mb-5 w-75" name="login-form" onsubmit="return loginSubmit()" method="post" action="submit/login.cfm">
					<cfoutput>
			  		<cfif StructKeyExists(url, 'status')>
			  			<cfif url.status CONTAINS "success">
				  			<div class="form-text text-success">Woah! You have been successfully registered.</div>
				  		</cfif>
			  		</cfif>
			  		<cfif StructKeyExists(url, 'error')>
			  			<cfif url.error CONTAINS "mandatory">
				  			<div class="form-text text-danger">Please enter all mandatory fields.</div>
					  	<cfelseif url.error CONTAINS "submit-error">
					  		<div class="form-text text-danger">Please submit through login form.</div>
					  	<cfelseif url.error CONTAINS "confirmpass">
					  		<div class="form-text text-danger">Please confirm your password.</div>
					  	<cfelseif url.error CONTAINS "technical">
					  		<div class="form-text text-danger">#url.message#</div>
					  	<cfelseif url.error CONTAINS "submit-failed">
					  		<div class="form-text text-danger">Login Failed. Please enter valid username and password.</div>	
					  	<cfelse>
					  		<div class="form-text text-danger">Something went wrong. Please try again.</div>
					  	</cfif>
					  </cfif>
					</cfoutput>
				  <div class="mb-3">
				    <input type="text" placeholder="Username" class="form-control" id="text-username" name="text_username">
				    <div id="username-error" class="form-text text-danger"></div>
				  </div>
				  <div class="mb-3">
				    <input type="password" placeholder="Password" class="form-control" id="text-password" name="text_password">
				    <div id="password-error" class="form-text text-danger"></div>
				  </div>
				  <div class="mb-3 form-check">
				    <input type="checkbox" class="form-check-input" id="exampleCheck1"> 
				    <label class="form-check-label" for="exampleCheck1" name="logged_in">&nbsp;&nbsp;Stay logged in</label>
				  </div>
				  <button type="submit" name="login-submit" class="btn btn-primary">Login</button>
				  -or-
				  <a href="#" class="btn btn-primary">Login with Google</a>
				  <a href="#" class="btn btn-primary">Login with Facebook</a>
				</form>
			</div>	
		</div>
	</div>

    <script src="dist/js/bootstrap.bundle.min.js" ></script>
  </body>
</html>