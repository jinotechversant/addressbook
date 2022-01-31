<cfscript>
if(StructKeyExists(Session, "user"))
	{
		location("dashboard.cfm");
		exit;
	}
else
	{
		location("login.cfm");
		exit;
	}

</cfscript>