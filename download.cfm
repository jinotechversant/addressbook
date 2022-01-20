<cfscript>
if(StructKeyExists(Session,"user"))
	{
		if(StructKeyExists(url,'type'))
			{
				if(url.type == 'pdf' || url.type == 'excel' || url.type == 'print')
					{
						
					}
				else 
					{
						writeOutput("Invalid Request");
					}
			}
		else 
			{
				writeOutput("Invalid Request");
			}
	}
else 
	{
		writeOutput("Invalid Request");
	}	
</cfscript>