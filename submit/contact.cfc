<cfscript>
remote function viewContact()
	{

		data 	=	structNew();

		if(StructKeyExists(Session,"user"))
			{
				if(StructKeyExists(form,"contact_id"))
					{
						contact_id		=	form.contact_id
						try {
								ORMReload()
								currcontact		= 	entityLoad( "contacts", { id: contact_id })
								data.status 	= 	'ok';
								data.message	=	currcontact;
								writeOutput(serializeJSON(data));
							}
						catch(Exception e)
							{
								data.status 	= 	'error';
								data.message	=	e.message;
								writeOutput(serializeJSON(data));
							}
					}
				else 
					{
						data.status 	= 	'error';
						data.message	=	'Contact does not match with records in database. Please try again';
						writeOutput(serializeJSON(data));
					}
			}		
		else 
			{
				data.status 	= 	'error';
				data.message	=	'This is not a valid request';
				writeOutput(serializeJSON(data));
			}		
	}

remote function updateContact()
	{
		data 			=	structNew();
		contactObj 		= 	createObject("component", "local.components.contact")

		if(StructKeyExists(Session,"user"))
			{
				if(form.form_action == 'add' || form.form_action == 'edit')
					{
						address 			=	form.address;
						dob 				=	form.dob;
						email 				=	form.email;
						first_name 			=	form.first_name;
						form_action 		=	form.form_action;
						gender 				=	form.gender;
						last_name 			=	form.last_name;
						phone 				=	form.phone;
						pincode 			=	form.pincode;
						title 				=	form.title;
						if(StructKeyExists(form,"upload_photo"))
							{
								form.photo_name			=	form.upload_photo;	
								upload_photo			=	form.upload_photo;	
							}
						else 
							{
								form.photo_name			=	"";
								upload_photo			=	"";
							}
						
						form.userid 	=  Session.user.userid;

						if(len(trim(address)) == 0 || len(trim(dob)) == 0 || len(trim(email)) == 0 || len(trim(first_name)) == 0 || len(trim(gender)) == 0 || len(trim(last_name)) == 0 || len(trim(phone)) == 0 || len(trim(pincode)) == 0 || len(trim(title)) == 0 || len(trim(upload_photo)) == 0)
							{
								data.status 	= 	'error';
								data.message	=	'Please enter all mandatory fields';
								writeOutput(serializeJSON(data));
								exit;
							}
					}

				if(form.form_action == 'add')
					{
						try {
								insert_contact = contactObj.insertContact(form);
								if(insert_contact.status == 'success')
									{
										data.status 	= 	'ok';
										data.message	=	'Contact added successfully';
										writeOutput(serializeJSON(data));
										exit;
									}
								else 
									{
										data.status 	= 	'error';
										data.message	=	insert_contact.text;
										writeOutput(serializeJSON(data));
										exit;
									}
						}
						catch(Exception e) { 
							data.status 	= 	'error';
							data.message	=	e.message;
							writeOutput(serializeJSON(data));
							exit;
						}
					}
				else if(form.form_action == 'edit')
					{
						contact_id		=	form.contact_id;
						if(len(trim(contact_id)) == 0)
							{
								data.status 	= 	'error';
								data.message	=	'Contact does not match with records in database. Please try again';
								writeOutput(serializeJSON(data));
								exit;
							}
						try 
						{
								update_contact = contactObj.updateContact(form);
								if(update_contact.status == 'success')
									{
										data.status 	= 	'ok';
										data.message	=	'Contact updated successfully';
										writeOutput(serializeJSON(data));
										exit;
									}
								else 
									{
										data.status 	= 	'error';
										data.message	=	update_contact.text;
										writeOutput(serializeJSON(data));
										exit;
									}
						}
						catch(Exception e) { 
							data.status 	= 	'error';
							data.message	=	e.message;
							writeOutput(serializeJSON(data));
							exit;
						} 
					}
			}
		else 
			{
				data.status 	= 	'error';
				data.message	=	'This is not a valid request';
				writeOutput(serializeJSON(data));
			}
	}

remote function deleteContact()
	{
		data 			=	structNew();
		contactObj 		= 	createObject("component", "local.components.contact")

		if(StructKeyExists(Session,"user"))
			{
				if(StructKeyExists(form,"contact_id"))
					{
						contact_id		=	form.contact_id;
						userid 			=	Session.user.userid;
						try {
								delete_contact = contactObj.deleteContact(contact_id, userid);
								if(delete_contact.status == 'success')
									{
										data.status 	= 	'ok';
										data.message	=	'Contact updated successfully';
										writeOutput(serializeJSON(data));
										exit;
									}
								else 
									{
										data.status 	= 	'error';
										data.message	=	update_contact.text;
										writeOutput(serializeJSON(data));
										exit;
									}
						}
						catch(Exception e) { 
							data.status 	= 	'error';
							data.message	=	e.message;
							writeOutput(serializeJSON(data));
							exit;
						} 
					}
				else 
					{
						data.status 	= 	'error';
						data.message	=	'Contact does not match with records in database. Please try again';
						writeOutput(serializeJSON(data));
						exit;
					}
			}
		else 
			{
				data.status 	= 	'error';
				data.message	=	'This is not a valid request';
				writeOutput(serializeJSON(data));
			}
}

</cfscript>