<cfscript>

userObj = createObject("component", "local.components.user")
if(StructKeyExists(form,"register-submit"))
	{
		if(len(trim(form.text_name)) == 0 || len(trim(form.text_email)) == 0 || len(trim(form.text_username)) == 0 || len(trim(form.text_password)) == 0 || len(trim(form.text_confirm_password)) == 0 )
			{
		 		location("../signup.cfm?error=mandatory")
		 	}
		 else 
			{
				if(form.text_password EQ form.text_confirm_password)
					{
						validate_user = userObj.checkUser(form);
						if(validate_user.status == 'success')
							{
								if(validate_user.text.RecordCount == 0)
									{
										insert_user = userObj.insertUser(form);
										if(insert_user.status == 'success')
											{
												location("../signup.cfm?status=success&message=#insert_user.text#");
											}
										else
											{
												location("../signup.cfm?error=technical&message=#insert_user.text#");
											}
									}
								else 
									{
										location("../signup.cfm?error=technical&message=Usename already registered");
									}
							}
						else
							{
								location("../signup.cfm?error=technical&message=Usename seems invalid");
							}
					}
				else 
					{
						location("../signup.cfm?error=confirmpass");
					}
			}
	}
else 
	{
		location("../signup.cfm?error=submit-error");
	}

</cfscript>