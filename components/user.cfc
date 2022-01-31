component displayname="user"{

	public function checkUser(form)
		{
			response = structNew()

			try{
				result = queryExecute("SELECT * FROM ab_users WHERE username = :usersname AND password =  :userpassword",{usersname: form.text_username, userpassword: form.text_password},  {});
				response.status = 	"success";
				response.text 	=	result;
			}
			catch (any e)
			{
				response.status = "error";
				response.text 	= #e.message#;
			}

			return response;
		}

	public function checkGoogle(data)
		{
			response = structNew()

			try{
				result = queryExecute("SELECT * FROM ab_users WHERE google_auth = :googleAuth",{googleAuth: data.googleAuth},  {});
				response.status = 	"success";
				response.text 	=	result;
			}
			catch (any e)
			{
				response.status = "error";
				response.text 	= #e.message#;
			}

			return response;
		}

	public function insertUser(form){
		data = structNew();
		try
			{
				result = queryExecute("INSERT INTO ab_users (full_name, email, username, password) VALUES ('#form.text_name#','#form.text_email#','#form.text_username#','#form.text_password#')",{}, { result="userset" });
				data.status = 	"success";
				data.text 	=	userset.generatedKey;
			}
		catch  (any e)
			{
				data.status = "error";
				data.text 	= #e.message#;
			}

		return data;	
	}

	public function insertGoogle(data){
		response = structNew();
		try
			{
				result = queryExecute("INSERT INTO ab_users (full_name, email, username, password, google_auth, login_type) VALUES ('#data.text_name#','#data.text_email#','#data.text_username#','#data.text_password#','#data.googleAuth#','#data.type#')",{}, { result="userset" });
				response.status = 	"success";
				response.text 	=	userset.generatedKey;
			}
		catch  (any e)
			{
				response.status = "error";
				response.text 	= #e.message#;
			}

		return response;	
	}

}