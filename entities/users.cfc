component entityname="users" persistent="true" table="ab_users" {

	property name="id" column="id" fieldtype="id" generator="increment";
    property name="FullName" column="full_name" ormtype="text";
    property name="Email" column="email" ormtype="text";
    property name="UserName" column="username" ormtype="text";
    property name="Password" column="password" ormtype="text";
    property name="GoogleAuth" column="google_auth" ormtype="text";
    property name="FacebookAuth" column="facebook_auth" ormtype="text";
    property name="LoginType" column="login_type" ormtype="text";
    property name="CreatedOn" column="created_on" ormtype="text";
    property name="LastLoggedin" column="last_loggedin" ormtype="text";

}