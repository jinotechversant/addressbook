 <cfscript>

 	//if(isDefined(form))
	 	//{
	 		writeDump(form);
	 	//}
 	//else 
	 	//{
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
		    				id 			=	googleLoginResult.id; 
		    				email 		=	googleLoginResult.other.email;	 
		    				fullname 	=	googleLoginResult.other.given_name;	

		    				checkUsers = entityLoad( "users", { GoogleAuth: id })
							if(ArrayLen(checkUsers) > 0)
								{
									Session.user 				= structNew();
									Session.user["loggedin"] 	= "yes";
			                        Session.user["userid"] 		= checkUsers['1'].id;
			                        Session.user["full_name"] 	= checkUsers['1'].FullName;
			                        Session.user["user_email"] 	= checkUsers['1'].Email;
			                        Session.user["user_name"] 	= checkUsers['1'].UserName;
									location('http://localhost:8500/addressbookapp/');
								}
							else 
								{
									try {
											ORMReload()
											userObj 	=	EntityNew("users");
											userObj.setUserName(id);
											userObj.setFullName(fullname);
											userObj.setEmail(email);
											userObj.setPassword(id);
											userObj.setGoogleAuth(id);
											userObj.setLoginType('google');
											EntitySave(userObj);
											ormflush();
											checkUsers = entityLoad( "users", { GoogleAuth: id })
											if(ArrayLen(checkUsers) > 0)
												{
													writeDump(checkUsers['1']);
													Session.user 				= structNew();
													Session.user["loggedin"] 	= "yes";
							                        Session.user["userid"] 		= checkUsers['1'].id;
							                        Session.user["full_name"] 	= checkUsers['1'].FullName;
							                        Session.user["user_email"] 	= checkUsers['1'].Email;
							                        Session.user["user_name"] 	= checkUsers['1'].UserName;
													location('http://localhost:8500/addressbookapp/');
												}
											else 
												{
													writeOutput('Google validation failed. Please try again. <a href="http://localhost:8500/addressbookapp/">Click Here</a>');
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
		    				writeOutput('Google validation failed. Please try again. <a href="http://localhost:8500/addressbookapp/">Click Here</a>');
		    			}
		    	}
		    else 
		    	{
		    		writeOutput('Google validation failed. Please try again. <a href="http://localhost:8500/addressbookapp/">Click Here</a>');
		    	}	
		//}

</cfscript>

