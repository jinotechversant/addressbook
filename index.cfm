<cfscript>

if(StructKeyExists(Session, "isUserLoggedIn"))
	{
		writeDump(Session);
		exit;
	}
else
	{
		location("signup.cfm");
		exit;
	}

</cfscript>