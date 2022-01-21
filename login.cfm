<cfif StructKeyExists(Session,"user")>
	<cflocation url="index.cfm">
</cfif>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="dist/style.css" rel="stylesheet">
    <meta name="google-signin-client_id" content="814107083015-23g773h6amik8rra204i6n41es3d9s7v.apps.googleusercontent.com">
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
    <script src="https://apis.google.com/js/platform.js" async defer></script>
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
			  	<div class="form-text text-success" id="sc-success"></div>
			  	<div class="form-text text-danger" id="sc-error"></div>
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
				  <div class="mb-3 form-check">
				  	<div class="row">
				  		<div class="col-4">
				  			<button type="submit" name="login-submit" class="btn btn-primary">Login</button>
				  		</div>
				  		<div class="col-1">
				  		</div>
				  		<div class="col-3">
				  			<div class="g-signin2" data-onsuccess="onSignIn"></div>
				  		</div>
				  		<div class="col-1">
				  		</div>
				  		<div class="col-3">
				  			<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
								</fb:login-button>
								<div id="status"></div>
				  		</div>
				  	</div>				  	
				  </div>
				</form>
			</div>	
		</div>
	</div>

    <script src="dist/js/bootstrap.bundle.min.js" ></script>
		<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
    <script>
			function onSignIn(googleUser) {
			  var profile = googleUser.getBasicProfile();
			  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			  console.log('Name: ' + profile.getName());
			  console.log('Image URL: ' + profile.getImageUrl());
			  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.

			  sc_success	=	document.getElementById('sc-success');
				sc_error		=	document.getElementById('sc-error');	

			  formData	=	{
									'form_action': 'google',
									'ID':	profile.getId(),
									'Name': profile.getName(),
									'Email': profile.getEmail()
							}

				fetch('submit/social.cfm', {
	                method: 'POST',
	                headers: {
	                  'Content-Type': 'application/json',
	                },
	                body: JSON.stringify(formData),
	              })
	              .then(response => response.json())
	              .then(data => {

	              	const obj = data;
	              	console.log('RESPONSE', obj);
	                if(obj.STATUS === 'ok')
	                  {
	                    sc_success.textContent    = "User registered successfully!";
	                    location.reload();
	                  }
	                else
	                  {
	                    sc_error.textContent    = obj.MESSAGE;
	                  }
	              })
	              .catch((error) => {
	                	sc_error.textContent    = error;
	              });

	              var auth2 = gapi.auth2.getAuthInstance();
						    auth2.signOut().then(function () {
						      console.log('User signed out.');
						    });
				}
		</script>
		<script>

	  function statusChangeCallback(response) {  
	    
	    if (response.status === 'connected') {
	      testAPI();  
	    } else {                                 
	      //document.getElementById('status').innerHTML = 'Please log ' +
	      //  'into this webpage.';
	    }
	  }


	  function checkLoginState() {
	    FB.getLoginStatus(function(response) {
	      statusChangeCallback(response);
	    });
	  }


	  window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '2459111417556905',
	      cookie     : true,
	      xfbml      : true,
	      version    : 'v5.0'
	    });


	    FB.getLoginStatus(function(response) {
	      statusChangeCallback(response);
	    });
	  };
	 
	  function testAPI() {

	    FB.api('/me', function(response) {
	      document.getElementById('status').innerHTML =
	        'Thanks for logging in, ' + response.name + '!';

        sc_success	=	document.getElementById('sc-success');
				sc_error		=	document.getElementById('sc-error');	

		  	formData	=	{
								'form_action': 'facebook',
								'ID':	response.id,
								'Name': response.name,
								'Email': response.name
						}

				fetch('submit/social.cfm', {
                method: 'POST',
                headers: {
                  'Content-Type': 'application/json',
                },
                body: JSON.stringify(formData),
              })
              .then(response => response.json())
              .then(data => {

              	const obj = data;
              	console.log('RESPONSE', obj);
                if(obj.STATUS === 'ok')
                  {
                    sc_success.textContent    = "User registered successfully!";
                    location.reload();
                  }
                else
                  {
                    sc_error.textContent    = obj.MESSAGE;
                  }
              })
              .catch((error) => {
                	sc_error.textContent    = error;
              });
	    });	    
	    
	  }

	</script>
  </body>
</html>