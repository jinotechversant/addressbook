<cfif StructKeyExists(Session,"user")>
    <cfdocument format="PDF"> 
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <html>
    <head>
        <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="row">
            <div class="col-12">
                <cfset allcontact = entityLoad( "contacts")>
                    <table class="table mt-3">
                      <thead>
                        <tr>
                          <th scope="col">Name</th>
                          <th scope="col">Gender</th>
                          <th scope="col">Email</th>
                          <th scope="col">Phone</th>
                          <th scope="col">DOB</th>
                          <th scope="col">Address</th>
                          <th scope="col">Pincode</th>
                        </tr>
                      </thead>
                      <tbody>
                            <cfloop array="#allcontact#" index="alc">
                                <tr>
                                  <td><cfoutput>#alc.Title# #alc.FirstName# #alc.LastName#</cfoutput></td>
                                  <td><cfoutput>#alc.Gender#</cfoutput></td>
                                  <td><cfoutput>#alc.Email#</cfoutput></td>
                                  <td><cfoutput>#alc.Phone#</cfoutput></td>
                                  <td><cfoutput>#alc.DateBirth#</cfoutput></td>
                                  <td><cfoutput>#alc.Address#</cfoutput></td>
                                  <td><cfoutput>#alc.Pincode#</cfoutput></td>
                              </tr>
                          </cfloop>
                      </tbody>
                  </table>
            </div>
        </div>
    </body>
    </html>
    </cfdocument>
<cfelse>
    <cfoutput>Invalid Request</cfoutput>
</cfif>
