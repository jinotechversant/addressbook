function formSubmit()
	{
	    let text_name       			= document.forms['signup-form']['text-name'].value;
	    let name_error      			= document.getElementById('name-error');
	    let text_email       			= document.forms['signup-form']['text-email'].value;
	    let email_error      			= document.getElementById('email-error');
	    let text_username       		= document.forms['signup-form']['text-username'].value;
	    let username_error      		= document.getElementById('username-error');
	    let text_password       		= document.forms['signup-form']['text-password'].value;
	    let password_error      		= document.getElementById('password-error');
	    let text_confirm_password       = document.forms['signup-form']['text-confirm-password'].value;
	    let confirm_password_error      = document.getElementById('confirm-password-error');

	    if(text_name == null || text_email == null || text_username == "" || text_password == ""  || text_confirm_password == "" || (text_password != text_confirm_password))
	      {
	        if(text_name == null || text_name == "")
	          {
	            name_error.textContent = "Please enter your name";
	          }
	        else 
	          {
	            name_error.textContent = "";
	          }

	        if(text_email == null || text_email == "")
	          {
	            email_error.textContent = "Please enter your email"
	          }
	        else 
	          {
	            email_error.textContent = ""
	          }

	        if(text_username == null || text_username == "")
	          {
	            username_error.textContent = "Please enter your user name"
	          }
	        else 
	          {
	            username_error.textContent = ""
	          }

	        if(text_password == null || text_password == "")
	          {
	            password_error.textContent = "Please enter your password"
	          }
	        else 
	          {
	            password_error.textContent = ""
	          }

	        if(text_confirm_password  == null || text_confirm_password  == "")
	          {
	            confirm_password_error.textContent = "Please confirm password"
	          }
	        else 
	          {
	            if(text_password != text_confirm_password)
	              {
	                confirm_password_error.textContent = "Password and confirm password does not match"
	              }
	            else 
	              {
	                confirm_password_error.textContent = ""
	              }
	          }
	        
	        return false;
	      }
      else 
          {
				name_error.textContent = "" 
				email_error.textContent = ""
				username_error.textContent = ""
				password_error.textContent = ""
				confirm_password_error.textContent = ""    
	            return true;
          }
  }

function loginSubmit()
	{
	    let text_username       		= document.forms['login-form']['text-username'].value;
	    let username_error      		= document.getElementById('username-error');
	    let text_password       		= document.forms['login-form']['text-password'].value;
	    let password_error      		= document.getElementById('password-error');

	    if(text_username == "" || text_password == "")
	      {
	        if(text_username == null || text_username == "")
	          {
	            username_error.textContent = "Please enter your user name"
	          }
	        else 
	          {
	            username_error.textContent = ""
	          }

	        if(text_password == null || text_password == "")
	          {
	            password_error.textContent = "Please enter your password"
	          }
	        else 
	          {
	            password_error.textContent = ""
	          }

	        return false;
	      }
      else 
          {
				username_error.textContent = ""
				password_error.textContent = ""   
	            return true;
          }
  }