<cfset allcontact = entityLoad( "contacts")>
<cfset sheet = SpreadSheetNew()>
<cfset SpreadsheetAddRow(sheet, "title,name,gender,email,phone,dob,pincode,address")>
<cfloop array="#allcontact#" index="alc">
	<cfset SpreadsheetAddRow(sheet, "#alc.Title#,#alc.FirstName# #alc.LastName#,#alc.Gender#,#alc.Email#,#alc.Phone#,#alc.DateBirth#,#alc.Pincode#,#alc.Address#")>
</cfloop>

<!--- stream it to the browser --->
<cfheader name="Content-Disposition" value="inline; filename=contacts.xls">
<cfcontent type="application/vnd.ms-excel" variable="#SpreadSheetReadBinary(sheet)#">