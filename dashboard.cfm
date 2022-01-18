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
		<div class="row g-5 align-items-center mt-5">
			<div class="col-md-2 text-center bg-gainsboro h-230">
				<cfoutput>
					<img src="images/face.jpg" class="rounded-circle mt-2" style="width:100px;"/>
					<h5 class="low-grey-shade mt-3">#Session.user.full_name#</h5>
					<button class="btn btn-sm btn-primary">Create Contact</button>
				</cfoutput>
			</div>
			<div class="col-md-10 bg-gainsboro h-230">
					<table class="table">
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
					      <td><button type="button" class="btn btn-sm btn-outline-primary">Edit</button>
					      <button type="button" class="btn btn-sm btn-outline-danger">Delete</button>
					      <button type="button" class="btn btn-sm btn-outline-dark">View</button></td>
					    </tr>
					  </tbody>
					</table>
			</div>	
		</div>
	</div>

    <script src="dist/js/bootstrap.bundle.min.js" ></script>
  </body>
</html>