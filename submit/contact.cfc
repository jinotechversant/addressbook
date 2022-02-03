<cfscript>
remote function contact(){
		if(StructKeyExists(Session,"user"))
			{
				if(cgi.content_type EQ "application/json")
					{
						mydata 	= 	deserializeJSON(ToString(getHTTPRequestData().content));
						data 	=	structNew();				

						x = createObject("component", "local.components.contact")

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
										mydata.photo_name		=	mydata.upload_photo;	
										upload_photo			=	mydata.upload_photo;	
									}
								else 
									{
										mydata.photo_name		=	"";
										upload_photo			=	"";
									}
								
								mydata.userid =  Session.user.userid;

								if(len(trim(address)) == 0 || len(trim(dob)) == 0 || len(trim(email)) == 0 || len(trim(first_name)) == 0 || len(trim(gender)) == 0 || len(trim(last_name)) == 0 || len(trim(phone)) == 0 || len(trim(pincode)) == 0 || len(trim(title)) == 0 || len(trim(upload_photo)) == 0)
									{
										data.status 	= 	'error';
										data.message	=	'Please enter all mandatory fields';
										writeOutput(serializeJSON(data));
									}
							}	

						if(mydata.form_action == 'add')
							{
								try {

										insert_contact = x.insertContact(mydata);
										if(insert_contact.status == 'success')
											{
												data.status 	= 	'ok';
												data.message	=	'Contact added successfully';
												writeOutput(serializeJSON(data));
											}
										else 
											{
												data.status 	= 	'error';
												data.message	=	insert_contact.text;
												writeOutput(serializeJSON(data));
											}
								}
								catch(Exception e) { 
									data.status 	= 	'error';
									data.message	=	e.message;
									writeOutput(serializeJSON(data));
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
									}

								try
								{
										update_contact = x.updateContact(mydata);
										if(update_contact.status == 'success')
											{
												data.status 	= 	'ok';
												data.message	=	'Contact updated successfully';
												writeOutput(serializeJSON(data));
											}
										else 
											{
												data.status 	= 	'error';
												data.message	=	update_contact.text;
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
						else if(mydata.form_action == 'delete')
							{
								contact_id		=	mydata.contact_id;

								if(len(trim(contact_id)) == 0)
									{
										data.status 	= 	'error';
										data.message	=	'Contact does not match with records in database. Please try again';
										writeOutput(serializeJSON(data));
									}

								try {
										delete_contact = x.deleteContact(contact_id);
										if(delete_contact.status == 'success')
											{
												data.status 	= 	'ok';
												data.message	=	'Contact updated successfully';
												writeOutput(serializeJSON(data));
											}
										else 
											{
												data.status 	= 	'error';
												data.message	=	update_contact.text;
												writeOutput(serializeJSON(data));
											}
								}
								catch(Exception e) { 
									data.status 	= 	'error';
									data.message	=	e.message;
									writeOutput(serializeJSON(data));
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
								data.message	=	'Not valid request';
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
		else 
			{
				data.status 	= 	'error';
				data.message	=	'This is not a valid request';
				writeOutput(serializeJSON(data));
			}	
	}

remote function deleteContact()
	{
		if(StructKeyExists(Session,"user"))
			{
				mydata 	= 	deserializeJSON(ToString(getHTTPRequestData().content));
				data 	=	structNew();

				contact_id		=	mydata.contact_id;

				if(len(trim(contact_id)) == 0)
					{
						data.status 	= 	'error';
						data.message	=	'Contact does not match with records in database. Please try again';
						writeOutput(serializeJSON(data));
					}

				contact_id		=	mydata.contact_id
				userObj 		= 	createObject("component", "local.components.contact")
				delete_contact 	= 	userObj.deleteContact(contact_id);
				if(delete_contact.status == 'success')
					{
						data.status 	= 	'ok';
						data.message	=	'Contact updated successfully';
						writeOutput(serializeJSON(data));
					}
				else 
					{
						data.status 	= 	'error';
						data.message	=	update_contact.text;
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

remote function viewContact()
	{
		if(StructKeyExists(Session,"user"))
			{
				mydata 	= 	deserializeJSON(ToString(getHTTPRequestData().content));
				data 	=	structNew();

				contact_id		=	mydata.contact_id;

				if(len(trim(contact_id)) == 0)
					{
						data.status 	= 	'error';
						data.message	=	'Contact does not match with records in database. Please try again';
						writeOutput(serializeJSON(data));
					}

				contact_id		=	mydata.contact_id

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
				data.message	=	'This is not a valid request';
				writeOutput(serializeJSON(data));
			}
	}	
</cfscript>