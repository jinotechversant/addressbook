 <cfscript>

 	x = createObject("component", "local.components.user")

 	data = structNew();

    cfoauth(
	    Type="Google",  
	    clientid="814107083015-23g773h6amik8rra204i6n41es3d9s7v.apps.googleusercontent.com",  
	    scope="https://www.googleapis.com/auth/userinfo.email+https://www.googleapis.com/auth/userinfo.profile",  
	    secretkey="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",  
	    result="googleLoginResult",  
	    redirecturi="http://localhost:8500/addressbookapp/google.cfm");

    if(StructKeyExists(googleLoginResult,'access_token') AND StructKeyExists(googleLoginResult,'id') AND StructKeyExists(googleLoginResult,'other'))
    	{
    		if(StructKeyExists(googleLoginResult.other,'email') AND StructKeyExists(googleLoginResult.other,'given_name'))
    			{
    				data.googleAuth			=	googleLoginResult.id; 
    				data.text_email 		=	googleLoginResult.other.email;	 
    				data.text_name 			=	googleLoginResult.other.given_name;	
    				data.text_username		=	googleLoginResult.id; 
    				data.text_password		=	googleLoginResult.id; 
    				data.type				=	"google"; 

					validate_user 			= 	x.checkGoogle(data);

					if(validate_user.status == 'success' AND validate_user.text.RecordCount == 1)
						{
							Session.user 				= structNew();
							Session.user["loggedin"] 	= "yes";
                     Session.user["userid"] 		= validate_user.text.id;
                     Session.user["full_name"] 	= validate_user.text.full_name;
                     Session.user["user_email"] 	= validate_user.text.email;
	                  Session.user["user_name"] 	= validate_user.text.username;
							location('http://localhost:8500/addressbookapp/dashboard.cfm');
						}
					else 
						{
							try {
									insert_user = x.insertGoogle(data);
									if(insert_user.status == 'success')
										{
											Session.user 				= structNew();
											Session.user["loggedin"] 	= "yes";
					                        Session.user["userid"] 		= insert_user.text;
					                        Session.user["full_name"] 	= data.text_name;
					                        Session.user["user_email"] 	= data.text_email;
					                        Session.user["user_name"] 	= data.text_username;
											location('http://localhost:8500/addressbookapp/dashboard.cfm');
										}
									else 
										{
											writeOutput('Google validation failed (Insertion). Please try again. <a href="http://localhost:8500/addressbookapp/">Click Here</a>');
										}
								}
							catch(Exception e) 
								{
									writeOutput(e.message);
									writeOutput('Google validation failed. Please try again. <a href="http://localhost:8500/addressbookapp/">Click Here</a>');
								}
						} 
    			}
    		else 
    			{
    				writeOutput('Google validation failed (Name). Please try again. <a href="http://localhost:8500/addressbookapp/">Click Here</a>');
    			}
    	}
    else 
    	{
    		writeOutput('Google validation failed. Please try again. <a href="http://localhost:8500/addressbookapp/">Click Here</a>');
    	}	

</cfscript>

