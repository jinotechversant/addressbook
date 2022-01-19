<cfif NOT StructKeyExists(Session,"user")>
	<cflocation url="index.cfm">
</cfif>

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

      .h-230{
      	height:  230px;
      }

      .low-grey-shade{
	      color: #3d4346;
      }

      .bg-gainsboro{
      	background-color: gainsboro;
      }

      .loader{
			    position: absolute;
			    top:0px;
			    right:0px;
			    width:100%;
			    height:100%;
			    background-color:#140d45;
			    background-image:url('icons/ajax-loader.gif');
			    background-size: 50px;
			    background-repeat:no-repeat;
			    background-position:center;
			    z-index:10000000;
			    opacity: 0.4;
			    filter: alpha(opacity=40);
			}
    </style>
    <script src="dist/script.js"></script>
  </head>
  <body style="background-color: #fff">
    
	<cfinclude template="templates/menu.cfm">

	<div class="container">
		<div class="row">
			<div class="col-12 mt-5 bg-gainsboro">
				<ul class="nav justify-content-end p-1">
				  <li class="nav-item">
				    <a class="nav-link" href="#"><img src="icons/pdf.png" width="30"></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#"><img src="icons/excel.png" width="30"></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#"><img src="icons/printer.png" width="30"></a>
				  </li>
				</ul>
			</div>
		</div>
		<div class="row align-items-center mt-5">
			<div class="col-md-2 text-center bg-gainsboro h-230" style="border-right: 8px solid white;">
				<cfoutput>
					<img src="images/face.jpg" class="rounded-circle mt-2" style="width:100px;"/>
					<h5 class="low-grey-shade mt-3">#Session.user.full_name#</h5>					
				</cfoutput>
				<button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#contactModal" data-bs-value="add-contact">Create Contact</button>
			</div>
			<div class="col-md-10 bg-gainsboro">
					<cfset allcontact = entityLoad( "contacts")>
	  			<table class="table mt-3">
					  <thead>
					    <tr>
					      <th scope="col">#</th>
					      <th scope="col">Name</th>
					      <th scope="col">Email</th>
					      <th scope="col">Phone Number</th>
					      <th scope="col"></th>
					    </tr>
					  </thead>
					  <tbody>
					  		<cfloop array="#allcontact#" index="alc">
							  	<tr>
							      <th scope="row"><cfoutput>#alc.id#</cfoutput></th>
							      <td><cfoutput>#alc.Title# #alc.FirstName# #alc.LastName#</cfoutput></td>
							      <td><cfoutput>#alc.Email#</cfoutput></td>
							      <td><cfoutput>#alc.Phone#</cfoutput></td>
							      <td>
							      	<button type="button" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#contactModal" data-bs-value="edit-contact" data-bs-id="<cfoutput>#alc.id#</cfoutput>">Edit</button>
							      	<button type="button" class="btn btn-sm btn-outline-danger" data-bs-id="<cfoutput>#alc.id#</cfoutput>">Delete</button>
							      	<button type="button" class="btn btn-sm btn-outline-dark" data-bs-toggle="modal" data-bs-target="#contactModal" data-bs-value="view-contact" data-bs-id="<cfoutput>#alc.id#</cfoutput>">View</button>
							    	</td>
							    </tr>
					    	</cfloop>
					  </tbody>
					</table>
			</div>	
		</div>
	</div>

		<div class="modal fade" id="contactModal" tabindex="-1" aria-labelledby="contactModal" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Contact</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      		<div class="loader" id="loader"></div>
		      	  <form method="post" enctype="multipart/form-data" name="contact-form"	id="contact-form" onsubmit="return contactSubmit(event)">
		      	  	<div class="row">
			      	  	<div class="col-12 mb-3">
					       		<div id="form_error" class="form-text text-danger"></div>
					       		<div id="form_success" class="form-text text-success"></div>
					       	</div>
					      </div>
		      	  	<div class="row">
			      	  	<div class="col-12 mb-3">
					       		<strong>Personal Contact</strong><hr/>
					       	</div>
					      </div>
					      <div class="row">
				          <div class="col-4 mb-3">
				            <label for="title" class="col-form-label">Title*</label>
				            <select class="form-select" id="title" name="title">
										  <option selected>Please Select</option>
										  <option value="Mr">Mr</option>
								     	<option value="Mrs">Mrs</option>
								     	<option value="Miss">Miss</option>
								     	<option value="Ms">Ms</option>
										</select>
				            <div id="title_error" class="form-text text-danger"></div>
				          </div>
				          <div class="col-4 mb-3">
				            <label for="first_name" class="col-form-label">First Name*</label>
				            <input type="text" class="form-control" id="first_name" name="first_name">
				            <div id="name_error" class="form-text text-danger"></div>
				          </div>
				          <div class="col-4 mb-3">
				            <label for="last_name" class="col-form-label">Last Name*</label>
				            <input type="text" class="form-control" id="last_name" name="last_name">
				            <div id="last_error" class="form-text text-danger"></div>
				          </div>
			          </div>
			          <div class="row">
			          	<div class="col-6 mb-3">
				            <label for="gender" class="col-form-label">Gender*</label>
				            <select class="form-select" id="gender" name="gender">
										  <option selected>Please Select</option>
										  <option value="male">Male</option>
								     	<option value="female">Female</option>
										</select>
				            <div id="gender_error" class="form-text text-danger"></div>
				          </div>
				          <div class="col-6 mb-3">
				            <label for="dob" class="col-form-label">Date Of Birth*</label>
				            <input type="date" class="form-control" id="dob" name="dob">
				            <div id="dob_error" class="form-text text-danger"></div>
				          </div>
			          </div>
			          <div class="row">
			          	<div class="col-12 mb-3">
				            <label for="upload_photo" class="col-form-label">Upload Photo*</label>
				            <input type="file" class="form-control" id="upload_photo" name="upload_photo">
				            <div id="upload_error" class="form-text text-danger"></div>
				          </div>
			          </div>
			          <div class="row">
			      	  	<div class="col-12 mb-3">
					       		<strong>Contact Details</strong><hr/>
					       	</div>
					      </div>
					      <div class="row">
					      	<div class="col-6 mb-3">
				            <label for="address" class="col-form-label">Address*</label>
				            <input type="text" class="form-control" id="address" name="address">
				            <div id="address_error" class="form-text text-danger"></div>
				          </div>
				          <div class="col-6 mb-3">
				            <label for="pincode" class="col-form-label">Pincode*</label>
				            <input type="text" class="form-control" id="pincode" name="pincode">
				            <div id="pincode_error" class="form-text text-danger"></div>
				          </div>
					      </div>
					      <div class="row">
					      	<div class="col-6 mb-3">
				            <label for="email" class="col-form-label">Email*</label>
				            <input type="email" class="form-control" id="email" name="email">
				            <div id="email_error" class="form-text text-danger"></div>
				          </div>
				          <div class="col-6 mb-3">
				            <label for="phone" class="col-form-label">Phone*</label>
				            <input type="text" class="form-control" id="phone" name="phone">
				            <div id="phone_error" class="form-text text-danger"></div>
				            <input type="hidden" name="form_action" id="form_action" value="">
				            <input type="hidden" name="contact_id" id="contact_id" value="">
				          </div>
					      </div>
					      <div class="row">
					      	<div class="col-12 text-center">
					      		<button type="submit" id="form_submit" class="btn btn-primary">Submit</button>
					      	</div>
					      </div>
			        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>

    <script src="dist/js/bootstrap.bundle.min.js" ></script>
    <script>
			var processModal = document.getElementById('contactModal')
			processModal.addEventListener('show.bs.modal', function (event) {
				var button = event.relatedTarget
				var recipient = button.getAttribute('data-bs-value')				
				var modalTitle = processModal.querySelector('.modal-title')
				var actionText = document.getElementById("form_action")
				var x = document.getElementById("loader");

				document.getElementById("contact-form").reset();	
				let title						= document.getElementById('title');
		    let title_error     = document.getElementById('title_error');
		    let first_name			= document.getElementById('first_name');
		    let name_error     	= document.getElementById('name_error');
		    let last_name				= document.getElementById('last_name');
		    let last_error     	= document.getElementById('last_error');
		    let gender       		= document.getElementById('gender');
		    let gender_error		= document.getElementById('gender_error');
		    let dob       			= document.getElementById('dob');
		    let dob_error     	= document.getElementById('dob_error');
		    let address					= document.getElementById('address');
		    let address_error		= document.getElementById('address_error');
		    let pincode					= document.getElementById('pincode');
		    let pincode_error		= document.getElementById('pincode_error');
		    let email       		= document.getElementById('email');
		    let email_error     = document.getElementById('email_error');
		    let phone       		= document.getElementById('phone');
		    let phone_error     = document.getElementById('phone_error');
		    let upload_photo		= document.getElementById('upload_photo');
		    let upload_error    = document.getElementById('upload_error');
				let form_error			= document.getElementById('form_error');
	      let form_success		= document.getElementById('form_success');


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
				form_error.textContent		=	""
				form_success.textContent  = "" 
				
				if(recipient == 'add-contact')
					{
						x.style.display				 = 'none';
						modalTitle.textContent = 'Create Contact'
						actionText.value 			 = 'add'
					}
				else if(recipient == 'edit-contact')
					{
						x.style.display				 = 'block';
						modalTitle.textContent = 'Edit Contact'
						actionText.value 			 = 'edit'
						
						var contact_id = button.getAttribute('data-bs-id')

						formData	=	{
								'form_action' : 'view',
								'contact_id'	:	contact_id
						}

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

					}
				else if(recipient == 'view-contact')
					{
						modalTitle.textContent = 'View Contact'
						actionText.value 			 = 'view'
					}	
				else
					{
						modalTitle.textContent = 'Contacts'
						actionText.value 			 = 'none'
					}
			})

			processModal.addEventListener('hidden.bs.modal', function (event) {
			  	location.reload();
			})

    </script>
  </body>
</html>