<cfscript>
if(StructKeyExists(Session,"user"))
	{
		if(cgi.content_type EQ "application/json")
			{
				mydata 	= 	deserializeJSON(ToString(getHTTPRequestData().content));
				data 	=	structNew();				

				if(mydata.form_action == 'add' || mydata.form_action == 'edit')
					{
						address 			=	mydata.address;
						dob 				=	mydata.dob;
						email 				=	mydata.email;
						first_name 			=	mydata.first_name;
						form_action 		=	mydata.form_action;
						gender 				=	mydata.gender;
						last_name 			=	mydata.last_name;
						phone 				=	mydata.phone;
						pincode 			=	mydata.pincode;
						title 				=	mydata.title;

						if(StructKeyExists(mydata,"upload_photo"))
							{
								upload_photo		=	mydata.upload_photo;	
							}
						else 
							{
								upload_photo		=	"";
							}
						

						if(len(trim(address)) == 0 || len(trim(dob)) == 0 || len(trim(email)) == 0 || len(trim(first_name)) == 0 || len(trim(gender)) == 0 || len(trim(last_name)) == 0 || len(trim(phone)) == 0 || len(trim(pincode)) == 0 || len(trim(title)) == 0 || len(trim(upload_photo)) == 0)
							{
								data.status 	= 	'error';
								data.message	=	'Please enter all mandatory fields';
								writeOutput(serializeJSON(data));
								exit;
							}
					}	

				if(mydata.form_action == 'add')
					{
						try {
								ORMReload()
								contactObj 	=	EntityNew("contacts");
								contactObj.setTitle(title);
								contactObj.setFirstName(first_name);
								contactObj.setLastName(last_name);
								contactObj.setGender(gender);
								contactObj.setAddress(address);
								contactObj.setPincode(pincode);
								contactObj.setDateBirth(dob);
								contactObj.setEmail(email);
								contactObj.setPhone(phone);
								contactObj.setPhotoName(upload_photo);
								EntitySave(contactObj);
								ormflush();
								data.status 	= 	'ok';
								data.message	=	'Contact added successfully';
								writeOutput(serializeJSON(data));
								exit;
						}
						catch(Exception e) { 
							data.status 	= 	'error';
							data.message	=	e.message;
							writeOutput(serializeJSON(data));
							exit;
						} 
					}
				else if(mydata.form_action == 'edit')
					{
						contact_id		=	mydata.contact_id;

						if(len(trim(contact_id)) == 0)
							{
								data.status 	= 	'error';
								data.message	=	'Contact does not match with records in database. Please try again';
								writeOutput(serializeJSON(data));
								exit;
							}
						try {
								ORMReload()
								contactObj 	=	entityLoad( "contacts", contact_id, true );
								contactObj.setTitle(title);
								contactObj.setFirstName(first_name);
								contactObj.setLastName(last_name);
								contactObj.setGender(gender);
								contactObj.setAddress(address);
								contactObj.setPincode(pincode);
								contactObj.setDateBirth(dob);								
								contactObj.setPhotoName(upload_photo);
								contactObj.setEmail(email);
								contactObj.setPhone(phone);
								ormflush();
								data.status 	= 	'ok';
								data.message	=	'Contact updated successfully';
								writeOutput(serializeJSON(data));
								exit;
						}
						catch(Exception e) { 
							data.status 	= 	'error';
							data.message	=	e.message;
							writeOutput(serializeJSON(data));
							exit;
						} 
					}
				else if(mydata.form_action == 'delete')
					{
						contact_id		=	mydata.contact_id;

						if(len(trim(contact_id)) == 0)
							{
								data.status 	= 	'error';
								data.message	=	'Contact does not match with records in database. Please try again';
								writeOutput(serializeJSON(data));
								exit;
							}
						try {
								ORMReload()
								contactObj 	=	entityLoad( "contacts", contact_id, true );
								entityDelete( contactObj );
								ormflush();
								data.status 	= 	'ok';
								data.message	=	'Contact deleted successfully';
								writeOutput(serializeJSON(data));
								exit;
						}
						catch(Exception e) { 
							data.status 	= 	'error';
							data.message	=	e.message;
							writeOutput(serializeJSON(data));
							exit;
						} 
					}
				else if(mydata.form_action == 'view')
					{
						contact_id		=	mydata.contact_id
						try {
								ORMReload()
								currcontact		= 	entityLoad( "contacts", { id: contact_id })
								data.status 	= 	'ok';
								data.message	=	currcontact;
								writeOutput(serializeJSON(data));
								exit;
							}
						catch(Exception e)
							{
								data.status 	= 	'error';
								data.message	=	e.message;
								writeOutput(serializeJSON(data));
								exit;
							}
					}		
				else 
					{
						data.status 	= 	'error';
						data.message	=	'Not valid request';
						writeOutput(serializeJSON(data));
						exit;
					}
			}
		else 
			{
				data.status 	= 	'error';
				data.message	=	'This is not a valid request';
				writeOutput(serializeJSON(data));
				exit;
			}
	}
else 
	{
		data.status 	= 	'error';
		data.message	=	'This is not a valid request';
		writeOutput(serializeJSON(data));
		exit;
	}	

</cfscript>