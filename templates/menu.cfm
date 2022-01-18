<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.cfm">
      <img src="images/contact-book.webp" alt="" width="30" height="24" class="d-inline-block align-text-top">
      Address Book
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
     	<cfif StructKeyExists(Session,"user")>
     		<li class="nav-item">
	          <a class="nav-link" aria-current="page" href="index.cfm">Home</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" aria-current="page" href="logout.cfm">Logout</a>
	        </li>
	    <cfelse>	    	
	        <li class="nav-item">
	          <a class="nav-link <cfif cgi.script_name EQ "signup.cfm"><cfoutput>active</cfoutput></cfif>" href="signup.cfm"><img src="icons/user.png" style="width:25px" /> Sign Up</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="login.cfm"><img src="icons/login.png" style="width:25px" /> Login</a>
	        </li>
    	</cfif>
      </ul>
    </div>
  </div>
</nav>