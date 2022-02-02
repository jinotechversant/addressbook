<cfscript>

x = createObject("component", "local.components.user")
if(StructKeyExists(form,"login-submit"))
	{
		if(len(trim(form.text_username)) == 0 || len(trim(form.text_password)) == 0)
			{
		 		location("../login.cfm?error=mandatory")
		 	}
		 else 
			{
				validate_user = x.checkUser(form);
				if(validate_user.status == 'success')
					{
						if(validate_user.text.RecordCount == 1)
							{
								Session.user 				= structNew();
								Session.user["loggedin"] 	= "yes";
		                        Session.user["userid"] 		= validate_user.text.id;
		                        Session.user["full_name"] 	= validate_user.text.full_name;
		                        Session.user["user_email"] 	= validate_user.text.email;
		                        Session.user["user_name"] 	= validate_user.text.username;
		                        location("../dashboard.cfm");
							}
						else 
							{
								location("../login.cfm?error=technical&message=User login failed");
							}
					}
				else
					{
						location("../login.cfm?error=technical&message=User login failed");
					}
			}
	}
else 
	{
		location("../login.cfm?error=submit-error");
	}

</cfscript>