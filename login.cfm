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
  </head>
  <body style="background-color: #fff">
    
	<cfinclude template="templates/menu.cfm">

	<div class="container">
		<div class="row align-items-center mt-5">
			<div class="col-md-6">
				<img src="images/contacts.webp" style="width:320px;"/>
			</div>
			<div class="col-md-6 mx-auto" style="background: #faf9fa;">
				<form class="mt-5 mb-5 w-75">
				  <div class="mb-3">
				    <input type="text" placeholder="Username" class="form-control" id="text-username">
				    <div id="username-error" class="form-text text-danger"></div>
				  </div>
				  <div class="mb-3">
				    <input type="password" placeholder="Password" class="form-control" id="text-password">
				    <div id="password-error" class="form-text text-danger"></div>
				  </div>
				  <div class="mb-3 form-check">
				    <input type="checkbox" class="form-check-input" id="exampleCheck1"> 
				    <label class="form-check-label" for="exampleCheck1">&nbsp;&nbsp;Stay logged in</label>
				  </div>
				  <button type="submit" class="btn btn-primary">Login</button>
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