<cfscript>
data = structNew()
if(StructKeyExists(Session,"user"))
	{
		if(StructKeyExists(form,"file"))
			{
				try
				{
					uploadedFile = fileUpload( "C:\ColdFusion2021\cfusion\wwwroot\addressbookapp\uploads", "form.file", "image/jpeg,image/pjpeg,image/png", "MakeUnique" )
					data.status   = "ok";
					data.message  = uploadedFile.SERVERFILE;
					writeOutput(serializeJSON(data));
					exit;
				}
				catch(coldfusion.tagext.io.FileUtils$InvalidUploadTypeException e)
				{
					data.status   = "error";
					data.message  = e.message;
					writeOutput(serializeJSON(data));
					exit;
				}
				catch (any e){
					data.status   = "error";
					data.message  = e.message;
					writeOutput(serializeJSON(data));
					exit;
				}
			}
		else 
			{
				data.status 	= 	"error";
				data.message 	=	"Session Expired. Please login again";
				writeOutput(serializeJSON(data));
				exit;
			}
	}
else 
	{
		data.status 	= 	"error";
		data.message 	=	"Session Expired. Please login again";
		return data;
		exit;
	}

</cfscript>