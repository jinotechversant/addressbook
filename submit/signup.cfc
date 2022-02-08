<cfscript>

userObj = createObject("component", "local.components.user")
if(StructKeyExists(form,"register-submit"))
	{

		text_name					= form.text_name
		text_email					= form.text_email
		text_username				= form.text_username
		text_password				= form.text_password
		text_confirm_password		= form.text_confirm_password

		if(len(trim(text_name)) == 0 || len(trim(text_email)) == 0 || len(trim(text_username)) == 0 || len(trim(text_password)) == 0 || len(trim(text_confirm_password)) == 0 )
			{
		 		location("../signup.cfm?error=mandatory")
		 	}
		 else 
			{
				if(text_password EQ text_confirm_password)
					{
						ins_data      = form;
						validate_user = userObj.checkUser(ins_data);
						if(validate_user.status == 'success')
							{
								if(validate_user.text.RecordCount == 0)
									{
										insert_user = userObj.insertUser(ins_data);
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