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
			<div class="col-md-10 bg-gainsboro h-230">
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
					    <tr>
					      <th scope="row">1</th>
					      <td>Mark</td>
					      <td>Otto</td>
					      <td>@mdo</td>
					      <td>
					      	<button type="button" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#contactModal" data-bs-value="edit-contact">Edit</button>
					      	<button type="button" class="btn btn-sm btn-outline-danger">Delete</button>
					      	<button type="button" class="btn btn-sm btn-outline-dark" data-bs-toggle="modal" data-bs-target="#contactModal" data-bs-value="view-contact">View</button>
					    	</td>
					    </tr>
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
		      	  <form>
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
				var modalBodyInput = processModal.querySelector('.modal-body input')
				
				if(recipient == 'add-contact')
					{
						modalTitle.textContent = 'Create Contact'
					}
				else if(recipient == 'edit-contact')
					{
						modalTitle.textContent = 'Edit Contact'
					}
				else if(recipient == 'view-contact')
					{
						modalTitle.textContent = 'View Contact'
					}	
				else
					{
						modalTitle.textContent = 'Contacts'
					}
			})


    </script>
  </body>
</html>