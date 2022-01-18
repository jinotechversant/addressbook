<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="dist/style.css" rel="stylesheet">
    <link href="dist/font-awesome.min.css" rel="stylesheet">
    <meta name="google-signin-client_id" content="308413841430-dj5p677mg5juoplaug96r78rl55qpmdg.apps.googleusercontent.com">
    <title>Coldfusion</title>
    <style>
      #errorDisplay{
        color: red;
      }

      .required{
        color:  red;
      }
    </style>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
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
				  <div class="mb-3 error">
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
						  		<div class="form-text text-danger">Please submit through signup form.</div>
						  	<cfelseif url.error CONTAINS "confirmpass">
						  		<div class="form-text text-danger">Please confirm your password.</div>
						  	<cfelseif url.error CONTAINS "technical">
						  		<div class="form-text text-danger">#url.message#</div>
						  	<cfelse>
						  		<div class="form-text text-danger">Something went wrong. Please try again.</div>
						  	</cfif>
						  </cfif>
						</cfoutput>
				  </div>
				  <div class="mb-3">
				    <input type="text" placeholder="Full Name*" class="form-control" id="text-name" name="text_name">
				    <div id="name-error" class="form-text text-danger"></div>
				  </div>
				  <div class="mb-3">
				    <input type="email" placeholder="Email address*" class="form-control" id="text-email" name="text_email">
				    <div id="email-error" class="form-text text-danger"></div>
				  </div>
				  <div class="mb-3">
				    <input type="text" placeholder="Username*" class="form-control" id="text-username" name="text_username">
				    <div id="username-error" class="form-text text-danger"></div>
				  </div>
				  <div class="mb-3">
				    <input type="password" placeholder="Password*" class="form-control" id="text-password" name="text_password">
				    <div id="password-error" class="form-text text-danger"></div>
				  </div>
				  <div class="mb-3">
				    <input type="password" placeholder="Confirm Password*" class="form-control" id="text-confirm-password" name="text_confirm_password">
				    <div id="confirm-password-error" class="form-text text-danger"></div>
				  </div>
				  <button type="submit" name="register-submit" class="btn btn-primary">Register</button>
				  -or-
				  <div class="mt-3 mb-3">
					  <div class="g-signin2" data-onsuccess="onSignIn"></div>
					</div>

				  <a href=" " class="btn btn-primary">Signup with Facebook</a>
				</form>
			</div>	
		</div>
	</div>

    <script src="dist/js/bootstrap.bundle.min.js" ></script>
  </body>
</html>
