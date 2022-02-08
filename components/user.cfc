component displayname="user"{

	public function checkUser(data)
		{
			response = structNew()

			try{
				result = queryExecute("SELECT * FROM ab_users WHERE username = :usersname AND password =  :userpassword",{usersname: data.text_username, userpassword: data.text_password},  {});
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

	public function insertUser(userData){
		data = structNew();
		try
			{
				result = queryExecute("INSERT INTO ab_users (full_name, email, username, password) VALUES ('#userData.text_name#','#userData.text_email#','#userData.text_username#','#userData.text_password#')",{}, { result="userset" });
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

	public function insertGoogle(userData){
		response = structNew();
		try
			{
				result = queryExecute("INSERT INTO ab_users (full_name, email, username, password, google_auth, login_type) VALUES ('#userData.text_name#','#userData.text_email#','#userData.text_username#','#userData.text_password#','#userData.googleAuth#','#userData.type#')",{}, { result="userset" });
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