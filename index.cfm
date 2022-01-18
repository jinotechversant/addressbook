<cfscript>
if(StructKeyExists(Session, "user"))
	{
		location("dashboard.cfm");
		exit;
	}
else
	{
		location("signup.cfm");
		exit;
	}

</cfscript>