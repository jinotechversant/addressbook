<cfscript>

remote function facebookLogin()
	{
		data 	=	structNew();

		if(StructKeyExists(form, "ID") AND StructKeyExists(form, "Email") AND StructKeyExists(form, "Name"))
			{
				UserName			=	form.ID;
				FacebookAuth		=	form.ID;
				Email 				=	form.Email;
				FullName 			=	form.Name;
				

				if(len(trim(UserName)) == 0 || len(trim(FacebookAuth)) == 0 || len(trim(Email)) == 0 || len(trim(FullName)) == 0)
					{
						data.status 	= 	'error';
						data.message	=	'Signup with facebook failed. Please try again!';
						writeOutput(serializeJSON(data));
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
											}
										else 
											{
												data.status 	= 	'error';
												data.message	=	'Something went wrong. Please try again!';
												writeOutput(serializeJSON(data));
											}
									}
								catch(Exception e) 
									{
										data.status 	= 	'error';
										data.message	=	e.message;
										writeOutput(serializeJSON(data));
									}
							}						 
					}
			}
		else 
			{
				data.status 	= 	'error';
				data.message	=	'Signup with facebook failed. Please try again!';
				writeOutput(serializeJSON(data));
			}	
	}
</cfscript>