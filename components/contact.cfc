component displayname="contact"{

	public function insertContact(ins_data){
		data = structNew();
		try
			{
				result = queryExecute("INSERT INTO contacts (title, first_name, last_name, gender, date_of_birth, photo_name, address, pincode, email, phone, userid) VALUES ('#ins_data.title#','#ins_data.first_name#','#ins_data.last_name#','#ins_data.gender#','#ins_data.dob#','#ins_data.photo_name#','#ins_data.address#','#ins_data.pincode#','#ins_data.email#','#ins_data.phone#','#ins_data.userid#')",{}, { result="userset" });
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

	public function updateContact(ins_data){
		data = structNew();
		try
			{
				result = queryExecute("UPDATE contacts SET 
														title = '#ins_data.title#', 
														first_name = '#ins_data.first_name#', 
														last_name = '#ins_data.last_name#', 
														gender = '#ins_data.gender#', 
														date_of_birth = '#ins_data.dob#', 
														photo_name = '#ins_data.photo_name#', 
														address = '#ins_data.address#', 
														pincode = '#ins_data.pincode#', 
														email = '#ins_data.email#', 
														phone = '#ins_data.phone#'
														WHERE  id = '#ins_data.contact_id#'",{}, { result="userset" });
				data.status = 	"success";
				data.text 	=	ins_data.contact_id;
			}
		catch  (any e)
			{
				data.status = "error";
				data.text 	= #e.message#;
			}

		return data;	
	}

	public function deleteContact(contact_id, userid){
		data = structNew();
		try
			{
				result 		= queryExecute("DELETE FROM contacts WHERE  id = '#contact_id#' AND userid = '#userid#'",{}, { result="userset" });
				data.status = 	"success";
				data.text 	=	contact_id;
			}
		catch  (any e)
			{
				data.status = "error";
				data.text 	= #e.message#;
			}

		return data;	
	}

}