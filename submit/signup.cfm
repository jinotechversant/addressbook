<cfscript>
writeDump(form);
if(StructKeyExists(form,"register-submit") AND StructKeyExists(form,"text-name") AND StructKeyExists(form,"text-email") AND StructKeyExists(form,"text-username") AND StructKeyExists(form,"text-password") AND StructKeyExists(form,"text-confirm-passworod"))
	{
		
	}
else 
	{
		location("../signup.cfm?error=mandatory")
	}

</cfscript>