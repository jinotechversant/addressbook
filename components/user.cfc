component displayname="user"{

	public function check(){
		return 'hello';
	}

	public function checkUser(form)
		{
			data = structNew()

			try{
				result = queryExecute("SELECT * FROM ab_users WHERE username = :usersname AND password =  :userpassword",{usersname: form.text_username, userpassword: form.text_password},  {});
				data.status = 	"success";
				data.text 	=	result;
			}
			catch (any e)
			{
				data.status = "error";
				data.text 	= #e.message#;
			}

			return data;
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

}