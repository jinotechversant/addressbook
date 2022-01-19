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


function contactSubmit(event)
	{
	    let title       		= document.forms['contact-form']['title'].value;
	    let title_error     = document.getElementById('title_error');

	    let first_name			= document.forms['contact-form']['first_name'].value;
	    let name_error     	= document.getElementById('name_error');

	    let last_name				= document.forms['contact-form']['last_name'].value;
	    let last_error     	= document.getElementById('last_error');

	    let gender       		= document.forms['contact-form']['gender'].value;
	    let gender_error		= document.getElementById('gender_error');

	    let dob       			= document.forms['contact-form']['dob'].value;
	    let dob_error     	= document.getElementById('dob_error');

	    let address					= document.forms['contact-form']['address'].value;
	    let address_error		= document.getElementById('address_error');

	    let pincode					= document.forms['contact-form']['pincode'].value;
	    let pincode_error		= document.getElementById('pincode_error');

	    let email       		= document.forms['contact-form']['email'].value;
	    let email_error     = document.getElementById('email_error');

	    let phone       		= document.forms['contact-form']['phone'].value;
	    let phone_error     = document.getElementById('phone_error');

	    let upload_photo		= document.forms['contact-form']['upload_photo'].value;
	    let upload_error    = document.getElementById('upload_error');

	    let form_action			= document.forms['contact-form']['form_action'].value;
	    let contact_id			= document.forms['contact-form']['contact_id'].value;

	    if(title == "" || first_name == "" || last_name == "" || gender == "" || dob == "" || address == "" || pincode == "" || email == "" || phone == "" || upload_photo == "")
		      {
		        if(title == null || title == "")
		          {
		            title_error.textContent = "Please enter title"
		          }
		        else 
		          {
		            title_error.textContent = ""
		          }

		        if(first_name == null || first_name == "")
		          {
		            name_error.textContent = "Please enter first name"
		          }
		        else 
		          {
		            name_error.textContent = ""
		          }

		        if(last_name == null || last_name == "")
		          {
		            last_error.textContent = "Please enter last name"
		          }
		        else 
		          {
		            last_error.textContent = ""
		          } 

		        if(gender == null || gender == "")
		          {
		            gender_error.textContent = "Please enter gender"
		          }
		        else 
		          {
		            gender_error.textContent = ""
		          } 

		        if(dob == null || dob == "")
		          {
		            dob_error.textContent = "Please enter your date of birth"
		          }
		        else 
		          {
		            dob_error.textContent = ""
		          }

		        if(address == null || address == "")
		          {
		            address_error.textContent = "Please enter your address"
		          }
		        else 
		          {
		            address_error.textContent = ""
		          }  
  
		        if(pincode == null || pincode == "")
		          {
		            pincode_error.textContent = "Please enter your pincode"
		          }
		        else 
		          {
		            pincode_error.textContent = ""
		          }  
  
		        if(email == null || email == "")
		          {
		            email_error.textContent = "Please enter your email"
		          }
		        else 
		          {
		            email_error.textContent = ""
		          }   
  
		        if(phone == null || phone == "")
		          {
		            phone_error.textContent = "Please enter your phone"
		          }
		        else 
		          {
		            phone_error.textContent = ""
		          }   
  
		        if(upload_photo == upload_photo || phone == "")
		          {
		            upload_error.textContent = "Please upload file"
		          }
		        else 
		          {
		            upload_error.textContent = ""
		          }  


		        return false;
		      }
      else 
          {

          		let form_error    				= document.getElementById('form_error');
          		let form_success    			= document.getElementById('form_success');
							
							title_error.textContent 	= ""
							name_error.textContent 		= ""   
							last_error.textContent 		= ""   
							gender_error.textContent 	= ""   
							dob_error.textContent 		= ""   
							address_error.textContent = ""   
							pincode_error.textContent = ""   
							email_error.textContent 	= ""   
							phone_error.textContent 	= ""   
							upload_error.textContent 	= ""   

	            let photo = document.getElementById("upload_photo").files[0];
							
							formData 	=	{
														'title':title,  
												    'first_name':first_name,
												    'last_name':last_name,
												    'gender':gender,
												    'dob':dob,
												    'address':address,
												    'pincode':pincode,
												    'email':email,
												    'phone':phone,
												    'upload_photo':photo,
												    'form_action':form_action,
												    'contact_id':contact_id
													}

							var btnSubmit = document.getElementById('form_submit');
							btnSubmit.disabled = true;	

							fetch('http://127.0.0.1:8500/addressbookapp/submit/contact.cfm', {
			                method: 'POST',
			                headers: {
			                  'Content-Type': 'application/json',
			                },
			                body: JSON.stringify(formData),
			              })
			              .then(response => response.json())
			              .then(data => {

			              	const obj = data;

			                if(obj.STATUS === 'ok')
			                  {
			                    btnSubmit.removeAttribute('disabled');
			                    console.log('Success:', obj);
			                    form_success.textContent = obj.MESSAGE;
			                    document.getElementById("contact-form").reset();
			                    form_success.scrollIntoView();
			                  }
			                else
			                  {
			                    form_error.textContent = obj.MESSAGE;
			                    form_error.scrollIntoView();
			                  }
			              })
			              .catch((error) => {
			                form_error.textContent = error;
			                form_error.scrollIntoView();
			              });

	            return false;
          }
  }  


