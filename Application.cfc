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
}