<cfscript>

if(cgi.content_type EQ "application/json")
	{
		mydata 	= 	deserializeJSON(ToString(getHTTPRequestData().content));
		data 	=	structNew();				

		if(mydata.form_action == 'google')
			{
				UserName			=	mydata.ID;
				GoogleAuth			=	mydata.ID;
				Email 				=	mydata.Email;
				FullName 			=	mydata.Name;
				

				if(len(trim(UserName)) == 0 || len(trim(GoogleAuth)) == 0 || len(trim(Email)) == 0 || len(trim(FullName)) == 0)
					{
						data.status 	= 	'error';
						data.message	=	'Signup with google failed. Please try again!';
						writeOutput(serializeJSON(data));
						exit;
					}
				else 
					{
						checkUsers = entityLoad( "users", { GoogleAuth: GoogleAuth })
						if(ArrayLen(checkUsers) > 0)
							{
								Session.user 				= structNew();
								Session.user["loggedin"] 	= "yes";
		                        Session.user["userid"] 		= checkUsers['1'].id;
		                        Session.user["full_name"] 	= checkUsers['1'].FullName;
		                        Session.user["user_email"] 	= checkUsers['1'].Email;
		                        Session.user["user_name"] 	= checkUsers['1'].UserName;
								data.status 	= 	'ok';
								data.message	=	'loggedin';
								writeOutput(serializeJSON(data));
								exit;
							}
						else 
							{
								try {
										ORMReload()
										userObj 	=	EntityNew("users");
										userObj.setUserName(UserName);
										userObj.setFullName(FullName);
										userObj.setEmail(Email);
										userObj.setPassword(GoogleAuth);
										userObj.setGoogleAuth(GoogleAuth);
										userObj.setLoginType('google');
										EntitySave(userObj);
										ormflush();
										checkUsers = entityLoad( "users", { GoogleAuth: GoogleAuth })
										if(ArrayLen(checkUsers) > 0)
											{
												writeDump(checkUsers['1']);
												Session.user 				= structNew();
												Session.user["loggedin"] 	= "yes";
						                        Session.user["userid"] 		= checkUsers['1'].id;
						                        Session.user["full_name"] 	= checkUsers['1'].FullName;
						                        Session.user["user_email"] 	= checkUsers['1'].Email;
						                        Session.user["user_name"] 	= checkUsers['1'].UserName;
												data.status 	= 	'ok';
												data.message	=	'loggedin';
												writeOutput(serializeJSON(data));
												exit;
											}
										else 
											{
												data.status 	= 	'error';
												data.message	=	'Something went wrong. Please try again!';
												writeOutput(serializeJSON(data));
												exit;
											}
									}
								catch(Exception e) 
									{
										data.status 	= 	'error';
										data.message	=	e.message;
										writeOutput(serializeJSON(data));
										exit;
									}
							}

						 
					}
			}

		if(mydata.form_action == 'facebook')
			{
				UserName			=	mydata.ID;
				FacebookAuth		=	mydata.ID;
				Email 				=	mydata.Email;
				FullName 			=	mydata.Name;
				

				if(len(trim(UserName)) == 0 || len(trim(FacebookAuth)) == 0 || len(trim(Email)) == 0 || len(trim(FullName)) == 0)
					{
						data.status 	= 	'error';
						data.message	=	'Signup with facebook failed. Please try again!';
						writeOutput(serializeJSON(data));
						exit;
					}
				else 
					{
						checkUsers = entityLoad( "users", { FacebookAuth: FacebookAuth })
						if(ArrayLen(checkUsers) > 0)
							{
								Session.user 				= structNew();
								Session.user["loggedin"] 	= "yes";
		                        Session.user["userid"] 		= checkUsers['1'].id;
		                        Session.user["full_name"] 	= checkUsers['1'].FullName;
		                        Session.user["user_email"] 	= checkUsers['1'].Email;
		                        Session.user["user_name"] 	= checkUsers['1'].UserName;
								data.status 	= 	'ok';
								data.message	=	'loggedin';
								writeOutput(serializeJSON(data));
								exit;
							}
						else 
							{
								try {
										ORMReload()
										userObj 	=	EntityNew("users");
										userObj.setUserName(UserName);
										userObj.setFullName(FullName);
										userObj.setEmail(Email);
										userObj.setPassword(FacebookAuth);
										userObj.setFacebookAuth(FacebookAuth);
										userObj.setLoginType('facebook');
										EntitySave(userObj);
										ormflush();
										checkUsers = entityLoad( "users", { FacebookAuth: FacebookAuth })
										if(ArrayLen(checkUsers) > 0)
											{
												Session.user 				= structNew();
												Session.user["loggedin"] 	= "yes";
						                        Session.user["userid"] 		= checkUsers['1'].id;
						                        Session.user["full_name"] 	= checkUsers['1'].FullName;
						                        Session.user["user_email"] 	= checkUsers['1'].Email;
						                        Session.user["user_name"] 	= checkUsers['1'].UserName;
												data.status 	= 	'ok';
												data.message	=	'loggedin';
												writeOutput(serializeJSON(data));
												exit;
											}
										else 
											{
												data.status 	= 	'error';
												data.message	=	'Something went wrong. Please try again!';
												writeOutput(serializeJSON(data));
												exit;
											}
									}
								catch(Exception e) 
									{
										data.status 	= 	'error';
										data.message	=	e.message;
										writeOutput(serializeJSON(data));
										exit;
									}
							}

						 
					}
			}	
	}
</cfscript>