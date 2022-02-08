component{
	this.name = "addressbook"
	this.datasource = "addressbookdb"
	this.loginstorage="Session" ;
	this.sessionmanagement="True" ;
	this.sessiontimeout=CreateTimeSpan(0,0,45,0); 
	this.ormEnabled = true;
    this.ormSettings = { logsql : true, datasource = "addressbookdb"};
    this.invokeImplicitAccessor = true;
    this.mappings["/local"] = getDirectoryFromPath(getCurrentTemplatePath());

    function onRequestStart(requestname){ 
        if(!structKeyExists(session, "user") or !structKeyExists(session.user, "loggedin") ){
            if(!(FindNoCase("login",requestname) > 0 or FindNoCase("signup",requestname) > 0 or FindNoCase("google",requestname) > 0)){
               location("/addressbookapp/login.cfm",false);
            }
        }
    }

    function onError(Exception,EventName){
    	//include "sorry.cfm";
		writeOutput('<h2>An unexpected error occurred.</h2>
		<p>Please provide the following information to technical support:</p>
		<p>Error Event: #EventName#</p>
		<p>Error details: #Exception.message#<br>');
    }
    
}